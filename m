Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D76606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UVLX4VxI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80468811D4;
	Fri, 23 Oct 2026 07:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oph4w1T6NXRW; Fri, 23 Oct 2026 07:27:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A88DC8120B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792740425;
	b=iTwyFjVuw+KSf7Outy73xlx8nmyZm9QjvbVH0xnR0kXVgZQf/JBaNn5pPJr7TksdsvHc
	 gM6kodVeL5Oz4eildVTSv93ADICySz2vJ3alc2jRObY2CltMpT+JY3nvSDb5aXcPLcIA9
	 oZ5i3zx2AloPwwn8QFULfHhFSTjI/SXeGB+T7gifM8tiGr4LXV2u2CCfWuJLRuHTaoT/v
	 gpDKk6mWBuCaTWHEH7h9N/REAWdXcA7wj7u2/RtXnn+ZHi3cekS6rMW+6JZXWiRPpBpj/
	 6hP7udA3DwboJSr4yKjgIKALg4isK2xYQO6NHO3TcfZG3fhCrd2jY7X+wOa5SEvxK+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740425;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JhZo1vTPY0ddZ7ovepVDpgGvYBFHohF1Cy/C4pqX6x4=;
	b=qZUCK32GRXaIT0/44JGIwXbpxmJtZrJpjaoEPRV6RtpXf3J6Gs9TzTusKAgem38czYZC
	 qi0Ig0kPrha5BC+Nbls+oXnenekfCXW0L9mLxiwF4JlUaiGA6erZou/x55jm/YRoNbQp9
	 YrmNli3yQ8fdGB7L66+ZotUVB/eE4mBg8hQTwT20FP3jymYhZBMwbcdLu36nD7frNmDtZ
	 OBChE85IYaJr0wgLtIk50C2pZIYEpFj2H6gS4aySYUSzQi+spjpbMF1ua2S6unb1JoO95
	 7nVNILe6sjJetf3zZOEawq8U+9dLMXN5P/NETmaEc8nr2JXbW2P4t2Z3QHIPmUYefcQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792740425;
	bh=JhZo1vTPY0ddZ7ovepVDpgGvYBFHohF1Cy/C4pqX6x4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UVLX4VxIwz4Hu0kAiMaE8T5AavsOs8abzwlkxjvrdY/6HISYn5EkO88x/J9qBHKce
	 YwMP4cuInL42iY0XAHrMldaVT5lzlOyOAYK4Dq6NGxeQfha2Fa7rwOnfyIjJ2KHwix
	 0NkNxGwJwQ3hwaRD+WCMrHs9btnu3FifgkE4GV9c34RZy3Z9+vGu2mxtMoI8QeTJKf
	 u6xvqO3aajJIs7mVZBGaEEL1qCXrBF3dirJO9ju5JQNJ+vd3qcXMnhiqUfkCbqf9Lq
	 v+hHkwbzZTdruL/Y4GVUCQFnZ7+89h5RWsPIZ+AzZmVgYhusi7gcx8/ZPDX/+3wgCs
	 GJk8dPbVofe1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A88DC8120B;
	Fri, 23 Oct 2026 07:27:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B861422D1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAE3C40921
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64wftnLDnDaw for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:27:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EFA354091D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792740421;
 b=f4YT+lFu7/T1wuhA4ioOknTY5CVItprYLVax2KN7sE94EsUjm95CokHREtGG0eyViygN
 vgvd/PUAaJ4gqVtAu3Ga7Q6LC3pza2rL2apP4/qO+1/4nLC2yHtyRZ3CxXKzpJKqyt0jE
 B2VcCA9Rtt7/p77MwmYGytFt7bQ0mvfrRGyPzgsSiV3wnkldiRCZXArUn1qBwb6cWQhi/
 W3SZx2Vlvuo5PeYS8cTS0yL7elVWgv864fi2NGUHuvjdg1grh8kP69hWtp53CNtgHB+/3
 Z1vb44pUcQQB7th6vz73h10w0jlpBAi3gZ9XEPu8btXXx3WpViNRiVuWq73JmkR5RLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792740421;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/tp+BCVp6EQDwVPJkG6Cw/6S7liyX2GhExGKEJA3amU=;
 b=ho7sTk1r8IEiX/GzE8AeBfXR/0uirzraV/fBnAyioTKik3RyPzJrGpjhL3jP+XmcDFrt
 Hq6mOvRCU7PMtrvAn8EgfdKU8kK0mTq+1Tvi2Ow41Tb7kohdGOrKQr3hIkmCA7aS54Nty
 j2RdEFtQaOoatmy+CSW9FoLcwkU9ibfQ92W4JypxYSMTqTLsWHnxL9mQv1XgkUOUX8iBy
 M0CeroA0+9i9BZcwPV+Y0dXeIO//e/isHOI5RK0xazZ/iscFuesFDIJYuNhtFO99flSTL
 W0ttaifnf77krZok3d+qVmhJZ+38zjAEHYjH3yt3mazpgbENYaVGHzhAZFZCMVS4sJA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFA354091D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:27:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95E0A9C643; Fri, 23 Oct 2026 07:25:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 09:14:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15c73cbb31768c24849333f2a793ac712e89bf26
X-Git-Newrev: 315207aeaaf2fab48384c00a7ae72f32bfee1678
X-Patchwork-Hint: ignore
Message-Id: <20261023072536.95E0A9C643@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tailscale: disable built-in client
 updates
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/315207aeaaf2fab48384c00a7ae72f32bfee1678
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Tailscale's built-in update mechanism is not designed for Buildroot
systems and is likely to cause problems. Disable it with the
ts_omit_clientupdate build tag.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tailscale/tailscale.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 8ac2ae41da..0031292226 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -11,7 +11,7 @@ TAILSCALE_LICENSE_FILES = LICENSE
 TAILSCALE_GOMOD = tailscale.com
 TAILSCALE_CPE_ID_VENDOR = tailscale
 TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
-TAILSCALE_TAGS = ts_omit_iptables
+TAILSCALE_TAGS = ts_omit_clientupdate ts_omit_iptables
 TAILSCALE_LDFLAGS = \
 	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
 	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
