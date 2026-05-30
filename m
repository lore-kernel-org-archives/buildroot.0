Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03E7CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BD7E6F5C3;
	Sat, 30 May 2026 13:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mykauLKfsACN; Sat, 30 May 2026 13:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA7886F5CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149176;
	bh=y1dqQJaf8/Nv3j4HghSIRZpD0RH/4LyaLAxEDMR6DBg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A6H3Qf9X2+rdR5z5faz/WTYCpl2Lqvityg6Hod65Ao63gthzNxMze2JStYK8HsIl8
	 CPC2TKA01MFxm4OaUzfEVI7hxOpB4ryHpBxWWoNG8V4UnI3TTM1SSRX6VYunmI/6YR
	 TyN8lhnHoUuzsCTJnCG3a0KKWCsE2WYI2Qrn48p0CyUY/d42NmcQGiC369p/cJ00/g
	 elHXjvmh2weUvRDJtl9q4+ljsrDFp8TlSQRnCaaYybpEuLOyNWEWsb7HTCx3HHOs10
	 VWXM9UJiYLfHslLbi2SZOtRC50V4NNLrLCwmmSUenPclBb6/2xd1gGryMMHUMiCKCy
	 sQnjpTgLkAE/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA7886F5CD;
	Sat, 30 May 2026 13:52:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EC0CF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B51D74025D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBZ1s01Pv6s6 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F0B742676
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F0B742676
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A142E8750C; Sat, 30 May 2026 13:52:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 27ebca4af2cce6a24fdd9b9f1f8ce280f4c381c0
X-Git-Newrev: b3329ed3e027f7a57f5b96a2a842643bebbee693
X-Patchwork-Hint: ignore
Message-Id: <20260530135221.A142E8750C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_16 blind option
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b3329ed3e027f7a57f5b96a2a842643bebbee693
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

In order to add gcc 16 support in follow-up commits, introduce
BR2_TOOLCHAIN_GCC_AT_LEAST_16 symbol.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 910cd103dc..5aa6cf8f6d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -848,10 +848,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_16
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "16"	if BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	default "15"	if BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	default "14"	if BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	default "13"	if BR2_TOOLCHAIN_GCC_AT_LEAST_13
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
