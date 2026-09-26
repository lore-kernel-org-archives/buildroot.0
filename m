Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6498DC9832A
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 20:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE03E40547;
	Sat, 26 Sep 2026 20:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id viYNvrUnPvID; Sat, 26 Sep 2026 20:04:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 095B940591
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790453057;
	b=RzsdC8qtj4xoNmnfMiJmmz5Ds2utkf2XOvVPKbbQ0YKT1d4D7TYGsyYVljGOLqLwOOMC
	 k+8Bs3soG+y9p2zXzpsIVIFDE7uNmIadJuApYH45h1wQsL/2YGRYa/TB8BPH/h0vUgfdi
	 yWEkFmNwKNfmPx30dZxarsWjCynR2V87FD7Bkjf4pDbix7wuyj/JvYNCqd53BZ6e75oTx
	 tkLPPqAWj6Uwads1+DQxCnSSgOL/YyxyIuM3smVLQLd9xmLljqTmkRoHcM1sV3o61l4aK
	 oMwg4LUS54dAxnTFJ1MNemPLdc3ahqGJESNE7M0cXyzVqXHS0nWg6mWq489Y/fu0lPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790453057;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XxHOBN/Fw1YtTt9QZoGDSFPU9pKxzOCdtnzSWcDQbqM=;
	b=idNPHlmVTcgHKkxA7AgA3VBNC4GIq8vAVWbct/s/OUhIg5xFy9MJ2HvJ2AXQTIodIkbT
	 7GdNtYMmJiz7bMV7CA1RnTGbFhAhFLdNoLJ+iFkEVDxA067lG2f+t122IwuXSKo9m+R1t
	 loZZPi4oS/YEj/e2+8wGZ4Czh4WAE3kiMqbvhtu66rMtzhBtQQYundkPd1bp77RDL0XsO
	 lfpF2R7JTWBNnDMLxQwq027W0bqBblwdl7MkDekcaA1mF2qCjysRoHnr8+N7/i2ylCFD7
	 wpGdDIpuH4XwNzhPe371Axb6ikA3LbVPhfopy6AczicQpL5Dj3/oVgKf99miAE0LTJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790453057;
	bh=XxHOBN/Fw1YtTt9QZoGDSFPU9pKxzOCdtnzSWcDQbqM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=CrQYuS7ERO4e5Y+oCeqf98UQxZTEHFP+YUwnQ1YQ4vKYi7jHabsQmaLmrmlhZMhei
	 Lk5mzW7+8y605jPPHs9jpA7ATfeuf6GQjxfbfYJHrNeOd0K+BsvdjAc2hyt2OmqgOw
	 NClnzDGYRtmPE/85z6M8fGoCqs+cjE17ya5rlyrDWKmsnDQ/ys2QfrLukRqHB2qNw+
	 6FUTaesj6thKCUoQ9t6D2gSXjEU2RzzeaBorsTj+7kkmyQXQ17iuDWnrUSpkFulAnb
	 6YeUWsn3V1cmx8o9eZErOwJCB2Ia1PqtR6x5vyy3+PIgMUBbw1MyV3pah79SmrhqKv
	 DQowOunyiGB5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 095B940591;
	Sat, 26 Sep 2026 20:04:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50880D1
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 20:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FF798115C
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 20:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CxpEDs5QKsB for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 20:04:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9A4AA81158
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790453054;
 b=H733WaKMaeP90bB4uH3+qjdGOtpZf4cNb9fjfcaukgQ/GhXEt9tmPlia9w3qs+PyZm5d
 Jw5sknqmuxYGJoJkkTIVGkj/lgjoc4U68GuX7r/geP3tZKc+YVL4qkpKFFMnkkWiNPC/K
 PRluqxvFfuNbq0aI1jnMRtg9BPp7hq+hfBOFo3GRpvVNkl5zzPpGQel6M7qWxak8oaly5
 B9hWOEYvpvVyKr/NMMA67vzBPwnqTwNg02sMJBP553DU0OVL/fxqeaxkI7Mt6G59xrmZs
 /JN6XPVmVOsamFOgpGQxpVP9zDVI92pVD5nnCKFybz8ctik7yvnwNKfCoqV8rAZTUdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790453054;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=DtrdK4/2lokOT08xX5o+bjySZ62aqtqsxGoRyJl0/lM=;
 b=AaSQdgadnc1hIi1e63pri0iWSRe03HQExICj5CAKapuBv6HvI0hZ+m/f0XAo4ChMIRN2
 N3vcuBj/qQxOZ0mRisfNMjp35duivdlITVKkIy2WTK7z/vL5WDf6zp1LdocErxPj89nyp
 S0KD1DHZUWZYYqmPm6rnTBdn5r/Kvu8IK48OckHbtEMDF11I/qu4tsq0iL7nlj9aOhUoB
 yohquM2ylDdsYkm6jTGdHI8MR8F8unlpa6+vHF0/XHtFO6Ph9RGPHlXb6xwbw/QjC/VPN
 L7wXMLS1qFKD2XlQE7LUC3BmYfrw9xLJnRNnFA5dW3Xt6QuUW21xy40cHNEMAjBq9DQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b="V/ru4kFS"; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A4AA81158
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 20:04:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEUz4-1wvhZZ11cA-00AJwq; Sat, 26
 Sep 2026 22:04:11 +0200
