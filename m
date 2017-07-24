From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 24 Jul 2017 20:16:26 +0200
Subject: [Buildroot] Makefile for iotivity-1.1.1 build under buildroot
In-Reply-To: <CAL6UhvSj4kKS4E0VhFSfD+E2_K_ese8r_ubktdBPTotgOQsCRA@mail.gmail.com>
References: <CAL6UhvSj4kKS4E0VhFSfD+E2_K_ese8r_ubktdBPTotgOQsCRA@mail.gmail.com>
Message-ID: <20170724181626.GA4226@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-07-24 13:48:16, Linux Edwin K wrote:
> Hi buildroot,
>
> I have done a specific project on buildroot environment and I wanted to add
> *ioTivity-1.1.1* as a /buildroot/package/iotivity/
>
> Either OCF or buildroot were not given official support for iotivity build
> under buildroot.
>
> Since my project completion time is shorter, am finding difficulty to write
> my own *iotivity.mk <http://iotivity.mk>* file.
>
> Will I get help ?

Out of curiosity, I briefly looked at iotivity [1]. It uses Scons as its
build system. So if you want to add a new Buildroot package for
iotivity, you can take package/mongodb/mongodb.mk as an example, as this
package also uses Scons.

Scons is not used directly, as a wrapper script named `auto_build.py` is
provided. It may have to be invoked from IOTIVITY_BUILD_CMDS in the
package Makefile.

I also noticed it relies on some external libraries, like Boost,
tinycbor or gtest. Some are available in Buildroot, others are not. So
you may have to add additional packages for the missing ones and list
them in the package dependencies (surprisingly, depending on the missing
library, it either asks the user to perform the clone manually or does
it on its own when building).

Hope this helps.

[1] https://wiki.iotivity.org/build_for_your_system

Regards,

--
ELB
