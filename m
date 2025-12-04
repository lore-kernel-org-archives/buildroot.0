Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029B7D2A537
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB19861C1B;
	Thu,  4 Dec 2025 20:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7A05GsvjUle; Thu,  4 Dec 2025 20:42:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E09AE6147E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880945;
	bh=7b58ZapulJYBR3AKnoV24sJNePiBjX+kc2bhiyjYZZM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ABRRVbTXc7fCsZUiJcYt2wyuw6rMHe1nLz2+TxmpY95ynLCAqFw0iVl/UHsFQIJQO
	 6s5/6s4vSOCL7dSceeD21J2ZTBQ4XpM3RVBWH+F2rXlWO2sHsQv8yHA2A2Rx5nmAWK
	 FZCfydGGATQbkp9UkdVm78RdetB1kXdVWlcqsabfqsL9J/sODZlXypinkmHed8UXGu
	 dSgU5h9YRROwrc1cD64pV556msJrr+n/CnBn3LUlEz9s/WWGzfAOTKT9gzPXO/wi/K
	 TeGZsbKkDsX1B/pBta6fZtmDNgZtnF0M6uzcRUSFaBpNzulah7xKfWuqBpIhf18QLD
	 Z25b6PAbpk5gA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E09AE6147E;
	Thu,  4 Dec 2025 20:42:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4DA01BD
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABA798471E
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gscfB21ogMC4 for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:42:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B891D8471A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B891D8471A
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:42:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B336F8653D; Thu,  4 Dec 2025 20:42:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 21:34:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: da8f89a6a4027c0875b38de7256dd617ea68fe13
X-Git-Newrev: 55961e952df4cd4d229f9325fecf141aae15b521
X-Patchwork-Hint: ignore
Message-Id: <20251204204221.B336F8653D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hwdata: bump version
 to 0.402
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

commit: https://git.buildroot.net/buildroot/commit/?id=55961e952df4cd4d229f9325fecf141aae15b521
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/vcrhonek/hwdata/releases/tag/v0.402

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index b96c36648e..6a0b931aea 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  e9ff93b9807cc014ed8f7f5cb5dc2c31e714058c82ddc59b7355f5c57c9b759e  hwdata-0.401.tar.gz
+sha256  e390fe2f5f5ef7ed9ccbe62eb7cd40d4ee2b57389e7869c0dc96433c81812e7a  hwdata-0.402.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index f826faf94e..8a8e399c21 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.401
+HWDATA_VERSION = 0.402
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
