From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 18 Jul 2011 10:15:51 +0100
Subject: [Buildroot] [RFC PATCH 0/2] Add the ability to rebuild packages.
Message-ID: <1310980553-20754-1-git-send-email-quotientvremainder@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes it's necessary to fix something up in the source code of a package.
Usually this requires deleting the stamp file and runinng "make" again.
This patch set allows this sequence to be done by just issuing either a top-level
"make rebuild" to rebuild all packages or a package-specific command, e.g.
"make busybox-rebuild".  The package-specific command will normally be followed by
a "make" (*not* "make rebuild") command to sweep up and generate the RFS.

There may be some subtle harmful effects from rebuilding packages unconditionally
but I've been using this approach for some time and noticed nothing.  The original
patch was based on v2010.08 and I've made efforts to update but may have missed some
things.  It's mainly testing the water anyway as an RFC.

This feature may be useful if Buildroot is extended to being used as a day-to-day
development environment as opposed to a build-once tool.

Quotient Remainder (2):
  Allow rebuilding of generic targets.
  Add top-level rebuild target.

 Makefile                    |   10 ++++++++++
 fs/common.mk                |    2 ++
 package/Makefile.package.in |   22 ++++++++++++++++++++++
 target/generic/Makefile.in  |    6 ++++++
 4 files changed, 40 insertions(+), 0 deletions(-)

-- 
1.7.6
