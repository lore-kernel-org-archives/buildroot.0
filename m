From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu, 7 Mar 2019 09:26:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/mender: Fix service file.
In-Reply-To: <20190306154953.119334-1-aduskett@gmail.com>
References: <20190306154953.119334-1-aduskett@gmail.com>
Message-ID: <CA+_SqVY+kRB5XCPegZS1ikP43CZ5xi722jKk71QRgfyy0Livkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 6, 2019 at 4:50 PM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> There was a missing double quotes that would prevent the service from starting.
>
> Signed-off-by: Adam Duskett <Aduskett at gmail.com
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Acked-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/mender/mender.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/mender/mender.service b/package/mender/mender.service
> index 8b60a4f1aa..2a5f476ee5 100644
> --- a/package/mender/mender.service
> +++ b/package/mender/mender.service
> @@ -12,7 +12,7 @@ if [ -L /var/lib/mender \
>      if rm -f /var/lib/mender >/dev/null 2>&1; then \
>          mkdir -p /var/lib/mender; \
>      else \
> -        echo "No persistent location to store mender data. Data will be lost\
> +        echo "No persistent location to store mender data. Data will be lost" \
>          echo "at reboot. Are you sure this is what you want to do?"; \
>          mkdir -p "$(readlink /var/lib/mender)"; \
>      fi; \
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
