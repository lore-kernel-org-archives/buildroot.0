Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E93CDB471
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 434E086193;
	Sat, 20 Jun 2026 09:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yx8KUZ2puZnQ; Sat, 20 Jun 2026 09:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC87E861C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946409;
	bh=+tkwTCGGY0ILLytVw6Txxid5Si3Qy445BRk66NLh/08=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CBdDMRYh5j5yrHMCFW7N6eav9V1Duu26D5kkmDZkKD7cUfnTnGK0F/i2P8tP5v2+o
	 3umBwI5w/DP1Z9bXreWzmu88f92ajT4AHvmI4qkcic6H8w6NFrRiPtU3vb7PQSphdS
	 tvc1e3DBatb0Lna/OLMZVuy71+9ACV7WQSHbWJ1qXA2z1bgPyzEbBpd+znn2zDs9PA
	 d6Ay45y8DFjGCzKbuCjxEST2auiYdPBa7F7chIVLogBcY9O7IF61eoSOznlwPr7Tg0
	 hqY1uuWUBTGR3dPtqQMr6nqc7giQpKpQi1zDWV2a5bHIYvZSQKxNCb50amNk9lvoh/
	 UTp3HNso+dt5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC87E861C6;
	Sat, 20 Jun 2026 09:06:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EEFBAD06
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC17A42FD7
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTGXPjg-6lbu for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 258A843124
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 258A843124
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 224BC81E45; Sat, 20 Jun 2026 09:06:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:55:13 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: ffc2f56308b743cb1ec13d71b5970957f39363bc
X-Git-Newrev: 09b4a21c96c4ba6af41463fb5bb1838aad275d02
X-Patchwork-Hint: ignore
Message-Id: <20260620090615.224BC81E45@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/ntp: ignore
 CVE-2015-7977
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/09b4a21c96c4ba6af41463fb5bb1838aad275d02
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The NVD database schema has the following entry

```
{
  "vulnerable": true,
  "criteria": "cpe:2.3:a:ntp:ntp:*:*:*:*:*:*:*:*",
  "versionEndIncluding": "4.2.8",
},
```

Which make every patch revision of the package ntp match to the
CVE-2015-7977.

This commit ignore this entry.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 00e4a03348ca4fccbc64d540a9d06d0bbdc2602f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ntp/ntp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index f481c5d79b..29770642a0 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -25,6 +25,9 @@ NTP_CONF_OPTS = \
 	--with-yielding-select=yes \
 	--disable-local-libevent
 
+# NVD Entry incorrectly match on every patch revision. Fixed in 4.2.8p6.
+NTP_IGNORE_CVES += CVE-2015-7977
+
 # 0002-ntp-syscalls-fallback.patch
 NTP_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
