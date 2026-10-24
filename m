Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43319606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=F780G5gy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AB8E816EE;
	Sat, 24 Oct 2026 10:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEcbvwkXXnjz; Sat, 24 Oct 2026 10:33:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 38DCB816E2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792838005;
	b=U1pnkN7OODcki5j7PO9vRB/8YY+N6HwXeJVEA5KEbnRTvAjz9YTSf8nvgzMx2hCeCEBs
	 hnpATOw1a9GlOSnxtpMk6cI6TWHld/diA84g0mgWi09gYpmob7bul0pv+eGXF2RjwDCo6
	 x3YDZsjiuVAelrQgUvj6Ka8o7kWLrHn7+9Msft1XMsDHb6t3bU6EVI3OeYC+K2194JEW9
	 MY9PsiKnrztym7QTOpgZ6VUDDk/4twlh4LV9mEovKLhdrxMfZJSMH6RmBjRQ2y1NAPHXT
	 ItK8pMyQCyBjH7+nAx0gb8xq6aQW87hpLVUFdfxWd/fGpvaIe2Kd8XE0J/MiqonS+MQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792838005;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KPA5cm9+cQ/ZIpBzXd1/Af17UVhJvZx+LasvSbwImd8=;
	b=GTIP6wymyDmnAFxjJ0AyhOqRd0HIN4Q3CFON5fPQvl+3dK5NZGdaCxJkRTvDkKlCMUcV
	 Z+B8pO+Nwhub+7ekpMNHAZwwpJLB/r8/wFaLk1ePAhRm1BsSb7w8ISh4V/avBOyzvMok4
	 UWmRsz/8C5ksCsxd+x6NmndPb5b7jMh/B8gg4QaDy9NPnheq42u5jEMDQnlEXb+LQFtbh
	 lIiQpY54Mvol8vENwv8rO6RRQPDxbcd0x1qmh8aMVUS96MuVZdk01JuKhrzQkQcTwZGB3
	 6yuKXKFmsVkVd9/EGMA7kTzBHlJlKwgixn+lxfzHxIX8X87Pevm/FI2+KTY8Q93oS9w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792838005;
	bh=KPA5cm9+cQ/ZIpBzXd1/Af17UVhJvZx+LasvSbwImd8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F780G5gyixmFRDztmyz0k+HR27hvE9ZzJtz+gkQDTXwPxDJ7dYG+7g0getWYvtm3/
	 ecDafInosiMtgdBQSzQB5NOpNoCw7yKHn75xHcfBB8126cXxRD3X3drjBJF3eA4Rit
	 nxes9UV9wsBRztYBH64ijNRulwHKRIqd6He/sPqUycqB+Q8fKd1q/ruUamWU5INRyc
	 JfWkUDQ2twpBgg9vXd9PPqWb/u/3OFNrDtxWzAgMdwfQOVQVosoUiiq1qGxiqAstqc
	 aK8sHdDo9sTiP4xB601XW+yU2pLLn6eln5eU+2Y3RHJZf6OscNIIUqT47ka3UfnO7S
	 68hlyKSiRg6IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38DCB816E2;
	Sat, 24 Oct 2026 10:33:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53AC64D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39C5B40A82
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8UiuYl6fhOv for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3431C40A80
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792837992;
 b=OY/ClQkmvsUMZyZ1Gk8MUCuH8ocxA5dNkzyqc0RTSUiW5pOkzDGBi1U0PjnAsYftDdr3
 57yO4co/V/6nc3nA7mN19RlQnaqNqYWK1mmTmKOdbNkeo72/3U6qgWbOtp/2g0MrkOiNr
 W/3DJB65c4F2L58643ZUv70x4QLLmfySullRxeMQOC2EnnhV0cfD4Ieg8MQDhzZ6NkM+H
 aJjgjd3sTp/BNDEAi4gt51E/MhIisdH9qCzd1HzxACWB9OY/osgeWV6henL6IfTEzZD0b
 mwLSARGRW2UXcLQFHOk14y6tyV7Ir4W+i9dAkXjrNhT+mJGWw5vf+ODm/56dBtt7vzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792837992;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JaoZSYcZX2U2O8g64pjd1QBH/1YVj8FEyu3rbgN4z5M=;
 b=ZxQppoMF/OfJzdtnRjlMnTs7AmtHTKxkXT8TEVqIilnqDgBqCfgtlmWHdEYdbrGyCzGl
 PPWsYT5BZdFyxNvXunMFrXKw+5fHHeR2OV59Y7m4S9AhTL/B2pX8+v5zDrcG6R2P63niv
 vtBHpSUMTjfi9mzP4293YHd6l4pqsHa5lmMlGiemDfM9v7FHbl86b4Zwv4oI8LoDRPX2u
 aQhd7h8rrdbBjuqx39YTm9axxVW3zMuF3vDGikQb7WTRpKAl0PwQt5tzKITjzSeSNgtsy
 D6WO7xSb1zRgmWhtsWb2ZkLItBFnOLHaV2hIQJHV1gAFsB2LI5n23cCdRIK4LhWA9HQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3431C40A80
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40BAA8D6B9; Sat, 24 Oct 2026 10:31:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 11:57:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25b21ab9aae0de536c16e3c2460f78c13990e9b7
X-Git-Newrev: 2e9f4394b39e38eb8fa839992577fc523c51c500
X-Patchwork-Hint: ignore
Message-Id: <20261024103147.40BAA8D6B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylru: bump to version 1.3.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e9f4394b39e38eb8fa839992577fc523c51c500
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pylru/python-pylru.hash | 4 ++--
 package/python-pylru/python-pylru.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylru/python-pylru.hash b/package/python-pylru/python-pylru.hash
index 46cd6b7710..faa9575119 100644
--- a/package/python-pylru/python-pylru.hash
+++ b/package/python-pylru/python-pylru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylru/json
-md5  1276fb7ba07e27c2f79462826788905d  pylru-1.3.1.tar.gz
-sha256  1ad89d14cdccefd81265bb619f9f9c351556e2e38fafc7a57b1319ded086f8e9  pylru-1.3.1.tar.gz
+md5  2710118d4618067047400d3f63cd5167  pylru-1.3.2.tar.gz
+sha256  ad610b227999da4e2cbaf68a6adf7b57ff69a3e3839ff0f86210dc2f5ebddcdd  pylru-1.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b376065aeb8d20c17795697af05c8426ae02f736dd06224ded1b35aad8bac818  LICENSE.txt
diff --git a/package/python-pylru/python-pylru.mk b/package/python-pylru/python-pylru.mk
index 39c7c620d4..761c1e7d87 100644
--- a/package/python-pylru/python-pylru.mk
+++ b/package/python-pylru/python-pylru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLRU_VERSION = 1.3.1
+PYTHON_PYLRU_VERSION = 1.3.2
 PYTHON_PYLRU_SOURCE = pylru-$(PYTHON_PYLRU_VERSION).tar.gz
-PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/76/5f/1c22971415233fa6132453fa8b5a7464b7b7af004a2f236717de403a42c6
+PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/0c/88/dc306f0b4dbc5cd89c5153bdf5b2141d0f9107dde8b26edabf4f6654e65f
 PYTHON_PYLRU_SETUP_TYPE = setuptools
 PYTHON_PYLRU_LICENSE = MIT
 PYTHON_PYLRU_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
