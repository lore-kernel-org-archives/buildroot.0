Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AC7C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 18:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53030404F4;
	Sun,  5 May 2024 18:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmc6tK04JLam; Sun,  5 May 2024 18:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 164A1405C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 164A1405C1;
	Sun,  5 May 2024 18:48:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 621051BF373
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 18:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C7B482132
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 18:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzj7c2dXTwaJ for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 18:48:17 +0000 (UTC)
X-Greylist: delayed 398 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 05 May 2024 18:48:16 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 814E1820E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 814E1820E1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=159.69.191.136;
 helo=mx2.dismail.de; envelope-from=november@dismail.de; receiver=<UNKNOWN> 
Received: from mx2.dismail.de (mx2.dismail.de [159.69.191.136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 814E1820E1
 for <buildroot@buildroot.org>; Sun,  5 May 2024 18:48:16 +0000 (UTC)
Received: from mx2.dismail.de (localhost [127.0.0.1])
 by mx2.dismail.de (OpenSMTPD) with ESMTP id d4ee0aaa
 for <buildroot@buildroot.org>; Sun, 5 May 2024 20:41:33 +0200 (CEST)
Received: from smtp2.dismail.de (<unknown> [10.240.26.12])
 by mx2.dismail.de (OpenSMTPD) with ESMTP id c34ea9bf
 for <buildroot@buildroot.org>; Sun, 5 May 2024 20:41:32 +0200 (CEST)
Received: from smtp2.dismail.de (localhost [127.0.0.1])
 by smtp2.dismail.de (OpenSMTPD) with ESMTP id f32968c0
 for <buildroot@buildroot.org>; Sun, 5 May 2024 20:41:32 +0200 (CEST)
Received: by dismail.de (OpenSMTPD) with ESMTPSA id 3c7bdc84
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <buildroot@buildroot.org>; Sun, 5 May 2024 20:41:32 +0200 (CEST)
Date: Sun, 05 May 2024 14:41:21 -0400
To: buildroot@buildroot.org
Message-Id: <XWZ0DS.CUMWYFFCDVCQ2@dismail.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-3xa4F3hzYry7Ory5Mv4D"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=dismail.de;
 h=date:from
 :subject:to:message-id:mime-version:content-type; s=20190914;
 bh=Rkn8ds7gzUulu0wmzmXSyMiQK4gMBplcji5P1OF8p0I=; b=vpEimjRrgiH9
 zv9ibMYpCdJlItbSbwwKap/HMak9FXn4eORVLMLODVcuYLH/4+yDERTyZHmy8H6n
 eLyQX4x4WVzmAGMdE/v44JT47595yG8FCXK1ED2YhNNwL+Au0ibEp8MZnnH0H7dR
 /oiW89PUZR+zS1JNDVg3PYuN9Ar4y4E46wNksD9eiRQwxw4cMuHNCcFKXxuFWOsJ
 gHZHVgpFdVSNdC9SuhUXvlS45YLYv3toWb+3UEnSikE+SASB5sGwoGSwEqSiimbR
 XUBB9VzzbKw2nFs4/j0jj6f+p5AEvAFa5CWEI00pxWCQYNNa4GI/UNvYjXtulrT6
 Bt2cMVBtnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=dismail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=dismail.de header.i=@dismail.de header.a=rsa-sha256
 header.s=20190914 header.b=vpEimjRr
Subject: [Buildroot] Issue Building New Package cmus
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
From: Dylan via buildroot <buildroot@buildroot.org>
Reply-To: Dylan <november@dismail.de>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--=-3xa4F3hzYry7Ory5Mv4D
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello,

I have added a new package, cmus, to my buildroot package list, but 
when I try to compile it during a full rebuild, it returns an error 
message,

input.c: In function 'do_http_get':
input.c:223:54: error: expected ')' before 'VERSION'
CC lib.o
make[2]: *** [scripts/lib.mk:66: input.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [package/pkg-generic.mk:283: 
buildroot/output/build/cmus-2.10.0/.stamp_built] Error 2
make: *** [Makefile:82: _all] Error 2


I can build the cmus package outside of buildroot, so I think it may be 
related to my cmus.mk file, but I am not sure what is wrong with the 
file.

I've uploaded the contents of the cmus.mk file here:
https://paste.ack.tf/8471de

If the mailing list supports it, I have the hash and config files 
attached, as well.


I'm using buildroot version 2024.02 and have tried running "make clean 
all".
Is anyone else able to reproduce the same error, or can tell me what 
I've done incorrectly?

Thank you,
Dylan


--=-3xa4F3hzYry7Ory5Mv4D
Content-Type: multipart/mixed; boundary="=-WsSBx73uv+Ka6d7Hitgr"

--=-WsSBx73uv+Ka6d7Hitgr
Content-Type: text/plain
Content-Disposition: attachment; filename=cmus.hash
Content-Transfer-Encoding: base64

IyBMb2NhbGx5IGNvbXB1dGVkCnNoYTI1NiAgZmY0MDA2ODU3NDgxMGE3ZGUzOTkwZjRmNjljOWM0
N2VmNDllMzdiZDMxZDI5OGQzNzJlOGJjZGFmYjk3M2ZmZiAgY211cy0yLjEwLjAudGFyLmd6CnNo
YTI1NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0
MDEwNTIxYjg4MDY0MyAgQ09QWUlORw==

--=-WsSBx73uv+Ka6d7Hitgr
Content-Type: text/plain
Content-Disposition: attachment; filename=Config.in
Content-Transfer-Encoding: base64

Y29uZmlnIEJSMl9QQUNLQUdFX0NNVVMKCWJvb2wgImNtdXMiCglzZWxlY3QgQlIyX1BBQ0tBR0Vf
TkNVUlNFUwoJaGVscAoJICBTbWFsbCwgZmFzdCBhbmQgcG93ZXJmdWwgY29uc29sZSBtdXNpYyBw
bGF5ZXIgZm9yIAoJICBVbml4LWxpa2Ugb3BlcmF0aW5nIHN5c3RlbXMuIAoKCSAgaHR0cHM6Ly9j
bXVzLmdpdGh1Yi5pby8K

--=-WsSBx73uv+Ka6d7Hitgr--

--=-3xa4F3hzYry7Ory5Mv4D
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--=-3xa4F3hzYry7Ory5Mv4D--

