From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 03 Jul 2011 21:19:59 +0200
Subject: [Buildroot] [PATCH 1/6] Create and mount /dev/shm
In-Reply-To: <1309355181-21048-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Wed, 29 Jun 2011 15:46:16 +0200")
References: <1309355181-21048-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87y60f189s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> The /dev/shm directory is neither created nor mounted as tmpfs as boot
 Maxime> time. This will cause troubles when using named semaphores on the
 Maxime> system.

Hmm, for everything but BR2_ROOTFS_DEVICE_CREATION_STATIC we already
have a perfectly fine tmpfs on /dev, so it would be good to not mount
another one.

On the other hand, people can use a custom rootfs skeleton if they want
that kind of microoptimizations.

-- 
Bye, Peter Korsgaard
