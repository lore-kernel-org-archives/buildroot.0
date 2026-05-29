Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E14CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAC91843F5;
	Fri, 29 May 2026 08:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-o_mv72E5b8; Fri, 29 May 2026 08:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C7AD83E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043873;
	bh=H4fIHaP5E0eou6cAc0ght4Om1wg25H04XusWq47rPuQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ou3mJqTol0Q9Iw6dF6aTfzJAze8gf0Eii/xLf+U2PkxkcIf4NJJDERHVRHp1LW9O8
	 xYkKDm4h0adJg5nizRr2GRfsV0kdMPxyErjt5ghiESkpEp3ZOcJjYNeYQjCJbtZhPh
	 baFq+xkfxUmJHJLmN9qDx2yoQDYw/WPtqPMq/wmVj24oH3/8YMgQ6EQBvQzk4N5rFO
	 9EmR/37jU9wbt/NikEvLbBgxVnWN5F9+5K+WcOdEo+gooo4/OubM6PemcLmx6bz2Et
	 RMHJ5WdLUNTsKxAG5W38NXrCSq+hczDkMiSf+9vBZAA2JWstyK43Xs2Je32HY4Vm9+
	 e8httQFy+qGfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C7AD83E8E;
	Fri, 29 May 2026 08:37:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68A2D28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49C98406F7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llmwWq33Of6I for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:37:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67BA2406F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67BA2406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:37:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03404868A6; Fri, 29 May 2026 08:37:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:37:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cd487fe9d185267def6c1a3109574ea10e54551
X-Git-Newrev: 6add6e3cd87f2ac5c24a558427b8f4aaac6d34a5
X-Patchwork-Hint: ignore
Message-Id: <20260529083738.03404868A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: security bump to 22.9.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6add6e3cd87f2ac5c24a558427b8f4aaac6d34a5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for a changelog:
https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-22-current.html

Pjsip was updated to 2.16.

Fixes some security issues in pjsip:

Author: Mike Bradeen Date: 2026-03-23
Address the following pjproject security vulnerabilities

GHSA-j29p-pvh2-pvqp - Buffer overflow in ICE with long username
GHSA-8fj4-fv9f-hjpc - Heap use-after-free in PJSIP presense subscription termination header
GHSA-g88q-c2hm-q7p7 - ICE session use-after-free race conditions
GHSA-x5pq-qrp4-fmrj - Out-of-bounds read in SIP multipart parsing

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 4 ++--
 package/asterisk/asterisk.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 3a8274b458..8d620a0ee3 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,8 +1,8 @@
 # Locally computed
-sha256  6669a8d2e50481a3b70c6099a21a100ab7d7ae9ac00e2182eabb94c68c94bcc9  asterisk-22.8.2.tar.gz
+sha256  dd664a9600874d0b0c0e63a8fda2e08efc9f5fdc95781022fbf39ed9b15196f6  asterisk-22.9.0.tar.gz
 
 # Locally computed
-sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
+sha256  633c3dc34ffb21af8ac9ee160245c9c174379391e35cace1b6c9f516a260f683  pjproject-2.16.tar.bz2
 sha256  6775095bcd417d375faddc1f17cdd7706ad8aa9b9b02404990c4b0ee218ee379  libjwt-1.15.3.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index e2fdb189fa..b15a83f6f8 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.8.2
+ASTERISK_VERSION = 22.9.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
@@ -12,13 +12,13 @@ ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
 # compilation with the external pjsip produces a non-working asterisk, which
 # segfaults. The reason behind this is unclear.
 # https://github.com/asterisk/asterisk/issues/671
-ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.15.1/
+ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.16/
 ASTERISK_LIBJWT_URL = https://raw.githubusercontent.com/asterisk/third-party/master/libjwt/1.15.3/
 ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
 ASTERISK_EXTRA_DOWNLOADS = \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.6.1.tar.gz \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz \
-	$(ASTERISK_PJSIP_URL)/pjproject-2.15.1.tar.bz2 \
+	$(ASTERISK_PJSIP_URL)/pjproject-2.16.tar.bz2 \
 	$(ASTERISK_LIBJWT_URL)/libjwt-1.15.3.tar.gz
 
 ASTERISK_LICENSE = GPL-2.0, BSD-3-Clause (SHA1, resample), BSD-4-Clause (db1-ast)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
