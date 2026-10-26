Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A387606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 20:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WIJZYNgo
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BB0D4063A;
	Mon, 26 Oct 2026 20:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEksSFNqn4mA; Mon, 26 Oct 2026 20:22:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6E80940647
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793046177;
	b=NppL28X6PkHdzUPFSxFUXAv2+I3IyuOiSzXOZnuP6VK+KArwlwPjRQrJ6yd8a1jlx0HB
	 rT2mS2Rp4Az9CdK0mqGq13CArmA/t2iwKdRM0AHwFdZb1KN5/ooC3liAShySgSwnPU8cJ
	 6lp/8tMmaLb9kqTcDmr/qAWpBm/LlmjuWH3+3RQdy5DMiwoiV0GX824I9M9lVKLjQMAYc
	 OoAamUqBeyG/CL1RoUkRBnffkXiWk27citsy3vqnsw1EuSxZNNM3J33hB+cZ3vaXpCYCD
	 hv7H9kC1dRjN3GZwndAHdZF134Wn4/Y1DpF0fSEFBj+mUZu2URYpgFU94KVKc9KpAHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793046177;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=psDWNHRQ83LWEfUADMSPi933Hxn9hs+9jmusytEkGwg=;
	b=hadELZ6a6ZyN2Fd/c7vPtDBpKfKH13C6kuVmNgPsP6zPAThmcLFTnQFdNBpq9tqxtX1V
	 qP8KlGnhUs1skkBSdaWC1/5x3L2zcL+VPhjOFS32njfFuCKRbgjBwcxtFXmcEl48+EBP9
	 FnJVbJYzum9xMqtMYns1IRixirytlagrGPyBq29qnM4G76Tiln9gNZAcmO3u0gom+OSmL
	 T8GwEfDq6c/WlWKO1QFsdLbTMowAcW8ULcQhWiwcUWl27dv02QpIBMCYcSf9jsLqldgIP
	 GbQaWrszWakbPOYEyqZglr1O9MI/Oe8L7xnuwq79DFJ65ooMqeWqju7jvOWdQEUr2iA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793046177;
	bh=psDWNHRQ83LWEfUADMSPi933Hxn9hs+9jmusytEkGwg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WIJZYNgoqLlZJDcQ3MI04dsj+CBM4TCCi5rdU8vvb0H0NhEszgtd+BTC1kKI/S68q
	 Qg0adouy7BpPFAXo1AqJQHrvur+z9gKyUZGjPYGTCpeYUWnxQcTyIpSJJaFpMUhbFf
	 ZzMnK7rMcZC7svNK4jVMULwkZWWQE1OWhyBpNy56Nn9MXhsY47E2kNxUrrjv9Wj+SN
	 73G/+fsc0GBoY30jcaN2aBRDwYVrP2Xl2doCED3UJQ6KsH8Y3cbjZN6x2tPObeIGjM
	 5ymo+IeOHO2eFkrdgt5edf8gVpOlVZztMhU3F74NAzMsFyXQtDZbiyHV0gvCzQrhvD
	 zxGGumAE3P0bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E80940647;
	Mon, 26 Oct 2026 20:22:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67FF12F5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E1BD40112
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXJgAmVzrvaV for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 20:22:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 71ECC400D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793046174;
 b=TpT8IiadmSQKQh8uXFpxqjg5jAj7M/WtP+W3hlyM5vKR+oZ9gW032FfZN0ZFkLZgqgli
 Q5TLYbSNTTxb3EQamFk87OsPTjUcr3uTAA6j7hlh1KPG+N6FQQ1SGbxghik/ivkNH0r1o
 2ltnh2ArxbfHX321H1TzYYr2agEHBRTP82NoK3cyh/0W8Yi51QxD1/Yeu25KYUzo3/4F0
 F9wrKw5zsn3Z71gx81XMcLrflanVfBYKw/Prm+7Zy55Cl47kduVQjtLvw5g+FtGteHBDI
 CENAF4JzQKYFkVdm6oPFoKUuzKe5MgWhnsZOyjukduTkx0WTvf4bp4NyIkBQ9yqG8zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793046174;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Cg9Xd+yccRth7WMurit1bygpJAEFzNIu9mEcpLlYlG4=;
 b=Qbxf+XE+pKctDZKIyG+y1HyQmwTjb8XDiyWE+ggTZIVWQhZ8MgfLVQZ3f8zKllNJUGXk
 ROHUDgd+0uOaF7I7o2+W8Z3CQVdwsQ4z4hb6C2mG8DbApAGBpyPTNmRuSc0Idq3QSxtp7
 g8vKYWPDcHfiUrvUvIPA4HKeq/t8vKRojgE8q5MsExGOmuho1MMWcIqK5r/5mQgxYNZ80
 IpZBKy2ojTJviLiYo1DE8BICozY8S+WBuPlEJiHWwJxoQYUxSq0JC3VMjTLMckhCXJNmI
 72fuIDWzzmgZuAWkKXZBBsAGE7Gp9KGWoT6K5zNJPKsrHPlXdHGeu2M/e06y00z46Tg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71ECC400D2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:22:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 645289CFA9; Mon, 26 Oct 2026 20:21:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 21:05:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9af3b214be63c7fdef33bb4e4b9a922f2a653047
X-Git-Newrev: 1612f01df512b3fa7ce4241466968aba78572fb4
X-Patchwork-Hint: ignore
Message-Id: <20261026202128.645289CFA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdparm: bump to version 1.12
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1612f01df512b3fa7ce4241466968aba78572fb4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes since 1.10 include new SCSI mode and VPD pages (e.g. Command
duration limits, Zoned block device control, SCSI Feature Sets), new
--out_mask and --examine options, and experimental NVMe support for
the write cache enable (WCE) setting.

ChangeLog:
http://sg.danny.cz/sg/p/sdparm.ChangeLog

The upstream site doesn't provide signatures. The tarball's sha512 was
checked against the one used by Arch Linux.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sdparm/sdparm.hash | 2 +-
 package/sdparm/sdparm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdparm/sdparm.hash b/package/sdparm/sdparm.hash
index 22d6b5b87b..6c509f1657 100644
--- a/package/sdparm/sdparm.hash
+++ b/package/sdparm/sdparm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7dc9e148cef22744e00809dad21b59ac544e3615001bc1b2399978f73e1d58ca  sdparm-1.10.tar.xz
+sha256  c4c9efafdbeb662e2f9712707ec490932bd4d010bb1129ae7a99526546eeadbe  sdparm-1.12.tar.xz
 sha256  4f98444e14adb18a94a65c3ded5f0dad42d382c6a2288b593a2d5bd5ecc4f46d  COPYING
diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index b9fac518c8..4c1aa42f4c 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDPARM_VERSION = 1.10
+SDPARM_VERSION = 1.12
 SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tar.xz
 SDPARM_SITE = http://sg.danny.cz/sg/p
 SDPARM_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
