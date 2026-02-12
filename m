Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4024AEEA865
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 22:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC9D684010;
	Thu, 12 Feb 2026 22:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmPbetWeqWKx; Thu, 12 Feb 2026 22:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ADC281D24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770935711;
	bh=c9RQ4bUFqHVIzimo1eIzH9x+mS0jvTbxG6vqoS70JcA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KDCTksCZKHE1g9hOWwzLSZ9cxRczg8aBT8tIRLcnin3WQtwxyj9rOkzvYqFLuRbo6
	 VH6mqp+fehf2wnBxjVToXs2CNkyG4LSgUSIOPjgfAuMcS07lzxSARRYTZbBOjnSzhU
	 YLnG8tM9qvrm75o0LcsscbJnpQ5a8Bl+m7eaWj8hKxTXMRqYHlU825j8Xg9iRDR/eT
	 MjLgMb3R9NFSq5IfVMrElzUleSIpg2ZwKlysn+yHElBTGf4T/+kcfqFNNBOpceoQFk
	 exUx2OAatax1YAplSAH1aA9wI55Fa8OwKAOmrE6rpW+Af2igzCZZNGJyJNi0KC9KUW
	 qtETVWr44OBEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ADC281D24;
	Thu, 12 Feb 2026 22:35:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07EBB1CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD6426125D
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDN1DNxDoVNz for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 22:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2578F61247
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2578F61247
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:35:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0788386CAE; Thu, 12 Feb 2026 22:35:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 23:34:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 431950769d5ca14f2c490e328a38cbf163ce2a18
X-Git-Newrev: d8798806f7e283e7da256357883de18bc79e4079
X-Patchwork-Hint: ignore
Message-Id: <20260212223509.0788386CAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: reapply "libcurl: add
 host variant"
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5690111745550167413=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5690111745550167413==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d8798806f7e283e7da256357883de18bc79e4079
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libcurl host build support has initially been added with 736e0fc5d610
("libcurl: add host variant") while adding support for host-cargo build,
and reverted with 69e84008abf8 ("Revert "libcurl: add host variant"")
when standalone cargo build has been removed.

In order to bring in an upcoming commit a new host package that
depends on libcurl, re-enable host-libcurl build support.

This reverts commit w9e84008abf87eaeeb3f2d53c880cf33492a3bf8, with the
exception of the post-patch hook which is no longer needed.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcurl/libcurl.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index d9a712bcb6..7ebf26c3b1 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -185,4 +185,16 @@ endef
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 endif
 
+HOST_LIBCURL_DEPENDENCIES = host-openssl
+HOST_LIBCURL_CONF_OPTS = \
+	--disable-manual \
+	--disable-ntlm-wb \
+	--disable-curldebug \
+	--with-ssl \
+	--without-gnutls \
+	--without-mbedtls \
+	--without-nss \
+	--without-libpsl
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))

--===============5690111745550167413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5690111745550167413==--
