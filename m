From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Apr 2017 14:58:37 +0200
Subject: [Buildroot] [PATCH] portmap: remove package as it is obsolete
In-Reply-To: <20170402033708.GA24554@waldemar-brodkorb.de>
References: <20170402033708.GA24554@waldemar-brodkorb.de>
Message-ID: <50fc5360-3eb6-3a77-6e46-8d9762f73948@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-04-17 05:37, Waldemar Brodkorb wrote:
> The upstream tarball isn't available, no releases since ten
> years. The latest change to upstream git is from 2014.
> Better use rpcbind for any RPC portmapper service.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  Config.in.legacy                                   |  8 ++
>  package/Config.in                                  |  1 -
>  .../0001-README-fix-typo-in-tcp-wrapper-doc.patch  | 26 ------
>  ...0002-NO_PIE-make-PIE-support-controllable.patch | 53 ------------
>  ...K-control-usage-of-fork-for-nommu-systems.patch | 95 ----------------------
>  ...ERROR-control-overriding-of-perror-symbol.patch | 65 ---------------
>  package/portmap/0005-tcpd.patch                    | 18 ----
>  package/portmap/Config.in                          | 16 ----
>  package/portmap/S13portmap                         | 44 ----------
>  package/portmap/portmap.hash                       |  2 -
>  package/portmap/portmap.mk                         | 33 --------
>  11 files changed, 8 insertions(+), 353 deletions(-)
>  delete mode 100644 package/portmap/0001-README-fix-typo-in-tcp-wrapper-doc.patch
>  delete mode 100644 package/portmap/0002-NO_PIE-make-PIE-support-controllable.patch
>  delete mode 100644 package/portmap/0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
>  delete mode 100644 package/portmap/0004-NO_PERROR-control-overriding-of-perror-symbol.patch
>  delete mode 100644 package/portmap/0005-tcpd.patch
>  delete mode 100644 package/portmap/Config.in
>  delete mode 100755 package/portmap/S13portmap
>  delete mode 100644 package/portmap/portmap.hash
>  delete mode 100644 package/portmap/portmap.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index dfd4d67..1da91f6 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,14 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.05"
>  
> +config BR2_PACKAGE_PORTMAP
> +	bool "portmap has been removed"
> +	select BR2_LEGACY

 Shouldn't we add 'select BR2_PACKAGE_RPCBIND' here to make things easier for
the user?

> +	help
> +	  The portmap upstream tarball is removed, no releases since
> +	  ten years and latest change in upstream git in 2014.
> +	  You should better use rpcbind as a RPC portmapper.
> +
>  config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS

 Note to Thomas/Peter: when the rest of the ext2 refactoring stuff is committed,
please keep their legacy entries together, i.e. without inserting the portmap in
the middle. You'll get a merge conflict so it will be obvious :-)

 Regards,
 Arnout

>  	int "extra size in blocks has been removed"
>  	default 0

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
