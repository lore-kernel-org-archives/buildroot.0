From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Feb 2018 10:50:49 +0000
Subject: [Buildroot] [Bug 10766] New: upmpdcli: Segmentation fault
Message-ID: <bug-10766-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10766

            Bug ID: 10766
           Summary: upmpdcli: Segmentation fault
           Product: buildroot
           Version: 2017.08.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: yangtze31 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

upmpdcli Segmentation fault.
The same config works fine with 2017.11 on a NanoPi NEO.

# upmpdcli -l 4 -c /etc/upmpdcli.conf
:4:src/mpdcli.cxx:129::MPDCLi::openconn: mpd protocol version: 0.20.0
:4:libupnpp/upnpplib.cxx:156::LibUPnP: Using IP 192.168.0.19 port 49154
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
Segmentation fault

-- 
You are receiving this mail because:
You are on the CC list for the bug.
