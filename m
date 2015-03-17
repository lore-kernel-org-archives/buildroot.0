From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 17:53:13 +0100
Subject: [Buildroot] [git commit] toolchain: disable internal for blackfin
Message-ID: <20150317165320.7E53D817E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aef5a87ef56d40500e4ae48be6628b45ca8948df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The internal toolchain was a "best effort" approach - we strived to make
it build properly and all but it's mostly untested.
Since it's got issues disable it until it's properly fixed and tested
and leave the official ADI toolchain instead.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index b039ee2..efb77f8 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -43,6 +43,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
+	depends on !BR2_bfin
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
