From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 24 Jul 2007 08:40:01 +0200
Subject: [Buildroot] Buildroot Exits Before Linux Compilation
In-Reply-To: <000001c7cd88$772f1890$6b01a8c0@RANDY>
References: <000001c7cd88$772f1890$6b01a8c0@RANDY>
Message-ID: <20070724064001.GA11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 23, 2007 at 05:20:39PM -0700, Kent wrote:
>Hello,
>
> 
>
>I?m trying to use Buildroot to compile Linux for use on an Atmel
>AT91SAM9260. I?m running buildroot-20070719 on a Fedora core 6, VmWare
>Player virtual machine over top of Windows XP. I browsed the settings
>available in the menuconfig, chose the arm926t for the target architecture,
>chose a couple of options like gdb, pppd, and ?build Linux kernel?, but as
>far as I can tell/remember left the rest as defaults.
>
> 
>
>I get an error right as it starts in on the Linux kernel:
>
> 
>
>Make: *** No rule to make target
>???/buildroot/project_build_arm/uclibc/linux-2.6.21.5/.patched?, needed by
>???/buildroot/project_build_arm/uclibc/linux-2.6.21.5/.configured?. Stop.

Until somebody fixes this, you can just
sed -i -e "s/PROJECT_//g" target/linux/Makefile.in

>???/buildroot/project_build_arm/uclibc?
>
> 
>
>I haven?t seen any other posts about this, so I doubt it?s anything wrong
>with the code, but I?m really newb enough to have no idea what to tinker
>with to get this error to go away. I?m also not sure what other information
>I need to include. If I?ve left out something truly vital, please let me
>know and I?ll send it out as soon as I can.
>

http://lists.uclibc.org/lists/buildroot/2007-July/003826.html
