From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Sep 2020 23:07:59 +0200
Subject: [Buildroot] [PATCH v3 7/7] package/cups: adding python support
In-Reply-To: <20200624204347.797088-8-angelo@amarulasolutions.com>
References: <20200624204347.797088-1-angelo@amarulasolutions.com>
 <20200624204347.797088-8-angelo@amarulasolutions.com>
Message-ID: <e72c34ac-dc0a-a5df-0537-4bc4a131ef81@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/06/2020 22:43, Angelo Compagnucci wrote:
> Enables python support if python is available.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  package/cups/cups.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index 805a80e854..67baaf82f9 100644
> --- a/package/cups/cups.mk
> +++ b/package/cups/cups.mk
> @@ -75,6 +75,13 @@ else
>  CUPS_CONF_OPTS += --disable-avahi
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
> +CUPS_CONF_OPTS += --with-python
> +CUPS_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
> +else
> +CUPS_CONF_OPTS += --without-python
> +endif

 configure doesn't know this option, and I couldn't find any reference to python
in the cups 2.3.3 source tree. So I marked this path as rejected.

 Regards,
 Arnout

> +
>  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
>  define CUPS_INSTALL_UDEV_RULES
>  	$(INSTALL) -D -m 0644 package/cups/70-usb-printers.rules \
> 
