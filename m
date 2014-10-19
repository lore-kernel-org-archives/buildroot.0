From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 12:45:25 +0200
Subject: [Buildroot] systemd not working properly?
Message-ID: <20141019124525.01fe9653@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear systemd/Buildroot users,

I don't use systemd much, but every time I need to test a config with
systemd enabled, there are quite a few errors at boot time, and more
precisely, it doesn't even boot completely. Here are the errors I get:

[FAILED] Failed to start Remount Root and Kernel File Systems.
See 'systemctl status systemd-remount-fs.service' for details.
...

Then a *very* long delay because of dev-ttyAMA0.device., that finally
ends up with:

[ TIME ] Timed out waiting for device dev-ttyAMA0.device.
[DEPEND] Dependency failed for Serial Getty on ttyAMA0.

And finally, I get no getty at all.

Defconfig being used:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSTEMD=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_AVAHI_DAEMON=y

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
