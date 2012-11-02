From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  2 Nov 2012 10:25:39 +0100
Subject: [Buildroot] [RFC 0/2] legal-info: split _LICENSE and _REDISTRIBUTE
	constants
Message-ID: <1351848341-5905-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this small patchset implements the recent proposal to split the license
description (<PKG>_LICENSE) from the fact that a package can be
redistributed or not (<PKG>_REDISTRIBUTE).

The idea is to let the _LICENSE do its work, i.e. simply describe the
license, and add a new _REDISTRUBUTE parameter (defaulting to YES), to
specify if the tarball must be copied or not.
Defining the license and choosing whether or not to redistribute would
become technically independent, which is more correct.

Examples:

MYAPP_LICENSE = PROPRIETARY
would become
MYAPP_LICENSE = PROPRIETARY
MYAPP_REDISTRIBUTE = NO
or
MYAPP_LICENSE = Copyright (C) 2012 My Company # just an idea
MYAPP_REDISTRIBUTE = NO

FOOBAR_LICENSE = PROPRIETARY
would become
FOOBAR_LICENSE = Foobar license
FOOBAR_REDISTRIBUTE = NO

Of course this would make package files more verbose for non-redistributed
packages, but they are a minor part so it is probably not a problem.

See the mailing list thread for further details:
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/46346/focus=46949

You can pull the two commits as well:

The following changes since commit 3ff05f80ffb82e077a332b0c0625f4696a138528:

  rtorrent: bump to version 0.9.3 (2012-10-31 23:15:07 +0100)

are available in the git repository at:

  git at github.com:lucaceresoli/buildroot.git redistribute

for you to fetch changes up to ea0bf84cc08a7eaa91ed2bfb0b563f3e8686d208:

  legal-info: split _LICENSE and _REDISTRIBUTE constants (2012-11-01 23:15:45 +0100)

Luca

----------------------------------------------------------------

Luca Ceresoli (2):
  legal-info: move $(2)_LICENSE to a proper line
  legal-info: split _LICENSE and _REDISTRIBUTE constants

 package/pkg-generic.mk |   29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

-- 
1.7.9.5
