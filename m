From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu,  3 Jun 2021 02:58:04 +0200
Subject: [Buildroot] [URGENT] [PATCH 0/1] Fix Buildroot Makefile failure on
 lvm2
Message-ID: <20210603005805.216004-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 8a313b019c7d7e898186a8b08f9c25ae0194fa16 prevents Buildroot to
make any target due to a endif left behing in lvm2.mk. Following patch
removes it and make Buildroot to work again.

Giulio Benetti (1):
  package/lvm2: remove endif that prevents Buildroot to use Makefiles at
    all

 package/lvm2/lvm2.mk | 2 --
 1 file changed, 2 deletions(-)

-- 
2.25.1
