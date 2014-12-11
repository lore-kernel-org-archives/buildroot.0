From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 23:50:08 +0100
Subject: [Buildroot] [PATCHv2 0/3] Improved static/shared library handling
Message-ID: <1418338211-1595-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series contains the remaining patches for the improved
static/shared library handling.

Changes since v1:

 * On the first patch, take into account the various comments made by
   Yann (on the commit log, on defining a 'bool' type for the choice,
   on the prompts for the options of the choice, on the help texts,
   etc.)

 * Split out the ncurses changes in another patch.

 * Add Acked-by from Yann on the patch making "shared only" the
   default.

Thanks,

Thomas

Thomas Petazzoni (3):
  Turn the static lib option into a choice with more options
  ncurses: better handling for shared/static library
  Build shared libraries only as the default

 Config.in                  | 45 ++++++++++++++++++++++++++++++++++++---------
 arch/Config.in             |  1 -
 package/Makefile.in        |  4 +++-
 package/ncurses/ncurses.mk |  9 ++++++++-
 4 files changed, 47 insertions(+), 12 deletions(-)

-- 
2.1.0
