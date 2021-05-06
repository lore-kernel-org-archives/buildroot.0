From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 May 2021 16:03:26 +0000
Subject: [Buildroot] [Bug 13781] isc dhcp-server package don't create file
 /usr/bin/dhcpd
In-Reply-To: <bug-13781-163@https.bugs.busybox.net/>
References: <bug-13781-163@https.bugs.busybox.net/>
Message-ID: <bug-13781-163-CuIC514vqM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13781

--- Comment #8 from Heiko Thiery <heiko.thiery@gmail.com> ---
could you please share the content of the following file;

# cat build/dhcp-4.4.2/.files-list.txt 

dhcp,./usr/lib/libdhcp.so.0.0.0
dhcp,./usr/lib/libdhcp.so.0
dhcp,./usr/lib/libdhcp.so
dhcp,./usr/lib/libdhcp.la
dhcp,./usr/lib/libomapi.so.0.0.0
dhcp,./usr/lib/libomapi.so.0
dhcp,./usr/lib/libomapi.so
dhcp,./usr/lib/libomapi.la
dhcp,./usr/lib/libdhcpctl.so.0.0.0
dhcp,./usr/lib/libdhcpctl.so.0
dhcp,./usr/lib/libdhcpctl.so
dhcp,./usr/lib/libdhcpctl.la
dhcp,./usr/bin/omshell
dhcp,./var/lib/dhcp
dhcp,./usr/sbin/dhcpd
dhcp,./etc/dhcp/dhcpd.conf
dhcp,./etc/init.d/S80dhcp-server
dhcp,./etc/init.d/S80dhcp-relay

this is what the package should install into the target.


you could also try to rebuild the dhcp package and check/share the output:
# make dhcp-dirclean dhcp

maybe the autoreconfigure does something strange on your side.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
