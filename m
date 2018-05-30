From: Enoch W. <ixew@hotmail.com>
Date: Wed, 30 May 2018 00:31:14 +0000
Subject: [Buildroot] get initial entropy from the host
Message-ID: <CO2PR01MB1976C4D602E26FDF0D121DEFCC6C0@CO2PR01MB1976.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,?

Thanks for making Linux so easy to build [that is, when it works ;-) ]

package/initscripts/init.d/S20urandom doesn't have readily available entropy on its first boot.
May I suggest initializing /dev/urandom from host generated random-seed. I do it now via my board post-build.sh as follows.
IMHO it should be done as standard.

umask 077
dd if=/dev/urandom of=${TARGET_DIR}/etc/random-seed count=1

Thanks, Enoch.
