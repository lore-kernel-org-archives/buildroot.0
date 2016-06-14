From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:29:28 +0200
Subject: [Buildroot] Reproducible build v2
Message-ID: <20160614152928.GH3060@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Please find a second version of the patches, containing all patches
which did not raise objections, or which have been fixed according
to your advices.

The patches follow this mail and are available as a git branch:
https://git.click-hack.org/buildroot.git/log/?h=reproducible

Some modifications have been left out this time around, because as
has been said in answer to the first set, because they need to be
factored rather than fixed again and again for every package.
Namely:
- overriding gcc macros containing build timestamps in packages;
- touching with SOURCE_DATE_EPOCH all files before starting;
archiving (whether with tar, cpio, or genisoimage);
- touching the tarball before compressing it, in order to allow
generating images in format where the compressor does not allow
disabling timestamps (such as lzo);
- sort file list when archiving so that the archive members order do
not depend on the order of files in the directory.

Unfortunately, I have other more urgent issues to work on, so I am
going to abandon this work on buildroot. If anyone is interested in
continuing this work, you can also find my original patches in a git
branch too:
https://git.click-hack.org/buildroot.git/log/?h=reproducible.orig

Regards.

-- 
					    Gilles.
https://click-hack.org
