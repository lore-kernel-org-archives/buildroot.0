From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Oct 2012 21:53:14 +0200
Subject: [Buildroot] [PATCH] mxs-bootloader: Barebox entry point symbol
 changed in 2012.08
In-Reply-To: <1350547326-31407-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1350547326-31407-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <50805E2A.1010308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/12 10:02, Maxime Ripard wrote:
> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>
> ---
>   boot/mxs-bootlets/barebox_ivt.bd |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/boot/mxs-bootlets/barebox_ivt.bd b/boot/mxs-bootlets/barebox_ivt.bd
> index e02ddd6..0c67e9c 100644
> --- a/boot/mxs-bootlets/barebox_ivt.bd
> +++ b/boot/mxs-bootlets/barebox_ivt.bd
> @@ -28,7 +28,7 @@ section (0) {
>   	//----------------------------------------------------------
>
>           load barebox;
> -        load ivt (entry = barebox:exception_vectors)>  0x8000;
> +        load ivt (entry = barebox:start)>  0x8000;
>   	hab call 0x8000;
>
>   }

  Shouldn't this somehow depend on the selected barebox version then?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
