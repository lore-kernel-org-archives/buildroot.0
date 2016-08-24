From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 18:51:28 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-18
In-Reply-To: <20160819222925.GD6096@free.fr>
References: <20160819063024.55AF4101904@stock.ovh.net>
 <20160820000709.0ceef3cd@free-electrons.com>
 <20160819222925.GD6096@free.fr>
Message-ID: <20160824185128.68a2fdef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 00:29:25 +0200, Yann E. MORIN wrote:

> There is another type of issues for kmsxx:
> 
>     http://autobuild.buildroot.org/results/5e9/5e9963c1f11af40a6349da524fc128116a1d9e6e/build-end.log
> 
>     [ 81%] Linking CXX executable ../bin/fbtestpat
>     /tmp/ccvhwy4u.ltrans0.ltrans.o: In function `main':
>     <artificial>:(.text.startup+0xa4): undefined reference to `kms::ExtCPUFramebuffer::ExtCPUFramebuffer(unsigned int, unsigned int, kms::PixelFormat, unsigned char*, unsigned int)'
>     <artificial>:(.text.startup+0xd4): undefined reference to `kms::draw_test_pattern(kms::IMappedFramebuffer&)'
>     <artificial>:(.text.startup+0x10c): undefined reference to `kms::RGB::RGB(unsigned char, unsigned char, unsigned char)'
>     <artificial>:(.text.startup+0x128): undefined reference to `kms::draw_text(kms::IMappedFramebuffer&, unsigned int, unsigned int, std::string const&, kms::RGB)'
>     <artificial>:(.text.startup+0x188): undefined reference to `kms::ExtCPUFramebuffer::~ExtCPUFramebuffer()'
>     <artificial>:(.text.startup+0x2a8): undefined reference to `kms::ExtCPUFramebuffer::~ExtCPUFramebuffer()'
>     collect2: error: ld returned 1 exit status
>     make[3]: *** [bin/fbtestpat] Error 1
> 
> And I was not able to reproduce it either... :-/

This issue happened only once:

	http://autobuild.buildroot.net/?reason=kmsxx-bd5f6471e619a6ba2987bc7f66ef78a531f94d6c

I've restarted the same build on the same machine, I'll see if it
happens again.

> > Secondary question: other packages are using libbsd, why aren't we
> > seeing other occurrences of this problem?  
> 
> Because none is using libbsd-overlay.pc, just libbsd.pc.

OK.

> The underlying issue, that pkconf does not munge -isystem, is being
> investigated by the pkconf guys:
>     https://github.com/pkgconf/pkgconf/issues/94

OK. I'll apply your lldpd workaround then.

Thanks for the feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
