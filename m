From: Lionel Orry <lionel.orry@gmail.com>
Date: Tue, 28 Jul 2015 09:01:47 +0200
Subject: [Buildroot] [PATCH] mongrel2: Bump version and change hosting
In-Reply-To: <1438034847-16930-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1438034847-16930-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAKAx1cgU5Ra4=v=iTQWqDQJ6OP_b8z25kbq-GkNrFyZU3511nQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 28, 2015 at 12:07 AM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> mongrel2 has changed it's repository.
> It was also the opportunity to bump it.
> Adding a hash, since we use this packages as an example for the hash in
> the manual, it was a bit shamefull that it did not have a proper hash.
>
> Remove 0001-use-CC-variable-to-compile-procer.patch, an equivalent was
> applied upstream:
> https://github.com/mongrel2/mongrel2/commit/eafe3cf3efde4278040f38b5808f336e3d102c84
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Lionel Orry <lionel.orry@gmail.com>
> ---
>  .../0001-use-CC-variable-to-compile-procer.patch   | 28 ----------------------
>  package/mongrel2/mongrel2.hash                     |  2 ++
>  package/mongrel2/mongrel2.mk                       |  5 ++--
>  3 files changed, 5 insertions(+), 30 deletions(-)
>  delete mode 100644 package/mongrel2/0001-use-CC-variable-to-compile-procer.patch
>  create mode 100644 package/mongrel2/mongrel2.hash
>
> diff --git a/package/mongrel2/0001-use-CC-variable-to-compile-procer.patch b/package/mongrel2/0001-use-CC-variable-to-compile-procer.patch
> deleted file mode 100644
> index 310177a..0000000
> --- a/package/mongrel2/0001-use-CC-variable-to-compile-procer.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From d30cf797af4828e49fd3c0f25841e669dec05ed5 Mon Sep 17 00:00:00 2001
> -From: Lionel Orry <lionel.orry@gmail.com>
> -Date: Wed, 27 Mar 2013 14:02:00 +0100
> -Subject: [PATCH 3/4] use CC variable to compile procer.
> -
> -This fixes procer tool cross-compilation issues.
> -
> -Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
> ----
> - tools/procer/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tools/procer/Makefile b/tools/procer/Makefile
> -index d0d7de0..bb9aa31 100644
> ---- a/tools/procer/Makefile
> -+++ b/tools/procer/Makefile
> -@@ -8,7 +8,7 @@ all: procer
> -
> -
> - procer: ../../build/libm2.a ${OBJECTS}
> --      gcc $(OPTFLAGS) $(OPTLIBS) -o $@ ${OBJECTS} ../../build/libm2.a ${LIBS}
> -+      $(CC) $(OPTFLAGS) $(OPTLIBS) -o $@ ${OBJECTS} ../../build/libm2.a ${LIBS}
> -
> - clean:
> -       rm -f *.o procer
> ---
> -1.8.1.4
> -
> diff --git a/package/mongrel2/mongrel2.hash b/package/mongrel2/mongrel2.hash
> new file mode 100644
> index 0000000..b8f8de3
> --- /dev/null
> +++ b/package/mongrel2/mongrel2.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 543553c3082f2b992649a975f6cb7324ae2aea93af05288ea4f2c1262a7f63b2  mongrel2-v1.9.2.tar.bz2
> diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
> index 23cec50..0be4832 100644
> --- a/package/mongrel2/mongrel2.mk
> +++ b/package/mongrel2/mongrel2.mk
> @@ -4,10 +4,11 @@
>  #
>  ################################################################################
>
> -MONGREL2_VERSION = v1.9.1
> +MONGREL2_VERSION = 1.9.2
> +MONGREL2_SOURCE = mongrel2-v$(MONGREL2_VERSION).tar.bz2
>  # Do not use the github helper here, the generated tarball is *NOT* the same
>  # as the one uploaded by upstream for the release.
> -MONGREL2_SITE = https://github.com/zedshaw/mongrel2/releases/download/$(MONGREL2_VERSION)
> +MONGREL2_SITE = https://github.com/mongrel2/mongrel2/releases/download/$(MONGREL2_VERSION)
>  MONGREL2_LICENSE = BSD-3c
>  MONGREL2_LICENSE_FILES = LICENSE
>  MONGREL2_DEPENDENCIES = sqlite zeromq
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
