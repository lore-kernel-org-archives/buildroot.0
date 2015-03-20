From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:49:40 +0100
Subject: [Buildroot] systemd cleanups v2
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <20150320204940.396d4c36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Fri, 20 Mar 2015 15:13:51 -0400, Mike Williams wrote:
> Changes:
> v1 -> v2:
> * numerous packages adjusted to put udev rules in /usr/lib instead of /lib
> * use relative symlinks everywhere
> * avahi: AVAHI_EXTRA_CFLAGS -> AVAHI_CFLAGS
> * OpenSSH: enable by linking to multi-user.target.wants in /etc instead of /usr/lib
> * systemd: create dir /etc/systemd/system/getty.target.wants
> * thttpd: add systemd support, fix line wraps from separate v1 patch
> * gpsd: fix systemd and udev support
> * lighttpd: use upstream service file
> * wpa_supplicant: rolled into series from separate patch

Next time you may want to use "git format-patch --cover" which
generates for you a cover letter that has a list of the patches.

So, I have applied:

c85b3fca39e9a3361a3202037010211566d152fd thttpd: add systemd service file
1c74c8431341006d063f40b7436cc529d4378ae2 wpa_supplicant: install systemd service files
af17811662595ad1db0a992a3a7446c79d40d578 kodi: move systemd service file to /usr/lib
b054815ee5fd023d7123f35633688eb56c9514d9 dhcp: move systemd service file to /usr/lib
1dd088ca16f4daacad33b8e7c218dc9055c47c97 libiio: move systemd service file to /usr/lib
173f15e62b4539e670690a03e3a1f59a83923656 postgresql: move systemd service file to /usr/lib
3aa96c1e5ad51c9dfb3a50af8ef1fc958d7f655f dropbear: move systemd service file to /usr/lib
6111d478d2ef180eeb80c1a3b42deb625f5594b8 openssh: move systemd service files to /usr/lib
2702ac5016cca013350f6c2d5639c4a4263bfdd3 irqbalance: move systemd service file to /usr/lib
40f0d87374aea8371f1612fca3ed12b4b152f1b7 dbus: move systemd service files to /usr/lib
407e542d777e1de3dca2e6c2e0e87ee7b753b4df openntpd: move systemd service files to /usr/lib
ad56242ae3ef6997b7c30b940065ae8f1ba85978 openvmtools: move systemd service to /usr/lib
7afccf677621c557d0db100117833b1dfdf4d071 ntp: move systemd service file to /usr/lib
c986d663d77ad50c59f3191d49c51cb4da4d3198 lighttpd: use upstream systemd service file

I have left on the side:

 [v2,04/25] psplash: move systemd service files to /usr/lib
 [v2,09/25] rsyslog: fix systemd service installation
 [v2,23/25] avahi: systemd cleanups

because I made some comments on them.

And I have also left on the side all the patches moving the udev rules
from /lib/udev to /usr/lib/udev because for now, I'm not sure to
understand the motivation behind this change, which seems a bit
pointless to me at first sight.

For systemd, I do understand the idea of having .service files
themselves in /usr and only the symlinks to enable the services
in /etc. But for udev, I'm not sure.

Opinions from others are welcome.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
