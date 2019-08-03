From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Aug 2019 21:33:03 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: regenerate after adding
 TestCheckPackage
Message-ID: <20190803193205.AE844885D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa3a2f139f21e0f30da72fa2a1ccc689cf2901fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When adding the check-package test, the committer (Arnout) merged the
TestCheckPackageBasicUsage class into the TestCheckPackage class, but
failed to regenerate .gitlab-ci.yml. Do this now.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fff9d99237..1faba3c57e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -475,4 +475,4 @@ tests.toolchain.test_external.TestExternalToolchainLinaroArm: { extends: .runtim
 tests.toolchain.test_external.TestExternalToolchainSourceryArmv4: { extends: .runtime_test }
 tests.toolchain.test_external.TestExternalToolchainSourceryArmv5: { extends: .runtime_test }
 tests.toolchain.test_external.TestExternalToolchainSourceryArmv7: { extends: .runtime_test }
-tests.utils.test_check_package.TestCheckPackageBasicUsage: { extends: .runtime_test }
+tests.utils.test_check_package.TestCheckPackage: { extends: .runtime_test }
