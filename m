From: Guillermo Amaral <g@maral.me>
Date: Thu, 4 Jul 2013 16:36:17 -0700
Subject: [Buildroot] Raspberry Pi and recent commit
Message-ID: <20130704233617.GA10505@enterprise.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys!

I noticed that in a recent commit (3d2c99565856fa96320019dfb7b81fd18e66311f)
the rootfstype was removed from the rpi config.txt file. I had played with
removing it before in rpi-buildroot and I ran into a few issues.

One being that the kernel would fail to mount the ext4 fs if you had ext2
and/or ext3 enabled in the kernel, since it tries to mount ext2,
ext3 then ext4. It can even mount it as ext3, ignoring the journal.

I only experienced the latter, the first was reported to me by a user of
rpi-buildroot.

Just wanted to warn you guys, maybe it was fixed or something, I haven't had
time to test out master.

Also, I always wanted to ask, is there any reason you guys didn't place the
rpi firmware under boot? That's where I put it, seemed like the logical place:

    https://github.com/gamaral/rpi-buildroot/tree/rpi/boot/rpi

Anyway, keep up the great work! I love the project.

Cheers,
G

-- 
gamaral http://about.me/gamaral
