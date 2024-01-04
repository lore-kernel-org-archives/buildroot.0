Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC32C47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 19:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D5F260F3A;
	Thu,  4 Jan 2024 19:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D5F260F3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OHBULVW9kWW1; Thu,  4 Jan 2024 19:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBCC360C0C;
	Thu,  4 Jan 2024 19:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBCC360C0C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AA4C1BF356
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 19:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52DAE60C0C
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 19:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52DAE60C0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6kuxbZwRID99 for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 19:05:41 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AFEB60C07
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 19:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AFEB60C07
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 404Ib9Jt001904; Thu, 4 Jan 2024 11:05:40 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3ve1gdgb84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 11:05:39 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 96C144052B;
 Thu,  4 Jan 2024 19:05:38 +0000 (UTC)
Received: from us01arcgnu3.internal.synopsys.com
 (us01arcgnu3.internal.synopsys.com [10.194.34.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 52847A0085;
 Thu,  4 Jan 2024 19:05:38 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Thu,  4 Jan 2024 11:05:26 -0800
Message-Id: <20240104190529.1521901-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Proofpoint-GUID: 21tw_EqO-qHIRkEyR45-9KEACK-lqUzV
X-Proofpoint-ORIG-GUID: 21tw_EqO-qHIRkEyR45-9KEACK-lqUzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401040148
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=pfptdkimsnps; bh=XGC94OGMy3WIMbEhK
 n7dfrEU9RN5NUSlCt1nIHh+RSI=; b=a1rNR4NWN4XOfmvHEwhxqOPoKN+W+TgV4
 6PZtURZALp2NAzxzCLkNuCEh6TbpkBQWWmD9Uz8W+XC+STuk5QNQJ+saRZ19jwhf
 TPP/o4BD+nYZGbkMPRGrehcS6NYDXxb7wtZrnwo50eJyBHne8JSUMDcEBKBncy+c
 czLqNMmev3uLs6YuQIrx2JzOMDRdB01Wzfp84WypCREnbTE9LdrnVe1c1NYD6ikN
 /e/BoVttsAK6GH7k6sOkfW5A6Qz2nOx53KjByMfT8IhqWFWaIl86NLrVPFP1glCU
 ZzjcTVtPL5WA0R32+crHr39IavWl0oq/vtlIjiNKKrCnxRtwSV5Bw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704395138; bh=qO6tgC/9Y0/VH7JYsTdP5JYSNVsBnvnhdjK6FkMxIlM=;
 h=From:To:Cc:Subject:Date:From;
 b=LLzegE0Ud6hDwxCJjj+mmqxpKPJSBMF5earj1pu7DWYE1sCqhdi5T2+YaDPEFpOgc
 sQ4ZOSlxyHYKN/NOnlvIQWRXW4fI2K3xzTO1R185L+CyO3vyIVBD43sdTqHsDT8EtF
 QNtLwXvCczmFAp04xAuc1BqGgwzrmavHI3j4FrUyeTofKF+m5QA2CfIWJ3ccan8zKQ
 zXKHTuHwBmtgvobArRVhsXzuEdCWqGFR22j+u66dy/ZvIoLUgwS+yEr9rCXFNVwyUe
 lLo2W02ZW2OKVdpeqtWJuAuJ84s1TpV//u9LP/fqCkFr9ap2CeXa8RfIyOo/Btz8/y
 /LS8oi0CRYTrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=a1rNR4NW; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=LLzegE0U
Subject: [Buildroot] [PATCH 0/3] Add support for ARCv3 ISA  processors
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: geomatsi@gmail.com, artem.panfilov@nokia.com,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Shahab.Vahedi@synopsys.com,
 VVIsaev@gmail.com, vgupta@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It's been quite some time since introduction to the market
of new Synopsys ARCv3 ISA processors, which are meant to
build on top of success of their predecessors in ARCv2 family.

ARCv3 ISA is meant to improve efficiency of high-performance
embedded microprocessors and thus by definition is not binary
compatible with previous generation of ARC cores such as ARCompact
(ARC600 and ARC700 processors) and ARCv2 (ARC EM and ARC HS processors).

Moreover, finally in ARCv3 line there's a 64-bit processor family called
ARC HS6x meant to cover cases when 32-bit address space is not enough.

Since ARCv3 ISA in not binary compatible with older ARC cores, we have
to switch to newer tools, which in fact are already available as a part
of ARC GNU toolchain v2023.09, see [1] & integration of them into
Buildroot [2].

Even though that update is long overdue (for too long we kept all that in
our GitHub repo [3]) it's better late than never.

I'd like to say thank you for all the folks who used to work on Linux
bring-up on ARCv3 processors, most of whom did contribute to these
changes I'm sending out today, some even no longer work with us, but
still it's another amazing example of close and efficient collaboration
of a group of truly highly motivated professionals. And it is my
pleasure to work with such talented and bright people!

You guys rock!

[1] https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2023.09-release
[2] https://lists.buildroot.org/pipermail/buildroot/2024-January/682184.html
[3] https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot

Alexey Brodkin (3):
  ARCv3: Add support of ARCv3 32-bit and 64-bit processors
  ARC: Add defconfigs for ARC HS58 & HS68 processors in simulators
  libffi: ARCv3: Switch to upstream version

 arch/Config.in.arc                            |   51 +-
 arch/arch.mk                                  |    2 +-
 arch/arch.mk.arc                              |    4 +
 board/synopsys/nsim/hs5x.props                |   30 +
 board/synopsys/nsim/hs6x.props                |   30 +
 board/synopsys/nsim/post-image-arcv3.sh       |    4 +
 board/synopsys/nsim/readme.txt                |   16 +
 configs/snps_arc32_defconfig                  |   29 +
 configs/snps_arc64_defconfig                  |   26 +
 package/binutils/Config.in.host               |    3 +
 package/binutils/binutils.mk                  |    8 +
 package/gcc/Config.in.host                    |    6 +
 ...01-arc64-Remove-faulty-sub.f-pattern.patch |   47 +
 package/gdb/Config.in                         |    1 +
 ...ARC-Add-support-for-ARCv3-processors.patch | 4036 +++++++++++++++++
 .../0004-Update-ARC-s-libffi-port-771.patch   |  871 ++++
 package/uclibc/Config.in                      |    2 +-
 support/gnuconfig/config.sub                  |    2 +-
 18 files changed, 5163 insertions(+), 5 deletions(-)
 create mode 100644 board/synopsys/nsim/hs5x.props
 create mode 100644 board/synopsys/nsim/hs6x.props
 create mode 100755 board/synopsys/nsim/post-image-arcv3.sh
 create mode 100644 configs/snps_arc32_defconfig
 create mode 100644 configs/snps_arc64_defconfig
 create mode 100644 package/gcc/arc-2023.09-release/0001-arc64-Remove-faulty-sub.f-pattern.patch
 create mode 100644 package/glibc/0004-ARC-Add-support-for-ARCv3-processors.patch
 create mode 100644 package/libffi/0004-Update-ARC-s-libffi-port-771.patch

-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
