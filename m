From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:01:53 +0200
Subject: [Buildroot] [PATCH] uclibc: deprecate locale support
In-Reply-To: <20150628071417.GA13377@waldemar-brodkorb.de>
References: <20150628071417.GA13377@waldemar-brodkorb.de>
Message-ID: <20150628140153.4a657fdd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sun, 28 Jun 2015 09:14:17 +0200, Waldemar Brodkorb wrote:
> The quality of the locale implementation in uClibc seems
> to be bad. Recently a discussion on the uClibc mailinglist
> showed that the uClibc maintainer has no time to fix
> remaining issues in the locale implementation.
> http://lists.uclibc.org/pipermail/uclibc/2015-June/049000.html
> 
> Because of the bad state of the code I would like to deprecate
> it. I never used it myself and see no good reason why I would
> need it for an embedded system.
> 
> I believe not many people are using it. For good working
> locale support there is still GNU libc and musl.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Can you assess the impact on the packages we currently have in
Buildroot ? I.e, which packages can only work with locale support?

If we remove BR2_TOOLCHAIN_BUILDROOT_LOCALE, then there's a lot of
possible further cleanup: BR2_ENABLE_LOCALE should be removed, all
packages doing select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE should
be changed, etc.

Also, do you have an idea of what is the state of the locale support in
musl ? Does musl provide the functions provided by libiconv ?

It would be good to take this opportunity to make sure the locale
support is OK.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
