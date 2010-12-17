From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Dec 2010 16:43:15 +0100
Subject: [Buildroot] [PATCH 48/55] linux: always enable support for
	tmpfs in the kernel
In-Reply-To: <e2b832a7ac35e77fa907f23e126f223fbdf7d93a.1291582352.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 5 Dec 2010 21:53:19 +0100")
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<e2b832a7ac35e77fa907f23e126f223fbdf7d93a.1291582352.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vd2sflrg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Our default /etc/fstab uses tmpfs to mount the /tmp directory, so it
 Thomas> sounds like a good idea to enable this filesystem by default.

Hmm, I'm not thrilled about this. If you don't have the full SHMEM
filesystem enabled (which I would say is relatively common on the kind
of small systems without swap we're targetting), you have ramfs rather
than tmpfs, and you CAN use a custom fs skeleton, so tmpfs might not be
needed (E.G. for an initramfs).

In general, I would like to keep the hardcoded options to a minimum.

-- 
Bye, Peter Korsgaard
