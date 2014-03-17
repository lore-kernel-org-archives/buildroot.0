From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Mar 2014 22:17:22 +0100
Subject: [Buildroot] [PATCH] toolchain: bfin: Add 2013R1 Blackfin
	toolchain option
In-Reply-To: <1395049064-12333-1-git-send-email-Sonic.adi@gmail.com> (sonic
 adi's message of "Mon, 17 Mar 2014 17:37:44 +0800")
References: <1395049064-12333-1-git-send-email-Sonic.adi@gmail.com>
Message-ID: <87siqg5xul.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "sonic" == sonic adi <sonic.adi@gmail.com> writes:

 > From: Sonic Zhang <sonic.zhang@analog.com>
 > Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
 > ---
 >  toolchain/toolchain-external/Config.in             |   19 +++++++++++++++++++
 >  toolchain/toolchain-external/toolchain-external.mk |    6 +++++-
 >  2 files changed, 24 insertions(+), 1 deletion(-)

 > diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
 > index 0607693..0600aeb 100644
 > --- a/toolchain/toolchain-external/Config.in
 > +++ b/toolchain/toolchain-external/Config.in
 > @@ -665,6 +665,23 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 >  	  Other architecture variants (beyond Pentium-4/Xeon) are
 >  	  supported as well, but glibc is not optimised for it.
 
 > +config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
 > +	bool "Blackfin.uclinux.org 2013R1-RC1"
 > +	depends on BR2_bfin
 > +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 > +	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 > +	select BR2_INSTALL_LIBSTDCPP
 > +	select BR2_LARGEFILE
 > +	select BR2_INET_IPV6
 > +	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 > +	select BR2_USE_WCHAR
 > +	select BR2_TOOLCHAIN_HAS_THREADS
 > +	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 > +	select BR2_HOSTARCH_NEEDS_IA32_LIBS

You need to select the correct BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_x
matching your kernel version. With that said, this version sounds quite
similar to the one that got added by Thomas last year:

http://git.buildroot.net/buildroot/commit/?id=951fc4c63f3e14f160ae0d2e306b0a5f0e7b3f6d

-- 
Bye, Peter Korsgaard
