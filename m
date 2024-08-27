Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7ACC54734
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 13:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9217D4090F;
	Tue, 27 Aug 2024 13:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8i5YieOcPlb; Tue, 27 Aug 2024 13:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A02340920
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A02340920;
	Tue, 27 Aug 2024 13:05:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E13141BF21A
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 13:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDCA24090F
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 13:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jL9XeVevuWoi for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 13:05:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83FD3408E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83FD3408E2
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83FD3408E2
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 13:05:00 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R7qO6U029673;
 Tue, 27 Aug 2024 13:04:57 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 419asuj11a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2024 13:04:57 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47RD4uwP024779
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2024 13:04:56 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47RD4uqP010253
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 27 Aug 2024 13:04:56 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id C782A3026D76;
 Tue, 27 Aug 2024 08:04:55 -0500 (CDT)
Date: Tue, 27 Aug 2024 13:04:54 +0000
Message-Id: <20240827-package-dirclean-rdep-v1-0-d5e4f79a4241@collins.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPbOzWYC/x2MSQqAMAwAvyI5W0jrgvgV8RDaqEGpJQURxL9bP
 M7AzAOZVTjDWD2gfEmWMxawdQV+o7iykVAYHLoWB4cmkd+p6CDqD6ZoNHAyHXpC2wzONj2UNik
 vcv/faX7fDyT1JidnAAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=507
 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408270096
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 mlxlogscore=553
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408270096
X-Proofpoint-ORIG-GUID: lAJh2IlhVBRI6QQsa05kLWesDVKlJ11Z
X-Proofpoint-GUID: lAJh2IlhVBRI6QQsa05kLWesDVKlJ11Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 phishscore=0 adultscore=0 mlxlogscore=656 clxscore=1015 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2407110000 definitions=main-2408270096
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=on9XNiWz9CcmAL++uio4/t9+3W2eiVGX8JgrizaJdes=;
 b=WcWhRXAxbUuhGYrJ9Lci14zOuatVP4c4HW1b3LyhQF5ZJ7EDR4GB+aW+87TNvAVuSfUj
 y/ftxsJ9UsBHX2zEEEZX9HMA9GjOL1Him/1868yB8HpL1NYt2wQ+g+6UqoGF52NSbs/+
 9taDRSGqi4OSDppn9ep6RZICnNvrLBkwK5LFOC6RjyL83O+gwL3xwXRFigBYBbUmyJfT
 Qz4V9KmAJMXiz3kbigXLtOKQfn9dNagW9n0TptLP5I/H+wK3ckF7zHK/iolBo5VXmF7w
 V15050WrOBq0eJ8X89nCw0R047RwfFexgPxX75Hrw61fcpzQzqWB54D8vezeaXCXZhPz TA== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=WcWhRXAx
Subject: [Buildroot] [PATCH 0/2] package/pkg-generic.mk: add
 '<pkg>-dirclean-rdepends' command
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

This series adds a build target similar to '<pkg>-dirclean' that cleans
a package and all of its reverse dependencies (rdepends).

I'm interested in this command as a short-term workaround for
reinstalling the target/ and host/ directories when using
PER_PACKAGE_DIRECTORIES, as described in this old patch[1]. This command
is more reliable then manually picking out the right targets to
dirclean.

This command may also be useful when not using PER_PACKAGE_DIRECTORIES,
as it can be used to rebuild a library and force dependent packages to
rebuild.

[1] https://lore.kernel.org/buildroot/20191212130253.2cb543ba@windsurf/

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Brandon Maier (2):
      package/pkg-generic.mk: add '<pkg>-dirclean-rdepends' command
      Makefile: document <pkg>-dirclean-rdepends

 Makefile               |  3 +++
 package/pkg-generic.mk | 12 ++++++++++++
 2 files changed, 15 insertions(+)
---
base-commit: 0196ec4198771e5fe83d6df02c7cd3b13c0ce05f
change-id: 20240820-package-dirclean-rdep-50ca01382136

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
