From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 26 Oct 2014 15:00:34 -0500
Subject: [Buildroot] [PATCH 51/51] protobuf: bump version
In-Reply-To: <1414349157-22749-51-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414349157-22749-51-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CANQCQpbZNpCqvsqxagGhEkKNXou8xbKS_rgyORygjaYLTFQkyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,
On Oct 26, 2014 1:47 PM, "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
wrote:
>
> From: Matt Weber <matthew.weber@rockwellcollins.com>
>
> * Adds powerpc architecture support
> * Changes to the new github upstream site
> * Updates the license filename
>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
> This patch is a re-spin of the previous bump by Matt Weber, we bump to
> 2.6.1, change effectively the license filename and also add a hash file.
>
> Since the previous bump has caused issues with other packages, this
> patch (along with the bump of protobuf-c) has been tested:
> * host-protobuf-c-v1.0.0-rc1
>
http://autobuild.buildroot.org/results/647/64707ecd9acfbf519d5f22dd6bd5b39c3b544073/build-end.log
>
> * python-protobuf-2.6.0
>
http://autobuild.buildroot.org/results/b3b/b3b36c72b233a624ebae9eaac592b7c6fbd394be/build-end.log
>
> Both issues were reported by Thomas Petazzoni after the last bump.
> None of them did occur with this current bump on my machine.
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/protobuf/Config.in     | 7 +++----
>  package/protobuf/protobuf.hash | 2 ++
>  package/protobuf/protobuf.mk   | 6 +++---
>  3 files changed, 8 insertions(+), 7 deletions(-)
>  create mode 100644 package/protobuf/protobuf.hash
>
> diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
> index 6015b13..e45ed14 100644
> --- a/package/protobuf/Config.in
> +++ b/package/protobuf/Config.in
> @@ -3,17 +3,16 @@ config BR2_PACKAGE_PROTOBUF
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         # See src/google/protobuf/stubs/platform_macros.h for supported
archs.
> -       # PowerPC doesn't actually work.
> -       depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
> +       depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 ||
BR2_powerpc
>         # host-protobuf only builds on certain architectures
>         depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>         help
>           Protocol buffers are Google's language-neutral,
platform-neutral,
>           extensible mechanism for serializing structured data.
>
> -         http://code.google.com/p/protobuf/
> +         https://github.com/google/protobuf/
>
>  comment "protobuf needs a toolchain w/ C++, threads"
>         depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> -       depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
> +       depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 ||
BR2_powerpc
>         depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> diff --git a/package/protobuf/protobuf.hash
b/package/protobuf/protobuf.hash
> new file mode 100644
> index 0000000..ea9b7ef
> --- /dev/null
> +++ b/package/protobuf/protobuf.hash
> @@ -0,0 +1,2 @@
> +# Locally generated
> +sha256
dbbd7bdd2381633995404de65a945ff1a7610b0da14593051b4738c90c6dd164
protobuf-2.6.1.tar.gz
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index 9043f98..366cd1f 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -4,10 +4,10 @@
>  #
>
 ################################################################################
>
> -PROTOBUF_VERSION = 2.5.0
> -PROTOBUF_SITE = http://protobuf.googlecode.com/files
> +PROTOBUF_VERSION = 2.6.1
> +PROTOBUF_SITE =
https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)/
>  PROTOBUF_LICENSE = BSD-3c
> -PROTOBUF_LICENSE_FILES = COPYING.txt
> +PROTOBUF_LICENSE_FILES = LICENSE
>
>  # N.B. Need to use host protoc during cross compilation.
>  PROTOBUF_DEPENDENCIES = host-protobuf
> --
> 2.1.1
>

There is still an outstanding issue with atomics if protobuf 2.6 is built
with gcc older then 4.7.  This was discussed at the last developers meeting
and it sounds like it will result in buildroot infrastructure updates to
validate gcc toolchain during toolchain setup to set a use  atomics
variable only if it supports it.
Thanks,
Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141026/f7f7c181/attachment.html>
