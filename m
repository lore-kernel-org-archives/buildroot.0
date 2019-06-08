From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 8 Jun 2019 15:36:31 -0400
Subject: [Buildroot] [PATCH 1/1] package/pkg-golang: add cflags/ldflags
 to GO_HOST_ENV
In-Reply-To: <20190603092101.8658-1-mirza.krak@northern.tech>
References: <20190603092101.8658-1-mirza.krak@northern.tech>
Message-ID: <CAFSsvmo5+Zt_2opn72tP2NO5BHCRnb6sRAb4ryMH6oFNfXN92Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All:

Acked-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>

On Mon, Jun 3, 2019 at 5:21 AM Mirza Krak <mirza.krak@northern.tech> wrote:
>
> If a go host package is built using cgo, it needs access
> to HOST_CFLAGS/HOST_LDFLAGS to utilize host packages it
> might depend on.
>
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---
>
> This fixes current build errors of mender-artifact-3.0.0:
>
> http://autobuild.buildroot.net/results/dd1a6dac03dd3b68ee63761c33dbb01c328d4f14/build-end.log
>
>  package/pkg-golang.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index b4e8a53065..72e8f6b7af 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -35,6 +35,8 @@ GO_TARGET_ENV = \
>         $(GO_COMMON_ENV)
>
>  GO_HOST_ENV = \
> +       CGO_CFLAGS="$(HOST_CFLAGS)" \
> +       CGO_LDFLAGS="$(HOST_LDFLAGS)" \
>         $(GO_COMMON_ENV)
>
>  ################################################################################
> --
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
