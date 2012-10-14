From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 11:35:38 +0200
Subject: [Buildroot] [PATCH 1 of 1] Disable check for C++ compiler
In-Reply-To: <patchbomb.1350207337@skate>
References: <patchbomb.1350207337@skate>
Message-ID: <e33fa7a0d77ca247f73d.1350207338@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

# HG changeset patch
# User Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
# Date 1350206855 -7200
# Node ID e33fa7a0d77ca247f73db7f36722261319521951
# Parent  6f2b87c8b1f3bf88e9d0a75191e4f8efb1bcc791
Disable check for C++ compiler

By default, CMake assumes that a project uses both the C and C++
languages, and unionfs-fuse's CMakeLists.txt doesn't explicit which
languages it uses. Therefore CMake checks for both a C compiler and a
C++ compiler, which prevents from building unionfs-fuse on platforms
that don't have a C++ compiler.

We adjust unionfs-fuse CMakeLists.txt to explicity state that we only
use the C language, so that the C++ compiler check is no longer
performed by Cmake.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

diff -r 6f2b87c8b1f3 -r e33fa7a0d77c CMakeLists.txt
--- a/CMakeLists.txt	Wed Sep 26 15:55:52 2012 +0200
+++ b/CMakeLists.txt	Sun Oct 14 11:27:35 2012 +0200
@@ -1,4 +1,4 @@
-project(unionfs-fuse)
+project(unionfs-fuse C)
 
 cmake_minimum_required(VERSION 2.0)
 INCLUDE (CheckIncludeFiles)
