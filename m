From: Aleksander Morgado <aleksander@aleksander.es>
Date: Wed, 6 Sep 2017 10:38:25 +0200
Subject: [Buildroot] [PATCH] libqmi: udev and qmi-over-mbim are optional
In-Reply-To: <20170905213604.61141da0@windsurf.lan>
References: <20170905100327.21421-1-aleksander@aleksander.es>
 <20170905213604.61141da0@windsurf.lan>
Message-ID: <CAAP7uc+GQ51G_8P6+L4VmBmFJf6i4iD0f4V-LM9=QzRBLKFjKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> All in all, isn't it simpler to get rid of those options, and simply do:
>
> ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
> ... enable support

When doing this, should I also include a direct dependency on
libgudev, so that libgudev is built before libqmi always?
LIBQMI_DEPENDENCIES += libgudev

> else
> ... disable support
> endif
>



-- 
Aleksander
https://aleksander.es
