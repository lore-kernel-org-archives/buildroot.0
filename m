From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Oct 2011 18:17:26 +0200
Subject: [Buildroot] [RFC] Build time graph generation
Message-ID: <cover.1318176666.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are two patches that implement a simple modification of the
package infrastructure to output some timing data about the duration
taken by each step for each package, and then a small Python script
that generates graphs from those informations.

I am not sure that there is any useful usage of those graphs, but it's
fun and there are nice to look at.

Here are some sample graphs, first on a moderately large package set:

 http://free-electrons.com/~thomas/pub/buildroot/graph-time/big/histogram-build-order.pdf
 http://free-electrons.com/~thomas/pub/buildroot/graph-time/big/histogram-duration-order.pdf
 http://free-electrons.com/~thomas/pub/buildroot/graph-time/big/pie-packages.pdf
 http://free-electrons.com/~thomas/pub/buildroot/graph-time/big/pie-steps.pdf

and then on a smaller package set:

 http://free-electrons.com/~thomas/pub/buildroot/graph-time/small/histogram-build-order.pdf
 http://free-electrons.com/~thomas/pub/buildroot/graph-time/small/histogram-duration-order.pdf
 http://free-electrons.com/~thomas/pub/buildroot/graph-time/small/pie-packages.pdf
 http://free-electrons.com/~thomas/pub/buildroot/graph-time/small/pie-steps.pdf

I don't think the modification to the package infrastructure is ready
for merging (there are many cases not handled, like when the timing
data should be cleaned up, the case of overriden packages not being
handled, etc.) and I am not even sure it is useful to complicate the
package infrastructure with such a not-so-useful feature.

Regards,

Thomas

The following changes since commit ddb8c639c312fd9f65dbb123837c100281495d50:

  libplayer: mark python bindings as broken (2011-10-08 22:39:29 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.11/graph-build-time

Thomas Petazzoni (2):
      package: instrument to gather timing data
      graph-build-time: generate graphs based on timing data

 package/Makefile.package.in      |   28 ++++
 support/scripts/graph-build-time |  252 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 280 insertions(+), 0 deletions(-)
 create mode 100755 support/scripts/graph-build-time

Thanks,
-- 
Thomas Petazzoni
