From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 Jan 2014 00:07:38 +0100
Subject: [Buildroot] [PATCH] fs/ext2: fix generation of ext4 filesystems
In-Reply-To: <1388962578-23901-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 5 Jan 2014 23:56:18 +0100")
References: <1388962578-23901-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <878uuuyqmd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > cset 7a58a4e (e2fsprogs: bump to version 1.42.9) broke the generation
 > of ext4 filesystems.

 > This is because, in ext4, some metadata are dependent on the UUID.
 > If changing the UUID of an ext4 filesystem, tune2fs now exits with
 > exit-code 1, and prints a message to run fsck, to avoid trashing the
 > filesystem.

 > This condition is of utmost importance on a mounted filesysten (which
 > is not our case) to avoid corruption (yes, it is possible to change
 > the UUID of a mounted filesystem).

 > But the error is not valid for us, since we are working on an unmonted
 > filesystem image in the first place.

 > Since we change the UUID after we convert the filesystem (to ext4),
 > tune2fs just bails out.

 > We can not just ignore the exit code of tune2fs, since we still want
 > to catch any other failure.

 > It turns out that, changing the UUID before converting the filesystem
 > is just the way to go.

 > Fixes #6752.

 > Reported-by: Daniel Mentz <daniel@exxm.de>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Daniel Mentz <daniel@exxm.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
