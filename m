Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF919C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 14:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 825CD60E3F;
	Sat, 23 Dec 2023 14:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 825CD60E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08EWpuQQ4a4L; Sat, 23 Dec 2023 14:14:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4CF960B49;
	Sat, 23 Dec 2023 14:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4CF960B49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B37011BF32A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99956822B3
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99956822B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wx39AzktbCeF for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 14:14:41 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4858D82242
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 14:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4858D82242
Received: by mail.gandi.net (Postfix) with ESMTPSA id 063261BF204;
 Sat, 23 Dec 2023 14:14:37 +0000 (UTC)
Date: Sat, 23 Dec 2023 15:14:37 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231223151437.7d9c27dd@windsurf>
In-Reply-To: <20231221140039.246333-1-peter@korsgaard.com>
References: <20231221140039.246333-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703340878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2RAI+5ieOd0pe8TOnM1Q8fkTOPHHCOA6WalyscTNvU4=;
 b=ipUmHBEUUiKMl5wb72NcIMCh+NJX3ZxKxpeVKcPTEPycSbGpZYtNYoAXb1YHQLuMhtWYGS
 Ye1kHcMXtdQwMRi9QFeuEl0x58tWr7urgqhgAyzXzBhrDDDOxvc20Enie/DQshW7Kyws1c
 vpYc2mg2hZAi17MByPg4PKjXQtji7fz7E7+tg7DxL1f+gu3pgy5abNFHPDIGHHtOXGPXIQ
 LGHfe9s/ZOXqE/NprOy+rLnklxZdQywXMbOPZKyQ86XW0GDz3QNYvWEXs2TiDvREE1yT1q
 43ecBdyHmMSzB7qK+8cklO2uErq5jTGqtZLIOqQSk0yyuvwj49h5eSZUxp7PpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ipUmHBEU
Subject: Re: [Buildroot] [PATCH] package/putty: security bump to version 0.80
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexander Dahl <post@lespocky.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 21 Dec 2023 15:00:39 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> As described in the announcement, this fixes a security issue:
> 
> There is one security fix in this release:
> 
>  - Fix for a newly discovered security issue known as the 'Terrapin'
>    attack, also numbered CVE-2023-48795. The issue affects widely-used
>    OpenSSH extensions to the SSH protocol: the ChaCha20+Poly1305
>    cipher system, and 'encrypt-then-MAC' mode.
> 
>    In order to benefit from the fix, you must be using a fixed version
>    of PuTTY _and_ a server with the fix, so that they can agree to
>    adopt a modified version of the protocol. Alternatively, you may be
>    able to reconfigure PuTTY to avoid selecting any of the affected
>    modes.
> 
>    If PuTTY 0.80 connects to an SSH server without the fix, it will
>    warn you if the initial protocol negotiation chooses an insecure
>    mode to run the connection in, so that you can abandon the
>    connection. If it's possible to alter PuTTY's configuration to
>    avoid the problem, then the warning message will tell you how to do
>    it.
> 
> https://lists.tartarus.org/pipermail/putty-announce/2023/000037.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/putty/putty.hash | 8 ++++----
>  package/putty/putty.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
