From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jan 2013 00:41:34 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	yem-instrument-build
Message-ID: <cover.1358379198.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds some intrumentation to the pkg-infra so that it is easier
for the autobuilders to extract meaningfull information about the reason
of failures.

It does so by:
  - logging all messages displayed with calls to MESSAGE to a time-stamped
    log file
  - log the last such mesage to a file
  - add calls to MESSAGE in the non-package steps of the external toolchain
    backend
  - add calls to MESSAGE in the non-package steps of the crosstool-NG
    toolchain backend
  - add calls to MESAGE in the non-package steps of the internal toolchain
    backend (gcc, kernel headers, and uClibc)

Although I've tested it with external and internal toolchain backends (not
crosstool-NG for now), and although it does work, I expect some polishing
to be required. For example, the date is not displayed for the file system
images steps (I suspect it's due to second expansion being needed for
images, which is not for packages).

So, take this series as a kind of RFC, rather than a final series.


The following changes since commit 10e058b0ee7fd8135fef35bcf24ae985707078c2:

  proxychains-ng: copy proxychains.conf to target dir (2013-01-16 13:24:54 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-instrument-build

Yann E. MORIN (6):
      pkg-infra: log current message
      toolchain/external: sprinkle with some calls to MESSAGE
      toolchain/crosstool-ng: sprinkle with some calls to MESSAGE
      toolchain/gcc: sprinkle with some calls to MESSAGE
      toolchain/kernel-headers: sprinkle with some calls to MESSAGE
      toolchain/uClibc: sprinkle with some calls to MESSAGE

 package/pkg-utils.mk                             |    9 ++++++++-
 toolchain/gcc/gcc-uclibc-4.x.mk                  |   15 +++++++++++++++
 toolchain/kernel-headers/kernel-headers.mk       |    3 +++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    3 ++-
 toolchain/toolchain-external/ext-tool.mk         |    8 +++++---
 toolchain/uClibc/uclibc.mk                       |   12 ++++++++++++
 6 files changed, 45 insertions(+), 5 deletions(-)

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
