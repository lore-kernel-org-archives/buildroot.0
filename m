Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97424C4167B
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 20:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13F7581886;
	Fri, 25 Nov 2022 20:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13F7581886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TTWIKocRy7ui; Fri, 25 Nov 2022 20:33:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5401281836;
	Fri, 25 Nov 2022 20:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5401281836
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DFCE1BF271
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 20:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85A4841DC8
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 20:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85A4841DC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4aj6SEkNG6_5 for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 20:33:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8319641DC4
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 20:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8319641DC4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 718F18468D; Fri, 25 Nov 2022 20:33:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 21:33:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3e708ed1f2e3da30296336249a6b02d287549e63
X-Git-Newrev: 4d47982fa2d1b0ab04a253906944ff3f8ce99340
X-Patchwork-Hint: ignore
Message-Id: <20221125203352.718F18468D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-dicttoxml2: fix
 hash file formatting
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4d47982fa2d1b0ab04a253906944ff3f8ce99340
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

package/python-dicttoxml2/python-dicttoxml2.hash:5: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3378478031/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dicttoxml2/python-dicttoxml2.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-dicttoxml2/python-dicttoxml2.hash b/package/python-dicttoxml2/python-dicttoxml2.hash
index 7f584cc000..4cc92d1d37 100644
--- a/package/python-dicttoxml2/python-dicttoxml2.hash
+++ b/package/python-dicttoxml2/python-dicttoxml2.hash
@@ -2,4 +2,4 @@
 md5  787ea4b80cd6234a41c016e8efa7ff40  dicttoxml2-2.1.0.tar.gz
 sha256  67cb729f337dd752808c021b70c8df8a34f84b9e111a5dbaa37e000eeaf4d462  dicttoxml2-2.1.0.tar.gz
 # Locally computed
-sha256 4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
+sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
