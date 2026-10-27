Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5E8606A31B
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hXjJY8u2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndtNpBBS
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 602F080A53;
	Tue, 27 Oct 2026 14:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnK8W0fz0yBu; Tue, 27 Oct 2026 14:39:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6CFDA80A70
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793111950;
	b=Oq6lKoFMYam9oK41jK+pr80/x+Weftad9YYHwQSUPvrag/WOWdqko09af9dFrJt/nl0D
	 qBx5GgCULKZ+4uzK/xUZm64WcSHtt9FfV16Hze0ANc0N2twgYV29Y9RIO/c4IuS6+cZEi
	 g7CUnbC+RuWC3XelhIMbVNc3RIEQq6I7ClaL5P+StxfguhoJ+sRd9bFni4yDNTJCWIJOm
	 Dg5wXMzfotUK4f6uDXRX9CQWJPyJY3NUcMHH7I/EMyrDnx34gnXtI84mvwmNkKMq4Gvhr
	 7yunuSSlgWNj4dhQhNVgq1aphZcFEPwTpJmfJ3XsRJgW+d++q5cnqgT+YZZ0SwDxt+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793111950;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aEXZnBYVW0ZFgODag4GKYW4+fBh/4hNXF/HNXU2+i/8=;
	b=Qyk07UvjjVgzu34oCVRrtW6x0PAW9R2naUNk94M3aiAqQN/umdvvTLFIjQoUjwlSUaOR
	 djK3sq2pEAYct1+jWlj6y267xpEwVKThLwleSXMJNb9DZZm68TD5lWVHtGhhznvBS1euD
	 aBfoCsHcSQuCy/x1Ma1Gvgi4ZmPYnppyMG/RlpTY61+O21PTePuNkCtuGNIdpu7w1b7W0
	 kT8CnpLs466kQkerMf+7zj3xRWH//vJgVb/ImvX2tUUnyRIR6C0DZaCICFa+j+xTTrBux
	 xfF6ykeLH5ncLLxqkWUpfaI6IBE0ahkZJWLGhj17ApTnR/hFdEkQsiXYyCHSm3DEWiA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793111950;
	bh=aEXZnBYVW0ZFgODag4GKYW4+fBh/4hNXF/HNXU2+i/8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hXjJY8u2y5IHUemRxKAXENeY/+pF8MmB7yrsi4plZNSy4zqPq9L/c1uYpKKh7F2sO
	 Sgvlikm0FKTKHp+L/YiJC7gJJI9e+XTL0rcczywPHLVyd984mHbyCIlkKN1b2Nyk7N
	 1kEQ0AukIQ94K56LnuF9YpTf4SUSIMga7Qyl9Fcv/kWzf1sd75EAv5/CptF8dPBhMP
	 kklvRy/PwPGSBYUURawBvDF4Aiuk8NgECAZ/Tg8Ngl8v2lrizpu0IlNpBNkB/y8s86
	 WgtVkE5Bhvp9AqAJ1LAPViKggNPhY1WWzF+CjaoCFkmV1hmBdtK25UvatlxCsAohK1
	 GKNZKI2zhFs2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CFDA80A70;
	Tue, 27 Oct 2026 14:39:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BCA38A32
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADAC3605EA
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNLB7KnOTU2Y for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 14:39:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6BE1A605C9
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::533"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793111947;
 b=B4sZa3KN1NxfXksAvd9cHjMEmGwq1uPhm4nQ+dXETy22/IGa8/pxn4GuyGx0kvX8H1o5
 PfeSA67VwJd9+V68LJRqBS+g+I2pmyilhtymWNfUljEUTwXOFEBbb7uZVDduzQ4AtUbeU
 rXGlzIbsiUipJNhLd3ktd8VZnQDupewv9d9BYNcV+WWESQP6UiyeWXmvX8Fl45jLHKqAU
 0+VGMTtFxvaQueAAG/pnkGkg3YavQA3PrafkUvPx6nTr2txaloXi71rk91pvtl2HlaJov
 CNdT/Hy90cgkzc2gLtiDS/t6rkM33ztLRk6tdJGC0PlgRQ+zKNZLdw4v5y9hRosYP/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793111947;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=eVLaJFOBomH3hCLrrc1NEjaF/J5IJeZtVl9PSc/v4sM=;
 b=JUYwAtwDv1KYmT2o370hhJgUYpoE6FN3S8P25P0cArvdA97YpaCS3Dar0ftRtue2ERjU
 Ubf5K/eaJLai5pv1LZZWy+8md+FFaOuqb8sRmX0mZvjmaP1ZTcZZVVRxYgfmvgAotn8np
 aoVqlnCak40Rc5dp0uX4wPc54dp8/Fm5vlYqXFIuP2JuI3sUr6DZhyGZLtgENYyQAhy83
 rSuESNwF9bJcdc8SoBs8Wj29edzjUwWd5MbShES6NnDiXhDqte2OKHkJjTkO0lcpA+DLV
 +tbscwN2bWZWDuCzfYOADRsBFX2iGzMrZ+I3SUSPhaWrOlWfSQX7MUfxVWlcfP386kg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ndtNpBBS; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::533"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ndtNpBBS
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BE1A605C9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:39:06 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6afbc363efeso6122820a12.3
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 07:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793111945; x=1793716745; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=eVLaJFOBomH3hCLrrc1NEjaF/J5IJeZtVl9PSc/v4sM=;
 b=ndtNpBBSxSDxWT+RX5Sh7yCUfa0uLMy3BEcZRnoJqjRECX/3gsggBdjAzdxJ+vsUIT
 RH1AyDseGV6BZF9KUaWWMBeCDgXXj6EdDPJWJ8eIPQv/J9kwa/WF20RLH9mQDB/Uy08I
 2GWsKgm+7XAQrp81mhX6biv8N/sXQcC7+ENLw+0vkcuijIcM1oXyMAcjpAD9oQTK6kph
 lSLVnXFdlFHyo+yg0jwq7EfMPYFMYHa+vHRZzBY/0gey9PLnqnkz5uB7zuB8XWehIAHk
 xJIaatFQ9KQF0cmltoZW4gswGZSVwiSQnZ8IrzLCriA8lo7FSu6nCEVmXefz8cRiZRv/
 u7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793111945; x=1793716745;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eVLaJFOBomH3hCLrrc1NEjaF/J5IJeZtVl9PSc/v4sM=;
 b=v/jZndkTDVh+Q44d3GPOkHc3EdD+EmqD6bMTndad1U8SrYiajd6YGoy4Lbe8XB2PE0
 KMc6OsW0GWo8eTQ6u75ybWtJe9PplD/CDWxleZzggOAq/okv9AdsIporY/t10LTg2dx3
 D5JOPrQIi+uk9VWMOrDrnwtZmO1d0h4YjIZA+huD6zz+UaWDiFDAAROf0BptR6WfPHVB
 RvTLkFQzBzPE5+lGTXresNqchoSTiWEz6zq5CEF7wwnsTLgSDIM/vaG9GM7Uk8Yssmts
 JxdNZdOK+cNhSaSB9EqpdAg/z/G8E2P9TRG1uMJIQI/fapuUznSnyzJR9aA6K0QEXph2
 lCVw==
