Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F47160A2601
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UqsgOpzt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33A8181190;
	Fri, 30 Oct 2026 14:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mID4KROmN2YE; Fri, 30 Oct 2026 14:06:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4574981180
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369174;
	b=ZAW7WdwgF/oOgk+eUqSNCwzv8+8sWmUaLLWE30ZejEXZsNY+/zBe9nse6cK6SXz8uH7z
	 59hP0NcGmHjOYfviLNotdzHyRLTbMJgIBX30bzvNNPHVedaOxTHpTyDUdMk1q9hOwDSWW
	 rN5XRRmlnaZDVXdPLRW2S2f6MXh0GDzqsCwK2W9zEswce6fIce2zU45VBk64K2uM9jxEl
	 xpKmhy40JgzQIWYEU3eekGqmOSFRwq10R6zx5XfGFJDyyYRJk80AEDpP4/KcS8HQW/bvg
	 O0eMIaqZKMartddbjDO9Y29iGoFsUrLl6sYGXLtHAPYX0+RDskCknXBlyTg6WlRiI0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369174;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=kjYKeSsTvI65GV2PW6x2mQmIQ+01AvmJaZFcvrpOIB8=;
	b=OBsaScDo1ZjYUZEa1sbqj0aQcHcj1e4BrfcXwr2Hk8YNVI5iCKo0zj+jSGVI/xFjhWbG
	 q8Nxyu1uFG+w+f3mAtWizE0ohDgujRW41rF9EfggXTtf2MfBcd+kTlaHeOwnD7p6plapB
	 s/MI7tust9cTYFaTFFCDTSIuNfgCu5x5wsAV09HwncyOkC0C6smx80u2cLzIKSOFBXK7x
	 V5RmrCwWZABJ1O/3wXCj3+O949cPwAJd78yGsz/cZX0o8HqS2Q3jXi6vSRukv4BgoHH3e
	 xuQ/vVQI+tq2bzO5dao4DtRi+7rGVBXc3dcshUmhcGxEWKy0NCCHBh5bunYWC33SYuA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369174;
	bh=kjYKeSsTvI65GV2PW6x2mQmIQ+01AvmJaZFcvrpOIB8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UqsgOpztju7EjYhcg7Sevd0Pl8eGsn4NAbwKZqU5PkKiD3HNYAA9LYdkvU6KPTkNy
	 7bt+O50c204RtygFJY7HkDo8O7lp50ts0cxc8HUT27/sxl73heW7yfkGx112RvmB0w
	 rQ7ix98eUmnYZa0bjJq5fVKOd1BvLcj7bhueRvT1BkPAHLoevGq64Cs40zyipUYGy1
	 f6oI/4qwLrGpoBn95E6FzH4R+VMnmb80Z+UvjjiuU6OsRp9EtOPR+6BlOPGvMrL1iz
	 b8ozwZ3F1YdJRGx8dntiCzSoh9cP6BhlWCudFNn4NetWDk3KZNdGhpx5u/Onv2H9Yh
	 OSZpFYkrH8AsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4574981180;
	Fri, 30 Oct 2026 14:06:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F7CA362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45E0640B28
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uD-_CiISIfWU for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9498740B26
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369157;
 b=P8v7pfO/1lTa3uGoe51eddmvPSeN8KluxuFbs+iTd9vH6h71FV9vNKQAztAzm6S0ZXe/
 n7Z+iorl+ZTcdfbDWqT2gQn3RyaxY779pwBLjuEvwpWYHIczuN0UXzy7NKTwXIbA30Mvr
 U3HpPj2N/rVNl9M9D/re0Cc6XG/R0A5OQlcTtQfI3FMhq4IfEirnPmLGcm5ifsCD9+5Rr
 qk2hqFlXiObImFFdvDi6GlDqnCLeTR6IszLBy8K0/etOvUQwitaWiOhW6ocgWLf83xzLt
 yjZH1u490wYqaeDIpY3rTssHuoad+NzHgHGq/UWjqvwQx+XZikf3OSsbsVtczCW6Juw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369157;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=f+ZjgJXMZT7UqfYM7UtjkAVbQVP2xjNAoJcovtWjXfU=;
 b=qNCUzzHk8+pZsny56rBYezAQ9bWjPoxdSCSDNNo1Z8CwEvDrd8LcFErMsISMsG28F3hV
 FOnMzLsJjHVwBGqfFcZOE98lpweSthUT66ZrIQRg1XWbIdLSjYRpQcUm8q2o6kB1SlkC6
 wM/qbh/8JqZz0PyfhirKZByb169g29pvCO0xKiL6pzFg5IJvbGaDwHXn/lhAdRi84X6G7
 DuU7M4w/FOYARhkh31JZllwhHd07nCKw5FsFJhKDUjc5E+eJxkjgTD0dN1pERDTeVJdse
 NUA6uNz1tOHRmMGrjEwiCjFyQDRz2qRwXXZ9MrX0Vbu7to6qj8535XzVhjKUtv8GOKw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9498740B26
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3EDF9D388; Fri, 30 Oct 2026 14:04:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e33bd0d2f2a2a39a266a453db330a78476016c62
X-Git-Newrev: 5b2e0ab658e50e84483b191dd3b633bca0fe5dba
X-Patchwork-Hint: ignore
Message-Id: <20261030140429.B3EDF9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/network-manager:
 rework jansson handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2953557818548655363=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2953557818548655363==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b2e0ab658e50e84483b191dd3b633bca0fe5dba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

jansson is needed for BR2_PACKAGE_NETWORK_MANAGER_OVS (which selects
BR2_PACKAGE_JANSSON), but practically speaking, network-manager's
meson.build detects jansson regardless of ovs=true. So we make this
jansson optional dependency explicit.

This commit doesn't fix anything, it only makes the dependency more
explicit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 450a2c4857f381251f5613e1c6234462c4521ab4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/network-manager/network-manager.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 9b8618cab6..cc46c7cf41 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -106,9 +106,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
 endif
 
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+# No option available to explicitly enable/disable
+NETWORK_MANAGER_DEPENDENCIES += jansson
+endif
+
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
 NETWORK_MANAGER_CONF_OPTS += -Dovs=true
-NETWORK_MANAGER_DEPENDENCIES += jansson
 else
 NETWORK_MANAGER_CONF_OPTS += -Dovs=false
 endif

--===============2953557818548655363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2953557818548655363==--
