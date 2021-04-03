From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Apr 2021 09:11:25 +0200
Subject: [Buildroot] [git commit] package/samba4: update samba4-cache.txt
 for fcntl flags check
Message-ID: <20210403064635.AB805818BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c86434d720fdf1c42834162331c008e05c710d65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/a5d/a5db81fca8ec07159b69b108b742f3d060e3316a/

Checking whether fcntl supports flags to send direct I/O availability signals                   : not found
..
Cross answers file /srv/storage/autobuild/run/instance-3/output-1/build/samba4-4.14.2/cache.txt is incomplete

Samba4 has added a check for fcntl F_{G,S}ETOWN_EX handling since:
https://gitlab.com/samba-team/devel/samba/-/commit/5084a69de14f24e9d804998580eefcba773fdd5a

Which is supported by the Linux kernel since 2.6.32 in commit
ba0a6c9f6fceed11 (fcntl: add F_[SG]ETOWN_EX), so add it to the cache file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/samba4/samba4-cache.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
index bd7c3654b4..75d0343dc9 100644
--- a/package/samba4/samba4-cache.txt
+++ b/package/samba4/samba4-cache.txt
@@ -42,3 +42,4 @@ checking for clnt_create(): OK
 Checking for a 64-bit host to support lmdb: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: 29
 Checking value of GNUTLS_MAC_AES_CMAC_128: 203
+Checking whether fcntl supports flags to send direct I/O availability signals: OK
