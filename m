From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 13 Jul 2020 20:49:41 +0200
Subject: [Buildroot] [PATCH] package/cdrkit: fix build with GCC 10
In-Reply-To: <20200625005836.2232591-1-urjaman@gmail.com>
References: <20200625005836.2232591-1-urjaman@gmail.com>
Message-ID: <CAEyMn7bESKCEz=4hE8qJJLC9mK9Kk=c07feimKaduSnruvVp_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Urja,

Am Do., 25. Juni 2020 um 02:58 Uhr schrieb Urja Rannikko <urjaman@gmail.com>:
>
> This patch adds a missing extern on the outfile
> variable in genisoimage.h.
>
> Signed-off-by: Urja Rannikko <urjaman@gmail.com>

Tested-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
> Note: I would like to see this applied to the LTS 2020.02
> branch too, since it fixes building host-cdrkit for ISO9660
> generation with a host GCC 10.
>
>  .../cdrkit/0003-genisoimage-outfile-extern.patch    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 package/cdrkit/0003-genisoimage-outfile-extern.patch
>
> diff --git a/package/cdrkit/0003-genisoimage-outfile-extern.patch b/package/cdrkit/0003-genisoimage-outfile-extern.patch
> new file mode 100644
> index 0000000000..5a9f0363c9
> --- /dev/null
> +++ b/package/cdrkit/0003-genisoimage-outfile-extern.patch
> @@ -0,0 +1,13 @@
> +diff --git a/genisoimage/genisoimage.h b/genisoimage/genisoimage.h
> +index bbedfb0..82c859b 100644
> +--- a/genisoimage/genisoimage.h
> ++++ b/genisoimage/genisoimage.h
> +@@ -376,7 +376,7 @@ extern int use_fileversion;
> + extern int    split_SL_component;
> + extern int    split_SL_field;
> + extern char   *trans_tbl;
> +-char          *outfile;
> ++extern char   *outfile;
> +
> + #define       JMAX            64      /* maximum Joliet file name length (spec) */
> + #define       JLONGMAX        103     /* out of spec Joliet file name length */
> --
> 2.26.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
