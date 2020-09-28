From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Sep 2020 23:41:00 +0200
Subject: [Buildroot] [PATCH 4/7 RFC] WIP: support/testing: update git-hash
 checks with new archive format
In-Reply-To: <cover.1601329249.git.yann.morin.1998@free.fr>
References: <cover.1601329249.git.yann.morin.1998@free.fr>
Message-ID: <fa55073248fdbe223a495ce339bf40205c592668.1601329249.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

** WIP: should be squashed into the commit that changes the git backend.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 .../tests/download/br2-external/git-hash/package/bad/bad.hash   | 2 +-
 .../tests/download/br2-external/git-hash/package/good/good.hash | 2 +-
 .../git-partial-sha1-branch-head.hash                           | 2 +-
 .../git-partial-sha1-reachable-by-branch.hash                   | 2 +-
 .../git-partial-sha1-reachable-by-tag.hash                      | 2 +-
 .../git-partial-sha1-tag-itself.hash                            | 2 +-
 .../git-partial-sha1-tag-points-to.hash                         | 2 +-
 .../package/git-sha1-branch-head/git-sha1-branch-head.hash      | 2 +-
 .../git-sha1-reachable-by-branch.hash                           | 2 +-
 .../git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash    | 2 +-
 .../package/git-sha1-tag-itself/git-sha1-tag-itself.hash        | 2 +-
 .../package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash  | 2 +-
 .../package/git-submodule-disabled/git-submodule-disabled.hash  | 2 +-
 .../package/git-submodule-enabled/git-submodule-enabled.hash    | 2 +-
 .../download/br2-external/git-refs/package/git-tag/git-tag.hash | 2 +-
 .../git-refs/package/git-wrong-content/git-wrong-content.hash   | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
index b9e1baec84..741d28a0cc 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
@@ -1 +1 @@
-sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
+sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.xz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
index 9e92ab8ab9..4a5bcf48de 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
@@ -1 +1 @@
-sha256  d00ae598e9e770d607621a86766030b42eaa58156cb8d482b043969da7963c23  good-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
+sha256  922c3f71d3a5639fa5fca6f05a253e9268e42aa5bf35e82653e3e578c1fd1e1f  good-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.xz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
index 648bcceca0..f99244d3bd 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  70b76187369e47db69dac02c5696e63b35199cd20490fa473d289dd377774613  git-partial-sha1-branch-head-68c197d0879d485f4f6c.tar.gz
+sha256  6de8f91e390aa4e4f0719bcd7388872c2a2979914f95a634d06df436018cfa41  git-partial-sha1-branch-head-68c197d0879d485f4f6c.tar.xz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
index d064362e2c..8b8531c0a5 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  9db079b9e215799d59975db7b2b26671eff1932ee6cf1075296f2ace3e2cb746  git-partial-sha1-reachable-by-branch-317406308d9259e2231b.tar.gz
+sha256  7610e7ec450d320818f7104b9cb365c7f12ead46628fcc10ec7f3cc1f3e0ecbb  git-partial-sha1-reachable-by-branch-317406308d9259e2231b.tar.xz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
index 7696086690..21ef42b27d 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  f2ef9772f13a9ef9a2c7cde0795e179defb12320d1747fc8d2408748ef5844c2  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4.tar.gz
+sha256  f4f46473c3184b8396ee49f05009eceb8e5882588b2cd574836f485bf5ff520d  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4.tar.xz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
index e627caf91e..e60b5ce1a0 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  721143b41b8e56cfd9025833f1602e900a490627db2504e5b4907baa23e0019e  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61.tar.gz
+sha256  e0423db97d8f7c9af20f0534915c8a9a539856fa6aa072b5b47830a4e116cc40  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61.tar.xz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
index f957a0e23c..96a9143344 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  0fbf7fe935f962ceaafcf8e0ffd25dd2a83752c3f0fd055a942a53f8c9235fa7  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d.tar.gz
+sha256  48c28bc7f36745f5e5027997541704415720cc94cddac3405edf8ce0d43b84ae  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d.tar.xz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
index 3e8f76d31a..bebe0de985 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  a21a2507b6d94ad484e49e3a9ae698f672a57469aab8e1779da77df7c9d4d337  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f.tar.gz
+sha256  16508d53698c19fbc8f448e2ab25f0fd718e307fb8ea31b6e47b40a6f0d0875b  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f.tar.xz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
index f8d7b5dc48..5c4975ea7e 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  8909e76d898e651af0bc23fae4103b87888bfe77448d71aaf1fbec3da97a3ce2  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08.tar.gz
+sha256  e11a2e4509e883fed7f072bb64bf7babff30b3b3a9b1c8d45535aeea80fa2c89  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08.tar.xz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
index 0eb0ca0917..ba4379454d 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  9b20256a3058221a8e91031f11700d9945ea84e8f328fa8e42e1cb9f7a30e3b2  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59.tar.gz
+sha256  7b7ec0636ed5a5ece5c764acc765c471eaa5f9f805f7eb2fc3dab7745ee6fd03  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59.tar.xz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
index 48c1348538..ebe9bd4f4e 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  7d301c1a1054d6aee49193ca9e938f4da561ff73fb01719662865aa38bdc4361  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2.tar.gz
+sha256  e001dda03fbee456a726a35c3224677017116ad3231c29a4523af8cb71fbe95c  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2.tar.xz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
index 3dcafc2094..9b799ff320 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  c1f9f5734529a31140a71c031534460811f001b4db37d26833f386358150ab47  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023.tar.gz
+sha256  6852f682d022d0e0b35cb0903e61e563f17ce4240e9278a2f54585c9b1be56d6  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023.tar.xz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
index 3bd0a44693..995f0adc43 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
@@ -1,2 +1,2 @@
-sha256  f9d46ff8a1a344c6c31fa4211220f3085c446abd31626232540703158276f22c  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f.tar.gz
+sha256  4ef1e4ad92b2806e5280b8f307952d74d8b5749b65169f9ede8d338f503cb85e  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f.tar.xz
 sha256  ba8b6ddc4726bfb6a05045ebfd8c43263c968ad1bc601bd46a25bc055008eddc  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
index 7f92c652d3..cbc81276e7 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
@@ -1 +1 @@
-sha256  139a34c3c844c844dee74b6746418cfa75fbcc4205794ac8c0b3cd7d55a76792  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f.tar.gz
+sha256  35fcd4d90e1da8bceb9c0ef96f63d98e4ccd6e6fab52b965d6a6339de4f630d7  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f.tar.xz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
index 1cd0b15f27..52ab26f26b 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
@@ -1,2 +1,2 @@
-sha256  85dcb5bcf9bed496688d0eb01c7a3ce05c5b46b984cc1e9e76a6dbefd976e6b3  git-tag-mytag.tar.gz
+sha256  14af5fc1ddadb7fdb42a33f3c88ada4b34f103a4e25bffb8b5fc3dfe1f85b628  git-tag-mytag.tar.xz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
index 47b2b8b7d7..05d1d6c8df 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
@@ -1,2 +1,2 @@
- sha256  04715901977503d1df650e0959f4d31d8e7b105e2ac99a2182e0652b8f13baa1  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
+ sha256  cf3017e505b789498a95fd4429ac05aba9b1449a6a3bea3016b7938feaeaaeb0  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.xz
  sha256  0000000000000000000000000000000000000000000000000000000000000000  file
-- 
2.25.1
