Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E98FCD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E88D283A6D;
	Fri, 12 Jun 2026 16:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YtYbnzf-y60; Fri, 12 Jun 2026 16:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C322883A68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781283225;
	bh=1WmRf7AoZ2Ezeupf9FDcf50KmigNNIKYf8ahVvPJ3z0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h+Q2bmU9tZcPXTAFH966ETD1k6iYO3ykhPh9YL/L6Sjaak9/sM+vthIm8bu4Y1F4p
	 4fcpU5Siv0RmD7LcdU62OpznEM9oEsVQfxzmjmXvcGyMkbdrp4DPZpgRhDXfHMQZiN
	 ICjcAUv+z0njfTUYu/8kmSg9QTk21qf12+dgRMsl/E0wT3qp5Q6IurjeUuV/xWSNst
	 Gecb/9QjHRFdUkad39LJ682qSW4LVaVWOjTM6F3ggWcpbnIYOr8rbFnUBvFVKVVQzL
	 AuwXS5TxydjtwHtaaqqhi16KTdr2KGpfkqXd2DoH6wgdEADsnB6m0gH+kFzIjuy1LX
	 tXT3vR6w26cUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C322883A68;
	Fri, 12 Jun 2026 16:53:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC563237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA25340725
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKyL1m4TOfGm for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF54540727
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF54540727
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:53:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E0C288122; Fri, 12 Jun 2026 16:53:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 18:52:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00b9069f461075acdf49996b7ecd7c9175dc4ec3
X-Git-Newrev: 00e4a03348ca4fccbc64d540a9d06d0bbdc2602f
X-Patchwork-Hint: ignore
Message-Id: <20260612165323.7E0C288122@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntp: ignore CVE-2015-7977
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/00e4a03348ca4fccbc64d540a9d06d0bbdc2602f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
