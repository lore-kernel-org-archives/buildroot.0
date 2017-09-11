From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 11 Sep 2017 12:00:25 +0200
Subject: [Buildroot] [PATCH v3] gst1-plugins-bad: fix build against
 openjpeg 2.2
In-Reply-To: <20170910232432.69e3c57b@gmx.net>
References: <20170908133156.10357-1-ps.report@gmx.net>
 <CAAP7uc+zUqWR8w484d5uOtfCPgrkE7o=vaHHgBw7OSTvL1S5Rg@mail.gmail.com>
 <20170910095931.7ad07fe6@gmx.net>
 <CAAP7ucJwBX01nGdTWchRESw_5WqoA4TQSSTJk8ERSRPZT-hYDA@mail.gmail.com>
 <20170910232432.69e3c57b@gmx.net>
Message-ID: <CAAP7ucKGw23Ayd5QBD2ybPOyHnM58HG+we+rQDbcKVJikO08mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Do you have host-gettext explicitly enabled? Could you attach the output of
>
> Tested with your patch applied, my patch applied with the following changes:
>
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -15,7 +15,7 @@ GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+, LGPL-2.1+
>
>  # patch 0001-openjpeg-Fix-build-against-openjpeg-2.2.patch touches configure.ac
>  GST1_PLUGINS_BAD_AUTORECONF = YES
> -GST1_PLUGINS_BAD_GETTEXTIZE = YES
> +#GST1_PLUGINS_BAD_GETTEXTIZE = YES
>
>  GST1_PLUGINS_BAD_CONF_OPTS = \
>         --disable-examples \
> @@ -65,7 +65,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
>         --disable-gtk3 \
>         --disable-qt
>
> -GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
> +GST1_PLUGINS_BAD_DEPENDENCIES = host-gettext gst1-plugins-base gstreamer1
>
>  ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>  # RPI has odd locations for several required headers.
>
>
>> the make command when rebuilding the package?
>
> Yes, see attachment make-gst1_plugins-bad.log.gz.
>

I'll try to reproduce this issue myself once I find some free time,
and will let you know what I find. In the meantime, just go on and
merge the latest patch if it's ok, and sorry for hijacking the thread
with the gettext vs autopoint issue :)


-- 
Aleksander
https://aleksander.es
