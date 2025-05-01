Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630FBC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37DB6411B5;
	Fri,  2 May 2025 11:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w4_f7COBSTNP; Fri,  2 May 2025 11:11:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A0D3411B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A0D3411B8;
	Fri,  2 May 2025 11:11:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18EDB22D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AF9860AE6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2v2Ubj5kcbZ for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5344460C0D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5344460C0D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E28D860E9; Fri,  2 May 2025 11:11:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 May 2025 18:58:27 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ca5f3492fc3f034c1ce7dd9e5c24bdc13966b41f
X-Git-Newrev: b072b1018e16d7755ccf718f3c1ab219c233e7a2
X-Patchwork-Hint: ignore
Message-Id: <20250502111135.4E28D860E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libopenh264:
 ignore CVE-2025-27091
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
Content-Type: multipart/mixed; boundary="===============0080301242429852282=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0080301242429852282==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b072b1018e16d7755ccf718f3c1ab219c233e7a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Both openh264 2.6.0 and 2.5.1 contain the fix for this CVE (see the
release notes at [1]).

In other words the version we have is no longer vulnerable since
a7aeb5a46eaaf8a39560c8664593018cf253835a ("package/libopenh264:
security bump to version 2.5.1") but pkg-stats still reports it.

An email was sent to the NVD to fix the CPE version number, but in the
meantime let's ignore it to reduce the noise in our CVE checker.

[1]: https://github.com/cisco/openh264/releases/tag/2.5.1

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2488d97719535a00797bef01caad7f449954c725)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libopenh264/libopenh264.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index f9a50e4c61..9ae996fee1 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -12,6 +12,9 @@ LIBOPENH264_CPE_ID_VENDOR = cisco
 LIBOPENH264_CPE_ID_PRODUCT = openh264
 LIBOPENH264_INSTALL_STAGING = YES
 
+# The following CVE is fixed in 2.5.1, the NVD CPE is not up to date
+LIBOPENH264_IGNORE_CVES += CVE-2025-27091
+
 ifeq ($(BR2_aarch64),y)
 LIBOPENH264_ARCH = aarch64
 else ifeq ($(BR2_arm)$(BR2_armeb),y)

--===============0080301242429852282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0080301242429852282==--
