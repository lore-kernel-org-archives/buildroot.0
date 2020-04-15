From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 07:47:25 +0200
Subject: [Buildroot] [PATCH 5/6] package/collectd: add capabilities
 option
In-Reply-To: <20200414163800.2230496-5-fontaine.fabrice@gmail.com>
References: <20200414163800.2230496-1-fontaine.fabrice@gmail.com>
 <20200414163800.2230496-5-fontaine.fabrice@gmail.com>
Message-ID: <20200415074725.437cc6b6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Apr 2020 18:37:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> capabilities plugin is available since version 5.11.0 and
> https://github.com/collectd/collectd/commit/b934f1572cdb54cf485b600546a72dbf9929ba2c
> 
> It is currently enabled by default depending on jansson and
> libmicrohttpd availability
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/collectd/Config.in   | 8 ++++++++
>  package/collectd/collectd.mk | 2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index 7186d67c36..15c871025c 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -128,6 +128,14 @@ config BR2_PACKAGE_COLLECTD_BIND
>  	help
>  	  Collects BIND DNS statistics.
>  
> +config BR2_PACKAGE_COLLECTD_CAPABILITIES
> +	bool "capabilities"
> +	select BR2_PACKAGE_JANSSON
> +	select BR2_PACKAGE_LIBMICROHTTPD
> +	help
> +	  Collects selected static platform data using dmidecode and
> +	  expose it through micro embedded webserver.

So it will use dmidecode, but it does not depend/enable dmidecode ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
