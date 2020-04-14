From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 14 Apr 2020 19:51:21 +0300
Subject: [Buildroot] [PATCH 6/6] package/collectd: add buddyinfo option
In-Reply-To: <20200414163800.2230496-6-fontaine.fabrice@gmail.com>
References: <20200414163800.2230496-1-fontaine.fabrice@gmail.com>
 <20200414163800.2230496-6-fontaine.fabrice@gmail.com>
Message-ID: <CALFsTFWYW3rLQunMO3EkDy3_FJMX+KPi2HhNdEsOmMnQCkHtEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Apr 14, 2020 at 7:36 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> buddyinfo is available since version 5.11.0 and
> https://github.com/collectd/collectd/commit/cb19ecf90d89a79836b8b5236d2b66277dd79c5f
>
> It is currently enabled by default
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/collectd/Config.in   | 5 +++++
>  package/collectd/collectd.mk | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index 15c871025c..1f55271a97 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -128,6 +128,11 @@ config BR2_PACKAGE_COLLECTD_BIND
>         help
>           Collects BIND DNS statistics.
>
> +config BR2_PACKAGE_BUDDYINFO
I guess you meant to call this "BR2_PACKAGE_COLLECTD_BUDDYINFO".

> +       bool "buddyinfo"
> +       help
> +         Statistics from buddyinfo file about memory fragmentation.
> +
>  config BR2_PACKAGE_COLLECTD_CAPABILITIES
>         bool "capabilities"
>         select BR2_PACKAGE_JANSSON
> diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> index f04ccdb2ff..6bd1754ad7 100644
> --- a/package/collectd/collectd.mk
> +++ b/package/collectd/collectd.mk
> @@ -51,6 +51,7 @@ COLLECTD_CONF_OPTS += \
>         $(if $(BR2_PACKAGE_COLLECTD_APCUPS),--enable-apcups,--disable-apcups) \
>         $(if $(BR2_PACKAGE_COLLECTD_BATTERY),--enable-battery,--disable-battery) \
>         $(if $(BR2_PACKAGE_COLLECTD_BIND),--enable-bind,--disable-bind) \
> +       $(if $(BR2_PACKAGE_COLLECTD_BUDDYINFO),--enable-buddyinfo,--disable-buddyinfo) \
>         $(if $(BR2_PACKAGE_COLLECTD_CAPABILITIES),--enable-capabilities,--disable-capabilities) \
>         $(if $(BR2_PACKAGE_COLLECTD_CEPH),--enable-ceph,--disable-ceph) \
>         $(if $(BR2_PACKAGE_COLLECTD_CHRONY),--enable-chrony,--disable-chrony) \
> --
> 2.25.1
>
Regards,
Asaf.
