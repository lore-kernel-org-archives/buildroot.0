From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Nov 2011 22:57:39 +0000
Subject: [Buildroot] [PATCH 4 of 5 RFC] dependencies: remove unused lzma
	checking scripts
In-Reply-To: <8cb6371f26ea9b9af34f.1320911669@devws108>
References: <patchbomb.1320911665@devws108>
 <8cb6371f26ea9b9af34f.1320911669@devws108>
Message-ID: <201111152257.39718.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 10 November 2011 19:32:00 Thomas De Schampheleire wrote:
> Files package/lzma/lzmacheck.sh and
> toolchain/dependencies/check-host-lzma.sh are present since the very
> beginning of buildroot, but do not appear to be used (anymore). Let's
> remove them.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
>  package/lzma/lzmacheck.sh                 |   9 ---------
>  toolchain/dependencies/check-host-lzma.sh |  13 -------------
>  2 files changed, 0 insertions(+), 22 deletions(-)
> 
> diff --git a/package/lzma/lzmacheck.sh b/package/lzma/lzmacheck.sh
> deleted file mode 100755
> --- a/package/lzma/lzmacheck.sh
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -#!/bin/sh
> -
> -bin=$(toolchain/dependencies/check-host-lzma.sh)
> -if [ "x$bin" = "x" ] ; then
> -  echo build-lzma-host-binary
> -else
> -  echo use-lzma-host-binary
> -fi
> -
> diff --git a/toolchain/dependencies/check-host-lzma.sh
> b/toolchain/dependencies/check-host-lzma.sh deleted file mode 100755
> --- a/toolchain/dependencies/check-host-lzma.sh
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -#!/bin/sh
> -
> -ok=""
> -
> -for bin in /usr/bin/lzma $LZMA
> -do
> -# TODO: add check for proper functionality here..
> -  $bin --version > /dev/null 2>&1 && ok="$bin"
> -  if test "x$ok" != "x" ; then
> -    break
> -  fi
> -done
> -echo "$ok"
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