To: buildroot@buildroot.org
Date: Sat, 26 Sep 2026 22:04:03 +0200
Message-ID: <20260926200409.2095216-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:fZnzqiKcAYdSYo4yGlEr6Y/SKe2cjapRsyMeX4mo9WgAinf+ngt
 WtAa0eQZhKrlBy1J36t+xlDueU0kyzSw5R3FKHFGe43vvzEziZ/jT9wOOJ3MW28tuCQqd2Z
 YDJvnWAfYbFIiVwe+ndUM55ZRAyNP+pE9shJ0S+WasrEWCy6+BrUVvil/7HmbVbSwpiBS3p
 7Q+lY7pGwnvzjUN2xdjhg==
UI-OutboundReport: notjunk:1;M01:P0:IwQgaGhwV0s=;bBPx9Wb8dAMMZad3XI8vl3FhnFk
 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
 SV8hCloMMG087PBvHyMILmlmp2ezpHSCP4w==
Subject: [Buildroot] [PATCH v1 1/3] package/libnftnl: bump version to 1.3.2
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 1.3.2 (for details see [1])
- change sha256 URL to https
- update coreteam gpg key URL to newer key (used since libnftnl-1.2.9)

[1] https://git.netfilter.org/libnftnl/log/?h=libnftnl-1.3.2

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libnftnl/libnftnl.hash | 10 +++++-----
 package/libnftnl/libnftnl.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 1182d31fee..66b27fc221 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,9 +1,9 @@
-# From http://www.netfilter.org/projects/libnftnl/downloads.html
+# From https://www.netfilter.org/projects/libnftnl/downloads.html
 # Checked pgp signature:
-# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.3.0.tar.xz.sig
+# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.3.2.tar.xz.sig
 # with key:
-# https://www.netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
-# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.3.0.tar.xz.sha256sum
-sha256  0f4be47a8bb8b77a350ee58cbd4b5fae6260ad486a527706ab15cfe1dd55a3c4  libnftnl-1.3.0.tar.xz
+# https://www.netfilter.org/files/coreteam-gpg-key-0xD70D1A666ACF2B21.txt
+# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.3.2.tar.xz.sha256sum
+sha256  c97abc3409f8fa396b4462b2bb7f147a3a47a4ddc97cfa0b2f18890c9cfde8b0  libnftnl-1.3.2.tar.xz
 # Locally computed:
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 26f112c504..2ad05ea13d 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.3.0
+LIBNFTNL_VERSION = 1.3.2
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.xz
 LIBNFTNL_LICENSE = GPL-2.0+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
