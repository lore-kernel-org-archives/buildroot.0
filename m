From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Wed, 16 May 2012 21:23:57 -0600
Subject: [Buildroot] dbus missing /var/lib/dbus directory
Message-ID: <1337225037.1496.51.camel@kepler.gfxmuse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I enabled NetworkManager, which got me dbus, but then disabled
NetworkManager, but dbus remained (that part is okay).  I noticed today
that the init script for dbus tries to run dbus-uuidgen but fails with a
message about not being able to open /etc/machine-id.  I dug around and
then strace'd dbus-uuidgen and found that if /var/lib/dbus is present
this message goes away.

Should the init script also try to create /var/lib/dbus with "mkdir -p"?
Of is that something the specific rootfs needs to address on its own?
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
