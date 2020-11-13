From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 23:36:23 +0100
Subject: [Buildroot] [PATCH] support/testing:
 TestInitSystemSystemdRwIfupdown test expect a RW rootfs
In-Reply-To: <20201108230009.439548-1-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 9 Nov 2020 00:00:09 +0100")
References: <20201108230009.439548-1-romain.naour@gmail.com>
Message-ID: <87lff4evfc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > When running the TestInitSystemSystemdRwIfupdown test, the rootfs must
 > be in read-write mode. The commit log [1] introducing systemd tests say
 > so:

 > "basic systemd, read-write, network w/ ifupdown"

 > With systemd 246.5, the service systemd-update-done return an error code
 > when it can't write on the filesystem (/etc)

 > [1] 117835d5fcd508f301d62dd08ee658c1982c7fa7
 > [2] https://github.com/systemd/systemd/commit/8019995e9af9c6d7b5985198cedccd24eda3e26e

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981813

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 > Note: systemd-update-done will continue to fail for other systemd tests
 > when the rootfs is in read-only mode.

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
