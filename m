From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Sep 2014 00:08:37 +0200
Subject: [Buildroot] [PATCH V3 3/4] kexec-lite: Depends on elfutils
	instead of libelf to get the libelf library
In-Reply-To: <1409228494-19492-4-git-send-email-gregory.clement@free-electrons.com>
 (Gregory CLEMENT's message of "Thu, 28 Aug 2014 14:21:33 +0200")
References: <1409228494-19492-1-git-send-email-gregory.clement@free-electrons.com>
 <1409228494-19492-4-git-send-email-gregory.clement@free-electrons.com>
Message-ID: <87oauj5g2i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gregory" == Gregory CLEMENT <gregory.clement@free-electrons.com> writes:

 > The elfutils package provides a more recent version of the libelf, so
 > let's use it. It will allow to remove the libelf package and to avoid
 > conflicts with two packages providing the same library.

 > Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
 > ---
 >  package/kexec-lite/Config.in     | 4 +++-
 >  package/kexec-lite/kexec-lite.mk | 2 +-
 >  2 files changed, 4 insertions(+), 2 deletions(-)

 > diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
 > index 944ee29..dd9713e 100644
 > --- a/package/kexec-lite/Config.in
 > +++ b/package/kexec-lite/Config.in
 > @@ -2,7 +2,9 @@ config BR2_PACKAGE_KEXEC_LITE
 >  	bool "kexec-lite"
 >  	depends on BR2_powerpc || BR2_powerpc64
 >  	depends on !BR2_PREFER_STATIC_LIB # dtc
 > -	select BR2_PACKAGE_LIBELF
 > +	depends on BR2_LARGEFILE # elfutils
 > +	depends on BR2_USE_WCHAR # elfutils
 > +	select BR2_PACKAGE_ELFUTILS
 >  	select BR2_PACKAGE_DTC
 >  	select BR2_PACKAGE_DTC_PROGRAMS
 >  	help

Same as for avrdude, we should update the toolchain options comment to
match.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
