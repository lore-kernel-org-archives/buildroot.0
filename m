Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9A2CD0405
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 21:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F186A402E2;
	Mon,  5 Jan 2026 21:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siZNKnWbs20D; Mon,  5 Jan 2026 21:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4CE74025F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767646853;
	bh=vjyIbwi+9+ey6FuFnY7uwUIc6Gx1vR/YzLvZHXhtfiQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UWKXE+tW8slAVOyPS/csG9XWRovW/J1yBJkPY2Jb+3dI9qWyayoaQ0iWSxG0Q7te3
	 pf7KIthPz3toxdlbDDlRbdbjZKCgHwjyBQWQrozsYnu4ijKP/0zpbnqVavnlYcZWo5
	 7XfG2PAhXftPOyLdyHLRq9voE0pC0gb2mpMStwKdtdi6eYCzf1cS3plCsffQxHSgCb
	 t1pANkr4/qYQsAYKJS+Z6LkID0G36PkatB9ecZTTlZtIf7vLpFAidLmDWDtZ+YC+HT
	 Uv7TuLOS+EeP618sGJ+Unux2knBtJT5ljRYLJuRI/ywB+1ZTltOW9nCPYtEQuJmjbR
	 cZUHZdk2yCBIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4CE74025F;
	Mon,  5 Jan 2026 21:00:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2048E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89BBC80762
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHMoUh-9XpuX for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 21:00:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA0878075A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA0878075A
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:00:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C95D2882C0; Mon,  5 Jan 2026 21:00:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Jan 2026 21:54:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0d71ccaf6d2d114d3f8cbfd143c3fb8278dd855
X-Git-Newrev: 6db2d76b703f7662565ecedefda5e4af49bc7f30
X-Patchwork-Hint: ignore
Message-Id: <20260105210051.C95D2882C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-charset-normalizer: skip
 dependency check
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

commit: https://git.buildroot.net/buildroot/commit/?id=6db2d76b703f7662565ecedefda5e4af49bc7f30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-charset-normalizer package specifies an unnecessarily
strict upper version limit for mypy.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-charset-normalizer/python-charset-normalizer.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index 8b9c954bce..f793241a1e 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -11,6 +11,7 @@ PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
 PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy
+PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
 PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
