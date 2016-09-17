From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sat, 17 Sep 2016 13:47:25 +0200
Subject: [Buildroot] [PATCH] openal: Disable build also for examples and
 tests
In-Reply-To: <1473956868-9619-1-git-send-email-nerv@dawncrow.de>
References: <1473956868-9619-1-git-send-email-nerv@dawncrow.de>
Message-ID: <32fb4a64-4487-7f3d-e4ac-8878af33b924@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 15.09.2016 um 18:27 schrieb Andr? Hentschel:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/openal/openal.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openal/openal.mk b/package/openal/openal.mk
> index 356f2c1..6384104 100644
> --- a/package/openal/openal.mk
> +++ b/package/openal/openal.mk
> @@ -16,8 +16,8 @@ OPENAL_LICENSE = LGPLv2+
>  OPENAL_LICENSE_FILES = COPYING
>  OPENAL_INSTALL_STAGING = YES
>  
> -# We don't need the utilities, Distros don't ship them either
> -OPENAL_CONF_OPTS += -DALSOFT_UTILS=OFF
> +# We don't need examples, tests and utilities, Distros don't ship them either
> +OPENAL_CONF_OPTS += -DALSOFT_UTILS=OFF -DALSOFT_EXAMPLES=OFF -DALSOFT_TESTS=OFF
>  
>  ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),y)
>  OPENAL_CONF_OPTS += -DEXTRA_LIBS=atomic
> 
Note, this is for http://autobuild.buildroot.net/results/a11eab534b8642077705d891329c1fd40d394419
