From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 08:35:47 +0100
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant - Specify that old and
 new dbus are incompatible
In-Reply-To: <3603330.UGTkN10abk@peanuts2> (Pierre's message of "Wed, 28 Feb
 2018 23:55:34 +0100")
References: <20180218215039.4811-1-pinaraf@pinaraf.info>
 <87fu5kkfy0.fsf@dell.be.48ers.dk> <3603330.UGTkN10abk@peanuts2>
Message-ID: <877eqwjlik.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre" == Pierre  <pinaraf@pinaraf.info> writes:

 > On Wednesday, February 28, 2018 9:38:31 PM CET Peter Korsgaard wrote:
 >> >>>>> "Pierre" == Pierre Ducroquet <pinaraf@pinaraf.info> writes:
 >> > Building wpa-supplicant with support for both DBus interfaces
 >> > generates broken .service files.
 >> 
 >> In what way are they broken? I did a quick test build of 3
 >> configurations:
 >> 
 >> - Only old
 >> - Only new
 >> - Old and new
 >> 
 >> and I don't see any difference in the .service files?

 > It generated a .service file with an empty BusName in the [Service] part of 
 > the .service.
 > Since enabling only one interface generated the proper file, I deduced both 
 > could not be enabled together. Maybe something else in my configuration 
 > impacted that, I will check that again if you can't reproduce.

Wait, are we talking about dbus service files (that afaik don't take a
BusName directive) or systemd files?

-- 
Bye, Peter Korsgaard
