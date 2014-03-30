From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 30 Mar 2014 17:48:02 +0200
Subject: [Buildroot] [PATCH 1/1 v2] xdriver_xf86-video-intel: Bump
	version to 2.99.911
References: <1396178545-12912-1-git-send-email-bernd.kuhls@t-online.de>
 <20140330151109.658eb835@skate>
 <t9jl0bxj2h.ln2@ID-313208.user.individual.net>
 <20140330172413.049cd7d0@skate>
Message-ID: <iuql0bxemh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140330172413.049cd7d0 at skate: 

> Can you look into the other circular dependency that your patch series
> has introduced? I've reported it to you yesterday evening.

Hi,

I did, but my knowledge about Kconfig and virtual packages unfortunately 
reaches not that far:( One observation though I would like to share: when 
commenting out

source "package/xbmc/Config.in"

the circular dependency error did not show up. Also Yann?s idea resolved the 
"circular hell": 
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/80652

During the coding on the mesa3d update shortly I already had a virtual 
package for OpenGL, like you proposed, but, as I said, my knowledge here is 
limited so I removed that (non-working) part from the patch in order to have 
a working solution for mesa3d. Since I tested without the xbmc package from 
Maxime (mine is different) I did not notice the dependency problem before.

Regards, Bernd
