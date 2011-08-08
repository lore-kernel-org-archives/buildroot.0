From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon,  8 Aug 2011 13:58:08 +0200
Subject: [Buildroot] util-linux compile problems
Message-ID: <1312804690-21977-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

after updating buildroot we are getting compile errors from building
util-linux. First the linker was complaining that it couldn't find
libintl_gettext and related symbols. I was able to fix that by
passing --disable-nls to the configure script (patch follows).
Now I am getting errors all over the place because
program_invocation_short_name is not defined. This is correct
and there's a configure check to test for this. Based on this check
a fallback is provided by include/c.h. However this file is not
included from all places that use program_invocation_short_name.

Now I wonder if this would best be fixed by patching all affected
source files in util-linux or if UCLIBC_HAS_PROGRAM_INVOCATION_NAME
should be selected when util-linux is selected.


Sven
