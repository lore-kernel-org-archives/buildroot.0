From: Darik Horn <dajhorn@vanadac.com>
Date: Mon, 18 Feb 2008 09:33:08 -0600
Subject: [Buildroot] mkfs.jffs2 error
In-Reply-To: <20080216144427.5FC5012C811@busybox.net>
References: <20080216144427.5FC5012C811@busybox.net>
Message-ID: <47B9A534.6060001@vanadac.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 > I get an error "..../default.script" file not found.

The filesystem scripts sometimes try to pack the udhcp files even if 
CONFIG_APP_UDHCPC is not set, which is a bug.

The quick fix is:

$ mkdir -p project_build_*/*/root/usr/share/udhcpc/
$ touch project_build_*/*/root/usr/share/udhcpc/default.script

You should provide more of the error transcript to get better help sooner.
