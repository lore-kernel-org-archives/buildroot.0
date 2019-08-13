From: Victor Huesca <victor.huesca@bootlin.com>
Date: Tue, 13 Aug 2019 15:13:16 +0200
Subject: [Buildroot] [PATCH buildroot-test v3 0/3] allows to filter
 autobuild results by configuration symbols
Message-ID: <20190813131319.14860-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series allows to filter autobuild results by configuration
options an values from the '.config' file.

Changes:
v1 --> v2:
 - fix a typo causing the footer to not appear
v2 --> v3:
 - reorganize commits
 - reword commit messages
 - move unrelated changes to other patch series
 - replace occurences of 'symbols' by 'config symbols'
 - move the call to 'bab_format_sql_config_symbol_filter' from the 
   '*get_results*' functions to 'bab_format_sql_filter'

Victor Huesca (3):
  web/db.inc.php: add support to test if the database supports a feature
  web/funcs.inc.php: add support for filtering autobuild results by
    configuration options
  web/index.php: add support for configuration symbols via GET

 web/db.inc.php    | 28 ++++++++++++++++++++++++++--
 web/funcs.inc.php | 40 ++++++++++++++++++++++++++++++++++------
 web/index.php     |  3 +++
 3 files changed, 63 insertions(+), 8 deletions(-)

-- 
2.21.0
