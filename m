From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Apr 2017 22:59:58 +0200
Subject: [Buildroot] [PATCH 28/29] package/qt: drop option for license
 approved
In-Reply-To: <2389cf9ab684f7d56a7ab20b3d8a2be0fa612167.1492979449.git.yann.morin.1998@free.fr>
References: <cover.1492979449.git.yann.morin.1998@free.fr>
 <2389cf9ab684f7d56a7ab20b3d8a2be0fa612167.1492979449.git.yann.morin.1998@free.fr>
Message-ID: <3cbea545-9c8f-5502-eb50-aac7fb9a0bc5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-04-17 22:31, Yann E. MORIN wrote:
> As stated in previous commits, Buildroot only ever uses the free
> license, and we do not have a click-wrap approval for any such free
> license for any other package.
> 
> The option to approve the license now has no prompt and is no longer
> used anywhere. Drop it and make it a legacy entry.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> ---
>  Config.in.legacy     | 6 ++++++
>  package/qt/Config.in | 4 ----
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 8e9f3d175d..52cda9808e 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,12 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.05"
>  
> +config BR2_PACKAGE_QT_LICENSE_APPROVED
> +	bool "Qt free license now always approved"
> +	select BR2_LEGACY
> +	help
> +	  Use of Qt in Buildroot now always use the free license of Qt.

 IMO this doesn't bring any value. If the user already has selected to approve
the free license, nothing really changes for them so there's no point drawing
their attention to legacy.

 We should instead give a legacy warning when the user *didn't* have the option
selected. But that's not possible, of course.

 Therefore, I'd say we drop the legacy handling for this option.


 Regards,
 Arnout
> +
>  config BR2_PACKAGE_PORTMAP
>  	bool "portmap has been removed"
>  	select BR2_LEGACY
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index 5f07bd22f9..d3a01da87f 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -99,10 +99,6 @@ config BR2_PACKAGE_QT_STATIC
>  
>  endchoice
>  
> -config BR2_PACKAGE_QT_LICENSE_APPROVED
> -	bool
> -	default y
> -
>  config BR2_PACKAGE_QT_CONFIG_FILE
>  	string "Config file"
>  	help
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
