From: Pierre Le Magourou <pierre.lemagourou@openwide.fr>
Date: Wed, 17 Dec 2014 10:37:40 +0100
Subject: [Buildroot] [PATCH 1/1] qt5cinex: Add new
 Qt5CinematicExperience package.
In-Reply-To: <20141214230211.GH4121@free.fr>
References: <1415095550-26839-1-git-send-email-pierre.lemagourou@openwide.fr>
 <20141214230211.GH4121@free.fr>
Message-ID: <54914EE4.60103@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

> Thank you for your contribution. Sorry for the delay in reviewing this
> patch; here is my review...
> 

I have modified my patch taking into account what you said in your
review. I will send a new patch once I received feedback concerning
where to put the Qt binary file, but I have to clarify something
concerning arm dependency before.

[--SNIP--]

>> +if BR2_PACKAGE_QT5CINEX
>> +
>> +config BR2_PACKAGE_QT5CINEX_RPI
>> +	bool "RaspberryPI Edition"
> 
> This should at least "depends on BR2_arm".

The name of the upstream software is confusing here, it is called
"RaspberryPI edition" but it can also be run on any other platform
that have Qt5 installed. I run it on my laptop without any problem.
So I would say that this package does not need to depend on BR2_arm.

I decided to modify the name of this option to "High Definition
Edition" instead because the difference with the first option is
mainly the 1920x1080 resolution.

> 
> Also, does it use either or both of rpi-userland or rpi-firmware at
> build time or at runtime?

In my understanding, this application is platform independent. It
only needs a functional Qt5 framework installed with
QT5GRAPHICALEFFECTS and does not use rpi-firmware nor rpi-userland.

The dependency to rpi-userland comes from the Qt5GraphicalEffect
package that needs BR2_PACKAGE_QT5_GL_AVAILABLE that will ask for
rpi-userland package to provide GLESv2 on RaspberryPi platform.

> 
> If so, you should add proper dependencies, for example:
> 
> - if build or runtime dependency, add in Config.in:
>     config BR2_PACKAGE_QT5CINEX_RPI
>         bool "RaspberryPI Edition"
>         depends on BR2_PACKAGE_RPI_USERLAND
> 
> - if runtime dependency, add in qt5cinex.mk:
>     QT5CINEX_RPI_DEPENDENCIES += rpi-userland
> 
> (but that's just an example.)
> 

Regards.

-- 
Pierre Le Magourou
