Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1691C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 10:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 117CB4052D;
	Sat, 15 Oct 2022 10:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 117CB4052D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVapMrDLgu9a; Sat, 15 Oct 2022 10:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3724840241;
	Sat, 15 Oct 2022 10:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3724840241
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16C881BF292
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 10:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5392415F0
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 10:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5392415F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rS8Ux9ygyb2w for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 10:53:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26390415ED
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26390415ED
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 10:53:03 +0000 (UTC)
X-QQ-mid: bizesmtp63t1665831178trmfsaah
Received: from pc.. ( [202.188.176.82]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 15 Oct 2022 18:52:57 +0800 (CST)
X-QQ-SSF: 01000000002000206000B00A0000000
X-QQ-FEAT: 907spY4M0eMVtmQO8K1nrqtE6Tk2957zBP1wR0Ox4CpUm7BI25Qbp+kYjiQpG
 LgU/eo3N7nA/1oUFwf7C5L9OeSvm0+4fk1EMefGSurwJIu03fsALYjEzvu+ofaEiO8UOsb1
 TZT9uow4u2a/uTCNxC2byTJmarMW4WaNpKdydO9YSex5b8lOBmGTi6DnoUDnt2fWIxMFpt3
 lpSCa/hNog7aP+O2UPwKAYNU5hz8THOJhZT9erApXrW45Qlqx44GPUKjTjq0b46wubaK1Iw
 FTJN2QDGLuBpRUA+OvthihgvuYHnznm3jKDCivn/oZ63BJUbxBRwe7cJGcj5myfFMf2xjBn
 ndOUxlugGIhEjTta06z6+NZjh4Rz+WUF8eDux1ACKCYRAdIUrpIS/9haOwbyg==
X-QQ-GoodBg: 0
From: Tan En De <ende.tan@linux.starfivetech.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 16:47:54 +0800
Message-Id: <20221015084757.277050-1-ende.tan@linux.starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr4
Subject: [Buildroot] [0/3] package/libkcapi: bump version to 1.4.0 and add
 Kconfigs
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
Cc: Tan En De <ende.tan@linux.starfivetech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series is to:
- bump version to latest version 1.4.0
- add Kconfig option for building kcapi-dgst
- add Kconfig options for enabling lib-asym and lib-kpp 

Tan En De (3):
  package/libkcapi: bump version to 1.4.0
  package/libkcapi: support building kcapi-dgst application
  package/libkcapi: support enabling lib-asym and lib-kpp

 ...f-__NR_io_getevents-when-not-defined.patch | 42 -------------------
 package/libkcapi/Config.in                    |  9 ++++
 package/libkcapi/libkcapi.hash                |  4 +-
 package/libkcapi/libkcapi.mk                  | 20 ++++++++-
 4 files changed, 30 insertions(+), 45 deletions(-)
 delete mode 100644 package/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
