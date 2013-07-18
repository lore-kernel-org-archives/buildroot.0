From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 18 Jul 2013 11:12:23 +0200
Subject: [Buildroot] [PATCH v2 0/3] Fix for top-level parallel make part 1
Message-ID: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
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

v2:
 - remove patch "package: add toolchain dependency to inner-generic-package"
   because was not working fine against recent toolchain changes.

Fabio Porcedda (3):
  package/Makefile.in: add a way to don't force jobs in sub-make
  package: fix generic extract target for top-level parallel make
  package: fix generic patch target for top-level parallel make

 package/Makefile.in    | 2 +-
 package/pkg-generic.mk | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
1.8.1.4
