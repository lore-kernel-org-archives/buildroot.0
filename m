Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1040CA5FCF
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 16:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC7481220;
	Thu,  1 Oct 2026 16:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJpjxoYetyjI; Thu,  1 Oct 2026 16:50:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C348C811BC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790873402;
	b=cx7cirqnuMRauXJKPWrBOYEaKENRXTF7fDKfED1aq2s1zxaLz0YjQYX2GpLFsIIRmxV7
	 5LUqKUI8AcTSoVgOP01m6YKxGzyC3LpwlHSoYawIoytCG+TBMKTXmX+RgtF2Gc0FJI104
	 ljUX4A5vhLCKV0IZDVQV0FhfwFg27liYLqRmrlpFJwelRJQE5K2zXRMU3gHKirtBxMEg2
	 snN79f8vLpP1RmpGHhEv12droEIw+qgKk0V8fqlAXdxvstS7V4ux4+QuOrBfLPOvilH+S
	 U9WvjCRC3IttYzJsmaZkHFuLyJw3ZktssXlZ2rV8uryM5q4U+NaZ68AN6zbfM8XMIaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790873402;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2GZRbo1oLJ2c3Qjorou44UiUgjkieg8C+uDj4/ApMRQ=;
	b=mZjRWSag7pPHLbxPO0zW/s4k8WBEt/Q0iDdtS/sRR8bt7Enzx7E0iQmo7ZSybxS5x7X5
	 pjCN16TOtJQCEyWXvJctLhGUmmqSVQ8VhtUdtWxjM8Owh2x6F9/C/EBp8frYuEyuMuyEY
	 Jc61nRqLDLKMARXc/fFqSjeiT3WT+PaRlkiBAwpUed+pTdaCHmK1gRPijVniOfa38Kund
	 KpC2OViuRyNWBTkUA3Ysk1TevHHobYuCRT9OB5I5gcHw3Ji5Mw8qVf5sSjryVErNNFsk3
	 2tBHtxV60ZY3vkIgpnWgEDAMP+uVVlI8YkgVkcI+wky1BUaVBOqil+ClCMvTfdXP/hw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790873402;
	bh=2GZRbo1oLJ2c3Qjorou44UiUgjkieg8C+uDj4/ApMRQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=snmDomp4pAd73majisAy8vo1MW0axqXVbO3ixCd9AfAwIQ43UGK/IR0HRcgaqZJzE
	 3Sg+0OfQC75ik9tgsUVgtPzahzL1aj0KQios7hgh7EcaxQpToesX3GTGxmeXYRTt2T
	 ftidGcgmsVyOTXYC1q11wW4ZLL+LOs0Q2KZPN95ihxuay+MgHcjKyRNVdre1pY+41B
	 3kuhZlMpifW4O4k34RHlJed1mN4M+EmThPDHHchncptGFWL/BakA+l8efYERSkp4ld
	 tQauxCpKwE5bZNZww1MoIaynjnvBQ1NokUiwlkEUjZsyrdxwEh95Xirjpj7ueaa7Bx
	 SV4DPpaVyDm1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C348C811BC;
	Thu,  1 Oct 2026 16:50:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B47F7282
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A91E40BEC
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gi8jKlAHj8pv for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 16:50:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 00DF440BE4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790873400;
 b=hWW/jbVlaOQLebmGTtrHO8XdRzW/FQuzJj65X46ukygT1LTJxECcBpXPTdniIBScsg3w
 IMonAIt5OgHRhD2KQG3k9kyPwf0WZ8ao0dwGYp6U8y8CWjVm/atn2yfia7wOPFs4cNryr
 25+t3ZwNkwsBUEJ3SBT9DNz9Cpq3P8YdU7iFPrgbRt2tuTItvWilpHvORDvo/mLJHhDzZ
 6QBFNsfV3gi8BN9IqzF4tXuf4aovefCtzHlWboxZxOKkzHj4MjJos0QoFdnu4WJrk1J5d
 wu1yxVbICWvkguUzZD4bnBfLupYaTOgyV+0QOVW0y2okK3L9xUXJeCwctA54GWOqWSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790873400;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fSWlhhkcempi6SrVX3xqEqc0lmRyhd64FdKvuNOF0Ws=;
 b=FGqsSTRPXWJjv+xfMYNaUdFALTzeIIUPWLi29+UVphwcPEhQ724trEsIblzg4SrSLp2A
 AtIRku4g6Hu42qZT2Vy6vdruFJpazBzATDVpH3zeBwtpzJEphX5sfEWbDh9aB4nWL6PG2
 ZxedcjanXZSEqYnxlr8W7hbsIlWWTQH+Ba45BuRZwfddViFX7EeQzJWfcy5WBQ3Hl1T8k
 nUHdxUYcaOF+2ETfGZo8Hr5Uon1a0JUvBqPEidBEuPjKvS2EoGJ8/YZWfKdspQangmAgX
 1A+d3aEfFxlggHqiWoHIlRXuk8ZeZUQVpQ/wy0mDcPafArZJ1NY8pZr4CrESbzYoAkg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00DF440BE4
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:50:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39D9B814D0; Thu,  1 Oct 2026 16:48:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Oct 2026 18:49:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e0a068475062968db52c102ec2b7185f8a90d1b
X-Git-Newrev: 64002f0985a2568a7d30a1160f831c4ce3ddf6c7
X-Patchwork-Hint: ignore
Message-Id: <20261001164846.39D9B814D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcpdump: bump to version 4.99.7
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64002f0985a2568a7d30a1160f831c4ce3ddf6c7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/the-tcpdump-group/tcpdump/blob/tcpdump-4.99/CHANGES

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tcpdump/tcpdump.hash | 4 ++--
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index f69b672be9..752f0cab88 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature at
-# https://www.tcpdump.org/release/tcpdump-4.99.6.tar.gz.sig
+# https://www.tcpdump.org/release/tcpdump-4.99.7.tar.gz.sig
 # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
-sha256  5839921a0f67d7d8fa3dacd9cd41e44c89ccb867e8a6db216d62628c7fd14b09  tcpdump-4.99.6.tar.gz
+sha256  8be364e28d3b745ef1459b385cd2f4bc0e1ebad7a5d2ebdf70071d6c9b5b9a54  tcpdump-4.99.7.tar.gz
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index c3d777ca70..31d2464fdd 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.99.6
+TCPDUMP_VERSION = 4.99.7
 TCPDUMP_SITE = https://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
