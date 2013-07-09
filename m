From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  9 Jul 2013 10:47:44 +0200
Subject: [Buildroot] [PATCH 0/4] Fix for top-level parallel make part 1
Message-ID: <1373359668-18099-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
this is the first patch set for fixing top-level parallel make in buildroot,
the common problem scattered in buildroot's top-level makefile is that in the
rules it relies on the order of evaluation of the prerequisites,
to be able to use top-level parallel make instead of reling on the left to
right ordering of evaluation of the prerequisites we must add an explicit
rule to describe the dependency.

Fabio Porcedda (4):
  package/Makefile.in: add a way to don't force jobs in sub-make
  package: add toolchain dependency to inner-generic-package
  package: fix generic extract target for top-level parallel make
  package: fix generic patch target for top-level parallel make

 package/Makefile.in      |  2 +-
 package/pkg-autotools.mk |  2 +-
 package/pkg-generic.mk   | 14 ++++++++++----
 3 files changed, 12 insertions(+), 6 deletions(-)

-- 
1.8.1.4
