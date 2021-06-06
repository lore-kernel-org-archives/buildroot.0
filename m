From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 Jun 2021 13:33:08 +0200
Subject: [Buildroot] [PATCH v1]
 package/x11r7/xdriver_xf86-video-fbturbo: fix driver loading
In-Reply-To: <20210602201529.6210-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Wed, 2 Jun 2021 22:15:29 +0200")
References: <20210602201529.6210-1-ps.report@gmx.net>
Message-ID: <87pmwzxm6j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Port two xf86-video-fbdev upstream patches to xf86-video-fbturbo fixing
 > incompatibility with latest xorg release and add mandatory module loading
 > section to installed xorg.conf:

..

 > +++ b/package/x11r7/xdriver_xf86-video-fbturbo/0004-xorg.conf-add-mandatory-modules-fb-shadow-fbdevhw.patch
 > ++Section "Module"
 > ++   Load "fb"
 > ++   Load "shadow"
 > ++   Load "fbdevhw"

This has now come up a few times (4a3639bad01a0 and 0054fb6345ae). Do
you know what caused this change in xorg module loading behaviour and if
it is intentional or just a bug?

-- 
Bye, Peter Korsgaard
