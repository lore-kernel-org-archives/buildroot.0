Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7916AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 22:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAF1D4244C;
	Wed, 22 Jun 2022 22:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAF1D4244C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srt3PLmv97UF; Wed, 22 Jun 2022 22:09:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 893D141CC0;
	Wed, 22 Jun 2022 22:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 893D141CC0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1ECC81BF3A8
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 22:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0204941CC0
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 22:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0204941CC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryUqYe6_qIJ4 for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 22:09:31 +0000 (UTC)
X-Greylist: delayed 00:48:36 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBA3841A24
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBA3841A24
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 22:09:30 +0000 (UTC)
Received: from pps.filterd (m0075793.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 25MLALWM041202
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 21:20:53 GMT
Received: from xnwpv35.utc.com ([167.17.239.15])
 by mx0b-00105401.pphosted.com with ESMTP id 3gsrf70844-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 21:20:53 +0000
Received: from qusnwady.utcapp.com (QUSNWADY.utcapp.com [10.161.48.89])
 by xnwpv35.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 25MLKqnL134675
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 21:20:52 GMT
Received: from crulimr01.rockwellcollins.com ([10.172.224.19])
 by qusnwady.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 25MLKqsI029817
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 21:20:52 GMT
X-Received: from jdknight-dev2.rccalab.inside (unknown [10.197.250.171])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 959856057C;
 Wed, 22 Jun 2022 16:20:51 -0500 (CDT)
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 17:20:45 -0400
Message-Id: <20220622212045.573-2-james.knight@collins.com>
X-Mailer: git-send-email 2.30.0.windows.1
In-Reply-To: <20220622212045.573-1-james.knight@collins.com>
References: <20220622212045.573-1-james.knight@collins.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: aPGIi4LhVZSkH6EpswY69BKMcl5o0TwT
X-Proofpoint-GUID: aPGIi4LhVZSkH6EpswY69BKMcl5o0TwT
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206220097
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=PQrR+BejCwY41QPG997jDQAs5fn25VajGOlv9Clo46c=;
 b=cMN+IzzpkkYYPO11PuS3Un4mx6yLQBqaMNqu9g4dmLfeqtS/l0NSq6XC0spWwalPXZtK
 IhSwjeDCaz9rPP1V/I4RJ6oVRt1OE+KFM3VwzpWj/eotLSzLnYVllynUrab+Cp2VzC40
 qSU/okMg0/CxyfH03/Lk2/KvrA3cFdDDYNg4EZio9QAeKLOjMwNQrSQK8qLCAqcYCNM6
 4rz7OChF3JNFuQBBroojb4IO7emPzL3f8N8EPISrlN7HtqEJHld0I/KM9izZB5iqMvGn
 aYasMSmJMb2iOqVNClYFkc3jCBqOwl3vlPoJx5L+zsBLLkQcHefJmtTWqtpeZdXmsRQ3 PQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=cMN+Izzp
Subject: [Buildroot] [PATCH 2/2] .gitattributes: default lf line endings for
 text files
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
From: James Knight via buildroot <buildroot@buildroot.org>
Reply-To: James Knight <james.knight@collins.com>
Cc: James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Default the line endings for text files to be LF. The building of a
Buildroot project is most likely always invoked from an environment
using LF line endings. For developers working with various environments
(e.g. Linux and Windows), defaulting to LF can help improve a
developer's user experience. For example, with a clean checkout on a
Windows environment, a developer can trigger a configure and build with
two commands in their desired VM/container, without having to worry
about configuring `core.autocrlf`:

    make O=~/buildtest qemu_x86_defconfig
    make O=~/buildtest

Signed-off-by: James Knight <james.knight@collins.com>
---
 .gitattributes | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 .gitattributes

diff --git a/.gitattributes b/.gitattributes
new file mode 100644
index 0000000000000000000000000000000000000000..74dcc97d294192e61f4b241dbf4aa10449de5626
--- /dev/null
+++ b/.gitattributes
@@ -0,0 +1,2 @@
+# default lf for text files to help with cross platform development
+* text=auto eol=lf
-- 
2.30.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
