From: Alexander Dahl <post@lespocky.de>
Date: Wed, 17 Mar 2021 07:11:33 +0100
Subject: [Buildroot] [PATCH] package/siproxd: Remove license file hash for
 internal libltdl
In-Reply-To: <20210315075603.szbekct3w37mhsu6@falbala.internal.home.lespocky.de>
References: <20210315075603.szbekct3w37mhsu6@falbala.internal.home.lespocky.de>
Message-ID: <20210317061133.26547-1-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In a first draft of what ended up in commit 3efc5a250c1c
("package/siproxd: new package") libltdl was optionally built from an
internal copy of siproxd.  Now external libltdl is selected
unconditionally, thus the license file of the internal copy of libtool
does not apply anymore.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/siproxd/siproxd.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/siproxd/siproxd.hash b/package/siproxd/siproxd.hash
index be6815725a..9c9b8b8f5f 100644
--- a/package/siproxd/siproxd.hash
+++ b/package/siproxd/siproxd.hash
@@ -8,4 +8,3 @@ md5  9a9d2c89e5f0c59fdde9444a66d8372c  siproxd-0.8.3.tar.gz
 
 # Hash for license files:
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
-sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  libltdl/COPYING.LIB

base-commit: 54d3d94b6e3846447b5796ef8587b08b537cd348
-- 
2.20.1
