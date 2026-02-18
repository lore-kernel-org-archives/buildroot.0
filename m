Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82469E9A056
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59291611AE;
	Thu, 19 Feb 2026 17:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdwjUAG3ivhL; Thu, 19 Feb 2026 17:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02E95611A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521969;
	bh=aK+7AuUzlJL8+XgJHSTlbKCjvjmOZN7D94a4hV0s7Qg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MNlT1kpqEEFfj61FP6yN9q2yaeZuiPWEov+5GG35Y6OEy9IQqxpkAR+aoiCOx7Mqy
	 BVu6Sx8o4pBg1hMe1rZYrn1w5WUcOVaSP8kMz+SrcMcp3MHnLJXoBj7Nlc/VI2k9lT
	 fwY21jT8qNU143fpRTnsXVI4NERWFO74R7fg1ZqAGmG5nQ41xncuS2p9hKNkqFkL7g
	 ZT3JA3XhF9Upwf76IyVoaUwfOAdvHb5SJyTz/uoCb3fSJ6SkJ3Y2TbGE8ddienclhe
	 0xf02F8B1LMVoqZwGobddVKiX7cvoIhqxbGTAssZkXMWKcqyuuU7YaMfUGtq7nSGut
	 PGA+snpr3T/Nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02E95611A3;
	Thu, 19 Feb 2026 17:26:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DDC1206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81D5E60F46
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00aB-b1asi7N for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11F2A610BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11F2A610BF
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F28C870D9; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:27:22 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3e0076aa87fa78e6792319b5063f2ab9a9ef64ef
X-Git-Newrev: e7fce26fa04522ebcc785dca0a5a794bf4c79042
X-Patchwork-Hint: ignore
Message-Id: <20260219172538.0F28C870D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-jinja2:
 update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e7fce26fa04522ebcc785dca0a5a794bf4c79042
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The `pocoo:jinja2` CPE introduced in commit [1] is not deprecated but is
no longer used. All the security issue on the Github Advisory reference
CVE with the `palletsprojects:jinja` CPE instead (see [2]).

This commit updates the CPE accordingly.

[1] 165f60a092 package/python-jinja2: add CPE variables
[2] https://github.com/pallets/jinja/security/advisories/GHSA-cpwx-vrp4-4pq7

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c01c53f5e8ea212c826e9c276d69a900dfbbbace)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-jinja2/python-jinja2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 74360ec258..a52fa77275 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -10,8 +10,8 @@ PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/df/bf/f7da0350254c0
 PYTHON_JINJA2_SETUP_TYPE = flit
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.txt
-PYTHON_JINJA2_CPE_ID_VENDOR = pocoo
-PYTHON_JINJA2_CPE_ID_PRODUCT = jinja2
+PYTHON_JINJA2_CPE_ID_VENDOR = palletsprojects
+PYTHON_JINJA2_CPE_ID_PRODUCT = jinja
 
 # In host/target build, setup.py tries to download markupsafe if it is not installed
 PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
