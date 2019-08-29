From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 29 Aug 2019 15:23:38 +0200
Subject: [Buildroot] [PATCH buildroot-test 00/10] add gitlab-ci jobs to the
 daily-mail
Message-ID: <20190829132348.1603-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds gitlab-ci job failures to the daily-mail, this
includes both defconfig build failures and runtime tests failures.


Patches 1-3: gitlab-ci infrastructure for defconfigs and runtime-tests.
Patches 4-5: add defconfigs and runtime-tests to per-developer
 notifications.
Patches 6-8: add the formatting logic for defconfig and runtime-tests.
Patches 9-10: adjust command-line arguments and enable gitlab-ci
 integration.

Victor Huesca (10):
  utils/daily-mail: new data: gitlab-ci jobs
  utils/daily-mail: new gitlab-ci data: defconfigs
  utils/daily-mail: new gitlab-ci data: runtime tests
  utils/daily-mail: add defconfig support in developers notifications
  utils/daily-mail: add runtime tests support in developers
    notifications
  utils/daily-mail: prepare the mail formatting to support gitlab-ci
    results
  utils/daily-mail: add formatting for defconfig results
  utils/daily-mail: add formatting for runtime-test results
  utils/daily-mail: add argument for gitlab-ci related data
  utils/daily-mail: enable gitlab-ci emails

 utils/daily-mail | 342 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 313 insertions(+), 29 deletions(-)

-- 
2.21.0
