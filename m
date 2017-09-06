From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 13:32:45 +0200
Subject: [Buildroot] [PATCH] libqmi: udev and qmi-over-mbim are optional
In-Reply-To: <CAAP7uc+GQ51G_8P6+L4VmBmFJf6i4iD0f4V-LM9=QzRBLKFjKA@mail.gmail.com>
References: <20170905100327.21421-1-aleksander@aleksander.es>
 <20170905213604.61141da0@windsurf.lan>
 <CAAP7uc+GQ51G_8P6+L4VmBmFJf6i4iD0f4V-LM9=QzRBLKFjKA@mail.gmail.com>
Message-ID: <20170906133245.716cbbc6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Sep 2017 10:38:25 +0200, Aleksander Morgado wrote:

> > All in all, isn't it simpler to get rid of those options, and simply do:
> >
> > ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
> > ... enable support  
> 
> When doing this, should I also include a direct dependency on
> libgudev, so that libgudev is built before libqmi always?
> LIBQMI_DEPENDENCIES += libgudev

Well, if you don't do this, libgudev is not guaranteed to be built
before libqmi, so you would get a build failure, right ?

The canonical way to express optional dependencies is:

ifeq ($(BR2_PACKAGE_FOO),y)
BAR_DEPENDENCIES += foo
BAR_CONF_OPTS += --enable-foo
else
BAR_CONF_OPTS += --disable-foo
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
