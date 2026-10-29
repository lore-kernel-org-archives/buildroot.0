Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C32606A320
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HBSvDOTz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BEA481177;
	Fri, 30 Oct 2026 14:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2z_EZylcOaF3; Fri, 30 Oct 2026 14:07:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3E88B812C5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369262;
	b=Icmm/SkVBPWyoa55kcba3QIeBYMGgsKB2wgyzBHLGBoHh7BbJmkxxiZ4XlXgXXylENUi
	 OrbhQL8gFwfV93tlE2GGVBs1aiUbnQR2fCOwKdLeAW0INb9ApBL35JGYlOIKOHhJDU/rD
	 +nzzohrLBL0/M9O2TVN4fcjGicWRKHoyx5vZ8QWLPhZkLN6c1F8xGsPkR1iJ8Rk7vwy20
	 ufW8GDSdBoc7B4ZcDhYAnRHaaK4JZyChO0cgxH37uZq1LVurckqfGocTY3u+mtnH0qYEL
	 SMrPc5Nu5N9vhLJjxIGs6zdo2MKoZlXQtmpqqYqID1+JzFmKGa7wYdCqZR1ek0RTXVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369262;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=qec6BDk+TlRqby/ybEnuzIualKrwaOft1BXR9pHjdhw=;
	b=lcaHraVudiQcuU4uyFaovWYBCs0PmBBoIrh7k4322HsHnlFfpkZNkV0GSjl3AO24nMFl
	 MEYl3WPDItxSliLrdQmtwwEJ5EHjGZHxntckXSLGhEvSZqKlpUrHUGLwXEyi2WJWfUqS5
	 OYtQPNKdyk8zBxYpJ0v77gyaX+k0bzGBLGXGk0PcDMGadzne5Ui2iT1/GTU+CNB4UNiOR
	 iiepXSY2TajmdraHLfwPtoBcY+16NbW0sgxTVoP8rxVY1egOCVQhXQoQR9uUWopqsB++M
	 iCkipQQAbVkR3OaIXIjyzSDzS9PM34VWewOZWHC7aCtwUpzh7Fc7bbdkD/e0/odLo9g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369262;
	bh=qec6BDk+TlRqby/ybEnuzIualKrwaOft1BXR9pHjdhw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HBSvDOTzCZ7zS5Le2AE7kHzUokrvchxIbKcj5Woe20iGr3HFzNrCHzKcz7O8CrD7W
	 YNAY2zzkxdvzKjJjantzOiF8lXfAwOBd+HXCBsWEgl71AZdclcox80/gJR2nC252RQ
	 Y+k9ejl/Vi7qEZEiuQee7c/g3TMpOU59Kkz4Ke466B6qXrCobbIJFaUHpCBYE46G0A
	 zNwUidpQEJuYvIkCHNXuaJ07KKj7eJmLzybWCTalqgQNF0bbfZf6FXHcjx0k+t10MK
	 KVEholbG1EzNhXa7v3F83cdrOf62WLe7MB7aLRiVlCvT7MtSBakO06ip3/CT9fQN4a
	 F/01mIdF/yBOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E88B812C5;
	Fri, 30 Oct 2026 14:07:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9728D362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80C0940B38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uw_mOsQXU645 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BB6C440B1A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=Uq0f/KwENvHAAZMVPW/pp8mKHqC8WIRKZX0RMCNUSvr1qJGszStOihIEa4C8ER+ypkdI
 Yq33hCavYE2+vG0fDlOwklFRj1gIN8oysWsnc/axRfURmSo8vEVDe0Nf6BrJMstFj5HUz
 BARXA6yJvKp30n3qP8lOckZ8ikt8CpbuouOrPO3md7tvNbSZPZyeCNMBikvMhARdh9X/S
 tA0EBGSe+Hdt+Ccbrc6slRqFb4tY9r2RK5e4aT94QSwtWJDi/tYOB2KiLC1eX0kveLib5
 Yh/Ct+n9DYYpOSr8vwKGnHH5nQCLZP4PqQMiTlGxDwvWW4PRhpZXGpPF61q86/mraLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3rY8Tg41IdR87DgkXDdEhvl27iksYyd5aq0UbpDtSpM=;
 b=Hd5/KK1AZzRE/nf58+Ozdtwbr0SNZCVJcU1ktDNR/265lBvBm/5l7fvxz4mgz/T+C2/u
 jobYr6T0ObAkTnvNAM/zMtoiYoS77RSOcb4BEGGx1ckqv/BmzxaxApEDx3Uuv+0hcZcVa
 BFJ/DbgIYNw0QRSCMaZZoCvMs9sewAhtheuDBDjlA0aagYuafMuElZMVWozE2RhXMoXYB
 fb9Ou5ecBYq65oZ7iD+DqH2lAIvD+BtW2dZQJILgFkbZ0kmKKr2PI4easmF72T389gQHU
 MjXw9EbhLnt+1AAbX5W/rXfohgcg/YEcO0GnwXRbQTf4dHUEk7l7hlJR+vfx5d2UtfA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB6C440B1A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAC189D388; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 383c321f1619b1522985f61e7e039e4715ba175b
X-Git-Newrev: 05791616ce82751d95bbf82164c0c7c62a9eac5d
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.DAC189D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.122.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4401723557032302015=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4401723557032302015==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/05791616ce82751d95bbf82164c0c7c62a9eac5d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_112_1.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d6c087068760f3db8eccf47607d05d9db7a11c89)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index d2e85cb32d..d0d278c7f6 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_122_RTM/src/SHA256SUMS
-sha256  2699478b843b9f09c61f85341578df514463a0069447c816bef0d59bd800d777  nss-3.122.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_122_1_RTM/src/SHA256SUMS
+sha256  de5a655da82a67e502b802ae0b53f3eb02ea53f509c3fc0ab54a892e04493bbf  nss-3.122.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index bf59827bdc..b40cab03c9 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.122
+LIBNSS_VERSION = 3.122.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============4401723557032302015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4401723557032302015==--
