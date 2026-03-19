Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBCDFC72C4
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 16:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A65783ECA;
	Sun, 22 Mar 2026 16:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ipb6jkAdHn7O; Sun, 22 Mar 2026 16:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E70D83EBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774197903;
	bh=7tp52yKegBZtK5v9j06N9Bhw03EEZk+bbkX66rbWxJk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f7lkiRC9qLwSlumnzYGOKVl61aNNqJSNigXZLu+O5EtCCW2zmn6bCXdHVDs71QkDr
	 VdyH3KkTNqRyMNiUtVPngwSusJX018cPfdnJ7uMZgrdxAMmCQicvYYDQrEE0Ce06i/
	 Ub7ZFlIwkjCrDu5khvu3LkSrrKQ0Yh+wcRRGfaiPZptJD0aU+KZGhRUgQH85YY3Vn1
	 AM/eHbFjO0CMtVZKFWRuAoIB13bU83FlB4+uvO/zhlT+J/jF7J1d88xVrqcraR9xia
	 Kwza6f7mkLQ2znj/dHeb9xp4d+6AuAt450SXgJJeUSJSpjnfxYIKmAuly+oyroWV0t
	 Mwsj20w/OcoGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E70D83EBF;
	Sun, 22 Mar 2026 16:45:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87A1225C
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 16:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77F5F412AC
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 16:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ETRLa99bhNbn for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 16:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6722D412A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6722D412A7
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 16:45:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7716884DAC; Thu, 19 Mar 2026 20:57:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 21:54:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01a5a8be468db1489d97b77380ef56ff842dbb33
X-Git-Newrev: f163d200022e72aa8d9f9d37332cc7e2663503de
X-Patchwork-Hint: ignore
Message-Id: <20260319205709.7716884DAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_aichat: improve test
 reliability
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f163d200022e72aa8d9f9d37332cc7e2663503de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since llama.cpp update in Buildroot commit [1], the test_aichat can
fail for several reasons:

The loop checking for the llama-server availability can fail if curl
succeed, but the returned json data is not formatted as expected.
This can happen if the server is ready but the model is not completely
loaded. In that case, the server returns:

    {"error":{"message":"Loading model","type":"unavailable_error","code":503}}

This commit ignore Python KeyError exceptions while doing the
server test, to avoid failing if this message is received.

Also, this new llama-server version introduced a prompt caching, which
uses too much memory. This commit completely disable this prompt
caching by adding "--cache-ram 0" in the llama-server options.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/05c36d5d875713521f99b7bad48be316dcde2510

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_aichat.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/package/test_aichat.py b/support/testing/tests/package/test_aichat.py
index 5fc554bbb5..50c07f87dc 100644
--- a/support/testing/tests/package/test_aichat.py
+++ b/support/testing/tests/package/test_aichat.py
@@ -70,6 +70,8 @@ class TestAiChat(infra.basetest.BRTest):
         llama_opts = "--log-file /tmp/llama-server.log"
         # We set a fixed seed, to reduce variability of the test
         llama_opts += " --seed 123456789"
+        # We disable prompt caching to reduce RAM usage
+        llama_opts += " --cache-ram 0"
         llama_opts += f" --hf-repo {hf_model}"
 
         # We start a llama-server in background, which will expose an
@@ -91,9 +93,12 @@ class TestAiChat(infra.basetest.BRTest):
             if ret == 0:
                 models_json = "".join(out)
                 models = json.loads(models_json)
-                model_name = models['models'][0]['name']
-                if model_name == hf_model:
-                    break
+                try:
+                    model_name = models['models'][0]['name']
+                    if model_name == hf_model:
+                        break
+                except KeyError:
+                    pass
         else:
             self.fail("Timeout while waiting for llama-server.")
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
