Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8CECDD553
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74BED411F0;
	Wed, 18 Sep 2024 20:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Fvn1NaE6BEQ; Wed, 18 Sep 2024 20:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88FE2411C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88FE2411C3;
	Wed, 18 Sep 2024 20:12:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9020B1BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F2E481425
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXjaN-8emCzD for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:12:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A675813EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A675813EB
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A675813EB
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:12:52 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48IITHax025403;
 Wed, 18 Sep 2024 20:12:52 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 41qyw4c8we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2024 20:12:51 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 48IKCnSt029033
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2024 20:12:50 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 48IKCnRE014826
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 18 Sep 2024 20:12:49 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id B875C9709;
 Wed, 18 Sep 2024 15:12:49 -0500 (CDT)
Date: Wed, 18 Sep 2024 20:12:34 +0000
Message-Id: <20240918-ls1046a-frwy-linux-6-6-v1-0-941f6224e052@collins.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADM062YC/x2MSQqAMAwAvyI5G2hKqctXxEPRVANSpcUN8e8Wm
 dMcZh5IHIUTtMUDkQ9JsoYsVBYwzC5MjDJmB620UQ3VuCRSxjr08bxxkbBfaDOeK6oMaasaCzn
 eInu5/nHXv+8Ha3b1smgAAAA=
X-Change-ID: 20240918-ls1046a-frwy-linux-6-6-fe7174126096
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=505 mlxscore=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409180132
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=559
 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409180131
X-Proofpoint-GUID: 4X9_vWY6EXOkyWYwz91NPXPrN3hKBM-x
X-Proofpoint-ORIG-GUID: 4X9_vWY6EXOkyWYwz91NPXPrN3hKBM-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 mlxlogscore=637 suspectscore=0 mlxscore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2408220000 definitions=main-2409180132
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=UwDvYKGNZLwFwRw3fgxbZ/VC0tHM6oDf8nFddOAhyHk=;
 b=Yok5uyHTfbp4pUTwUHHQGOj7zk7XSxjG/V3SVMI0MR/y8yQtY/LKlfaU+ACK022Yrej/
 e4ffNMc59JpwEHUYQYy4lf0EDkkL2X8MgQdnWMju89TgcuGO6w2FI576Gq/2PyCHI0F8
 ECxPsbUXj4hru2ifHEC6DgAVL21eGZquhy2KPkELqjy40740PDQaGsLlJwo57IeGsGIU
 Bg7OExym5IqdEAzjzmn2A8UI9RlpQtrlcxrTeexqy16+qzYUbzOdJ7J708+x7Hlhwvgm
 hx15ERCHProBVuRiTbm39K9EvFeYTw2RVi7pfUz8dM1k/85Vv1C9iaep76CY2Em3HTKo Dw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=Yok5uyHT
Subject: [Buildroot] [PATCH 0/5] configs/ls10*: update ls1046 and ls1028 to
 Linux 6.6
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series fixes a build failure on the ls1046a-frwy board[1] by
updating the Linux kernel to the latest NXP supported release.

While we are updating the kernel, we also:
- Enable FORCE_CHECK_HASHES
- Update U-Boot, Arm Trusted Firmware, QorIQ RCW, and QorIQ F-Man
  packages to the same release
- Update the ls1028ardb board to match

I boot tested this series on an ls1046a-frwy. I do not have an
ls1028ardb board to test with.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199902

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Brandon Maier (5):
      configs/ls1046a-frwy: add hashes
      configs/ls1046a-frwy: update to Linux 6.6
      configs/ls1028ardb: update to Linux 6.6
      package/qoriq-fm-ucode: bump to version lf-6.6.23-2.0.0
      package/qoriq-rcw: bump to version lf-6.6.23-2.0.0

 .checkpackageignore                                      |  1 -
 .../arm-trusted-firmware/arm-trusted-firmware.hash       |  2 +-
 board/freescale/ls1028ardb/patches/linux/linux.hash      |  2 +-
 board/freescale/ls1028ardb/patches/uboot/uboot.hash      |  2 +-
 board/freescale/ls1028ardb/readme.txt                    |  8 ++++----
 .../arm-trusted-firmware/arm-trusted-firmware.hash       |  2 ++
 .../patches/linux-headers/linux-headers.hash             |  1 +
 board/freescale/ls1046a-frwy/patches/linux/linux.hash    |  2 ++
 board/freescale/ls1046a-frwy/patches/uboot/uboot.hash    |  2 ++
 board/freescale/ls1046a-frwy/readme.txt                  | 10 +++++-----
 configs/ls1028ardb_defconfig                             | 16 ++++++++--------
 configs/ls1046a-frwy_defconfig                           | 15 ++++++++-------
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash               |  4 ++--
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk                 |  4 ++--
 package/qoriq-rcw/qoriq-rcw.hash                         |  2 +-
 package/qoriq-rcw/qoriq-rcw.mk                           |  2 +-
 16 files changed, 41 insertions(+), 34 deletions(-)
---
base-commit: 8e783314d7299c0d1627f0aa650506133ed9cb4a
change-id: 20240918-ls1046a-frwy-linux-6-6-fe7174126096

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
