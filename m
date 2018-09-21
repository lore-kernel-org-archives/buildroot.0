From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Sep 2018 15:31:15 +0200
Subject: [Buildroot] [PATCH 0/2] Support for generating a timeline graph
Message-ID: <20180921133117.9300-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As part of the work on top-level parallel build, I found that it would
be interesting to be able to draw a timeline of the build, to see how
packages are being built in parallel or not. Not only it generates
nice graphs that are interesting to look at, but it also allows to
visually see which package was built in parallel to what other
packages, or before/after this or that other packages.

You can see one timeline graph for a non-parallel build at:

  https://bootlin.com/~thomas/timeline-no-parallel.png
  https://bootlin.com/~thomas/timeline-no-parallel.pdf

And you can see the timeline graph for the same build, with with
parallel build enabled at:

  https://bootlin.com/~thomas/timeline-parallel.png
  https://bootlin.com/~thomas/timeline-parallel.pdf

This patch series is pretty simple:

 - The first patch adds sub-second precision to the timestamps we keep
   in build-time.log.

 - The second patch adds support in the graph-build-time script to
   generate such a timeline. The whole thing is not perfect yet (the
   layout of the graph could be improved, some hardcoded values could
   be removed), but it's a good start, and follow-up patches can
   improve the graph layout.

To test this, just do a build, run "make graph-build", and enjoy the
graph in output/graphs/build.timeline.pdf.

Thanks,

Thomas

Thomas Petazzoni (2):
  package/pkg-generic.mk: increase precision of timestamps
  support/scripts/graph-build-time: add support for timeline graphing

 Makefile                         |  2 ++
 package/pkg-generic.mk           |  2 +-
 support/scripts/graph-build-time | 73 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 74 insertions(+), 3 deletions(-)

-- 
2.14.4
