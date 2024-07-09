Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC4EC3271E
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 01:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A94640DD5;
	Tue,  9 Jul 2024 01:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDtMn47kjbhX; Tue,  9 Jul 2024 01:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C31BC40237
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C31BC40237;
	Tue,  9 Jul 2024 01:45:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81EF41BF3A8
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 01:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BBAD812AC
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 01:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZaDrt1Yh1o5 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 01:45:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=20.231.56.155;
 helo=azure-sdnproxy.icoremail.net;
 envelope-from=zhangdongdong@eswincomputing.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 27A8D812A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27A8D812A9
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [20.231.56.155])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27A8D812A9
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 01:45:50 +0000 (UTC)
Received: from ubuntu18.eswin.cn (unknown [10.12.192.173])
 by app1 (Coremail) with SMTP id TAJkCgA3zOM8loxmHaUUAA--.15379S5;
 Tue, 09 Jul 2024 09:45:46 +0800 (CST)
From: zhangdongdong@eswincomputing.com
To: buildroot@buildroot.org
Date: Tue,  9 Jul 2024 09:45:17 +0800
Message-Id: <20240709014517.4838-2-zhangdongdong@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240709014517.4838-1-zhangdongdong@eswincomputing.com>
References: <20240709014517.4838-1-zhangdongdong@eswincomputing.com>
X-CM-TRANSID: TAJkCgA3zOM8loxmHaUUAA--.15379S5
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1fAFy5GrWrCry8JrW7XFb_yoW8CFy7pr
 Z8GFyayw4fAF9Fya93W3Wxuw4rZ3Z5A34DJa4xCrWDtFn3KanFyry5KFyYka47Gw4fZrs8
 XFZaqw4kKr48Z3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwAKzVCY07xG64k0F24lc2xSY4
 AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbqYLDUU
 UUU==
X-CM-SenderInfo: x2kd0wpgrqwvxrqjqvxvzl0uprps33xlqjhudrp/1tbiAQENCmaLsnIT2gABsi
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=eswincomputing.com
Subject: [Buildroot] [PATCH v3 1/1] .github: add github action to automate
 PR handling
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
Cc: thomas.petazzoni@bootlin.com, bonet@grenoble.cnrs.fr,
 Dongdong Zhang <zhangdongdong@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dongdong Zhang <zhangdongdong@eswincomputing.com>

This patch updates the Buildroot repository's GitHub configuration to better
manage incoming pull requests.

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
 .github/workflows/repo-lockdown.yml | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 .github/workflows/repo-lockdown.yml

diff --git a/.github/workflows/repo-lockdown.yml b/.github/workflows/repo-lockdown.yml
new file mode 100644
index 0000000000..45cfd2867d
--- /dev/null
+++ b/.github/workflows/repo-lockdown.yml
@@ -0,0 +1,25 @@
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
+    if: github.repository == 'buildroot/buildroot'
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
+
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
