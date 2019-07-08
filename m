From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  8 Jul 2019 10:14:02 +0200
Subject: [Buildroot] [PATCH buildroot-test 0/4] add support for outdated
 packages
Message-ID: <20190708081406.28215-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provide a new category in daily-mails in addition to build-results: outdated
packages.

The work of adding support for json output in buildroot's `pkg-stats` allow to reuse its
informations in other scripts. The commit add support for extracting packages version and
informs maintainers about packages they maintains that have a newer version.

This patch also improve cli by adding multiple options (see the last commit) since we may
not want to always include the 'outdated packages' notification.

Victor Huesca (4):
  utils/daily-mail: add information about version that may need an
    update
  utils/daily-mail: allow to print a header for results section
  utils/daily-mail: add some debug information for the Notification
    class
  utils/daily-mail: add multiple argument to ease modularity of the
    script

 utils/daily-mail | 185 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 154 insertions(+), 31 deletions(-)

-- 
2.21.0
