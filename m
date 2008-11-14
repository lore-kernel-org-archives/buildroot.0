From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Nov 2008 12:43:01 +0100
Subject: [Buildroot] [PATCH] package: don't default to y for categories
In-Reply-To: <20081114111923.4d1f2ab8@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Fri\, 14 Nov 2008 11\:19\:23 +0100")
References: <200811132007.39723.markus.heidelberg@web.de>
	<200811140957.05585.markus.heidelberg@web.de>
	<20081114101003.5f1cb983@hcegtvedt>
	<200811141021.18792.markus.heidelberg@web.de>
	<20081114105226.505aa98b@hcegtvedt> <20081114111545.3d3d5ca3@surf>
	<20081114111923.4d1f2ab8@hcegtvedt>
Message-ID: <87vduqo7ne.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

Hi,

 >> In our case, the categories ? Graphical libraries ?, ? Audio stuff ?
 >> and others do not lead to anything being compiled, except if I'm
 >> wrong. So I would say that we shouldn't be able to select/unselect the
 >> categories. They should just be submenus, to organize the options, not
 >> more.
 >> 

 Hans-Christian> Ah, even more sane. I think I for long time ago
 Hans-Christian> (probably fixed now) that LZO was not compiled if the
 Hans-Christian> compression menu was not selected. LZO was selected
 Hans-Christian> by some other packages in a different sub menu.

I actually think that's still the case as we don't source the
Config.in files of the stuff in the sub menus if the menu isn't
enabled.

 >> Look at the top of the kernel configuration system. Networking support
 >> can be enabled/disabled as a whole, while Device Drivers is just a
 >> submenu. Our categories should be like Device Drivers, IMO.
 >> 

 Hans-Christian> Yes, that is smoother IMHO.

I agree. I'll change the sub menus to use menu / endmenu instead of
menuconfig. This does mean that you no longer can deselect all
packages in a submenu simply by deselecting the menu, but as all
packages default to n that shouldn't be a big deal.

-- 
Bye, Peter Korsgaard