X-Gm-Message-State: AFq9FYLCyqEuTwWWPDOlr+hbqEdoU0NaH140UVQh7pX7dSNVnXljtyCD
 /Gs4xYouBm6IOnRqw81/J33SCzaOD/esqOqCLnFm1eZcmvjpXqZEWCh21dd/2vXH
X-Gm-Gg: AYBFou3OBoOgWfzY1wN8rUvT1S33ISo1WqLQxWQzhcMWHqMj+30tCQb1jbDzdu/Xp4L
 9p9jZcaa2yiRJv/j/ubMiO0IRN5ei8Tsmgm6kUwmGDpL8P2OsyXGndvoZ5IbfstZ/09UDSL5JLc
 7uvUHzxUXP5lUYsp3PNypvH/6cGGqmaIEHs27PDY+jIIYdSkZcgFGbgtgBwvnYyCxGzB4A2hve0
 8Fy1eCGLjiKo5119TKMOhuXROhwovu915IpPZyPa/yfJ2vmEfKfCdGeQCyfGcGQBy/b28nR8CGI
 AqXLgW/lKaJl5qxQLjqkA561vBPBqUa5HYAfyEo9uYhwdA7ruZjP0oW+Gs2UN7oC5igBhVDB0ke
 3oyOeLsP0W329T4Gk9nACBeqbqk+KMo+coWXFqflsNP6U3q+4b4NyaV8Miz1OcfnVoj9KWdvWVE
 uwdmJ8Kfy11e4y/TvUJZDeaqHoPpqiGfX7nmFfDHhSMZFBdLE1AU1QzLUgXCEa8W+ucDZQYxXZv
 YImpadUWRG4GaIVqxtI1rJaiDYbD3n7GWDU5YY1x83ycWku8WBT7rjat/ZkxuBV7l7NxqEt3U9d
 ZaWffD3mAdMyJIr7
