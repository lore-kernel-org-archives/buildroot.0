From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Feb 2017 11:26:06 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-02-09
In-Reply-To: <A9140E91EDA627489354A41A7EE118CA33CCBD@sv08ultra002.ultratronik.de>
References: <20170210072859.4656F20BAB@mail.free-electrons.com>
 <CALdGskLbBc1Vx9Ju8ZhUJvRa5r6q83=N-qukFygmS-eZz79i8Q@mail.gmail.com>
 <20170210093759.33285cd1@free-electrons.com>
 <A9140E91EDA627489354A41A7EE118CA33CCBD@sv08ultra002.ultratronik.de>
Message-ID: <20170210112606.1f17fd02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Feb 2017 09:52:09 +0000, Naumann Andreas wrote:

> I've actually sent a patch for this earlier in '[Buildroot] [PATCH v4
> 10/10] poppler: Compile with -std=c++11'. Unfortunately I forgot it
> in v5. Is this enough or do you want me to resend it?

OK, I found it again in patchwork:

  http://patchwork.ozlabs.org/patch/708239/

But this patch has an issue: if a package needs C++11 support then it
needs to have a BR2_TOOLCHAIN_GCC_AT_LEAST_XYZ dependency.

But this raises an even more fundamental issue: there is *nothing* in
poppler that indicates it can depend on Qt5. There is some logic for
Qt4, but nothing for Qt5.

So: the dependency on Qt5 should be made explicit, and should take care
of the fact that Qt5 needs C++11 support, and therefore a reasonably
recent C++ compiler.

Could you work on this?

Alternatively, if you don't care/use Qt5 support in Poppler, you can
also just pass the appropriate --disable-<foo> option to
unconditionally disable Qt5 support.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
