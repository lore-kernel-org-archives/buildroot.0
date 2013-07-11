From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 11 Jul 2013 21:06:03 +0300
Subject: [Buildroot] [PATCH] Raspberry Pi - WiringPi Library Package
In-Reply-To: <20130711175530.GA16506@enterprise.localdomain>
References: <1373519841-6138-1-git-send-email-g@maral.me>
 <1373519960-6212-1-git-send-email-g@maral.me>
 <20130711053359.GC4338@tarshish>
 <20130711060008.GA5570@enterprise.localdomain>
 <20130711060419.GD4338@tarshish>
 <20130711063845.GA7655@enterprise.localdomain>
 <51DE61E4.7030400@googlemail.com>
 <20130711175530.GA16506@enterprise.localdomain>
Message-ID: <20130711180603.GG4338@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillermo,

On Thu, Jul 11, 2013 at 10:55:30AM -0700, Guillermo Amaral wrote:
> The Raspberry Pi doesn't go down to 2.6.y, the oldest supported version is
> 3.2.27. :)

If this is the case, then there is no reason to make O_CLOEXEC a no-op.

> So there should be no need to do the kernel check, since the package is RPi
> specific.
> 
> The problem here was that O_CLOEXEC was not defined with the default uclibc
> and older versions of glibc.

The O_CLOEXEC define comes with the kernel headers used to build the 
toolchain, not from the C library.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
