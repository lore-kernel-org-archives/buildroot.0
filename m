From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:09:59 +0200
Subject: [Buildroot] [PATCH 49/50 v2] package/busybox: add dependency on
 attr
In-Reply-To: <5b94111a961b4f18589aa5b5dbc71fc71289e448.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
 <5b94111a961b4f18589aa5b5dbc71fc71289e448.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <966699f8-8101-4a99-ba1c-a3b6a7eb5806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-07-18 11:46, Yann E. MORIN wrote:
> attr and busybox may each install setfattr, so attr must be installed
> before busybox.

 bzip2 is in a similar situation, and probably more.

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/busybox/busybox.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 0a9af9f17b..5266f844b6 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
>  
>  # Packages that provide commands that may also be busybox applets:
>  BUSYBOX_DEPENDENCIES = \
> +	$(if $(BR2_PACKAGE_ATTR),attr) \
>  	$(if $(BR2_PACKAGE_BASH),bash) \
>  	$(if $(BR2_PACKAGE_BC),bc) \
>  	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
