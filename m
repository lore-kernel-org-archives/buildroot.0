From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 22:02:09 +0200
Subject: [Buildroot] [PATCH 15/30] package/matchbox-common: break
 dependency chain for display
In-Reply-To: <decaf19e18b41b46067fa48d59ba2171e4893598.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <decaf19e18b41b46067fa48d59ba2171e4893598.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <5543DBC1.4010706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/15 20:09, Yann E. MORIN wrote:
> Currently, matchbox-common depends on either matchbox-dsktop or
> matchbox-panel, and the three are organised so that matchbox-common gets
> indented in the menuconfig.
> 
> That's a feature of menuconfig to consider the dependency chain to
> indent sub-options.
> 
> Add a fake, prompt-less option to break that dependency chain.
> 
> Note: yes, this is an dirty hack.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Now that you've moved the packages out of the matchbox/ directory and sorted
them alphabetically, this is no longer needed.

 Or else, I missed the point :-)

 Regards,
 Arnout

> ---
>  package/matchbox/matchbox-common/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/matchbox/matchbox-common/Config.in b/package/matchbox/matchbox-common/Config.in
> index 6ec4697..93761f5 100644
> --- a/package/matchbox/matchbox-common/Config.in
> +++ b/package/matchbox/matchbox-common/Config.in
> @@ -1,3 +1,8 @@
> +# Hack! Break dependency chain so that matchbox-common does
> +# not get indented below matchbox-panel or matchbox-desktop.
> +config FOO
> +    bool
> +
>  config BR2_PACKAGE_MATCHBOX_COMMON
>  	bool "matchbox-common"
>  	depends on BR2_PACKAGE_MATCHBOX_PANEL || BR2_PACKAGE_MATCHBOX_DESKTOP
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
