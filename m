From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Dec 2014 19:12:19 +0100
Subject: [Buildroot] [PATCH 1/1] qt5cinex: Add new
 Qt5CinematicExperience package.
In-Reply-To: <54914EE4.60103@openwide.fr>
References: <1415095550-26839-1-git-send-email-pierre.lemagourou@openwide.fr>
 <20141214230211.GH4121@free.fr> <54914EE4.60103@openwide.fr>
Message-ID: <20141217181219.GA4293@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pierre, All,

On 2014-12-17 10:37 +0100, Pierre Le Magourou spake thusly:
[--SNIP--]
> >> +if BR2_PACKAGE_QT5CINEX
> >> +
> >> +config BR2_PACKAGE_QT5CINEX_RPI
> >> +	bool "RaspberryPI Edition"
> > 
> > This should at least "depends on BR2_arm".
> 
> The name of the upstream software is confusing here, it is called
> "RaspberryPI edition" but it can also be run on any other platform
> that have Qt5 installed. I run it on my laptop without any problem.
> So I would say that this package does not need to depend on BR2_arm.
> 
> I decided to modify the name of this option to "High Definition
> Edition" instead because the difference with the first option is
> mainly the 1920x1080 resolution.

Ah yes, in this case, it makes sense to rename the option and chage the
prompt. But still keep it somewhat aligned to what upstream names it,
maybe something like:

    prompt BR2_PACKAGE_QT5CINEX_HD
        bool "high-definition support (aka RPi Edition)"
        help
          Some blabla about what you explained above. ;-)

> > Also, does it use either or both of rpi-userland or rpi-firmware at
> > build time or at runtime?
> 
> In my understanding, this application is platform independent. It
> only needs a functional Qt5 framework installed with
> QT5GRAPHICALEFFECTS and does not use rpi-firmware nor rpi-userland.
> 
> The dependency to rpi-userland comes from the Qt5GraphicalEffect
> package that needs BR2_PACKAGE_QT5_GL_AVAILABLE that will ask for
> rpi-userland package to provide GLESv2 on RaspberryPi platform.

Indeed, with what you explained, rpi-userland or rpi-firmware is an
indirect dependency, only true when the target in indeed an RPi, but for
other platforms, it could well be another GL provider.

Thank you for the explanations, be sure to include them in some form or
another in the next iteration of the patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
