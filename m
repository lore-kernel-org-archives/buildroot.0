From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 11 Jul 2013 09:04:19 +0300
Subject: [Buildroot] [PATCH] Raspberry Pi - WiringPi Library Package
In-Reply-To: <20130711060008.GA5570@enterprise.localdomain>
References: <1373519841-6138-1-git-send-email-g@maral.me>
 <1373519960-6212-1-git-send-email-g@maral.me>
 <20130711053359.GC4338@tarshish>
 <20130711060008.GA5570@enterprise.localdomain>
Message-ID: <20130711060419.GD4338@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillermo,

On Wed, Jul 10, 2013 at 11:00:08PM -0700, Guillermo A. Amaral wrote:
> On Thu, Jul 11, 2013 at 08:33:59AM +0300, Baruch Siach wrote:
> > On Wed, Jul 10, 2013 at 10:19:20PM -0700, Guillermo A. Amaral wrote:
> > > From: "Guillermo A. Amaral" <g@maral.me>
> > > 
> > > 
> > > Signed-off-by: Guillermo A. Amaral <g@maral.me>
> > > ---

[...]

> > > ++#ifndef O_CLOEXEC
> > > ++#define O_CLOEXEC 0
> > 
> > Are you sure? I see
> > 
> > #define O_CLOEXEC      02000000
> > 
> > in include/uapi/asm-generic/fcntl.h.
> > 
> 
> Hi baruch,
> 
> Usage of O_CLOEXEC in wiringPi was added very recently, it started failing
> after that. I hear it still works if you're using glibc though (I haven't
> tested it).
> 
> Here's the output if you remove the patch:
> 
> 	/development/test/build/wiringpi-02a3bd8d8f2ae5c873e63875a8faef5b627f9db6/wiringPi/wiringPi.c: In function ?wiringPiSetup?:
> 	/development/test/build/wiringpi-02a3bd8d8f2ae5c873e63875a8faef5b627f9db6/wiringPi/wiringPi.c:1544:49: error: ?O_CLOEXEC? undeclared (first use in this function)
> 	/development/test/build/wiringpi-02a3bd8d8f2ae5c873e63875a8faef5b627f9db6/wiringPi/wiringPi.c:1544:49: note: each undeclared identifier is reported only once for each function it appears in
> 	make[2]: *** [wiringPi/CMakeFiles/wiringPi.dir/wiringPi.c.o] Error 1
> 	make[1]: *** [wiringPi/CMakeFiles/wiringPi.dir/all] Error 2
> 	make: *** [all] Error 2

I didn't say you should remove this patch, just use the correct value. Setting 
O_CLOEXEC to 0 makes it effectively a no-op. Is this intended?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
