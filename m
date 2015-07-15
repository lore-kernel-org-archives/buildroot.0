From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 15 Jul 2015 17:21:13 +0200
Subject: [Buildroot] Buildroot enhancement proposal: on starting a GUI
	service at boot
Message-ID: <CA+TH9VkiLkeg+9LWedL=2GBkAN4iAK1eO0+cs0_QW4qp7SS1qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Developers,

One of the common use-case for an embedded system is to start a gui at
boot. Probably it will be the main point of interaction after all and
the most sensitive process in the whole system.

I'm thinking on adding a custom option to set correctly a gui service
to be started at boot, something that will make easier for a buildroot
user to start a custom gui service at boot instead of fighting with
overlay and service scipts/files.

Note that this gui service is different from a standard service: it
should be respawned if someting goes wrong and this cannot be done in
a normal busybox/systemv init script: for busybox/systemv it should be
added directly to /etc/inittab.

Actually I'm more oriented in adding an option into "System
configuration": a string that will contain the command line to be
added as a service. The matter is to individuate which init system is
in use and acting accordingly: adding a line in /etc/inittab for
busybox and systemv or adding a service file for systemd.

Aside from technical difficulty which is none, what could be the best
way to implement such behaviour? Is it a desirable feature for
buildroot?
If yes, what is the best approach to have it accepted, a "package", an
option, where?

I'm looking for advice! thank you!

Sincerely, Angelo
-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
