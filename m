From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Jun 2010 21:23:51 +0200
Subject: [Buildroot] [PATCH 1/1] jffs2: let makedevs create device files
In-Reply-To: <5682fe13ee493517e0d0007caa2f61ed676f2789.1275751113.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sat, 5 Jun 2010 17:18:40 +0200")
References: <cover.1275751113.git.thomas.petazzoni@free-electrons.com>
	<cover.1275751113.git.thomas.petazzoni@free-electrons.com>
	<5682fe13ee493517e0d0007caa2f61ed676f2789.1275751113.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r5klnv08.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The common filesystem infrastructure in fs/common.mk uses a smart
 Thomas> combination of makedevs and fakeroot to create the device files in the
 Thomas> target filesystem images without being root. This technique is applied
 Thomas> to all filesystem formats that rely on this common infrastructure, and
 Thomas> JFFS2 is one of them.

 Thomas> Therefore, using the -D option of mkfs.jffs2, which allows to specify
 Thomas> a device table, is redundant with the usage of makedevs. And it is
 Thomas> worst than redundant: for some reason, -D does not create all device
 Thomas> files with the correct major and minor numbers, as reported in bug

 Thomas> For coherence, we just remove the usage of mkfs.jffs2 -D option, and
 Thomas> rely on makedevs/fakeroot to create the device files.

 Thomas> This commit fixes bug #1771.

Committed, thanks!

-- 
Bye, Peter Korsgaard
