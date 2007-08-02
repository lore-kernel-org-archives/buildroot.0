From: Benjamin Tietz <benjamin@micronet24.de>
Date: Thu, 2 Aug 2007 11:10:21 +0200
Subject: [Buildroot] gcc breaks when compiling in final-stage
Message-ID: <20070802091021.GD4820@firebird.dresden.micronet24.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

when building the internal toolchain with, at least, gcc 4.1.2 it breaks
in the final stage. Complaining about that there is no rule to build
/usr/bin/i686-linux-uclibc-as. As you can see, there is the
$(STAGING_DIR) missing. Looking into the Makefile, it turns out that a
lot of variables named like ORIGINAL_(TOOL)_FOR_TARGET are defined that
way; replacing (TOOL) with AS, LD, NM. 
There where already installed into the correct lcation, under
$(STAGING_DIR)/usr/bin; just these variables are mistakenly generated.

What would be the fastest way to fix this?

regards
Benjamin
