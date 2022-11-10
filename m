Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A1FC4332F
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 18:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C59B403E2;
	Thu, 10 Nov 2022 18:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C59B403E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHb5g8HlA292; Thu, 10 Nov 2022 18:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E10640232;
	Thu, 10 Nov 2022 18:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E10640232
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 767971BF3F2
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 18:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A21D81ED4
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 18:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A21D81ED4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ih8PL4inIAZS for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 18:47:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F27981EC8
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F27981EC8
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 18:47:51 +0000 (UTC)
Received: from pps.filterd (m0075556.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 2AAIkIXm006187; Thu, 10 Nov 2022 18:47:49 GMT
Received: from xmnpv39.utc.com ([167.17.239.13])
 by mx0a-00105401.pphosted.com with ESMTP id 3kryh1fmwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Nov 2022 18:47:49 +0000
Received: from qusnwadx.utcapp.com (QUSNWADX.utcapp.com [10.161.48.88])
 by xmnpv39.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2AAIllpX034336
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Nov 2022 18:47:47 GMT
Received: from crulimr02.rockwellcollins.com ([10.172.224.19])
 by qusnwadx.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2AAIll8P005836
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 10 Nov 2022 18:47:47 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab
 [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 714D960890;
 Thu, 10 Nov 2022 12:47:47 -0600 (CST)
To: buildroot@buildroot.org
Date: Thu, 10 Nov 2022 12:47:34 -0600
Message-Id: <20221110184734.22425-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Proofpoint-GUID: 91C043duOsyYCO1gvSemsQfOW92d4yzg
X-Proofpoint-ORIG-GUID: 91C043duOsyYCO1gvSemsQfOW92d4yzg
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=625 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=AI82HbblXduo1IU6bb1mAhjOPRTmdg5r5C8HusKU4u8=;
 b=UTjUvrvKqhjx+6HiUXBUbFEGZuqgOQYp/TskvNZsJMH/PerW9TY1Tmib45eaNcjIwu1i
 utMSlxDxINg80ERDRj+MuK9geLj2LyAH51lB1xFTl1bfDK59nYpntofgyakjhmi7HAvm
 359G6ISq8Cqmn6FzOgjOkaPoVkybB4RtJ4IhfqN8ESfrCb7oS9oHJFL9SHFGNCaTdK9X
 q9JFbx1xZq0PbKn2/JRVZ6HJSFvwt4vd6cn3PPVP+eGGFsCnu+ay2QGvjzwYUeBJEosg
 icF5hpbJfVW7lPJLikVVK1PsMyyMRjOzbTawy6rCATKISz0lFUP4Jt0q9aPugwKEn4oU gA== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=UTjUvrvK
Subject: [Buildroot] [PATCH 1/1] Makefile: fix SDK relocation for
 per-package-dirs
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The relocate-sdk.sh script does not work correctly when
BR2_PER_PACKAGE_DIRECTORIES is enabled. relocate-sdk.sh expects
everything to point at $HOST_DIR, but each package will be pointing at
its $(O)/per-package/*/host.

Before packing up the SDK, scrub the HOST_DIR to replace all matches of
the per-package directory to point at the final HOST_DIR.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 DEVELOPERS                 |  1 +
 Makefile                   |  1 +
 support/scripts/fix-perpkg | 31 +++++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100755 support/scripts/fix-perpkg

diff --git a/DEVELOPERS b/DEVELOPERS
index 81e6cd54ab..238f8754e3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -488,6 +488,7 @@ F:	package/ncdu/
 
 N:	Brandon Maier <brandon.maier@collins.com>
 F:	package/vmtouch/
+F:	support/scripts/fix-perpkg
 
 N:	Brock Williams <brock@cottonwoodcomputer.com>
 F:	package/pdmenu/
diff --git a/Makefile b/Makefile
index 7c1c07a2e4..929042396a 100644
--- a/Makefile
+++ b/Makefile
@@ -595,6 +595,7 @@ prepare-sdk: world
 	@$(call MESSAGE,"Rendering the SDK relocatable")
 	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath host
 	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath staging
+	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-perpkg
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	mkdir -p $(HOST_DIR)/share/buildroot
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
diff --git a/support/scripts/fix-perpkg b/support/scripts/fix-perpkg
new file mode 100755
index 0000000000..56d7d7a45d
--- /dev/null
+++ b/support/scripts/fix-perpkg
@@ -0,0 +1,31 @@
+#!/usr/bin/env bash
+
+usage() {
+	cat <<-EOF >&2
+	Usage: fix-perpkg
+
+	This script rewrites file's PER_PACKAGE_DIR to point at the HOST_DIR
+	before they are bundled into an SDK. So that relocate-sdk.sh can find
+	and relocate them.
+	EOF
+	exit 1
+}
+
+if [ "$#" -gt 1 ]; then
+	usage
+fi
+
+# Check if per-package-directories is disabled
+if ! [ -e "$PER_PACKAGE_DIR" ]; then
+	exit
+fi
+
+# Make sure `file` uses the right language
+export LC_ALL=C
+
+# Replace the old path with the new one in all text files
+grep -lr "${PER_PACKAGE_DIR}/[-_a-zA-Z0-9]\+/host" "${HOST_DIR}" \
+	| file --mime-type -f - \
+	| grep ': \+text/[-_a-zA-Z0-9]*$' \
+	| sed 's|: \+text/[-_a-zA-Z0-9]*$||' \
+	| xargs -r sed -i "s|${PER_PACKAGE_DIR}/[-_a-zA-Z0-9]\+/host|${HOST_DIR}|g"
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
