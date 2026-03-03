Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAB6EDA6BC
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 17:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E884941786;
	Tue,  3 Mar 2026 17:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCSVoQPfk3gI; Tue,  3 Mar 2026 17:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A09E40DC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772558816;
	bh=T6XCJZtdYnCDkIBaq4ErbrwEs9lXSmxuk/mK7kBxsAE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B+yW92IoBxMs9tvNCxUY4TIiPXgnhRbB0atLN9ANBxBSHtQzPZME7anrjAkiunTde
	 EkVY/btTbYUNQKm8vnmYplbq0G52ubGd/Om8MOyECqfIg6TcX6sLY3d/0s/3p+gWEA
	 TQpC97FclC4Rfl/VOGFQS9PMwkxKaqm3A7tsBYGwVcTAuzYRiM3OyhIKrCPeEHpfBV
	 7ic7ghRgn3l5m5RkTlFmtagGw+385f7ufOHeZJzTJZE9OV1DfRvwrWdrTSoFUgOhML
	 YmDlnqy68EG7IDYob08PwvIr/y1G94XFOZ2ENWO1W37t9hUKUgb0aTcIEFHhc58HLB
	 ToSDfNoB+hrnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A09E40DC8;
	Tue,  3 Mar 2026 17:26:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E65B25B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14C5640087
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7psIxNTOKSNd for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 17:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3639640028
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3639640028
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:26:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FE9E85FCF; Tue,  3 Mar 2026 17:26:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Mar 2026 18:25:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73861bb720a82316cb56e644fc75d3a7ce95980e
X-Git-Newrev: a3329fd4923b7f1451560b589f101091574cb4dc
X-Patchwork-Hint: ignore
Message-Id: <20260303172652.2FE9E85FCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: add CVE-2024-32662 to
 IGNORE_CVES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a3329fd4923b7f1451560b589f101091574cb4dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CVE-2024-32662 was Introduced in v3.0.0-beta1.
For more information see [1].

[1] https://security-tracker.debian.org/tracker/CVE-2024-32662

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freerdp/freerdp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 6929c73683..889c6035f3 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -13,6 +13,10 @@ FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 FREERDP_CPE_ID_VENDOR = freerdp
 
+# Introduced in v3.0.0-beta1
+# https://security-tracker.debian.org/tracker/CVE-2024-32662
+FREERDP_IGNORE_CVES += CVE-2024-32662
+
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
