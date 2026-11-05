Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3B8606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=czfSmXHt
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AF4A6061F;
	Fri,  6 Nov 2026 16:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Sibr6Oo4U_L; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1A33C606B1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981297;
	b=fgnmvC6GO1AhSuEs9IWtenOM3Du8BkfOAewWSRpPaYdCHVFsMIMXYy3wpbT56gpo8WZk
	 xpbIvHWhKpDidOtgKEZk2Kac2e0x5bYuyqzlD94Aob1Oo5n6fCewXvsN7MRbmA2HJ7RpA
	 GErQKfTdhADVuvWfIztNog8dC5SSLM7pwfVR8D04XOUKLr2OmOPpxsfgdPYcMgiCx6lsi
	 CJL2nuitQyaSYkKJb/DDA71kWBmeNDt5Crh/kY70j9dXGIbxC0TrXsq3Ch3DWfXg5orlD
	 6FTF+F5WOphP9Jp87BobtRLaCJjvaOk6FoYbpfMsWoEez3b9+7BWbveQPszCbSq7uDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981297;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=8eS1OaEDslFeTC4o+PSZ1H+Fb4nL9Ib/ClHEpshTs2I=;
	b=DX1uqaDJbguU9Fcqryn+hTvWkxtOQFlTYe78PvbeqCCEQT3tnIBix/fVHJ3eb5tlOnt1
	 O46pytLQ4S1ZFGqaqlEL+ISTo9C6B2r9M7K+XOesVC0jiM4HhYUG0uuQ0U5SW8rO2ixty
	 T0xmVa+7OM/+cxmDnZjiZNNvdx/uEkVh3o7P08hbCW5WZrVWZNoBQMZBsOGmc+HNotNAx
	 TCkqYZ+NIy/w6V0qkKw3LgAgV4xJ8tm0UzViMvIQEI5sQ5+Pl6RWDJYbzX6+DW8vA9Itf
	 6hxZztfqr6Ln79YbLs0fwmjRW5369Im9xDOvhq2MK5H6HOh5x1UbhcSo3MH2q1YtoLw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981297;
	bh=8eS1OaEDslFeTC4o+PSZ1H+Fb4nL9Ib/ClHEpshTs2I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=czfSmXHtuWP2FxWFcR5XTlrl4I9j7KqrlfJF4CA6truUbsOqsHGxCul0+hNsZ2AqC
	 gcmmnx1x8JOJS7bwfHuXyRQvFS+9PM/n/D84hKtRHkeksm8yr4knkHztrloRQExKou
	 8ZMIXKhC0wPWk5SaKWASHjnfLA8ggVXMSGaPWhfiYf9dbKqWSk3g9TBfxFUi59dfAc
	 yurBsU29ng/UUcuI17D0mu7dpAS0WcMX8sszxzYUtTGzGeNvM1cwNpFd/dgigh2yLD
	 3p5gPlrsrXdmhp2TSCnaxXPbOB1jgTHN9wnMrtlRkg0xRzqv7y+WGWLYFunZOEoXoq
	 LCllAS75I8foQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A33C606B1;
	Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DC842E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BA8981215
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YaKnqKBzF6Gb for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C05BB81280
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C05BB81280
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 015449E09B; Fri,  6 Nov 2026 16:06:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:55 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 30f25422d2a530ed4cf3038843b72c324431137d
X-Git-Newrev: 80c73c3a46177c4982773ca08a5ad018bf0e4ba9
X-Patchwork-Hint: ignore
Message-Id: <20261106160640.015449E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/swtpm: fix
 license information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3005261912736068733=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3005261912736068733==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/80c73c3a46177c4982773ca08a5ad018bf0e4ba9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The SPDX identifier matching the LICENSE file is BSD-3-Clause [1], not
BSD-4-Clause. The LICENSE file was last modified with upstream commit
5f1ef9565df074b918a39cb4885af4190c98edb7 in 2015, before release
0.1.0, so the fix applies to all Buildroot stable branches.

[1] https://spdx.org/licenses/BSD-3-Clause.html
[2] https://github.com/stefanberger/swtpm/commit/5f1ef9565df074b918a39cb4885af4190c98edb7

Fixes: 87b9b126d23be1e95b3d2b82438f65e28f554a87 "package/swtpm: add host package"

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 56f15ebd01b1057fb7d28574c4176e837b586fae)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/swtpm/swtpm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
index d6559c22d6..3357be9c39 100644
--- a/package/swtpm/swtpm.mk
+++ b/package/swtpm/swtpm.mk
@@ -6,7 +6,7 @@
 
 SWTPM_VERSION = 0.10.2
 SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
-SWTPM_LICENSE = BSD-4-Clause
+SWTPM_LICENSE = BSD-3-Clause
 SWTPM_LICENSE_FILES = LICENSE
 
 HOST_SWTPM_DEPENDENCIES = \

--===============3005261912736068733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3005261912736068733==--
