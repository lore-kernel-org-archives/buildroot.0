From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Jun 2019 09:10:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: add disable
 pivot_root option
In-Reply-To: <14308_1560493044_5D033BF4_14308_222_1_20190614061722.GA2485@r-lnx-nyma7486-2>
 (yann morin's message of "Fri, 14 Jun 2019 08:17:22 +0200")
References: <1560458829-20187-1-git-send-email-frasigal@gmail.com>
 <14308_1560493044_5D033BF4_14308_222_1_20190614061722.GA2485@r-lnx-nyma7486-2>
Message-ID: <87imt8hcb1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <yann.morin@orange.com> writes:

 > Frank, All,
 > On 2019-06-13 23:47 +0300, Frank Sigalas spake thusly:
 >> Sets the environment variable DOCKER_RAMDISK before starting dockerd.

 > [--SNIP--]
 >> diff --git a/package/docker-engine/S60dockerd-ramdisk b/package/docker-engine/S60dockerd-ramdisk
 >> new file mode 100644
 >> index 0000000..a1092b6
 >> --- /dev/null
 >> +++ b/package/docker-engine/S60dockerd-ramdisk
 >> @@ -0,0 +1,38 @@
 >> +#!/bin/sh
 >> +
 >> +NAME=dockerd
 >> +DAEMON=/usr/bin/$NAME
 >> +PIDFILE=/var/run/$NAME.pid
 >> +DAEMON_ARGS=""
 >> +
 >> +[ -r /etc/default/$NAME ] && . /etc/default/$NAME $1

 > The existing package/docker-engine/S60dockerd script also parses
 > similarly named file, so why can't you provide (e.g. in an overlay) this
 > configuraiton file taht would just contain:

 >     export DOCKER_RAMDISK=1

 > The config files in /etc/default/ are the place where such local
 > customisations mustr be done.

 > Besides, your solution does not cover the systemd case anyway (for which
 > Christian alrady provided an example). But that is not even needed
 > either, because this is still a local customisation.

Yes, I wonder if running dockerd from an initramfs is really such a
common setup that we want a dedicated option for it rather than just
letting people add such customization in their overlay?

-- 
Bye, Peter Korsgaard
