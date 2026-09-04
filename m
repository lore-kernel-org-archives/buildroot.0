Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8587CC79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 18:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41AEE40B1C;
	Fri,  4 Sep 2026 18:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AxWgaV0WQJj; Fri,  4 Sep 2026 18:45:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 84542407BC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788547502;
	b=kJNZDpCq+GwP7hmErngnIVIeABFscsVX5yFj+IhzXX7Ww0KhjdXMZdm4P6m67Js0TZ71
	 k9bPqWWFcLwGx5QQXdvpf5bS2ncQlVE7fhr1qDXqC6RBnoRV1jZrQkUvyornaRvkZSRS+
	 fZBOe1x3opmVuhjh3Th04Mbk/QWgqygcMGbMz1zc6+BL/c97qZZI5SQ9Lji5wpIzPfK/+
	 vGjACrostNdwVmkBJjb4LONeCHp2hMz/YsQmvfo1CC3lHTmkcS8v2nBac07eH307VFcoC
	 SMCh2pnezDZ+c3CvEmPX99AP0djLCTIw14LYm44oSd9EKkKbUrgAIz7ZBihwwo3RG+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788547502;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9P66iKCVJsSPYMUXif+5RGiFwv//hp/eD3QBqWA7uoU=;
	b=Wb0OA3kk6FtO/tccgWks/tX8w03g3mPQWWuQKHhe0bgOK0ucmhx+3bKd/9eRa3NqupTy
	 Y0ctOlxWaaRNZSRhNnqmsEBOtdWXg5lT7QmCs8N20LolwZ/mZjJ53gq75fxmFBNk174KR
	 uawNtiE4YYQ6MNPcYRh5G9BzqKf82SoVobGaiFkFuxIAmJTfypzse2EiWrdiq2c9R9MnE
	 P5odcpeVKVfE3FHrCpjaHw3CeUl7X1JAn+BswOi65+xPtG6zzVLB9B5aoKW3XsF1AHRQ1
	 IH2+/IUnqMwTXk2grvku0b2XDBwKgQCEkmi3JZpbIZ2x8wK0JxiqlTs7MRxN07o9IZw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788547502;
	bh=9P66iKCVJsSPYMUXif+5RGiFwv//hp/eD3QBqWA7uoU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gFyQV4jG35z/Bta5sbJTPpKvdnkxg3Ia1CrH+puN7eGdlBN0xm/CxPKuIMfvk2O3Z
	 dOLLFEx+jkKnnC+3ihG/gO4DBQGgQCXMQFfHcnUxTLZFQXMvew9YwPQ19S/9fSbW3L
	 aEESiU7zcqM/00N7hiHS9tEjoOqlDjQ1u+Rm1Syq4XHgHJ1k8vBVX7C+UIu8sdNQtO
	 6X8PgmxDmNB4zHOs9G69u+V3Z8pIE4/TPpx72ljjpsZ9LQCiU/sdARtX/DIHQePxcO
	 cNSbsJ6LIK7p0NNbx+jm/EhfSRwNho3U9IscGHgeveP2jGnDc09e5g8phEQxlzV94Y
	 TCyt2ymvxO3Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84542407BC;
	Fri,  4 Sep 2026 18:45:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70E1629B
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63500404F7
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cEFF1FkAKcn for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 18:45:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4D11D40058
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788547500;
 b=Z+P6DdwLO1elhExiwK7XQVNbU7Qryqke6lmx5b3zI47LCNWuhmRH8cxEbAQ+DCHsVGtr
 JWqdEyA9ezaGxrMJehvD44w9zirtmL5hbLxkcAd3Kp1rHbaP6+cEnG4B7O4Z5010PHzbg
 7lkAFHv+lCFFn3NVZvIjKprfu6+hvgAPCVU8L8rZ3XeH9j0Asg5zMiGxGW0x3F7s/Q3XS
 AoxhyAa3dy4J4wpU3k6dbwMyFfUNQy+yThMDQ7wbkSfPXMecZ4RXOoa3i0gT1VNXRIpT/
 wfonEYame6VKTBu1Na8tReY4NmqW7pytK185DVjaXR3T4vL9G/SnXQQ+8H0iQfHedzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788547500;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=fN+WAcyyA/YVw1fmW+YHAPPtLVM1/EZe1gb/YqDL+/I=;
 b=GOy06jvgLfUby9E43UCW0bdyvihIaFXPsV2N50GcJabw75lMt0NuGO5ab4/3It2jumCI
 yIrTtBVhHOHSRSFlyVaxkRnLwmUgO7prj5gWv+oOuEnCxa41/Lxp/BS9FRwR5C/WZBzmn
 DKgJ5COO9Ouohscb8+tVnQ1a+y97/D13eCIR1aPmeAGcI1sCdA/SUNgbJdCxZcY86Td3i
 fZhv+mbTuBGGnL2g0XiCayZi+CdZqeH1U7cPYTh6pOHjaahakYONkTKC+OqMHjP8+q0QM
 mJQZ+wnD7N6IxB/62BaXKFYdFTSkNP09ouq463aCgnywYhL45m4UA39XLvZJrelHnvQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=p9tLYksi; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=p9tLYksi
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D11D40058
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788547498;
 bh=fN+WAcyyA/YVw1fmW+YHAPPtLVM1/EZe1gb/YqDL+/I=;
 h=From:To:Subject:Date:From;
 b=p9tLYksitjW1YFgOZCIZ/p74VlHr65uVcQqnrEB+J+VV+igUow/Ss7AiJJ7YIYlpf
 yMFJe+vkgIuwED/yBKRxYilQKzzqeawddkFWQn499G8LHQcRJbaZZvgttzZm0fPBTL
 flkofstzEQkUXNDWFlMEbjRJCrWh02joQx96rg8gcQdFbx1epCoApNgyJ2HdCOZsLf
 9LQazvnQ3NnZBlLu3ZkGN+hEUt+Ouk7+z72AfnkzQFRKMZDIeX+5QXiMxOLqLT9k2d
 HAs6duSTfxk+cHlSguWJVoXEZCiMmxJFvD1uD619E6S2BzasfesoqtUt71+oASb6G6
 odHX8fj7EdHUQ==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 185CAA4C1FC3
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 20:44:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54002)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2YuH-000000005U3-3PpD
 for buildroot@buildroot.org; Fri, 04 Sep 2026 18:44:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 20:44:57 +0200
Message-ID: <20260904184457.876430-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/squid: bump version to 7.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/squid-cache/squid/blob/SQUID_7_7/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a332dde27e3b37009557311b2fed15076d192374
with the exception of an unrelated build error of the libcap package
using the defconfig br-arm-full-static.

 package/squid/squid.hash | 4 ++--
 package/squid/squid.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index fe362e9a2e..556115f80f 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,4 +1,4 @@
-# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_6
-sha256  852178fdc37c5b0786a934fc990c7d2fffc82acf19b2284be209b96431d25992  squid-7.6.tar.xz
+# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_7
+sha256  e3bd613b91b1c498ec2992276063342a85cd6edddd5521294e04f44bc055da9b  squid-7.7.tar.xz
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 627fef0b9e..dbade52fa3 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 7.6
+SQUID_VERSION = 7.7
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = https://github.com/squid-cache/squid/releases/download/SQUID_$(subst .,_,$(SQUID_VERSION))
 SQUID_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