X-Received: by 2002:a17:907:96a1:b0:c46:75e7:25af with SMTP id
 a640c23a62f3a-c46bdd6feb2mr1129575466b.11.1793111944756; 
 Tue, 27 Oct 2026 07:39:04 -0700 (PDT)
Received: from WL2200093.evs.tv ([140.209.217.132])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c49a4e2401bsm153834466b.84.2026.10.27.07.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 07:39:04 -0700 (PDT)
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
To: buildroot@buildroot.org
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>
Date: Tue, 27 Oct 2026 15:39:01 +0100
Message-ID: <20261027143901.402-1-fred.lefranc.evs@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/openssh: fix CVE-2026-106583
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fred Lefranc <fred.lefranc+evs@gmail.com>

In ssh in OpenSSH before 10.6, a $ or \ character can occur in a command-line username, leading to injection.

https://www.cve.org/CVERecord?id=CVE-2026-106583
Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
---
 package/openssh/0019-CVE-2026-106583.patch | 41 ++++++++++++++++++++++
 package/openssh/openssh.mk                 |  2 ++
 2 files changed, 43 insertions(+)
 create mode 100644 package/openssh/0019-CVE-2026-106583.patch

diff --git a/package/openssh/0019-CVE-2026-106583.patch b/package/openssh/0019-CVE-2026-106583.patch
new file mode 100644
index 0000000000..f116edf016
--- /dev/null
+++ b/package/openssh/0019-CVE-2026-106583.patch
@@ -0,0 +1,41 @@
+From 0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2 Mon Sep 17 00:00:00 2001
+From: "dtucker@openbsd.org" <dtucker@openbsd.org>
+Date: Mon, 5 Oct 2026 06:03:40 +0000
+Subject: [PATCH] upstream: Further restrict the characters allowed in a
+ command-line
+
+supplied user name, disallowing '$' and '\'. Reported by SecBuddyF KeenLab
+Tencent (CodeBuddy Security).
+
+Backport to OpenSSH 9.9p2 with the existing username validation patches:
+drop the OpenBSD revision update and rebase the functional hunk.
+
+OpenBSD-Commit-ID: 13671c178f492af63b5c1296f284818c7809ed9a
+CVE: CVE-2026-106583
+Upstream: https://github.com/openssh/openssh-portable/commit/0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2
+Signed-off-by: Copilot <223556219+Copilot@users.noreply.github.com>
+---
+ readconf.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/readconf.c b/readconf.c
+--- a/readconf.c
++++ b/readconf.c
+@@ -3319,14 +3319,11 @@ ssh_valid_ruser(const char *s)
+ 	for (i = 0; s[i] != 0; i++) {
+ 		if (iscntrl((u_char)s[i]))
+ 			return 0;
+-		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
++		if (strchr("'`\";&<>|(){}$\\", s[i]) != NULL)
+ 			return 0;
+ 		/* Disallow '-' after whitespace */
+ 		if (isspace((u_char)s[i]) && s[i + 1] == '-')
+ 			return 0;
+-		/* Disallow \ in last position */
+-		if (s[i] == '\\' && s[i + 1] == '\0')
+-			return 0;
+ 	}
+ 	return 1;
+ }
+-- 
+2.34.1
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index b3a4b0274d..29e29008d6 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -48,6 +48,8 @@ OPENSSH_IGNORE_CVES += CVE-2026-60000
 OPENSSH_IGNORE_CVES += CVE-2026-60001
 # 0018-CVE-2026-60002.patch
 OPENSSH_IGNORE_CVES += CVE-2026-60002
+# 0019-CVE-2026-106583.patch
+OPENSSH_IGNORE_CVES += CVE-2026-106583
 
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
