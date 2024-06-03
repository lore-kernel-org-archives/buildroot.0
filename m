Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99988C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E54D60848;
	Mon,  3 Jun 2024 07:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4lS8mvjfgtQ; Mon,  3 Jun 2024 07:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53C9E60845
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C9E60845;
	Mon,  3 Jun 2024 07:18:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 246441BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A2E98420E
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9R33XzSfuHub for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:17:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A9A0984240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9A0984240
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9A0984240
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:17:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0594240007;
 Mon,  3 Jun 2024 07:17:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sE1wi-002EbE-15;
 Mon, 03 Jun 2024 09:17:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 09:17:12 +0200
Message-Id: <20240603071726.532652-9-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603071726.532652-1-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 09/23] package/libnetfilter_acct: use https://
 reference for .hash file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ftp.netfilter.org no longer provides ftp, so use the https:// url from
_SITE.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnetfilter_acct/libnetfilter_acct.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnetfilter_acct/libnetfilter_acct.hash b/package/libnetfilter_acct/libnetfilter_acct.hash
index a72d83fb28..da9e1a3264 100644
--- a/package/libnetfilter_acct/libnetfilter_acct.hash
+++ b/package/libnetfilter_acct/libnetfilter_acct.hash
@@ -1,4 +1,4 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_acct/libnetfilter_acct-1.0.3.tar.bz2.{md5sum,sha1sum}
+# From https://www.netfilter.org/projects/libnetfilter_acct/files/libnetfilter_acct-1.0.3.tar.bz2.{md5sum,sha1sum}
 md5  814b2972b2f5c740ff87510bc109168b  libnetfilter_acct-1.0.3.tar.bz2
 sha1  4b9073e4aa989b0f000c8da1ab01b22fceed52b2  libnetfilter_acct-1.0.3.tar.bz2
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
