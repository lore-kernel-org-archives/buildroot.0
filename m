From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 May 2021 12:59:41 +0000
Subject: [Buildroot] [Bug 13781] isc dhcp-server package don't create file
 /usr/bin/dhcpd
In-Reply-To: <bug-13781-163@https.bugs.busybox.net/>
References: <bug-13781-163@https.bugs.busybox.net/>
Message-ID: <bug-13781-163-m5QQncGYSk@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13781

--- Comment #6 from Kay Jeschonneck <kay.jeschonneck@airbus.com> ---
> You did enable BR2_PACKAGE_DHCP_SERVER, right?

Yes

> As Arnout also asked, which buildroot version are you using?
version 2021.02


> Hi, just tried to reproduce your issue. Setup the environment with using the latest buildroot from master. With that I see the expected files in the target directory.

I don't see the same file. 
I use the version 2021.02, the kontron external layer and the
kontron_smarc_sal28_defconfig plus i enabled BR2_PACKAGE_DHCP and
BR2_PACKAGE_DHCP_SERVER.

This is my result:

#find build/target/ -name "*dhcp*"
build/target/var/lib/dhcp
build/target/usr/lib/libdhcpctl.so
build/target/usr/lib/libdhcp.so.0
build/target/usr/lib/libdhcpctl.so.0.0.0
build/target/usr/lib/libdhcpctl.so.0
build/target/usr/lib/libdhcp.so.0.0.0
build/target/usr/lib/libdhcp.so
build/target/usr/share/udhcpc
build/target/etc/dhcpcd.conf
build/target/etc/dhcp
build/target/etc/dhcp/dhcpd.conf
build/target/etc/init.d/S80dhcp-relay
build/target/etc/init.d/S80dhcp-server
build/target/sbin/udhcpc

-- 
You are receiving this mail because:
You are on the CC list for the bug.
