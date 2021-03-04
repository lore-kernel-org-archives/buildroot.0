From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 18:33:16 +0100
Subject: [Buildroot] [git commit] package/libstrophe: fix tarball hash
Message-ID: <20210304171439.858AD860CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5a669b99995c099ce5dcf3fed0c601eab4f6855
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix hash added by commit 28c7ff0bdb602e75d2891818ff87fe7fd4ed0015:
https://patchwork.ozlabs.org/project/buildroot/patch/20210104101054.5392-1-jubalh at iodoru.org

Says Michael:

    > ERROR: libstrophe-0.10.1.tar.gz has wrong sha256 hash:
    > ERROR: expected: 4918c47029ecdea2deab4b0f9336ca4a8bb12c28b72b2cec397d98664b94c771
    > ERROR: got     : 5bf0bbc555cb6059008f1b748370d4d2ee1e1fabd3eeab68475263556405ba39
    > ERROR: Incomplete download, or man-in-the-middle (MITM) attack

    I'm sorry about that. We had some disagreement at JasPer and we removed
    an existing tag and created the same tag on a different commit. Thus
    generating a different tarball under the same tag..

    I thought I only did the buildroot update after this, but maybe I
    remember wrong.

While at it, also update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/2f13af96eee20176ccb37ad32ec1472b4c9d6208

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: quote Michael's explanations]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libstrophe/libstrophe.hash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index 6aca289fb5..d5f151660f 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 4918c47029ecdea2deab4b0f9336ca4a8bb12c28b72b2cec397d98664b94c771  libstrophe-0.10.1.tar.gz
-sha256 82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
+sha256  5bf0bbc555cb6059008f1b748370d4d2ee1e1fabd3eeab68475263556405ba39  libstrophe-0.10.1.tar.gz
+sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
