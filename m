From: Nicholas Sielicki <sielicki@yandex.com>
Date: Mon,  4 Sep 2017 19:08:04 -0500
Subject: [Buildroot] [PATCH v2 0/2] grub2 wchar defconfig fixes
Message-ID: <20170905000806.13295-1-sielicki@yandex.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since a version bump of grub2 (5ffafd2353f5d67) it requires a toolchain
with wide character support. Some defconfigs have lines to build grub2
(BR_TARGET_GRUB2=y) but this doesn't always take place, depending on
whether BR2_USE_WCHAR is set. Because of this, some defconfigs will fail
to successfully build images.

This v2 cuts out some unnecessary changes from v1 (ie: comments in
configs to explicitly note this dependency without any other change) and
splits up the remaining changes into individual patches. I did not test
the minnowboard change, but the galileo change is tested.

Nicholas Sielicki (2):
  configs/galileo: grub2 needs wchar toolchain
  configs/minnowboard_max-graphical: wchar/grub2 fix

 configs/galileo_defconfig                   | 2 ++
 configs/minnowboard_max-graphical_defconfig | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.14.1
