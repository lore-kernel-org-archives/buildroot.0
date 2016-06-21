From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 21 Jun 2016 08:37:17 -0400
Subject: [Buildroot] [PATCH] fwup: disable documentation build
In-Reply-To: <dcd45c085506be96cfcec71a7357ddeba84c2df3.1466511361.git.baruch@tkos.co.il>
References: <dcd45c085506be96cfcec71a7357ddeba84c2df3.1466511361.git.baruch@tkos.co.il>
Message-ID: <CA+-urNSj1yLeKcvY5Zpk5h+AfYP5J78k8k3crH_+ybk1=MQzWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Tue, Jun 21, 2016 at 8:16 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Documentation build with help2man relies on the output of running 'fwup
> --help'. That obviously can't work with cross compilation.

Fwiw, there was a nearly identical patch a while ago that hasn't been
merged yet:

http://patchwork.ozlabs.org/patch/634937/

I prefer your commit comment, but I'm fine with whichever one gets
merged first. So,

Tested-by: Frank Hunleth <fhunleth@troodon-software.com>

Thanks,
Frank

>
> Fixes:
> http://autobuild.buildroot.net/results/bdd/bdd8137973c37824f6aa9261ee307f6ed21b9166/
> http://autobuild.buildroot.net/results/96a/96a53b3ec666bd09f09c8a3e5b31eff73e3dd0fa/
> http://autobuild.buildroot.net/results/e0b/e0bcfaf9dd36d4992e507d18afeb1cec56048987/
>
> Cc: Frank Hunleth <fhunleth@troodon-software.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/fwup/fwup.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
> index 7b007e1a9c8a..0a23856048b3 100644
> --- a/package/fwup/fwup.mk
> +++ b/package/fwup/fwup.mk
> @@ -10,6 +10,7 @@ FWUP_LICENSE = Apache-2.0
>  FWUP_LICENSE_FILES = LICENSE
>  FWUP_DEPENDENCIES = libconfuse libarchive libsodium
>  FWUP_AUTORECONF = YES
> +FWUP_CONF_ENV = ac_cv_path_HELP2MAN=""
>
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> --
> 2.8.1
>
