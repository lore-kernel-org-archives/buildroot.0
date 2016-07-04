From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 17:14:18 +0200
Subject: [Buildroot] [PATCH 03/83 v2] package/collectd: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <46b7f0adce308bf807e169fa8c8348c4f349a4b2.1467624132.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 4 Jul 2016 11:24:14 +0200")
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <46b7f0adce308bf807e169fa8c8348c4f349a4b2.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <87a8hxe8qd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Keep the existing sub-menus, because there are a lot of entries in those
 > sub-menus. Using comments to separate them is not a totally satifactory
 > solution.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I'm not quite sure I think this is an improvement. We used to have:

  [ ] collectd

Which when selected becomes:

  [*] collectd
       match plugins  --->
       misc plugins  --->
       read plugins  --->
       target plugins  --->
       write plugins  --->

Which looks sensible to me.

With the change we instead have:

[ ] collectd  ----

(and if you press enter you get to an empty menu). When enabled you
again have to press enter to get to the submenus.

-- 
Bye, Peter Korsgaard
