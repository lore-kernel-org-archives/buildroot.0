From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 May 2021 11:53:28 +0000
Subject: [Buildroot] [Bug 13781] isc dhcp-server package don't create file
 /usr/bin/dhcpd
In-Reply-To: <bug-13781-163@https.bugs.busybox.net/>
References: <bug-13781-163@https.bugs.busybox.net/>
Message-ID: <bug-13781-163-gASTtYtEj4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13781

--- Comment #3 from Kay Jeschonneck <kay.jeschonneck@airbus.com> ---
(In reply to Arnout Vandecappelle from comment #2)

> The file is dhcpd, not dhcpd2.
its right, prescribed


To test if i have some issue with the os-enviroment i had reinstall Ubuntu
18.04.5 LTS, followed the kontron github manual, activated the ccache and only
activated the isc dhcp service packages. 
Now i can't find the dhcpd-file in "build/target/usr/sbin/" or in the
rootfs.tar. 
In "build/build/dhcp-4.4.2/server" i found the file dhcpd, so the system
generate it. If i copy this file manuel in the folder "build/target/usr/sbin/"
and restart the make process, everything is fine and the dhcp-server start.


> Perhaps your post-build script removes it? Or one of your custom packages?

In the kontron buildlayer i can't find something what delete the dhcpd file, 
i searched per 'grep -rnw "./" -e "pattern"', pettern is dhcpd or sbin.

For this test i don't use any custom packages.


Have you some other Ideas?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
