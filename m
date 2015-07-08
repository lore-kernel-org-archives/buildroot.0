From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jul 2015 23:52:32 +0200
Subject: [Buildroot] [git commit] system/skeleton: remove random-seed
Message-ID: <20150708215408.8786781917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed0b44fdcecd2a703d2c1b8134375e19a2b7f867
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Seeding the entropy pool with a known seed makes more harm than good. This is
especially bad for when /etc is not on a persistent writable storage, so the
entropy pool is seeded with the same value on every boot. Just drop it.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/etc/random-seed |  Bin 512 -> 0 bytes
 1 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/system/skeleton/etc/random-seed b/system/skeleton/etc/random-seed
deleted file mode 100644
index f26038a..0000000
Binary files a/system/skeleton/etc/random-seed and /dev/null differ
