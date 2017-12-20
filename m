From: Sam <samiswt@gmail.com>
Date: Wed, 20 Dec 2017 14:19:42 -0800
Subject: [Buildroot] how to pass directory path to sed script
Message-ID: <CAPi4xiV8JLmssUyBbFg3G+LKAwH1vaOrA8Wq5u=rQegY=3e7oQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using Buildroot to cross-compile Linux for RPi3. I'm trying to add a
new package called Netmap to my Buildroot packages. The problem is that
there's a configure file in netmap src directory which contained a variable
named BUILDDIR and its default value is $PWD. During the configuring
process, it'll be  automatically configured to my buildroot root directory.
So I wanna replace it with $(@D). The following is what was doing, I'm
sorry for no mk file attached because my host machine is on Gentoo text
mode console.

define NETMAP_BUILD_CMDS
     NETMAP_CURRENT_DIR=$(sed -e 's/\//\\\//g' <<< "$(@D)")  ---- empty
     NETMAP_CURRENT_DIR=$$(sed -e 's/\//\\\//g' <<< "$(@D)") ----
commandline itself
     sed -e 's/BUILDDIR=$$PWD/BUILDDIR=$(NETMAP_CURRENT_DIR)/g' -i
$(@D)/LINUX/configure
     ...
endef

Thanks for your help!

Merry Christmas!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171220/8befa610/attachment.html>
