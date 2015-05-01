From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 22:07:08 +0200
Subject: [Buildroot] [PATCH 16/30] package/matchbox-fakekey: add missing
 dependency
In-Reply-To: <77c2f1a456664204e74551ed55c4a6578d94874d.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <77c2f1a456664204e74551ed55c4a6578d94874d.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <5543DCEC.6060607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/15 20:09, Yann E. MORIN wrote:
> matchbox-fakekey build-depends on xlib_libXtst, but does not select it.
> 
> Fix that.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/matchbox/matchbox-fakekey/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/matchbox/matchbox-fakekey/Config.in b/package/matchbox/matchbox-fakekey/Config.in
> index 334f3a2..4708292 100644
> --- a/package/matchbox/matchbox-fakekey/Config.in
> +++ b/package/matchbox/matchbox-fakekey/Config.in
> @@ -1,2 +1,3 @@
>  config BR2_PACKAGE_MATCHBOX_FAKEKEY
>  	bool
> +	select BR2_PACKAGE_XLIB_LIBXTST

 It also depends on matchbox-lib without selecting it (like all matchbox
packages BTW).

 Of course, matchbox-lib is always selected because matchbox selects it and
matchbox-* depends on matchbox. However, if there is ever going to be a
checkpackage script, it will check for consistency between select and
DEPENDENCIES. So you can just as well add it now.

 Probably best to do that for all matchbox packages in a single commit, so not
in this patch. Hence my Ack.

 Regards,
 Arnout

> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
