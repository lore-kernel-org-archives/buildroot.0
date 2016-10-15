From: daggs <daggs@gmx.com>
Date: Sat, 15 Oct 2016 07:57:38 +0200
Subject: [Buildroot] [PATCH 2/2] odroid-mali: add support for X11 driver
In-Reply-To: <4b3c5ef0-c62c-fce6-cce5-3cf4c091997b@mind.be>
References: <20161013174124.9639-1-daggs@gmx.com>
 <20161013174124.9639-2-daggs@gmx.com>,
 <4b3c5ef0-c62c-fce6-cce5-3cf4c091997b@mind.be>
Message-ID: <trinity-26433df8-3e12-4eb8-a67b-fe95a9ec41dd-1476511057951@3capp-mailcom-bs10>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Greetings Arnout, 
>  The Vivante driver has a similar issue as this one: there are different binary
> blobs for X11 and for fbdev, and only one of them can be installed. For the
> Vivante driver, we offer a choice to the user, and the x11-video driver depends
> on the user making the right choice. I don't really like that option. However,
> this one is not ideal either, because there is a two-way interdependence between
> the odroid-mali and the xdriver-video package. In fact, the way it is now, the
> two patches have to be squashed because the previoius one doesn't work without
> this one.
> 
>  So here is my idea: introduce a blind symbol BR2_PACKAGE_ODROID_MALI_X11 in
> this package, and let that option steer the choice between X11 or fbdev. It's
> blind, it's not part of a choice, so it can be selected from the xdriver-video
> package. So from the user's POV, they just have to select the xdriver-video
> package and not worry about the rest. This way, you can first have this patch,
> and then add the xdriver-video package in a second patch.
> 
>
thanks for the feedback, this driver has some limitations, the X11 opengl libs supports only arm64. there is no implementation for arm.
I want to see if I got the idea correct, as said, add the symbol mentioned above:
1) arm: show only the fbdev as an option, the current implementation stays the same. the X11 driver is hidden.
2) arm54: show fbdev and X11 option (if xorg + drivers is set), if fbdev is selected use the current implementation. if the X11 driver is selected, use the implementation in the patch.

am I correct?

Dagg.
