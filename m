From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 18:08:47 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	graph-depends-improvements
Message-ID: <cover.1357146432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are a few improvements to the graph-depends script. The most
important improvements are:

 * Removal of useless dependencies for the meta "all" package to many
   packages. This makes the dependency graphs a lot more readable.

 * Drastic optimization of the execution speed: on a given
   configuration, it used to take 5 minutes 14 seconds to generate the
   graph, now it takes 33 seconds.

Best regards,

Thomas

The following changes since commit f1d44593a04ff3be981c8a3b01a502f0b18193ee:

  docs/manual: small fixes and enhancements to adding generic packages (2012-12-30 22:39:13 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git graph-depends-improvements

for you to fetch changes up to 99c288aaaa42b38f2c841abbf2db0fff1e228656:

  graph-depends: remove support for "unknown" packages (2013-01-02 18:06:12 +0100)

----------------------------------------------------------------
Thomas Petazzoni (6):
      graph-depends: remove redundant dependencies
      graph-depends: use a separate TARGET_EXCEPTIONS variable
      graph-depends: optimize execution speed
      graph-depends: fix comment
      graph-depends: update copyright
      graph-depends: remove support for "unknown" packages

 support/scripts/graph-depends |  169 ++++++++++++++++++++++++++---------------
 1 file changed, 108 insertions(+), 61 deletions(-)

Thanks,
-- 
Thomas Petazzoni
