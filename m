From: Atharva Lele <itsatharva@gmail.com>
Date: Thu,  1 Aug 2019 08:16:13 +0530
Subject: [Buildroot] [PATCH v4 00/30] builder-class series cover letter
Message-ID: <20190801024643.11024-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since various functions in the autobuilder script use a lot of common data, we
introduce a Builder class to house these variables.

I have also included modified versions of Thomas's commits after adapting them
to work with Builder class.

I created a v4 to change the order of one patch, and to delete another patch. No
other changes have been made.

RFC: Few patches, namely patches 25, 27-30 have not been reviewed yet. I'd like
some feedback on them, if any, so that necessary modifications can be done and
it can be merged as soon as possible.

Atharva Lele (28):
  autobuild-run: introduce Builder class
  autobuild-run: move instance variable from kwargs to Builder class
  autobuild-run: move njobs from kwargs to Builder class
  autobuild-run: move sysinfo from kwargs to Builder class
  autobuild-run: move http variables from kwargs to Builder class
  autobuild-run: move submitter from kwargs to Builder class
  autobuild-run: move make_opts from kwargs to Builder class
  autobuild-run: move niceness from kwargs to Builder class
  autobuild-run: move toolchains_csv from kwargs to Builder class
  autobuild-run: move repo from kwargs to Builder class
  autobuild-run: move upload variable from kwargs to Builder class
  autobuild-run: move buildpid from kwargs to Builder class
  autobuild-run: move debug from kwargs to Builder class
  autobuild-run: define instance directory as a part of Builder class
  autobuild-run: move log variable to Builder class
  autobuild-run: remove kwargs argument from function calls and
    definitions
  autobuild-run: define source directory as part of Builder class
  autobuild-run: define download directory as part of Builder class
  autobuild-run: define output directory as part of Builder class
  autobuild-run: define results directory as part of Builder class
  autobuild-run: move check_version() to Builder class
  autobuild-run: move get_branch() to Builder class
  autobuild-run: create reason file on build failures
  web/import.inc.php: support reading failure reason from reason file
  autobuild-run: modify do_build() to accept outputdir as argument
  autobuild-run: define different output directory for reproducible
    builds
  autobuild-run: use different output directories for reproducible
    builds testing
  autobuild-run: make prepare_build() clean the output directory used
    for reproducibility testing

Thomas Petazzoni (2):
  scripts/autobuild-run: make the HTTP URL really configurable
  scripts/autobuild-run: support changing repo

 scripts/autobuild-run | 943 +++++++++++++++++++++---------------------
 web/import.inc.php    |  26 +-
 2 files changed, 488 insertions(+), 481 deletions(-)

-- 
2.22.0
