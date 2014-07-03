From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 Jul 2014 18:09:14 +0300
Subject: [Buildroot] Incorrect ABI setting on ubuntu 14.04LTS
In-Reply-To: <20140703165750.3529d265@free-electrons.com>
References: <CAFRxoJn5x=5YbSCOsMu7XB1PS2Dv2=fyih7nrwMmde0YtveeTQ@mail.gmail.com>
 <20140703092010.GO9025@tarshish> <20140703092420.GP9025@tarshish>
 <20140703113316.3100783a@free-electrons.com>
 <CAFRxoJnfkQ1xZDd_Q5h_qzWXkrsJCdUTBv6APB6VvFFH1ad20g@mail.gmail.com>
 <20140703164206.40a17ed0@free-electrons.com>
 <20140703145401.GS9025@tarshish>
 <20140703165750.3529d265@free-electrons.com>
Message-ID: <20140703150914.GT9025@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Jul 03, 2014 at 04:57:50PM +0200, Thomas Petazzoni wrote:
> On Thu, 3 Jul 2014 17:54:01 +0300, Baruch Siach wrote:
> > > > $ echo 'int main(void) {}' |
> > > > ./output/host/opt/ext-toolchain/bin/arm-linux-gnueabihf-gcc -x c -o
> > > > /dev/null -
> > > > /mnt/ocz-vector/projects/bb-buildroot-2014.05/output/host/opt/ext-toolchain/bin/../libexec/gcc/arm-linux-gnueabihf/4.8.3/cc1:
> > > > error while loading shared libraries: libz.so.1: cannot open shared object
> > > > file: No such file or directory
> > > 
> > > apt-get install zlib1g:i386
> > > 
> > > is what you need.
> > 
> > I'm afraid Ubuntu 10.04 was not multi-arch enabled. That's why I suggested 
> > ia32-libs instead.
> 
> Marco reported using 14.04 LTS.

Right, of course. Sorry for the noise.

Related to this: why do we redirect stderr of the compiler invocation to 
/dev/null in check_arm_abi? We are not interested in the output itself as we 
only check whether the compiler runs successfully. When the test succeeds it 
should not output anything. Whereas in the failing case the output is very 
interesting.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
