From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 May 2021 08:22:31 +0000
Subject: [Buildroot] [Bug 13781] isc dhcp-server package don't create file
 /usr/bin/dhcpd
In-Reply-To: <bug-13781-163@https.bugs.busybox.net/>
References: <bug-13781-163@https.bugs.busybox.net/>
Message-ID: <bug-13781-163-XpZmNql0Qz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13781

--- Comment #5 from Heiko Thiery <heiko.thiery@gmail.com> ---
Hi, just tried to reproduce your issue. Setup the environment with using the
latest buildroot from master. With that I see the expected files in the target
directory.

# find build/target/ -name "*dhcp*" 
build/target/sbin/udhcpc
build/target/etc/init.d/S80dhcp-server
build/target/etc/init.d/S80dhcp-relay
build/target/etc/dhcp
build/target/etc/dhcp/dhcpd.conf
build/target/usr/sbin/dhcpd
build/target/usr/share/udhcpc
build/target/usr/lib/libdhcp.so
build/target/usr/lib/libdhcpctl.so
build/target/usr/lib/libdhcp.so.0.0.0
build/target/usr/lib/libdhcp.so.0
build/target/usr/lib/libdhcpctl.so.0
build/target/usr/lib/libdhcpctl.la
build/target/usr/lib/libdhcp.la
build/target/usr/lib/libdhcpctl.so.0.0.0
build/target/var/lib/dhcp


As Arnout also asked, which buildroot version are you using?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
