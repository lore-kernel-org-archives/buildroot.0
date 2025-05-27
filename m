Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CB0C5B552
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D77B083BDE;
	Wed,  4 Jun 2025 18:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUncg7rVLglu; Wed,  4 Jun 2025 18:28:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E288E83B7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E288E83B7D;
	Wed,  4 Jun 2025 18:28:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3517B1A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DE2F83B72
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQdmYgpbFX2J for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A3BC83B57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A3BC83B57
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68349876E0; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:28:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 36e25128937644488b0864b2386991a7e96dcf62
X-Git-Newrev: 49d043172df197b58e5d5014fd98c33a5bc26eb8
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.68349876E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/freeradius-server: ignore CVE-2002-0318 and CVE-2011-4966
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
Content-Type: multipart/mixed; boundary="===============1681315536185629368=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1681315536185629368==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=49d043172df197b58e5d5014fd98c33a5bc26eb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit 913bdcda44159e3b517b611dc7fbb2d105be343d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============1681315536185629368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1681315536185629368==--
