From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 14:28:37 +0100
Subject: [Buildroot] [git commit] elfutils: download portability patch
Message-ID: <20141201132856.13E5D7FFF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc92e491f1bfc2a20e5a533e61b1d2de79855544
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Download the portability patch into the buildroot tree.

This isn't nice but there really isn't another good solution for it.
The elfutils-portability.patch is version-dependent hence we already
have an older version for an older version of elfutils in the mirrors.
This causes hash check failures when fetching from sources.buildroot.net
But we can't remove (hence replace) the old version with the new one
since this would causee issues with older versions of
buildroot/elfutils for the same scenario.

Fixes:
http://autobuild.buildroot.net/results/26a/26afb92dc14fd0f85c0800dd4e034ea86af19fe2/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elfutils/0001-elfutils-portability.patch   | 1875 ++++++++++++++++++++
 ...isable-progs.patch => 0003-disable-progs.patch} |    0
 ...0003-memcpy-def.patch => 0007-memcpy-def.patch} |    0
 package/elfutils/elfutils.hash                     |    1 -
 package/elfutils/elfutils.mk                       |    4 +-
 5 files changed, 1876 insertions(+), 4 deletions(-)

Patch is too large, so refusing to show it
