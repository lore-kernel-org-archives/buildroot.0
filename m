From: Alexander Trousevitch <trousev@yandex.ru>
Date: Wed, 10 Mar 2010 15:14:53 +0300
Subject: [Buildroot] [buildroot] [Xorg] [mouse] Mouse don't move
Message-ID: <4bdad2c51003100414vc1f0d37q9e9096a86fd78a30@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, all.

I'm trying to make a tiny linux-based OS, using buildroot, for terminal
stations.

I'm using latest buildroot (2010.02) and i've compiled it with this
configuration:

1. busybox
2. modular X.org
    vesa driver
    xf86-mouse-input driver
    xf86-keyboard-input driver
3. 2.6.22.5 kernel is build manually, modules are copied into /lib/2.6.22.5.

I've faced some problems with vesa driver, but now it's ok.

THE PROBLEM: When i'm starting X, mouse cursor appears, but mouse don't
move.

My Xorg.conf (mouse part):

Section ServerLayout
...
InputDevice "Mouse0" "CorePointer"
...
EndSection
...
Section "Module"
 Load "dri"
 Load "glx"
 Load "extmod"
 Load "dbe"
 Load "freetype"
EndSection

Section InputDevice
  Identifier "Mouse0"
  Driver "mouse"
  Option "Protocol" "PS/2" # i've tried others and auto -- no effect. Mouse
is ps/2.
  Option "Device" "/dev/input/mouse0"  # /dev/input/mice and /dev/mouse
don't work too
  Option "ZAxisMapping" "4 5 6 7"
EndSection


/proc/bus/input/devices says:

I: Bus=0011 Vendor=0002 Product=0006 Version=0000
N: Name="ImExPS/2 Generic Explorer Mouse"
P: Phys=isa0060/serio1/input0
S: Sysfs=/class/input/input1
U: Uniq=
H: Handlers=mouse0
B: EV=7
B: KEY=1f0000 0 0 0 0 0 0 0 0
B: REL=143


lsmod: no modules


What i'm doing wrong?

Should i load a kernel module before starting Xserver? Something else?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100310/8208c207/attachment.htm>
