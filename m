Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C84606A31D
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gnpM6YPg
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23406405A9;
	Mon, 26 Oct 2026 19:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ID9tsmWFJMou; Mon, 26 Oct 2026 19:59:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3E6B4405C8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793044766;
	b=WPKSLGxCJ9mZ8F8ah6A4BNQq0BkaxIYH5vb7HnZrnydRVPfY1wXP7KAfcRnREReHUCyN
	 ZGQg3bOOhsU7JqAYNCbHM+9c8mkpexNpBXGFWXQ4xlXOszE611nhI2MeeWems7EPyCrYd
	 7/YulztuXcuTncqtZOw0C7ismnjtpr4b06ALyNauuTomq2a7eXj3qurBd6FxRrZxKgf23
	 DgfcGpJCDACJvkOB2h87/842lUMdV0aP28U3L5ViT72hysFMNk0QyWOFxgxATMaFMP4LQ
	 bSJ4RlCedQi+JRViApIlxoVxjBOfJERHRoAhj8as7T4hW/lYSOIwW68TcKanY2P693w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793044766;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4tgdmvIDmdG/rXKXA9143LfTl5JnN3CESMNoBQ8ulQ4=;
	b=HJFDa2w0x37vOdDLHZQeHsffOZ8lCq0RG6HRXuBJDu3lULkTYN1H3HS08SkJJheYov3v
	 52bjNNmBbc0fmnDuYaDuUAoFFaftrV/buFNZJMfvLiQLiRO2MKDGIXff6VSMgHWzMFwfS
	 wTbm01IKb/8fPhwhTyy9xZKctJ11XnzjJgxcWGkF8Bv0R9eVrGug8SmAZYijviyT8GSu1
	 u9rccAUHv3B3jWUKPs14OVCL9QWbAYX9EWiS8kaPVcAA3ritE0md/0ghPvjoMdXSsQkoV
	 I/1N4u7JkRzpT7YisA8K7S1m8FYv/RLriAjMEzYsmk5HX3BuOJtyFJOHM3SN0VNNVEA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793044766;
	bh=4tgdmvIDmdG/rXKXA9143LfTl5JnN3CESMNoBQ8ulQ4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gnpM6YPgPbtBfseAvv94q5R30HcboIfSKVRccByk8HQn0LeqgelqbQZowDIE0/Bu2
	 wKU/0bjvLSSmtz6zvG4pwIhASE2ipVyAUHTPIodOGGiZfpy5a7kLBlF/LAjddWQi3c
	 6i7EbRZXjrwV4FGPwdnGR8Dcw13ykFQKjT1PVvpDVyRHqJBTmjvjS8YdfR+t1KFFok
	 1tV3jiKopjMvcD2vqy2intRXgf3bIvRDJYrwk1a1rHUgDWWbYWMTKDEPcBj6NX4q9m
	 /dmzs3/Qm3MGcb0YTK1v+I3FNl62yhFyGHGUrbCVrM241TsCGu8BlS077y/C3G8XTM
	 vTTgFntbW7Xxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E6B4405C8;
	Mon, 26 Oct 2026 19:59:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E94644BC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF30D605E0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYOgAO8myvnW for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:59:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E938B605E1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793044763;
 b=LeKbo+pUi2qrgBHrhXoJWRfTLzautXgeNheGu9Y8NBqjVmHwt/OtRK16cRAZBiJgY41p
 YLe48qr8UUmTCGFExu0HSLL0xV+f5Gi7Wq0B4M9XBREZM5c9fPqAv21uGZ4ywRX0QBq5d
 1OqUZ15U1oAxvPRuVhAO7NPpJsMTP4lyaWWwnoM3nu7+lPnuw10/6hSo21hueUvzExNRB
 9V3cRV4fvZodQEwjYQVkNjJ3WkOX1JHFDXHRamniNq7Zp5YysHY8sw9kE0r5jDEXiQb/B
 kDMV7qs1J/ZABWt6sezM7hUw7wNrtm3tNDiNxIkBtEkrqn+D41PFBUJzzrgjqORLnAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793044763;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jVd0cZqwokgiIj2qtNk9sCmndl0jV87RqLFs3r88tpo=;
 b=I7jTN/OqKXDHo+Ou3K+KsBeU/ioV+9Du4V2zpFm+1Ed5NIYlCZeoq9DH7oSDJM2RZr8t
 R/52hkt6+ZDqzyvhBDP5lRAbut1XTTvOnFzWCWPMo5kZ6nQljOrbjrCJiYYkV5F9f2Qf4
 +u9ZEsjBxnNNgIEPj5VOz+vzk8prl8n4eKRVmX0CCYsv9v5ytCEWx+zp+QkLCC7tivbSJ
 08FVGW+cxFTrzM2lZDLC+/XFeisRt6aWJv7ga2LIJxwW6YeRKUnvQsQFa5kkD13jcPuN4
 HWqRDsQeZWiPOAlymeQWXmJ9Rb9SdEdfCaJhK2JpInGC8gtDMuQjy4zZPgzh/4XUtkg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E938B605E1
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:59:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D90059CFCC; Mon, 26 Oct 2026 19:57:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 20:56:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04b8e19efd4b7085583cdc3fe099890a04abbc9e
X-Git-Newrev: 57e1b04f39fe1ae50efda34e74df9ec93f2c59f9
X-Patchwork-Hint: ignore
Message-Id: <20261026195757.D90059CFCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .mailmap: create a mapping for Markus
 Mayer original BRCM email address
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/57e1b04f39fe1ae50efda34e74df9ec93f2c59f9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Map my classic Broadcom email address from older commits to the new
standard format. (The old address now bounces.)

With the mapping, Git will show the new email address in the "Author"
field of old commits, unless --no-mailmap is given. Signed-off and other
footers do not change.

Using .mailmap is a first for Buildroot, however it was introduced into
the Linux kernel in back 2007 (see [1]) and is a standard Git feature.
See gitmailmap manual [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=e0ab1ec9fcd3799e874ff9086729a480f6c06cd3
[2] https://git-scm.com/docs/gitmailmap

Signed-off-by: Markus Mayer <markus.mayer@broadcom.com>
[Julien: reword commit title, add links in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
new file mode 100644
index 0000000000..bda50ce6c6
--- /dev/null
+++ b/.mailmap
@@ -0,0 +1 @@
+Markus Mayer <markus.mayer@broadcom.com> <mmayer@broadcom.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
