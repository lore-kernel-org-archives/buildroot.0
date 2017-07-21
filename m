From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 11:22:25 +0200
Subject: [Buildroot] [PATCH 1/1] Add option to the gst1-plugins-bad
 package to enable/disable the qt plugin.
In-Reply-To: <CADujc4qKisW=6QyDZjDSUo50Yj+_H4-+7V=2KW32cAzRB_d2Qw@mail.gmail.com>
References: <CADujc4qKisW=6QyDZjDSUo50Yj+_H4-+7V=2KW32cAzRB_d2Qw@mail.gmail.com>
Message-ID: <20170721112225.748ac7a5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 17:13:07 +0800, Glenn Coombs wrote:

> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QT
> +       bool "qt"

Don't you need Qt to be built for this plugin to be compiled?

I would expect some "depends on" on Qt here.

Also, what about qt4 vs. qt5 ?

> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QT),y)
> +GST1_PLUGINS_BAD_CONF_OPTS += --enable-qt

I would expect a GST1_PLUGINS_BAD_DEPENDENCIES += statement here, to
make sure qt or qt5 get built before GStreamer.

Or is Qt not needed to built GStreamer Qt support ?

Also, we have to be careful, because qt5base itself can depend on
gst1-plugins-base, so we need to be careful to not introduce a circular
dependency.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
