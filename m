Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D50D606A31D
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KEKfGT6o;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=KuBTfRAG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 680CA80C6A;
	Sun, 25 Oct 2026 22:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8D-oA7i0Q8u; Sun, 25 Oct 2026 22:09:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8692980C34
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966141;
	b=ah2uBDnTXmAB5ZDv2kJKjYHGI9hu5mxPjLKT1l3IKnzPlbWm/hJo3sye1LrTBhC793c8
	 0+WK6w7XogklP77UPmR0eAn41+LFSY+gDU8appIdMofwEf+Xx+4zd1uhA3A+ro4wljL3e
	 +7Mjx+O5x1AkK1IuRmN1CBac/+VIMvhYIiwtQUM29UcXw8n9DOHFdUBVrZwcD8o1274Lz
	 4tlbu2JS132iw9GLCs1rsTBVQpE3Xkm1HNVMBAK8Y+z+P9soeEBAOnLaxA7F9k82Ez0Ip
	 lGZWPt4UfrNpwbLj7qg2iXkvJMPRKB93azKmGe48D6uaJchNDDIpdjZnQ+nVpH7gITA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966141;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n1Dmq2PaltuN7m8GZKmt6b3flhe4i2fGYFXZMMV47gQ=;
	b=ZQG1kHEb+XybCVQnhlE9qg614dlfiUAOfD+r2SDeMLiNonPvgo725HZx3CWz2p5lq+FW
	 xJ72eQZJLh59pHuwpH03b/NLfzVIaxjBnjr+vg856FXM5cFrQOZcjwMFUeeY3r8bPIY+Y
	 PcHxhTX9UwaxtydhMXL5/QY5HYsLr1SrRZvQe2DiNlsN/U2Rqm5iRU31yFUwFQ7/7etvC
	 lxUJOejp9vaod1X6aUVyj3QUC6UAoldFpraw4fMeABjIF+EC8EMdWPfXrns4tTWYywitG
	 Aie/SXaYQ1dahdJUAqVovgLQyXrJeXPqVWDkrotuWHqxv78nxXn9UHDTEdIQoTKXMSQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966141;
	bh=n1Dmq2PaltuN7m8GZKmt6b3flhe4i2fGYFXZMMV47gQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KEKfGT6oDEF8n1z67x4o+ay/9egId1+L3D3nhyh7FyOGwpSPtvLh/qbtTH2TDJ+zS
	 /+wRyey4y3QWens8fsvtXYc6Sl9ZpXH77ffgOznQCbtFA0s9gpSCDJ0WkgsPwl0BKB
	 /aUsUH6NvIrR6dkyGk6n/5V0tTQ6A7UnjgUuVFI8z6tfRikz+33hrWuNz9qmpFDQEw
	 XVnubwuWHMUECMWHLaO/3SSFZasGYtIkIs7N8v/KzZdL6aYP9DMoqsj+wdxgUcaj4J
	 wU082beZiy8wTN3zpHAbfJGpDB67SvNE+XO5n/pUiZnsU208T60Cp6UmDPt4LYgZ6j
	 N8A0w1WO+E8gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8692980C34;
	Sun, 25 Oct 2026 22:09:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE36D356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FAFE60601
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZi8J1y8xLx3 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:08:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CCF7E60600
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966139;
 b=rtpaup/QVVMG3wNVU2cJsIKst4OZzhauDM4dnjwRyqDkRZiMVE1sY7/t6iG6Sl/mD2Vq
 ISOAxM8DgGEIr44HpYIAS1FDDGpyg+G3w583C6aADDKnTxPzboWe3K7nlIvtakLsLrKF2
 3mBaJndMts0TY0XVG867L6/4ggoNPnwBBt59osk4Mn6Dgw6sQVR7s5Zfz1xP0O59m9fjp
 Uk3a1i9TTVYAWRt8NVTOFIM4La+Czt/ZLCFr1iRXuJ1N49BsjJRj2ZTSE6o19oBsxL9Ck
 TlIE10ecdvoev4BNH8sqYUJyYEtbL4IBlTEkeeakgBYLCriUIJxYObelekvSe2BtZXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966139;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=YtxPbsHCaPFECm46qmaOO1+ijviTmGI4F90panNIeF4=;
 b=jt2kdTtPUocl/ijgKUQkV5fcmHaGwujCmXJ2Bmu9DaGTU/+bR9SK9VyTFd1Ck9NdohAp
 YkOQGABFxcOCSl+oyN+lbJ/p2iKpuusCGGv/lGg8Sd+RpBeseRfBpXyH9x2fy+KarERhs
 4EsuVrvvD/whLqIEhhasi01WrSLvZCoWXfCBUDMFP3ZO6KqXSNgvRl1RHiJ3hyOyrLgbD
 BRPPdSSPQHKNtE1zxDNs0g6ljCiapBCJwMKv/+RyIGsjwCgYKSI2qyEqcxs9X4oFv3MBW
 4wl8IWS4l5lF8awJhSYXdGCeqK7do7o21gmpQUkLYsyj25qyk3Bo0v0w8asPG70uYyQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KuBTfRAG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=KuBTfRAG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCF7E60600
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966083;
 bh=YtxPbsHCaPFECm46qmaOO1+ijviTmGI4F90panNIeF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KuBTfRAG/69hyufHvyl4/w3k++XxidxsmAOKD428xCVTTLUPMXgxIKxgqCn5T7JLm
 2+g+GCmZ1MCI9NsBBUSsAgXTKx0JQFVDFFmWBOS3ocmnh5OTJNfxtQnbOm6iNpL2JB
 +94Yaio572PVjludyGcVucX2aHpJ+efXm2iZ1mVr2CVG/xXJfZUEhg11CoTllqfD4w
 H+X/+4QgubjoVG3GEei948IsbFzU/dLSKKbJNS0Syh7ZgvbZiPLh4zJJlosUDMsTY9
 ALet9BNzU8e5VH09+FBN0yoC7IFk/wLuAaEC9+VUTVu/DQbF0W8BZU9VZ4mY2EGeAA
 My2IvDF8O6KNg==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 VBztJwne6XxUcwVFkxbZ9F+YZHNQIIzWV0lUBCeUvU/TygW/a8b/WTLurnLfPsAFL5PsNZEy+F5
 bc/p2JU+h/s6WCIF2xmI7dfdGiAYkGUnAEt6TBGKKUO1qGhd4kIFfeawNStGWadKf1DuYmiXwgw
 Y0s2z8rN4bbqPSgThYekwVMtwStrk3Fjk/vKFw4ujSzVATonW79naLidv6bIENjmSJl0yPiEMU+
 tK21XTcUSAKYz6supczrER/r0vMLnh/NPLgJuMtIFG/bCXfkUhl+CslRjFnbQqovcuLFoW6IS23
 /AB367lnomxBduuDarNpJIQZ/CEaZpvAhyuzcWxDSdGPulwiYHzwO/IoTnYbLDkhy6Fk1pz5IZI
 RE3wNOOvKHo46T9DZZ6iXA0mmv3NBm+gNVNFP63Nww17uX+EPHgd9+JdwwejK6DC8eNRU6D+C9z
 vh/lGn8j2TyiFOVZEwqq5cyW1JThzQoy6bOB1PNPxwkXWrpP6kreOyytNZip705CmS6Rr/VLZtz
 psLzq+vCLXitL65FW3n3XIWB8BXOVSs2EYHb5esQ0eH3F99UoTWkKtIY9Ske3e39CFEuRS0xrm4
 AjIN1pvoIZOKq1+szHxXN5S5eCij
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 03C53A4C69CC;
 Sun, 25 Oct 2026 23:08:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-04zD;
 Sun, 25 Oct 2026 22:07:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Stefan Agner <stefan@agner.ch>
Date: Sun, 25 Oct 2026 23:06:52 +0100
Message-ID: <20261025220723.1332924-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 03/34] package/containerd: bump version to v2.1.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefan Agner <stefan@agner.ch>

Latest minor release.

https://github.com/containerd/containerd/releases/tag/v2.1.3

Signed-off-by: Stefan Agner <stefan@agner.ch>
[Bernd: rebased]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 97d2691c5a..1c3a39d99a 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  a07e4bc9959ffdc409d2df22bd199be93fcb7a88f77b3c3dd1c07c199c01b42b  containerd-2.0.14-go2.tar.gz
+sha256  f5fd43b9eefd71ddef100e7070016f9e40a1d689251bc885a2d2a87750da26b5  containerd-2.1.3-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 753011e125..379f9c4059 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 2.0.14
+CONTAINERD_VERSION = 2.1.3
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
