Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38186C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D61496FBEC;
	Mon, 19 May 2025 11:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4kR7bTNPrai; Mon, 19 May 2025 11:05:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D975071231
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D975071231;
	Mon, 19 May 2025 11:05:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DAAAD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B6B141137
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgSPC1RHfPCD for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1743240DDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1743240DDC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15F5481E90; Mon, 19 May 2025 10:40:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:17:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 677b24ebaf154aaa0af59d34e91471b95d9a861b
X-Git-Newrev: 913bdcda44159e3b517b611dc7fbb2d105be343d
X-Patchwork-Hint: ignore
Message-Id: <20250519104010.15F5481E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/freeradius-server:
 ignore CVE-2002-0318 and CVE-2011-4966
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
Content-Type: multipart/mixed; boundary="===============1850749438432744164=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1850749438432744164==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=913bdcda44159e3b517b611dc7fbb2d105be343d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

CVE-2002-0318 has been mitigated by adding a new config option in
freeradius-server commit f0f762d1439336fff9c8b90291364ddff583f698,
which is part of release_0_5_0 onwards.
See also the original report ([1]).
The NVD database's CPE configuration doesn't have an associated
version number, which is why our CVE check still reports it.

For CVE-2011-4966, the CVE description (see [2]) mentions the issue is
fixed in version 2.2.0 onwards, but the CPE again doesn't use a
version number.

To reduce the noise in the list of CVEs that pkg-stats reports, ignore
them.

FWIW, yocto/oe also ignores them (see [3]).

[1]: https://marc.info/?l=bugtraq&m=101440113410083&w=2#2
[2]: https://nvd.nist.gov/vuln/detail/CVE-2011-4966
[3] https://patchwork.yoctoproject.org/project/oe/patch/20220715133515.14298-1-davide.gardenal@huawei.com/

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeradius-server/freeradius-server.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 94c9331b3d..9bb5c3606a 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -15,6 +15,13 @@ FREERADIUS_SERVER_CPE_ID_PRODUCT = freeradius
 FREERADIUS_SERVER_DEPENDENCIES = libtalloc
 FREERADIUS_SERVER_AUTORECONF = YES
 
+# Mitigated upstream since version 0.5.0, NVD database entry not
+# up-to-date
+FREERADIUS_SERVER_IGNORE_CVES += CVE-2002-0318
+
+# Fixed in 2.2.0, NVD database entry not up-to-date
+FREERADIUS_SERVER_IGNORE_CVES += CVE-2011-4966
+
 # We're patching src/modules/rlm_krb5/configure.ac
 define FREERADIUS_SERVER_RUN_KRB5_AUTORECONF
 	cd $(@D)/src/modules/rlm_krb5; $(AUTORECONF) -I$(@D)/m4

--===============1850749438432744164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1850749438432744164==--
