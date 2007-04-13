From: Alexander Kriegisch <Alexander@Kriegisch.name>
Date: Fri, 13 Apr 2007 20:07:20 +0200
Subject: [Buildroot] Kconfig - how to implement hierarchical (un-)select
	trees?
Message-ID: <461FC6D8.9050803@Kriegisch.name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I read the very concise, but nonetheless puzzling kconfig-language.txt
to understand how to optimise the awfully mis-structured menuconfig of a
project I am participating in. I experimented with an own set of minimal
Config.in files, but still do not understand the ins and outs of this tool.

Does anybody know of a tutorial (incl. samples!) for kconfig? What I
want to achieve is something like this:


Main menu
=========
[ ] global setting a
[x] global setting b
...
packages -->


Packages menu
=============
[ ] package a
[ ] package b
...
[ ] package n
    kernel modules -->
    shared libs -->
    [ ] sub-package n1
...


Kernel modules
==============
[ ] kernel module a
[ ] kernel module b
...
[ ] kernel module n


Shared libs
===========
[ ] shared lib a
[ ] shared lib b
...
[ ] shared lib n


My goals & problems:

  - If package n is unselected, I want everything below it (sub-package,
    shared libs, kernel modules) unselected, too. this is the most
    important point.

  - Some kernel modules (or shared libs, respectively) in the same
    hierarchy may be interdependent. I want to auto-(un)select dependent
    modules. I got part of this working with "select", but unselecting
    works strangely. I cannot describe it any better. Somebody knowing
    the kconfig language and its tricks and tweaks may know what I mean.

  - It is necessary to auto-(un)select several shared libs if related
    kernel modules are (un)selected.

  - Sub-package n1 from the example above automatically selects a number
    of kernel modules and shared libs. They don't get unselected cleanly
    if I define additional interdependencies between elements on the
    same hierarchy level.

  - Muli-level hierarchies as such seem to be problematic anyway.

I know I would express most of the dependencies in a common programming
language such as Java, but the kconfig "language" somehow defies my
thorough understanding.

Regards
-- 
Alexander Kriegisch
