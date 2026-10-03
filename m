Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137A5CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD7E5814BA;
	Sat,  3 Oct 2026 16:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVcDtWxkBpwT; Sat,  3 Oct 2026 16:16:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D797E8149A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791044215;
	b=FYtAOaJm3Z5H+GR2o+WZGu/26XdqHyaCMVUVYvig59zll7NC5iC6AmzRM1dYSqyxva93
	 o3qbSCbWVjgBFVuHSjYdwUu9lI3fHTtBtRlyCZ0D0rbsdQi3JWkqv6/gfbiIZrQHoZi/r
	 /cG+lJGklY/y4r+3RgRKMkq98Q1sdkpzMRHjVockMx2l8sCfgRL831CM79Xi4webAdptB
	 neUcdGyOB3GyP8zVB111MbwpKzuEcDc2MytSmGXWuh6qZrOjlonkTfwTW1jEgky4NMSc9
	 X0oOoVkHDrul2fSIe9w0Rc7R+90W6RqvE+7X1rDBP//rgj6rBq9+uPbDVojbUR1gSIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791044215;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OPme9we4sDzH8h9+rbbKMDdTo659gsyFs5wo4bmqrN0=;
	b=osFwo9qaAgeIob9VHLvKQIzN18cam8ZhFMi+YnE89eFbm3MvfePNTViG/NJUDyr3kFgw
	 tMQUXB61FDU/oHgV0JlKgCBmZJ9TPQOgYqdQCRr0T/MmvCci7UkPxy1vw4jUlGYFm3VtU
	 7VogNhsIsODgA8fwCpWLP2UBqvn4832QuBNC3uLoQL0aJ5cMkbXrh8l5TgjeXZPc10N9T
	 N7UZskUMJck9OGt8FGap4NHKY2Y9Mlra12FDAjalg9Yed1Bv3jIYsblWVAyluwhRCRyqb
	 WFRMaX+HH8pAfy2yU3xCdxic+BTw1f0pr+J9YYuzBIml8axlKFj/4TFLXOR+xAWV3lA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791044214;
	bh=OPme9we4sDzH8h9+rbbKMDdTo659gsyFs5wo4bmqrN0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BWC8hPJjcb3+uMRjVshhGbu4qjSb/WUv2H0hJeRZoHC+TwJflSvN4cyo//mf2SXSW
	 2AFmUozuO2Kb6NuRynF23NoUuoI0K01WsaGZuvX3hx5L/PQ7xi0/sXY/Or9OjywS06
	 95UQ2SlGFwDvfiQMg3YcXFz7gn5dBADYxc2ub/Qwia/M7wcPuJdHcBM4lmXL737EjZ
	 cJ36mbXvV+WhY11wPTbgsDACSxtaEPTBPQbRSXIqCI5LOodQhQtyCBJswxyXowTBvc
	 eIk9wANl075StK3y1pDAYGaQkmzfwYI7mOqP6LVp8lG594fb4+ttpOvmLPq04az/SF
	 K21rgNzRBT6pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D797E8149A;
	Sat,  3 Oct 2026 16:16:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E319C476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D33AA40048
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMmtN-txIcnC for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:16:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 313BD40024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791044211;
 b=Oz/xzkv3iBH8RCIUyLKbQuecN4Z0r0ST1fE1Oe5lRqn2uyOIJeFYZQM67Yyzik203Y+I
 +V+d6ACLLOrRTCvVgn1YKVl9pdLBRbP062TXydFV3nD46DPQ3c1hmwF2QZluSQKXPQDMz
 GMs63KhTjVGvdWuZeYJCvE7ft3PcBIC/7Syf0oL2eYX+cfZ37IBrdaM1ph4wVdVBs5bpG
 Q5SiwFC87KKG0j2PH/GN7OIOJgRZkjZ4M+Z71peW7rSs4aVGekiVaYPFeheEi4VyJWakF
 XzdOhjdnvGDHhKYgD+7jUYTwR3McxsqhQsr1J+n5D1OmPeda88fAUakOv8BJXl0cp1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791044211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=A9Eoe3fXbnPUSuFKyv9youi4dh7plGGSqHSfRnE6kLI=;
 b=l1oHRKFTMSOGT4zBKnupcFbvmnamuBXGcHHSoAy+yynlV+NdbRUSZJsaHYDI3eEMrci1
 V1SU8N3mQghTggDtBn4Cw6QV13c+zwYGoBNOqLzIOlAK+PjdEmghJXhx5g43c4vEydG+C
 hw6msShYxZHByRufhfsprrO2rac8LjEGO2otFXyPi2/2066HqwYsrUpV5ue/qnonLfO+9
 /3CDmoLlYP3XORj2D9jxbtClAsEsqTzvPJQKaLdS73XBxoNangHkD7gi96p4LWJ+Q3vKf
 quAUF222BNiUkuEVie9i7CR1SJohUc5MvgN3FCWaSezIT0tX//KoYR1v6FpPnT6Zq+w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 313BD40024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:16:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 590F4886DD; Sat,  3 Oct 2026 16:15:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 18:03:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ffe6f923cb9ae634934a8ecad329b60f0f7d35d
X-Git-Newrev: 510003c0411a915d71709417e53d2bd62be9f999
X-Patchwork-Hint: ignore
Message-Id: <20261003161536.590F4886DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/suricata: security bump version to
 8.0.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/510003c0411a915d71709417e53d2bd62be9f999
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://forum.suricata.io/t/suricata-8-0-5-and-7-0-16-released/6315

Fixes CVE-2026-45764, CVE-2026-45766, CVE-2026-45769, CVE-2026-45768,
CVE-2026-46387, CVE-2026-45759, CVE-2026-45762, CVE-2026-45765,
CVE-2026-45747, CVE-2026-45770, CVE-2026-46352, CVE-2026-45767,
CVE-2026-45763, CVE-2026-45751, CVE-2026-45752 & CVE-2026-45761

https://forum.suricata.io/t/suricata-8-0-6-and-7-0-17-released/6391

Fixes CVE-2026-63452, CVE-2026-63450, CVE-2026-63449, CVE-2026-57227,
CVE-2026-57229, CVE-2026-63446, CVE-2026-63448, CVE-2026-57224,
CVE-2026-63447, CVE-2026-63451, CVE-2026-57222 & CVE-2026-57228

https://forum.suricata.io/t/suricata-8-0-7-released/6467

Fixes 67 security bugs, all CVEs are pending.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 15f7e666b3..a5b7807d60 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  81cee7bae69848a9751b2ce0867620eefa52b192e79c20b5eac897600b28b191  suricata-8.0.4.tar.gz
+sha256  a9d46a9c8f40e81f8a6df3ecc2c5a9a8e8da985876299108d92da547c013ba8c  suricata-8.0.7.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 56bbc0c89b..d77652162c 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 8.0.4
+SURICATA_VERSION = 8.0.7
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
