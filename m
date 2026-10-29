Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D65606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pUymCk1k
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1189981187;
	Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9CyeQR9kkal; Fri, 30 Oct 2026 14:06:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2E6848116F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369164;
	b=o+5oOw15TRteAiDEavs48snSAawK+D2u/9NH/vt4YtWkto10Bk6bZ20aR5TqcGM9D3zi
	 CtBF9SN2WV+t+cma4AETZjfYmpQzs8lPqV82r7Pt/fMKuwBGNs+qdAHqIMmq+QpPsTq2a
	 njSzF8Rrom3kZ8+7vAPjPsgyUwzlgFYjm7wuatNGm5tzHRNqrXL7wBb/h5sskjmRkHySz
	 jTnog7bpAUnSVwIoN6GE0kRIIyEYjypmGEXWYkerFj6t0oFWTatbYMpEmyv17cEHKewf3
	 AKN4zmLxKjuZaju/Q7Q9qPxgjmGFLrS9rUeO7t4Z47XeFW1moS6QHYmooQA5v6NmfQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369164;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YPR5KZP5OOKUsla/TdZSikcM3SDprg1KzN4MepQikGg=;
	b=qx3MxVXPvWT4QE54iGRccr2zpuTLfPJD7m3PcM65S9d5nN6iqTkaJdazTU+Ci6AQpPkX
	 Ijm9pFVH/18dk6KWvmIWw2gFNxWAvaUS9IWRU0dZxEIJL5UOb2TYOcnazuCFah1gQLtsz
	 ZY85zD/s9ufyAP6I1521ebR5r9eB+koHlOASwFfRyTH5uZuvpFUl0B8u+Y/efLF99WjSn
	 MhaD6SyDJwLH5mJfpffdT+RLG/bShzNCC14Qqd4BtyMof2OGIJ0+6w5l4z5e+YNsK9KZi
	 Rbj//k5UWzXWtw6LM4xBn378gvKD0tCuO5k3TCrtVonc1M1sPTOQFOBmDZWAc9p1OpQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369164;
	bh=YPR5KZP5OOKUsla/TdZSikcM3SDprg1KzN4MepQikGg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pUymCk1kz7AMLKeAFG63vrherqouxj+Zn0UG3+ZFeil7hmXKWQbthIb6RMBup26Vf
	 PgrVY4ap7DnSSjvw40vn9cqWp7+eFfK/BD/ADj9NgTFs4cjrQ3gGyDb3YMn3mPPaAH
	 31k87iD2PcFZgzdZqsbe3WG17eBf0cY9OOZu5HZdfxruqO0y0PP0m6tWI/FnOK28YX
	 3L3kljPxHavjnJcFzFatD6n7KKc1qGz347ODsFwTyrXRjjE88qi4tcKgtC2yWpMqom
	 wRbIG7CBAoIblVUVrPKzNRFlhu5/K7Lz+u7+miDgR1UU34eOk1s6IjTIuw5wtLn+fL
	 WFb3OO96yB1Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E6848116F;
	Fri, 30 Oct 2026 14:06:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF369362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C12C960AD3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhC4TpGHwT3L for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8EF47607A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369156;
 b=nTUPWD26wmAcEIzGXuG/+vUPm69AjLJXsrMkkHIl4S0p4q/7xDL0xJfemiB7aCt6oFqe
 oSUT6uiGTp4WAIP5ebf+IX57/GkXwip4iv33Mro7e5tv85rXtJ5nTRQXCqT6gAMi4CTiE
 Y8RSxDCdE4MsfH91ORxEn36CjfemuNp2ayzwWKBjzJfW4SR3TiB04Lp6gcy3lPCV2gK2V
 glePsPqGPBCG3D5hiO/zafPct8U2gY/GWfGBHSfB2rMHX+hcOyEI3UuX50A7Qz3uLL7Sf
 ZbrU/zzSgoX3S+gFhKSI/nVfz2TQQn9tu9qx33nTO9ssevY4wkUhcZWF7WTQwpiDtBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369156;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=elnD5PAhcg309OiFFbsYBCNe4G0vT667vzSYLGRVWGM=;
 b=R7VBucSCtC0VKEjaihSkUOIeWpcTvc7iqkOgmHT7Um3A3DHkK69EzJW1bVk9ddBNzr3f
 EgIu8a2ENAgdN+gwKclIY2NhKTzOw/+aEZ8j3Z0iJfCaH9Wx0fGkrnUGs0XOrkaa8hnbZ
 qH7s4BR5wrdrOuatWRWWlZKzVmzzMwq9A0a1RCeQP8CUfAfC7d2wLU8d9N5ZM8G+2fYWZ
 nwL2BJGTEbvd2ZzOjoRYzilQHWsoEWAZYzlRvpmZg+BE7Ee2aj6pW4DKLOef79HTWFtuz
 /BRmxOekJQP0bsZUnQzWdAjxSKkwnI+aizqOq/6XEzhEuBREv+lxkwPEritrfK51zGQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EF47607A0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8784E9D388; Fri, 30 Oct 2026 14:04:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 13:37:28 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 678f7b47d9a10e51013152d17454189291568485
X-Git-Newrev: efd79a3df47d193432fef57de140e20fbe2806d8
X-Patchwork-Hint: ignore
Message-Id: <20261030140428.8784E9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openssh: upstream
 patch CVE-2026-106583
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/efd79a3df47d193432fef57de140e20fbe2806d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

In ssh in OpenSSH before 10.6, a $ or \ character can occur in a
command-line username, leading to injection.

https://www.cve.org/CVERecord?id=CVE-2026-106583

Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openssh/0019-CVE-2026-106583.patch | 41 ++++++++++++++++++++++++++++++
 package/openssh/openssh.mk                 |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/package/openssh/0019-CVE-2026-106583.patch b/package/openssh/0019-CVE-2026-106583.patch
new file mode 100644
index 0000000000..43da518f4a
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
+Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
