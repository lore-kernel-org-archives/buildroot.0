From: Malte Starostik <m-starostik@versanet.de>
Date: Tue, 20 Jul 2010 23:42:16 +0200
Subject: [Buildroot] cpio/initramfs and pre-existing /init
Message-ID: <1279662137-10251-1-git-send-email-m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using a skeleton that provides a script for /init that will eventually
exec /sbin/init after some setup.  The whole thing shall be wrapped up as a
linked in or external initramfs via the respective fs targets.
Problem is both of them unconditionally add a /init => /sbin/init symlink.
In my case this link is even broken as part of what /init does is run
busybox --install to create its target.

The following patch Works For Me(TM), but I'm not too sure it's the right
way to do it.  Is -L the correct test or would !-x be better?  What would it
break?

TIA for your thoughts,

Malte
