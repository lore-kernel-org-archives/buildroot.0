From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri,  3 Aug 2007 07:54:08 +0200
Subject: [Buildroot] gcc breaks when compiling in final-stage
Message-ID: <pJ3VX1CjlJz0.5P7gM3Zs@mailout.dof.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



 11:10:21AM +0200, Benjamin Tietz wrote:
>Hi all,
>
>when building the internal toolchain with, at least, gcc 4.1.2 it breaks
>in the final stage. Complaining about that there is no rule to build
>/usr/bin/i686-linux-uclibc-as. As you can see, there is the
>$(STAGING_DIR) missing. Looking into the Makefile, it turns out that a
>lot of variables named like ORIGINAL_(TOOL)_FOR_TARGET are defined that
>way; replacing (TOOL) with AS, LD, NM. 
>There where already installed into the correct lcation, under
>$(STAGING_DIR)/usr/bin; just these variables are mistakenly generated.
>
>What would be the fastest way to fix this?

revert that ORIGINAL_(TOOL)_FOR_TARGET stuff.

Ulf, until this stuff works, please create yourself a branch to work on.

=> Did I do any change here?
     I don't think so.
     At least, I do not 
     remember it.

Best Regards
Ulf Samuelsson
