Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7665C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:07:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C1A1610EA
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C1A1610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25D4F6072A;
	Thu, 14 Oct 2021 20:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1LSNofuyFRhh; Thu, 14 Oct 2021 20:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 977C2606FF;
	Thu, 14 Oct 2021 20:06:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF6BE1BF599
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DC3A40513
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-4IivmpzbIb for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 20:06:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00A1D404E6
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 20:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634242013;
 bh=AcNNI6S2HKdCXwe/dl227biUJwbzDxCF6QQ9PWXFe8w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=TIzt3ZTbEFQFtUWPiOCimWan0hIDIpkdz6u7jh1AeeJVCMZYZ5Rv16CCSJGmLdBw3
 JUWlcl7Dc92PwnW5mQ3Q1YFk1snOFm200uH+DJKRD5KsR5kMJeOgZ/s8+8Oc4w1cpM
 IRI6XvuCHoA6ihvbamBFJv2rpmQnzAz0POz92bkk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.156]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MKsnP-1mIk6L3CTl-00LCdp; Thu, 14 Oct 2021 22:06:52 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 22:06:52 +0200
Message-Id: <20211014200652.25988-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Qw6dAaKBhmGY7Yo1zItg7jtT0vidFR0mg81DxLgzzjilxY1FJ3E
 tiC9k22InzZ5Ce1HORDvaqnZr9VybFBJ9GmadviZgKU6wmgX4WwuhEdwHhIYOFuaCHGyvSG
 jw5fO5wF1MxwdMUywarnvZSUlh9EDIhAUe/DxGnBqqfrAQ1rs+GpC0CIi7J832+YKVc0h1r
 Zp2Hcwzj+010OtW3wriTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aE9UAFXDJUo=:YwvSpEhptlU2WAPf9A4/tb
 /junRgf3AVeQhPYaj2RFj2VtxioYD2XEAEQEszqV+61/vKLcbI0PQpkTDXAL7nSSzjSZs/8bx
 WiBqyGg8owiZeB44/RNfe3j0qQP1MDE+04vHivPa3iT1v6nGDQRXpqkZaSjiiFz1QoiijqZZH
 cYIKPuX5JyowopXfVrr4wmMTa7Tq4rnRW29K1RlWWEX+SIGWVol4P3feA8BgPbkFXWygfJHM3
 N9JEnK5itOO4UXrYdcf7cgmu4Fx+udvrieCnehRQKpbdPeCS87PObi6q0OBdEVHx7qHxbUx3b
 l6nspA7OZrWoupDk1aAFtJnNz9g6N/V52sdbDwtGe0vMwQJVQmBz0qWSeRDRYNUb3SZV/y0Qe
 gjwuNY3fxxrOv/q6VXE+EcM6WcbA8Nt9ZzS92SOFE55FYN82kN3gA9SJ8hpV4udxZw5kk8OtP
 6cTNUicPB1EQesOMqOXOWIRyZBt411PEo49g2OVOZdgOUh6/GSCUaQfA1Zr0IPvrloKcIWcFP
 RhjN57c6EuKIhxJYMAx3nziMCTSp6Efn2/8DdGjT8CMgtRGY/g8Mr5JfQf3WR4x1sjZk+J5mR
 jiU0ZJ/hXylE8PvLxDcODQLW0uHwTCoAo/8RNNVfNjNW9cmfzt1X7DWv9pFUHnEvGg9gQpp9P
 Dfkg7Z9lPYkk2kOD9c7BAEXQVjrWTLXzfD+vyX3c89csXeONeq2LoHsZyRdN0VLUNyArS1T1+
 Wd473sjqf5f0RoN1fts0bontDWB360PJJNim16fFXKDRkohElZIX+wRs08tfJ0q5n0FSqc7D3
 ZH6+Tg3Em5ZXsVJudX6PdVwV8fBbvX9gc9CAHvoHnoe5ufVQyGT7slFUe/AwA14H2jewfbXaX
 FlzI4AhWSMIz+j+NGDZsoH9H1agvu8sVtb8d8ozSVbNyjM85c1JHBFFnTPhnO6D+6EaGTCVGS
 12fpG3pz365n5VuYB1WRFTp2ucZWMjn5aKwNuzx8g1np4KD5mOjGhdNUe1pO9nSPY2Vwsj5Uo
 0pBNibu0QqgkSultFMga21rNBCAPKmqvt+Hj6bsVfJtoaW5F6DG0PGlPc7iCyWDdPBe+uTZlW
 PsA/6Tmt7dch8E=
Subject: [Buildroot] [PATCH v1] package/qemu: disable doc generation for
 host build
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- disable doc generation (via sphinx) for host build

Reduces host-qemu build time from (on a system with sphinx installed):

	real    2m5,522s
	user    9m41,292s
	sys     1m9,732s

to:
	real	1m9,183s
	user	8m40,131s
	sys	1m9,533s

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 520618cd55..69949cfd7b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -354,6 +354,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-bzip2 \
 		--disable-containers \
 		--disable-curl \
+		--disable-docs \
 		--disable-libssh \
 		--disable-linux-io-uring \
 		--disable-sdl \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
