From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 Mar 2018 19:47:20 +0000
Subject: [Buildroot] [Bug 10766] upmpdcli: Segmentation fault
In-Reply-To: <bug-10766-163@https.bugs.busybox.net/>
References: <bug-10766-163@https.bugs.busybox.net/>
Message-ID: <bug-10766-163-46B9cT3oZZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10766

--- Comment #2 from Bin Zhang <yangtze31@gmail.com> ---
Hello,

Version 1.6.24 of libupnp doesn't work with upmpdcli.
Back to version 1.6.22 solves the problem.
I sent a message to the author of upmpdcli.

======================================
# gdb upmpdcli
GNU gdb (GDB) 7.11.1
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "arm-buildroot-linux-gnueabihf".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from upmpdcli...(no debugging symbols found)...done.
(gdb) run -l 4 -c /etc/upmpdcli.conf
Starting program: /usr/bin/upmpdcli -l 4 -c /etc/upmpdcli.conf
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/libthread_db.so.1".
:4:src/mpdcli.cxx:129::MPDCLi::openconn: mpd protocol version: 0.20.0
[New Thread 0xb6864450 (LWP 209)]
[New Thread 0xb6063450 (LWP 210)]
[New Thread 0xb5862450 (LWP 211)]
[New Thread 0xb5061450 (LWP 212)]
[New Thread 0xb4860450 (LWP 213)]
[New Thread 0xb405f450 (LWP 214)]
[New Thread 0xb385e450 (LWP 215)]
[New Thread 0xb305d450 (LWP 216)]
:4:libupnpp/upnpplib.cxx:156::LibUPnP: Using IP 192.168.0.16 port 49152
:4:src/httpfs.cxx:231::Failed reading /usr/share/upmpdcli/icon.png : open/stat:
errno: 2 :
:4:libupnpp/device/device.cxx:424::UpnpDevice::addService:
[urn:upnp-org:serviceId:AVTransport]
:4:libupnpp/device/device.cxx:424::UpnpDevice::addService:
[urn:upnp-org:serviceId:RenderingControl]
:4:libupnpp/device/device.cxx:424::UpnpDevice::addService:
[urn:upnp-org:serviceId:ConnectionManager]
:4:libupnpp/device/device.cxx:424::UpnpDevice::addService:
[urn:av-openhome-org:serviceId:Info]
:4:libupnpp/device/device.cxx:424::UpnpDevice::addService:
[urn:av-openhome-org:serviceId:Time]
:4:libupnpp/device/device.cxx:424::UpnpDevice::addService:
[urn:av-openhome-org:serviceId:Volume]
:4:libupnpp/device/device.cxx:424::UpnpDevice::addService:
[urn:av-openhome-org:serviceId:Playlist]
[New Thread 0xb285c450 (LWP 217)]
:4:src/ohplaylist.cxx:108::ohPlaylist: cache restore done
:4:libupnpp/device/device.cxx:424::UpnpDevice::addService:
[urn:av-openhome-org:serviceId:Radio]
:4:libupnpp/device/device.cxx:424::UpnpDevice::addService:
[urn:av-openhome-org:serviceId:Product]
:4:src/ohproduct.cxx:108::OHProduct::OHProduct: sources: <SourceList>
 <Source>
  <Name>Playlist</Name>
  <Type>Playlist</Type>
  <Visible>1</Visible>
  </Source>
 <Source>
  <Name>Radio</Name>
  <Type>Radio</Type>
  <Visible>1</Visible>
  </Source>
</SourceList>

:4:src/main.cxx:712::Entering event loop
:4:src/main.cxx:719::Renderer event loop
:4:src/mpdcli.cxx:830::MPDCli::getQueueData
:4:src/mpdcli.cxx:815::MPDCli::getQueueSongs: 0 songs
:4:src/ohplaylist.cxx:147::OHPlaylist::translateIdArray: current ids:
[Thread 0xb6063450 (LWP 210) exited]
[Thread 0xb405f450 (LWP 214) exited]
[New Thread 0xb405f450 (LWP 218)]

Thread 9 "upmpdcli" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0xb305d450 (LWP 216)]
0xb6c9f154 in ?? () from /usr/lib/libupnp.so.6
(gdb) bt
#-1 0xb6c9f154 in ?? () from /usr/lib/libupnp.so.6
Backtrace stopped: Cannot access memory at address 0x25000a04
(gdb) quit
==============================================

-- 
You are receiving this mail because:
You are on the CC list for the bug.
