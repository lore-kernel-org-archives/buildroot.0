From: g4 at novadsp.com <g4@novadsp.com>
Date: Mon, 25 May 2015 19:52:44 +0100
Subject: [Buildroot] showstopper 404 problem ...
Message-ID: <01a201d0971b$fca690b0$f5f3b210$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am not sure if this is due to general ignorance or a real problem. TVMIA
for any pointers.

 

My .config (created by menuconfig) has 

 

BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.0.4"

BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-
kernel.git"

 

Once the repo is finally cloned I get this showstopper error. Re-running
make starts the git clone all over again. 

 

Have I simply go the kernel name/label wrong?  A manual wget fails so I
assume the latter is a strong possibility.

 

----------------------------------------------------------------------------
--

moi at acermint ~/buildroot $ make

/usr/bin/make -j1  HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++"
silentoldconfig

make[1]: Entering directory `/home/moi/buildroot'

BR2_DEFCONFIG=''
KCONFIG_AUTOCONFIG=/home/moi/buildroot/output/build/buildroot-config/auto.co
nf KCONFIG_AUTOHEADE

R=/home/moi/buildroot/output/build/buildroot-config/autoconf.h
KCONFIG_TRISTATE=/home/moi/buildroot/output/bui

ld/buildroot-config/tristate.config BR2_CONFIG=/home/moi/buildroot/.config
BR2_EXTERNAL=support/dummy-external /h

ome/moi/buildroot/output/build/buildroot-config/conf --silentoldconfig
Config.in

make[1]: Leaving directory `/home/moi/buildroot'

>>> linux 4.0.4 Downloading

Doing full clone

Cloning into bare repository 'linux-4.0.4'...

remote: Counting objects: 4872908, done.

remote: Compressing objects: 100% (723616/723616), done.

Receiving objects:  33% (1609811/4872908), 526.36 MiB | 218.00 K

remote: Total 4872908 (delta 4123401), reused 4863877 (delta 4114759)

Receiving objects: 100% (4872908/4872908), 944.23 MiB | 204.00 KiB/s, done.

Resolving deltas: 100% (4123401/4123401), done.

Checking connectivity... done.

fatal: Not a valid object name

--2015-05-25 18:36:02--  http://sources.buildroot.net/linux-4.0.4.tar.gz

Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109

Connecting to sources.buildroot.net
(sources.buildroot.net)|176.9.16.109|:80... connected.

HTTP request sent, awaiting response... 404 Not Found

2015-05-25 18:36:02 ERROR 404: Not Found.

 

make: *** [/home/moi/buildroot/output/build/linux-4.0.4/.stamp_downloaded]
Error 1

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150525/95c62f37/attachment.html>
