Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DC3606A325
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 19:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ittJ0lRY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 475E560788;
	Mon, 19 Oct 2026 19:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKshbQ3Dft1E; Mon, 19 Oct 2026 19:42:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 60D186076B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792438974;
	b=ogq85J64h0+3enckimBBmGlu2LDkHDpb61WJdEieoSnb0U8muhIHFEoavCNx8ITzvKte
	 MHXIafvfB/DJPmuYIdUczzGlWXsBj4Q4Pu3+elPr8cRf23RfcS10+fIkRKGyhYJAMgHtt
	 ZaYK0z5d7ivJJ0kki9DCHr541f/3D6LV9N5z+vatfG75qDcWtIvU//N63dsNJQA0Hjs/i
	 G/xk4vs6sfYdLYPPnKI1au2kDL9XGZQ8yDpl6dlqFfVdjIhGY1S+17EZC0dYHabscOphX
	 8/nXiNmLzeXwTteGQqTmDbMYS9E/4K/FTwEQSWeftzffn3h4LXcHCflrz6yyDJVWvlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792438974;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sfNmdGPenZFzTHd13ElrGIiYXJOu8l9d+gVbKghTjsY=;
	b=jMWfb7Bje5BtOvS4VJSCRLifwKCXVaKE4rO3R2IfUIqWYt73nf4EsUjIf7DXXbzz6reD
	 NnwnBKNTwN0ebkTq0GuDzOvJWLlzdH04vwqJ9Z5vFbjDRwr8oB9akf/AL7SA5rtya/KxN
	 lYo6HcgEh30BpJ+KSF+TiaYiXa1WVAzPKezxt79fFuB/CYGUWqO1dvc8gWzGF4bopiHSY
	 /s5cHhRq7QqqGE+VeGcn5DusH85Aij0V+Yh6QNKmzZgjVAqKXY2soh4r0o8C/E6azeXTh
	 Hq8Kh4SbMsD8t0NZzGzTnvdT4SKZ5v+Ant3gmRnnf/m9By0f/hCvsbwVZX4d/17P/qw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792438974;
	bh=sfNmdGPenZFzTHd13ElrGIiYXJOu8l9d+gVbKghTjsY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ittJ0lRY8+216L7cJVjfqJIK0zjEtsgw4M3auIe8Kz7Ha40yxGmUZEBiQdMpJGvr/
	 3g2vpLv6TUTCDhQi8qWCdWAg7e7XNV7mPlC4gmqH/wY0m0HqKewFd29vU3hbj9U0My
	 GMQ02Rxl8ednVTV9Qa7+1MW2oLs9MVDW1Wd2kh2NXUiCyH9a4sKdYZ1y9rwvbWUYkt
	 1Lz633gttAS/iX0MCdZtv/wsDSDVn/DQejlX3L664puRog6MO299aNsXC2d9xgb5GR
	 WyzoQH6UY5qlwKIpJHZCVvpqszOm+qldZBxNMzvD4eThw7dF93LprGaJgQyQEdIPV0
	 4i3yNFWNopPbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60D186076B;
	Mon, 19 Oct 2026 19:42:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D709C1DE
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD1B060714
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GapMyaAYOnm for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 19:42:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 245FC606DC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792438971;
 b=krlPvn0A3xSz1jysmZQ+kFIWMAKO37GdreMdFksH3rRG104+xM/To7BcrcAr5GRyqTdg
 dOA4wo2ecdCiVUvF9YhL+CaKo5vSGRSALG3Mf3iWpTQZ6zAySsRgpZjwxuHQ6LRKD1m/K
 MfLXqnR/1VGf0JMM0+IfzKHG30U31oFEEifT5ChyHfuqJQK4Tog7Z5SR0Lx6zoHxdzfTq
 dH2QAQRXeq+WQ9GEHyYjda6fjFRmH2dfK9gYCzeuxnZuUPTlPLvlkfurFOwcMw2Qjy/61
 Cxz6oTRSxrRpC5ymxUF2Amqey7u0wJjB2WRzfa/RrrBVba650Xc+zZAt208UjrPCx3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792438971;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lEYQDwAoMe+q7xBOjyqIB+1CC2yg63tn3ELjLH9SFSs=;
 b=mAz8H+74FZZIIf2BOJ+lpYwW3tTi4EBIfek4ZSE9vR0zRJhB1XwF+XDeyh+GyGeHxD6V
 IIr3MuIyLqvbF5UIIEZdp5yfzjzupyqiD7gr2ZF0k43cSAQT5w8CB5Aeq9/xb0EU2HnX4
 8lOV0esb/8y0kgF5odyrgD1vUyRQCeWx+ZTltn38v21FY3GEdbXwmNZUL5lnd0Q0LdLAY
 zfQ2p9jkFFGlBFDBoQandfIAr4a14edgIBAUb5m4YTQnNSDAamlSrPyjdCvVejrGLFEnS
 GyZYiLQEKWF/anixjkhwZ5ft55wrjNkD8RPVPAlrn80QWBCush28GQBm8bsQxnJTM2A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 245FC606DC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:42:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 661AD995C4; Mon, 19 Oct 2026 19:41:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 21:38:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 731121fc1b0f968fc94e8b168014c35d970ac7e8
X-Git-Newrev: b38468a4713c69bd4c11d19fbac1bff6c7638e83
X-Patchwork-Hint: ignore
Message-Id: <20261019194128.661AD995C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: do not select fmlib
 or fmc
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b38468a4713c69bd4c11d19fbac1bff6c7638e83
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The fmlib package contains kernel modules that can only build with
NXP-provided kernel sources, as they need the fm_ioctls.h header which
doesn't exist upstream. Therefore, there is absolutely no chance for
fmlib to build in our autobuilders as they will always build upstream
Linux kernel source code.

This commit updates genrandconfig to ensure that we don't generate a
configuration that includes fmlib. This requires also disabling fmc,
which selects fmlib.

Fixes: https://autobuild.buildroot.net/results/7fb2b2808c4f122e08ca217f34c4d56a2b1bfcc0/
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/genrandconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 597602f257..5cea529354 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -502,6 +502,12 @@ async def fixup_config(sysinfo, configfile):
         if optstr in configlines:
             configlines.remove(optstr)
 
+    # fmlib and fmc cannot build without NXP-provided kernel sources
+    for opt in ["FMLIB", "FMC"]:
+        optstr = 'BR2_PACKAGE_%s=y\n' % opt
+        if optstr in configlines:
+            configlines.remove(optstr)
+
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
