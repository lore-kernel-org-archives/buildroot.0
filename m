Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEE5C27C4F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 02:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5C7681770;
	Mon,  1 Jul 2024 02:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5E7Hdy8hFdsO; Mon,  1 Jul 2024 02:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBA0A81773
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBA0A81773;
	Mon,  1 Jul 2024 02:43:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EBB31BF375
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 02:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C4A16089B
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 02:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5K2J4pbZ7BNa for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 02:43:23 +0000 (UTC)
X-Greylist: delayed 1206 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Jul 2024 02:43:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94DF7607CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94DF7607CA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=159.65.134.6;
 helo=zg8tmtu5ljy1ljeznc42.icoremail.net;
 envelope-from=zhangdongdong@eswincomputing.com; receiver=<UNKNOWN> 
Received: from zg8tmtu5ljy1ljeznc42.icoremail.net
 (zg8tmtu5ljy1ljeznc42.icoremail.net [159.65.134.6])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94DF7607CA
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 02:43:20 +0000 (UTC)
Received: from ubuntu18.eswin.cn (unknown [10.12.192.173])
 by app1 (Coremail) with SMTP id TAJkCgAXrOPFF4Jmm8YSAA--.64039S4;
 Mon, 01 Jul 2024 10:43:18 +0800 (CST)
From: zhangdongdong@eswincomputing.com
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 10:43:16 +0800
Message-Id: <20240701024316.19646-1-zhangdongdong@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: TAJkCgAXrOPFF4Jmm8YSAA--.64039S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGF4ktF4xXF17KrW3GryUWrg_yoW5Xr1Upr
 Z5GFyakw4fXF9rA3s3W3WxZw4Fqan5A3yUJF97Kr4UtFnxKanFyF15KFWYka47J3yfArZ5
 XFWvq3ykKF4rX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lw4CEc2x0rVAKj4xx
 MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_
 JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 92-5UUUUU==
X-CM-SenderInfo: x2kd0wpgrqwvxrqjqvxvzl0uprps33xlqjhudrp/1tbiAgEFCmaBKDchDQABsZ
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=eswincomputing.com
Subject: [Buildroot] [PATCH] .github: add github action to automate PR
 handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: zhangdongdong@eswincomputing.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dongdong Zhang <zhangdongdong@eswincomputing.com>

This patch updates the Buildroot repository's GitHub configuration to better
manage incoming pull requests.

- Removed the existing pull request template that advised contributors to use
  the mailing list for patch submissions.
- Added a new GitHub Actions workflow (`repo-lockdown.yml`) to automatically
  handle new pull requests.

The new workflow:
- Triggers on new pull requests.
- Uses the `dessant/repo-lockdown` action to:
  - Comment on the pull request, guiding contributors to use the mailing list
    for patch submission.
  - Lock the pull request to prevent further discussion.
  - Close the pull request.

This change ensures that contributors are properly directed to the preferred
method of patch submission via the mailing list, maintaining consistency and
streamlining the review process.

Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
---
 .github/pull_request_template.md    |  6 ------
 .github/workflows/repo-lockdown.yml | 23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 6 deletions(-)
 delete mode 100644 .github/pull_request_template.md
 create mode 100644 .github/workflows/repo-lockdown.yml

diff --git a/.github/pull_request_template.md b/.github/pull_request_template.md
deleted file mode 100644
index 319e67d861..0000000000
--- a/.github/pull_request_template.md
+++ /dev/null
@@ -1,6 +0,0 @@
-Please do not submit a Pull Request via GitHub. Buildroot makes use of a
-[mailing list](http://lists.buildroot.org/mailman/listinfo/buildroot) for patch submission and review.
-See [submitting your own patches](http://buildroot.org/manual.html#submitting-patches) for more info.
-
-Thanks for your help!
-
diff --git a/.github/workflows/repo-lockdown.yml b/.github/workflows/repo-lockdown.yml
new file mode 100644
index 0000000000..a5f8bd6a93
--- /dev/null
+++ b/.github/workflows/repo-lockdown.yml
@@ -0,0 +1,23 @@
+name: 'Repo Lockdown'
+
+on:
+  pull_request_target:
+    types: opened
+
+permissions:
+  pull-requests: write
+
+jobs:
+  action:
+    runs-on: ubuntu-latest
+    steps:
+      - uses: dessant/repo-lockdown@v4
+        with:
+          pr-comment: |
+            Please do not submit a Pull Request via GitHub. Buildroot makes use of a
+            [mailing list](http://lists.buildroot.org/mailman/listinfo/buildroot) for patch submission and review.
+            See [submitting your own patches](http://buildroot.org/manual.html#submitting-patches) for more info.
+
+            Thanks for your help!
+          lock-pr: true
+          close-pr: true
\ No newline at end of file
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
