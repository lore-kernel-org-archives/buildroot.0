From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Wed, 25 Dec 2013 17:18:57 +0100
Subject: [Buildroot] [RFC PATCH 0/2] gitorious helper
Message-ID: <1387988339-17460-1-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following patches introduce a gitroious helper to download tarballs for
gitorious. I currently see two shortcomings:
 - the tarball URL is https://gitorious.org/<project>/<repo>/archive/<version>.tar.gz
   so the downloaded tarball doesn't have any name appart from <version>.tar.gz
 - It needs two separate functions for target and host packages.

Alexandre Belloni (2):
  infra: introduce gitorious helper function
  packages: use gitorious helper when applicable

 boot/xloader/xloader.mk                 |  2 +-
 docs/manual/adding-packages-generic.txt | 10 +++++-----
 docs/manual/adding-packages-tips.txt    | 18 ++++++++++++++++++
 package/can-utils/can-utils.mk          |  2 +-
 package/lpc3250loader/lpc3250loader.mk  |  2 +-
 package/pkg-download.mk                 |  8 ++++++++
 package/ti-uim/ti-uim.mk                |  2 +-
 7 files changed, 35 insertions(+), 9 deletions(-)

-- 
1.8.3.2
