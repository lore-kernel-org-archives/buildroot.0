From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Mon, 24 Apr 2017 13:19:31 +0200
Subject: [Buildroot]
	=?iso-8859-1?q?=5BPATCH=5D_gcc=3A_Fix_build_failure_r?=
	=?iso-8859-1?q?elated_to_-fPIC_for_x86=5F64_-=3E_i686_builds?=
In-Reply-To: <aded779d-fd0d-e83c-5a3e-d0e7b28b5dfe@mind.be>
References: <71cfdaf7-367d-44de-a1c6-9041e269c8de@cesnet.cz>
 <aded779d-fd0d-e83c-5a3e-d0e7b28b5dfe@mind.be>
Message-ID: <8b7a3f29-c200-4292-8efb-8f6f24c3e7c7@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On pond?l? 24. dubna 2017 0:06:30 CEST, Arnout Vandecappelle wrote:
>  Indeed. However, I wonder, won't you have a similar problem with other host
> packages that try to build something without -fPIC?

Here's a list of host packages that I built with no additional patches:

build/host-acl-2.2.52
build/host-attr-2.4.47
build/host-autoconf-2.69
build/host-automake-1.15
build/host-binutils-2.28
build/host-bison-3.0.4
build/host-dosfstools-4.0
build/host-expat-2.2.0
build/host-e2fsprogs-1.43.4
build/host-fakeroot-1.20.2
build/host-flex-2.5.37
build/host-gawk-4.1.4
build/host-gcc-final-6.3.0
build/host-gcc-initial-6.3.0
build/host-genext2fs-1.4.1
build/host-genimage-9
build/host-gettext-0.19.8.1
build/host-gmp-6.1.2
build/host-gperf-3.0.4
build/host-intltool-0.51.0
build/host-isl-0.14.1
build/host-kmod-24
build/host-libcap-2.25
build/host-libconfuse-3.0
build/host-libtool-2.4.6
build/host-libxml-parser-perl-2.44
build/host-libxml2-2.9.4
build/host-makedevs
build/host-mke2img
build/host-mkpasswd
build/host-mpc-1.0.3
build/host-mpfr-3.1.5
build/host-mtools-4.0.18
build/host-m4-1.4.18
build/host-ncurses-6.0
build/host-pkgconf-0.9.12
build/host-protobuf-c-v1.1.1
build/host-protobuf-v3.0.0
build/host-swig-3.0.10

When I try to rebuild some of them (`make host-$foo-rebuild`), I don't see 
any actual compilation for those that I tried (acl, kmod, swig). It seems 
to me that (except for the toolchain) the compilation is only performed 
when rebuilding the package for the target, and in that case, the newly 
built toolchain which has been previously built by Buildroot gets invoked. 
I.e., the host GCC doesn't get triggered after a toolchain has been built, 
as far as I can see now.

Am I missing something? Is there a host package that I should try to get 
built/rebuilt?

>> BTW, I cannot find my original submission on patchwork. Was 
>> that e-mail OK? I
>> see it in the ML archive [3].
>
>  I believe it's because you sent it base64-encoded, patchwork only likes
> plaintext. You didn't use git send-email, did you?

The copy of the original patch submission that I have in my sent folder 
doesn't appear to be base64-encoded -- it was a result of a `git 
format-patch` with no additional transformation after all.

However, I noticed that the outgoing e-mail was missing a Message-ID 
header, and it seems legit to reject these messages for various reasons.

With kind regards,
Jan
