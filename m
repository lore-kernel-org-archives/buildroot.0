Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8977C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 955F6812D3;
	Thu, 24 Sep 2026 18:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id UMr2oz_XGS4f; Thu, 24 Sep 2026 18:58:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AF7D5812D5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276283;
	b=cR0Fj9Ie3ZPWVLUNj+llDBUCxOci8tHkS8ioQHOPDyLAGHUE1tqkqx4mxCr891TNlEVi
	 WpiF+mlLlXExS+UsBY3IRaFRah2UGqceI6dBRwI6U1Uzs1HOL6I0he5e2SzREfaEC2/gN
	 fBebrcWwyWa8x4yl5vCKMPEl5QWOdTChEv+y+3NJfITl6pCZPDrcuM+/MksIS14RbCltI
	 274m44RPCtXqYcX2m20ofPUZ+sGqUuH/9+6Pk4e1/xwNaFJPzlBpDEpI0OvznrrMYAxZG
	 Olf5EqLmTJubLwgHQjpVEgN4sDHpypPd8fnSirBCLFAsWce3jia7R5jaNdK7Fyf64oQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276283;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ttUzl9ITPt/QHHlBf7MSaUzABiSaqLf8w6ueDSDCdbI=;
	b=oIhxjugdZbgdvDb6TQYqK3zTVvU4UMLyCEqLFkz23zBBkpROevsJWa0MhNdH0nz/L3kQ
	 23AMV2Dcu4Wx2f+3AUsG1dmTbYRBnhAUlXXmyWW+fA8Nrqw4i2q657SHoYMcsrpOVDyUB
	 kR3Pyb7iNPsqYbNKl94zWnhkdrZJ9ndgNA2MEibdfba3y3WTIQ8gCslrIm9sZnTK3d9df
	 BG4oTB0vo8fKYEGn88pzgMLHmpSHmzOz0M1fwF/Uqa3d+EXE63p0H7GqTjOZDiqEljLbf
	 bkU0YhQxlfAbCjNjzixfl0SlataeBRoCbEpKoBAAyhuqAwHBCzRBqnMk3UFj0ws+NVQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276283;
	bh=ttUzl9ITPt/QHHlBf7MSaUzABiSaqLf8w6ueDSDCdbI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S2NbU2txxin+D+cW5Zr+jdgZkj5oOfiZLtYG/7TSJcOeAW2XMtaQJVx22n2MgsMLQ
	 jXgmUohr/gBzuzN+y/6GwbHrLtLwZFOOXvWi64g6kyWMm1qZv3C54+gX9fUoe6s+c6
	 Bj/6oqTHVsrYnyY2lxoQeVtMhejLMITgC4aMVCC0GnLpjLsTAvTTmoVvaLhrSOX9OV
	 KwyjsxuWy+T9VNHVd/p9DkZPqgaMaQETo3SH4sGdNw4n32WUpJQU7Szytt4j+VBfRX
	 nn/FQnXo9SiU1fGqt89JhjxLVLXjSXti0ApUXiAQSVo9E0qvZVhBV6bmHXopiyCbLG
	 2Zg0uOOq/Ef0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF7D5812D5;
	Thu, 24 Sep 2026 18:58:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BC1F3B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93E1B40ACD
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqJVTN24SR6z for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1396840AE1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276205;
 b=IFtkvLsuAyyfd0dlW5c3AcPcURbxLuxya1fTO/+CH+NJHwUCPC+fohxtpjG6Qj1RAZ4M
 +0F8lEVdeq/8uzEVh3Z5ZdLojiC5ukBr0H8tWErhaIDXWr9gaaIUmi7NBNBFz1vnQDiao
 JVngxPhIKqHhNs/wJlkx5prXVylGbkkvDEML3lRBiW/CFzD+CkEepPp01++1TrvwnyXTh
 T4j2T+5chTs13LbgckD/ktlaspS1kzKunc0n7TeLqUvoVYNfxYz6PRtKV4uy1VxDtxHnn
 RCAu3icgA0kHTS3cbndZlHXgVbl1HmV441ciLoLe0v9vZlihqjU7XphKB5MeYOyWI3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276205;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MOzMfzC+z+fV0oChlu665VeDfafyhARqzrOo4qoV4wM=;
 b=PU9eg/8ZZ5QI6+MRpZfijE1wpD96pBuphuxEIyjEdQCYObQut/7wOxuTBst/Q1ES+oCv
 PMqZCoLQmVoWhoX3E9TTZx30kAI7vHGbYENw+YcA4nNO177UYoUTrTCOaUHZd4nw3NQ2E
 tPi8hpE5etiwkKBLjR/bNu6YH1OacUT9pLCqeO83kgcAPDHvoPQI58G+co5y90wdfoV2E
 WAxuN+i6FrKUyFg1G9Zsh5YRjiKCGodhCeE/oDjmOWviOQiNhdRNxqmFoQQ+KjvKYB8qb
 iaohPKNGzegrEst9KIsJaQBw/74AXzmsTnGf4WAQwjUxz5kUmdj0pNBC9wrJbjVXkng==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1396840AE1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABB5C8F0CF; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:33:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4dbda7cba14dbfec5e43ee3c028c883b94e3f16a
X-Git-Newrev: 7f7c1db4d2405d6a2b9e2d0c01cbc943964e512b
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.ABB5C8F0CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/screen: install
 screenrc without executable rights
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3221647626538171098=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3221647626538171098==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7f7c1db4d2405d6a2b9e2d0c01cbc943964e512b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

There is no reason to install a configuration file in /etc with
executable rights.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/work_items/174
Fixes: 98873717c2654e27ce069c44e9b5dbe3383c0f97 ("screen: enable terminfo and install screenrc")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 318d4ce4e55e862f61f5c79b877d228e9a264da2)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/screen/screen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index c279fed8bc..ed225d1983 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -28,7 +28,7 @@ SCREEN_CONF_OPTS += --disable-pam
 endif
 
 define SCREEN_INSTALL_SCREENRC
-	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
+	$(INSTALL) -m 0644 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
 endef
 SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
 

--===============3221647626538171098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3221647626538171098==--
