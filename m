From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 22:09:57 +0100
Subject: [Buildroot] [PATCH] package/avahi: Set the path to D-Bus
 system.d directory
In-Reply-To: <20180123231723.5923-1-chris.lesiak@licor.com> (Chris Lesiak's
 message of "Tue, 23 Jan 2018 17:17:23 -0600")
References: <20180123231723.5923-1-chris.lesiak@licor.com>
Message-ID: <87r2q9adwa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Lesiak <chris.lesiak@licor.com> writes:

 > Add --with-dbus-sys=/usr/share/dbus-1/system.d to configure
 > the path to D-Bus system.d directory.  Without this option,
 > distribution provided configuration files were unnecessarily
 > stored in /etc.

Hmm, if we want this to happen then several other packages also look
like they need to be fixed:

git grep '/system\.d'
package/dnsmasq/dnsmasq.mk:             $(TARGET_DIR)/etc/dbus-1/system.d/dnsmasq.conf
package/miraclecast/miraclecast.mk:             $(TARGET_DIR)/etc/dbus-1/system.d/org.freedesktop.miracle.conf
package/wpa_supplicant/wpa_supplicant.mk:               $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf

When did these files move from /etc/ to /usr/share? In D-Bus 1.8.x?

-- 
Bye, Peter Korsgaard
