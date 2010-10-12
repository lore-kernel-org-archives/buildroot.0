From: Maxime Ripard <ripard@archos.com>
Date: Tue, 12 Oct 2010 10:26:52 +0200
Subject: [Buildroot] [PATCH 0/4] Move to Python 2.7
Message-ID: <1286872016-12621-1-git-send-email-ripard@archos.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all !

This set of patches replaces the old yet brave python2.4 by the brand new
long term support python 2.7.

Note that the last patch is a workaround for a bug opened on the python's
bugtracker, so it should be removed anytime soon (even though the bug has
been opened two years ago).

The first two patches port existing patches to the new python version and
the third fix the new breakages when cross-compiling : bytecode generation
by compileall.py which requires the struct module, not compiled when we
compile the HOSTPYTHON. The removed part of the code is never executed for
now, but it could lead to a bug with future versions. The second breakage is
the long long int detection, which is required to build python, and is always
evaluated to false when cross-compiling.

[PATCH 1/4] python: Move to version 2.7
[PATCH 2/4] python: Port the existing patches to python2.7
[PATCH 3/4] python: Add needed extra patches.
[PATCH 4/4] python: Fix make install (Workaround python's bug #1669349)

____________________________________________________________________________

This  email  and any  files  transmitted  with it are  confidential  and are
intended solely  for the use of the individual  or entity to which  they are
addressed.  Access to this e-mail by anyone else is unauthorised. If you are
not the  intended recipient,  any disclosure,  copying,  distribution or any
action taken or omitted to be taken in reliance on it, is prohibited. E-mail
messages are not necessarily secure.  Archos does not accept  responsibility
for any changes made to this message after it was sent.
