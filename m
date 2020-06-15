From: Markus Mayer <mmayer@broadcom.com>
Date: Sun, 14 Jun 2020 19:43:48 -0700
Subject: [Buildroot] [PATCH v2 2/2] package/ebtables: select bash when
 installing ebtables-legacy-save
In-Reply-To: <20200427212653.29933-2-ryanbarnett3@gmail.com>
References: <20200427212653.29933-1-ryanbarnett3@gmail.com>
 <20200427212653.29933-2-ryanbarnett3@gmail.com>
Message-ID: <CAGt4E5sA79AvXc0thXAneM0u_qJiQKV=vBhXBGw6Cb6PPEHKcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 at 14:27, Ryan Barnett <ryanbarnett3@gmail.com> wrote:
>
> To allow easier installation of ebtables-legacy-save from the config
> menu, select BR2_PACKAGE_BASH. All dependencies of bash are met
> already by ebtables depending on BR2_USE_MMU.
>
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
> Changes v1 -> v2:
>   - new patch to series
> ---
>  package/ebtables/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
> index b98d03b626..703e55a3c3 100644
> --- a/package/ebtables/Config.in
> +++ b/package/ebtables/Config.in
> @@ -10,7 +10,8 @@ if BR2_PACKAGE_EBTABLES
>
>  config BR2_PACKAGE_EBTABLES_UTILS_SAVE
>         bool "ebtables save"
> -       depends on BR2_PACKAGE_BASH # runtime
> +       select BR2_PACKAGE_BASH # runtime
> +       select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
>         help
>           Install the ebtables-legacy-save tool
>
> --
> 2.17.1

Tested-by: Markus Mayer <mmayer@broadcom.com>

With BR 2020.05 + ebtables patches, external toolchain and glibc on arm & arm64.
