From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Mar 2015 20:49:44 +0100
Subject: [Buildroot] [PATCH 0/4] 'make help' and README update
Message-ID: <1426967388-559-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 On the BR developer meeting at FOSDEM two months ago I was volunteered
to update the 'make help' output and the README according to the
conclusions of the meeting:

* Keep one big 'make help', no 'make foo-help'. Order the output in a more
  logical way.
* Create a new 'make list-defconfigs' to reduce the output of 'make help'.
  Add a FAQ entry that refers to this.
* The README should be rewritten so it is small and refers to other
  documentation.

 Now, I've finally gotten around to do this...

 There is one potential change I haven't included here: Thomas had also
added documentation for the ccache-specific targets in 'make help'.
Perhaps that still makes sense? Note however that the help text without
linux-menuconfig and friends is already 63 lines long, that's almost 3
pages on some terminals...

 Regards,
 Arnout

----------------------------------------------------------------
Arnout Vandecappelle (Essensium/Mind) (4):
      Makefile: declare 'help' target as phony.
      Makefile: split off 'list-defconfigs' from 'help'
      Makefile: help: add package-specific targets
      README: reduce it to a single page and refer to other documentation

 Makefile                             | 27 ++++++++++++++++++++++-----
 README                               | 59 ++++++++++-------------------------------------------------
 docs/manual/customize-outside-br.txt |  6 +++---
 docs/manual/make-tips.txt            |  6 ++++++
 4 files changed, 41 insertions(+), 57 deletions(-)
