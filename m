Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD7CC77B7C
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 20:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B178842735;
	Thu,  4 May 2023 20:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B178842735
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5xOv30NJ8tR; Thu,  4 May 2023 20:45:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A003D42731;
	Thu,  4 May 2023 20:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A003D42731
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3D331BF3B8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DACC84026
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DACC84026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00qCIvmYT1Sv for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 20:45:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA23684023
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA23684023
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:45:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.47]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHoRK-1pyXyO37Ti-00ErA1
 for <buildroot@buildroot.org>; Thu, 04 May 2023 22:45:22 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu,  4 May 2023 22:45:22 +0200
Message-Id: <20230504204522.6352-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:W2kgDKFAx6d0HVOutwmnoNVQijoVqSABsZOd0nbOPalHAiXODxQ
 IUq7SPuGgzGnYJ//OB/5RykdwylOh70HINpHDtrd8k9hHQZ7eSY/KBWwsCBoo0uB6KtqjjJ
 JJRClqdpGbIGTNed1vV69p/Wku32+e8R7eb+yJAOKb0Frd1hwaILDMfDG4zfrybBB7r39kh
 vBI4Hg4V8Ht0VVG5IhA7g==
UI-OutboundReport: notjunk:1;M01:P0:o8wqDpAcK3M=;vMSlFSV+4HJKojnaZ2Xg/iYivhO
 VxHfBgg6Avg9aazZtWHAEHy7G4T17oKwbcj66LMMyLQvwdSFn54RGJusfn3cprr1w8ADqMCCp
 CedHqHvMLbGwD+CpyXZHIR20AYpjMQhcxiGwODXYtSjddDHdAIYYx5qEQgXRGPGejdPAfjy0w
 JZsGyq0JVaDaHFb+44eNjpCyQIY0NiJ3fKJSo8bZ1tferLKKeePP8QmQSFCut7z6mzDmY0S9m
 1+NPutwD5Jw0HPHaE7RW1IXxMuizEtdww4DsOJfxOWub+W2OVtTXj7LKIjv05a98JNLBH3xvQ
 aW4/JHLBwDJiKgDjFIsr5TlvniG0YrdZBpUqcbMmbSDhHBTrBpir35gTz/T/chnXVgrTs1zzU
 2iey0x5vK3hXlwiKI/9dvkh4dKqR8pgVw/VDkWxQszUinRV4yK63jEsitHqjAYSbto2FFFbv0
 Ff6D9+Qd9MkrePtBmgLr7EAmnlD34XzSflqiewhjHrjFe1OaWxjFhEBjw4+iEDb8rn12Q1+qL
 JqLb4II1tpKD3aMdS/4rXgxGmUHAmLmeEgzZYzULPFrtM9HCO074wH5/cEV2PzuJgan0sTcq0
 hPttFIdSz3agPAJS0diCbSxFVLxQnqaeVXFVj25nGm1Wcu7ktCDs+2gkJ0y7bUtK90DcbapZb
 1FhEl90GLO4FjsvQHZXv64t9IosKgBWKdmUpCeTWWTjpw1DTAC53+3JG3W3vF0cGxmPfn2s8z
 u4vqL96ZDSscGP9vQ1CbhRMZlSoAau3q2ORCOE6lpSO6r8PWc3kdLUTDUcoXFIQ/noCBxkHJV
 1ZeCXdl+1r3gENevaidxTUqx99ce+zwFDK2eLDqq26yAfZt1DCLe66ntQUzl0VkvJxPACjN0X
 kGDsx+Dh3z+FbO5HcbhatvBy80OdorI2Dp2FEpndFSpgU6ckmL3H/8hxx/XeWHUFNmvdJ7ia8
 v5rZNualBtY8wl141DZxgXIBhh4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683233122; i=ps.report@gmx.net;
 bh=Ji11zudGgHsSq0+rQm9qvriHghASTj2A2WVTMbwHSc0=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=rTxs6kS2Ec75DDIGeCpdjph6BVvopqRrlSiOpatmZn0cHFDzUQZ9TdAL0LcjSbYs2
 ndOHSGCuOiAyyNba6Y7L5cDQH2UNjwEGC5gsEh4GYZ45JrHXp6hTzcdpS3kxCxE0BS
 6J1AEak5oZSfegDybj7wsPLu6FHsehSRUwQcjxtkt6RlUMphplmedmgiz656ENLIGg
 9AzRw+7S2FMxocv31P9XEGwUPscgDscdfXz40IJ7/4ZWczxd2egahMW2T35Z0of++r
 AhWDQe0DizfH1uNUDpFVYN1xGkrZT1TQxfM24YPvDdYP6ThEQnFKM9HJiH20wfQDYn
 8SEil9a+0fxeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=rTxs6kS2
Subject: [Buildroot] [PATCH v1] package/edid-decode: change download from
 git URL to https
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- change download from git URL to https (and SITE_METHOD git)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/edid-decode/edid-decode.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index cd0bdfa0f0..247ed207d3 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 EDID_DECODE_VERSION = 2d44e1b01c7ed7d65b20ecdce62d354841832201
-EDID_DECODE_SITE = git://linuxtv.org/edid-decode.git
+EDID_DECODE_SITE = https://git.linuxtv.org/edid-decode.git
+EDID_DECODE_SITE_METHOD = git
 EDID_DECODE_LICENSE = MIT
 EDID_DECODE_LICENSE_FILES = LICENSE
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
