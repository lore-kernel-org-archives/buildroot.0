From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Jun 2017 00:11:27 +0200
Subject: [Buildroot] [PATCH 0/8] Top-level Makefile fixes
Message-ID: <20170614221135.17470-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I saw this StackOverflow question [1], to which Luca gave a satisfactory
answer, and noticed that this really shouldn't happen: when Buildroot
isn't configured and you type 'make toolchain', you should get an error
instead of "Nothing to be done.".

 So I set out to fix that, one thing led to another, and here are 8
patches :-)

 As described in the last patch, there are in fact two different ways
to fix it. I already have a patch for the alternative so I can post it
if necessary.

 Regards,
 Arnout


Arnout Vandecappelle (8):
  Makefile: remove 'toolchain' from .PHONY
  Makefile: document noconfig_targets variable
  Makefile: use pattern for manual-% in noconfig_targets
  Makefile: declare targets PHONY where they are defined
  Makefile: add missing PHONY targets
  doc-asciidoc: add missing .PHONY declarations
  printvars: remove "Nothing to be done for 'printvars'."
  Makefile: unconfigured "make toolchain" should report error

 Makefile                | 50 +++++++++++++++++++++++++++++++++++++++++--------
 package/doc-asciidoc.mk |  8 +++++++-
 2 files changed, 49 insertions(+), 9 deletions(-)

-- 
2.11.0
