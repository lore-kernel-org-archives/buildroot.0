Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58ECECD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 373908578D;
	Tue,  9 Jun 2026 13:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3ZLhujP66QS; Tue,  9 Jun 2026 13:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACE6F85777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010142;
	bh=ZUqpP4KSyB2BX615PIFdZTKlWoGSwJnr62wbuBi04kA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m3IEW0hH9fSzSOW0LaoqBLvJLD7PzPo/KQNreQVblqMface6cM3QS8x5389GVBnbj
	 ovdUR1fZ5nnlNzP1KeDlDPwHMwL61H7nqYGJh5Q+qXoVVkiZhmp8SBZE8PdypeXAtB
	 rTwH5ND6CG/0cs5o0UBvlMIThfTGiWh1ANSqxjFTv+re77iYhimasqtBpHwRtOFW7B
	 QKCdpjZ1T1v9tAT87sYViu4YQsM17v6kxRmq2sNJmoXl9jz2vNVVKkBXxhMrJPLwP1
	 C59Z09+t6VGS3/Zx4g2DK7RtBN/U7fQX29iTCOrUX0+toExaaj7V3Ew6p3gyJaxmsj
	 Nr5JvPw68322g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACE6F85777;
	Tue,  9 Jun 2026 13:02:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D729190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F221423C1
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39yAPieIwpGP for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02430426D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02430426D6
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DB6B87E7E; Tue,  9 Jun 2026 13:01:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 21:54:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fda245fea3d162b47472240bd1f0af7bd98753a
X-Git-Newrev: c537913fb9bef85c4667b22dc6841b000b93c6c4
X-Patchwork-Hint: ignore
Message-Id: <20260609130117.3DB6B87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tss: Correctly depend on
 util-linux-libs for fapi support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c537913fb9bef85c4667b22dc6841b000b93c6c4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

tpm2-tss is a dependency of systemd, which when enabled becomes a
dependency of util-linux.

tpm2-tss only really wants libuuid, so depend on util-linux-libs instead
breaking the dependency cycle.

Signed-off-by: John Ernberg <j@j-ernberg.se>
[Arnout: also select UTIL_LINUX_LIBS in Config.in]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/tpm2-tss/Config.in   | 1 +
 package/tpm2-tss/tpm2-tss.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index d87c1e0d8d..9ce3c22763 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -40,6 +40,7 @@ config BR2_PACKAGE_TPM2_TSS_FAPI
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  This option allows to enable Feature API (FAPI).  Feature
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 08ff401328..11da37a5b4 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -33,7 +33,7 @@ TPM2_TSS_CONF_OPTS = \
 TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
 ifeq ($(BR2_PACKAGE_TPM2_TSS_FAPI),y)
-TPM2_TSS_DEPENDENCIES += json-c libcurl util-linux
+TPM2_TSS_DEPENDENCIES += json-c libcurl util-linux-libs
 TPM2_TSS_CONF_OPTS += --enable-fapi
 else
 TPM2_TSS_CONF_OPTS += --disable-fapi --disable-policy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
