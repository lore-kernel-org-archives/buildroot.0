From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 21 Oct 2014 16:05:56 +0200
Subject: [Buildroot] [PATCH 1/1] Change /bin/bash shebangs into /usr/bin/env
	bash
Message-ID: <1413900356-5423-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not all systems have /bin/bash (e.g. NixOS[1] doesn't). Buildroot
already uses /usr/bin/env shebangs for other interpreters (perl,
python), so why not bash?

This changes only the shebangs used by Buildroot itself; stuff installed
to the target system is left unchanged.

With this applied I can run Buildroot unmodified on NixOS.

[1]: http://nixos.org/

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 support/download/bzr                  | 2 +-
 support/download/check-hash           | 2 +-
 support/download/cp                   | 2 +-
 support/download/cvs                  | 2 +-
 support/download/git                  | 2 +-
 support/download/hg                   | 2 +-
 support/download/scp                  | 2 +-
 support/download/svn                  | 2 +-
 support/download/wget                 | 2 +-
 support/download/wrapper              | 2 +-
 support/scripts/apply-patches.sh      | 2 +-
 support/scripts/expunge-gconv-modules | 2 +-
 support/scripts/mkusers               | 2 +-
 support/scripts/pkg-stats             | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/support/download/bzr b/support/download/bzr
index b545cb1..c157ca8 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # We want to catch any unexpected failure, and exit immediately
 set -e
diff --git a/support/download/check-hash b/support/download/check-hash
index f1e0c1b..067e7a2 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 set -e
 
 # Helper to check a file matches its known hash
diff --git a/support/download/cp b/support/download/cp
index 264f5dc..463fc38 100755
--- a/support/download/cp
+++ b/support/download/cp
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # We want to catch any unexpected failure, and exit immediately
 set -e
diff --git a/support/download/cvs b/support/download/cvs
index c92d491..56a11c2 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # We want to catch any unexpected failure, and exit immediately
 set -e
diff --git a/support/download/git b/support/download/git
index ff6b5c3..5d36ca4 100755
--- a/support/download/git
+++ b/support/download/git
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # We want to catch any unexpected failure, and exit immediately
 set -e
diff --git a/support/download/hg b/support/download/hg
index 747dd34..66bd2ed 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # We want to catch any unexpected failure, and exit immediately
 set -e
diff --git a/support/download/scp b/support/download/scp
index 1676929..f3e92f3 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # We want to catch any unexpected failure, and exit immediately
 set -e
diff --git a/support/download/svn b/support/download/svn
index 3a9512d..a960f7d 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # We want to catch any unexpected failure, and exit immediately
 set -e
diff --git a/support/download/wget b/support/download/wget
index 2cea100..6b73726 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # We want to catch any unexpected failure, and exit immediately
 set -e
diff --git a/support/download/wrapper b/support/download/wrapper
index 8ae2797..320a37e 100755
--- a/support/download/wrapper
+++ b/support/download/wrapper
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # This script is a wrapper to the other download helpers.
 # Its role is to ensure atomicity when saving downloaded files
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 37f2d81..8cc09cb 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -1,4 +1,4 @@
-#! /bin/bash
+#!/usr/bin/env bash
 # A little script I whipped up to make it easy to
 # patch source trees and have sane error handling
 # -Erik
diff --git a/support/scripts/expunge-gconv-modules b/support/scripts/expunge-gconv-modules
index a77b063..03012c1 100755
--- a/support/scripts/expunge-gconv-modules
+++ b/support/scripts/expunge-gconv-modules
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # This script is used to generate a gconv-modules file that takes into
 # account only the gconv modules installed by Buildroot. It receives
diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index ffd192d..1fd324e 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 set -e
 myname="${0##*/}"
 
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index f6d10bb..48a5536 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/env bash
 
 # Copyright (C) 2009 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 #
-- 
2.1.2
