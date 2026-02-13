Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB32CEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A5D1613FA;
	Fri, 13 Feb 2026 19:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9XCKYiuallU; Fri, 13 Feb 2026 19:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A1D8613F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011359;
	bh=WRTefINXcATCm8pXeFwOS8+P/zkDTNaYGSDkYehVAzA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J6ssXPfzw1YFapQ8HgMZCfV4oPypokY0VPKKjJK3i4KPnocZc+E4MwSGwwil4GGmr
	 +/QMxonzMRG6bfSWQTBKtUp/xBsEraxIs7PeaC6NKNWX9zJpt8wph9yy+vj916ltcg
	 uqfjxZc2hEQk6pBfGZK+ItJ8wU6i4e5qEws9Ur4/wQWTRj0i0QXgPWkiLhs6dr1jCo
	 EIWHg05cXLmtxRtNbxcKXg+0eQmMzRb3YCSadXHvL/oK40CxOZbcdggFcqyjQGoC/Q
	 9Y+SOytTsPDdx+RuP/1h45cAL37s921qdIByE0FUKWGrTDHInHsd+Q/HFaXX+Zltyh
	 TeuJU1Nc9K5jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A1D8613F7;
	Fri, 13 Feb 2026 19:35:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 859FCEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A3D640380
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAx5VrzEBfkT for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DEE1403B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DEE1403B1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52A2183545; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:31:53 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d7375030c127ddd0bd71ee21359da9505e6253dc
X-Git-Newrev: 52b7641c62b26724b75375fdcb36e1c4a6d8b580
X-Patchwork-Hint: ignore
Message-Id: <20260213193529.52A2183545@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcurl: also
 specify the CA bundle location
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52b7641c62b26724b75375fdcb36e1c4a6d8b580
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

When given a certificate directory with --with-ca-path, curl doesn't
list the files in that directory. Instead, it uses the certificate hash
to directly open the requested CA certificate. Therefore, putting a
bundle in that directory and removing all the individual certificates is
not possible.

In order to support use of the bundle, a separate configuration option
--with-ca-bundle is needed. With this option, it is possible to remove
the individual certificates and include just the bundle, which reduces
the size of the root filesystem a bit.

Note that the bundle is generated by the ca-certificates package, which
also installs the individual certificates and the hash symlinks. It
keeps both individual certificates and the bundle in the target.

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 5a63ee3c09e95bfd7afd7822a1a9254e361b940f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcurl/libcurl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index e1e5a7facb..d9a712bcb6 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -58,7 +58,8 @@ endif
 ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
 LIBCURL_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr \
-	--with-ca-path=/etc/ssl/certs
+	--with-ca-path=/etc/ssl/certs \
+	--with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
 else
 LIBCURL_CONF_OPTS += --without-openssl
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
