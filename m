Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47498CA5FEF
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B1C815DB;
	Sat,  3 Oct 2026 15:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sqiy9_lKEbwa; Sat,  3 Oct 2026 15:56:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 26170815C4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042967;
	b=q1e705kYaMfVAqfiui6rRT80rL30TiW6kOhui+gGTOhwrH44XU3zm+7i6LsjoEaSX2t5
	 jSAiT/AT0DHny/+vxHs5QQ9oKuVMhr2epG+B5U3utFEGKEoFwfhSo9As008SjCKWKYViK
	 CVIERO0/gSNcfACFubqM3R7kd5x8G2hqkzlMWDHPbK4sP+PFAYwICnmOzVPISlJzX1zJS
	 CdAM/ZpM0VZ3PhoocmE6Ty9kqxG4v6Ph+iihYPWS56AWjIZmQBdhifHbVt7TvEmsrFvQX
	 4qUHAP1vfzuM7sM7doeK5mrD+vUzYpIfXkrD4tgomDrLuGiP/DnmZLRIp4bzzAyR3Xg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042967;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2ywVrhBLuh3D6i7YSrGCkmJmkG26jdoi3pVW54W2Cmc=;
	b=eCRsdv+Q9kLb+8fkSJ3qIoFSdBugHhWWoxwuz60lE3Ap4pyLldHabS25R9jMG99D/1to
	 c+wvpVJ+msltAz6pQ+jw1zmyu4LwenTw0Y1TEUmgtqnY3UF4mcDVxyfbA3zteTIt9PZes
	 R9TvbdNNNA8QXXbMUT33y+S3yS1PcZsu5ACz4zDcZClPjADuAI/iaPV1qMkf1Em0Z7r8t
	 KxNL/3suJmBYndNBodOJ34X+PT14SqJDh+IA7BGk8imgSbS45UpFcUlYby5ABrY5oYu1f
	 3PbnLgZZEiK/euLB21+TKygA+z2he6BfJyG/UTG3qfWHb9ArkkDGTN+RKkMhQP1jjFQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042967;
	bh=2ywVrhBLuh3D6i7YSrGCkmJmkG26jdoi3pVW54W2Cmc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZVQBgZS6/ueITQWTRMuCXHNS9lXZUklOGBjg97vI5oaCWiEXnYo0JuUjw0YUndP2x
	 LfMTT62vTbks7ZCb07zdBGJu7vnAkUrTOGY+eju/WQ+gpqSx++2MU3QmPp/uwfqc1p
	 dAhemKLAi39QSzALYQxnTbj2GvAIC7ptSFq6Lk4RlVhkaePERWT1LZ3h7+OvEb2VYq
	 5lRgZqXfuW6YBgsqeMtL0rYsd/P0DOFKesMPhGNN4JQ1rEMrdKxx6TDF/vYhqxoIRF
	 LfqwMTeJN9PgIgksZPHm1iD9v4z5qDLzXCN8EPZCFnwn16XjRAS9QFFOoD9VmBBfsQ
	 quIzdxmKkwMFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26170815C4;
	Sat,  3 Oct 2026 15:56:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EBDE1476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC5E2606E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPFEBb-fcJYn for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2A7C560628
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=NsDL5iFbHR4ercmrxrC25pR0mJSrvYDw2rKHhyyLSNtsB1HxJ4At9JnTVjJ0zh+UtDYd
 FznS5hwTI4oBBQCPZkkr9y3+2tLkf5XPV6fQy7dpcPZYjjrP9yZEx4p1lq9UgOXzRpYXB
 uApCdjZUxH3Rhvaj/JkVcXJ4vIr0XD3YB3A6uIpR+bFLnB211l5290YSq3YihfQOLAE0V
 8At2NLjwREB25Mm8BsSbynOvhGn/OQSRG/Tp6e/bAhzlalbND0XicMEkFj+WeyFobJDDw
 2N0ZVFrFYuzaphkktPXcSBWOUzxU4Qxudmumi2aX+lj19thqFSTobCTfqwtLU1V6JEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=68wyqa4EIM3XigI3YR+zrnVbm4zQbBIJRFLgPF9HYLo=;
 b=oZNOstHlxeIj6uNSAPaB5pkt+Qg0pQkDMtH95RzkL1ugJck/1NL6ib/xC8b0ifHphd4C
 bzxYzPCgsg5jrjbJAn5+cJYmbrpekVdB2304dJpQSO5o+lqi/caHV6HB80ZqFQkOYcmmq
 3A/gTxFHEXhVDazlmbeKChyd1cdKXFI1FWj29aJWeCSzKkRSTpMdOW+N/C2iLH5t6a3E+
 XFue3bGRa5q7QMOpYOV5Ov5+EGGWrRWRHr1bBnqZu0J2CMnzSLh5uLc8msArB9yVbN4pA
 bYRkTKY2cw83V70hBxCthkKVpjLN4Vf802yT4ev4LWGH0wDMZmDHcX0QUpvlXGMA8Hw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A7C560628
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B5E888806; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d25bbf1f237ae34dfec52241986b04a221a57f56
X-Git-Newrev: 2d5207c9fad94d2c33295ef3f50d9edaacafbc39
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.6B5E888806@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-setuptools: bump
 version to 84.0.0.20260812
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d5207c9fad94d2c33295ef3f50d9edaacafbc39
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-types-setuptools/python-types-setuptools.hash | 4 ++--
 package/python-types-setuptools/python-types-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
index c0b0867998..6e330831fe 100644
--- a/package/python-types-setuptools/python-types-setuptools.hash
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-setuptools/json
-md5  156a454caa6bb356bdab546a1cfa2526  types_setuptools-82.0.0.20260210.tar.gz
-sha256  d9719fbbeb185254480ade1f25327c4654f8c00efda3fec36823379cebcdee58  types_setuptools-82.0.0.20260210.tar.gz
+md5  9a93e89b935a6a02dbfb4a143fbe0ccd  types_setuptools-84.0.0.20260812.tar.gz
+sha256  09bedc248ebbb7a232c9419dfcdca329706e61bf2aa5743e9424d027f1d956b4  types_setuptools-84.0.0.20260812.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index 4759fae2cb..d0cfdba1bc 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_SETUPTOOLS_VERSION = 82.0.0.20260210
+PYTHON_TYPES_SETUPTOOLS_VERSION = 84.0.0.20260812
 PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
-PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4b/90/796ac8c774a7f535084aacbaa6b7053d16fff5c630eff87c3ecff7896c37
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4f/cd/3b2a3362a526f91c33f785a291462b2ec448ae531101c62372fc30a21f53
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
