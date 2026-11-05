Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757BF606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cZp/M2wR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF73608DF;
	Fri,  6 Nov 2026 16:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-QJ6se6AbVi; Fri,  6 Nov 2026 16:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 78CF960890
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981307;
	b=q8Yd8xQnj1ZGxrA7ICwkyqH5EgsuSvxLkfREmXk59heWXASLeaSgMvGFYQ5tjaDXVhck
	 Ps7fsYy36bgDoweDMpyMGgMx6uxJW7JDLzpEONAlXBYWFydNLJSk9BvBk74SUx1Qas/MR
	 cKqxq1PXeDim9IWjyne+B6rAQK0cLtGIY9SQWUetPGIkK12BRbiZnSMalTn+nU9hb9zYw
	 RMi3UPWVOMbBTcWRX64n9Xc7lSuEASWve1FE+BTFHE04syGTPxdmR+5b8eO5cRXd3YTsZ
	 b0CtHsdpaPF4J90qlF6H9VJCZG5/vWfwobGuaK4W6+Exc1howb2EADq/D0h2qcxcLng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981307;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=gR028xD1LMPMyPyWz4tw7CGQHjGDO/2l+i44De1Axlg=;
	b=oPGt9gVjYp6Qwi3aKhWr6uS/oHkTv9beFr2VwBvM+XRUIeD0JhGUnhu6sW5tZ1tMq9W/
	 EtaiJuJoI8TzfkFOyOTQF55y259VwoY2u7axN/FdcHLQN+xTUMNcmW34Y1fM7izCqaTCt
	 frkiovAF/4x6O4jZqDki01WT+qEJTIcB0JVG1nRdWsS3tWV53Lafhf5QtVwIj3XMc7j2j
	 WOPrAK11ACGGvBOTVXd9kmliwKgmIXkk8s+LhzInNIR71uJCxewmzvfveFgLMKdiFgae4
	 7O+MURcni9wBzghZGS1YgOK12Cmh/z6sMv+oxCh/OOBZTXOoQkEcG/gQY2yIshSO+QA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981307;
	bh=gR028xD1LMPMyPyWz4tw7CGQHjGDO/2l+i44De1Axlg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cZp/M2wRJnzJLhpwEQyJWmldRlypnOQJNRxf+7TC7+cTMOsQwxshB7ye8mUTRS/Ui
	 ZG/T56shqysKwtOb+8ZaL+shgYVMf5xlo9Voo2iFmn6XuyvsnByLv9Apryx/gTUH8l
	 pBwy6+cc9bYhfD/1FjuAWz1LmaYSvYzwjISFOBdxIfnmq89/KBISp+YYzYt9E0wN6j
	 RcYe9ERNinW2VEkJi3snrJNmUXPN93NCKVlNpM9CGvoOAKeUJuKGcPZd1YTd21uMVP
	 t3foG7rutqF0TQuaMeGf4Wy9CS/oN1LpO6V1hTqEcuyGqTZ0shp6VOOZKsFRVapzHR
	 xEiPDFZUforLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78CF960890;
	Fri,  6 Nov 2026 16:08:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 837BD4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 753B540913
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obSf6jsHdyV3 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B7F1E4090B
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7F1E4090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E288E9E0B0; Fri,  6 Nov 2026 16:06:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:57 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: bbd7906616216d84c69c71aecec6f745c4afa6d3
X-Git-Newrev: 0c9f80d71abd53d433824ba95935d9b09f3af4ef
X-Patchwork-Hint: ignore
Message-Id: <20261106160644.E288E9E0B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/mender-update-modules: fix LICENSE hash
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
Content-Type: multipart/mixed; boundary="===============3895657990575578478=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3895657990575578478==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c9f80d71abd53d433824ba95935d9b09f3af4ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The SHA256 sum of the LICENSE file was incorrect, leading to a failure
when running `make mender-update-modules-legal-info`. This seems to be
the case since the introduction of mender-update-modules in Buildroot:
the license file hasn't been updated upstream for more than 7y [1], and
the buildroot package was introduced in May 2025 as Buildroot commit
a474642fdcd8 ("package/mender-update-modules: new package").

[1] https://github.com/mendersoftware/mender-update-modules/commits/master/LICENSE

Fixes: a474642fdcd8 ("package/mender-update-modules: new package")
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7e49651e266d8bb7742cf8b2f312d9d1638168bb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/mender-update-modules/mender-update-modules.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender-update-modules/mender-update-modules.hash b/package/mender-update-modules/mender-update-modules.hash
index ec879f46a1..f6de69c42c 100644
--- a/package/mender-update-modules/mender-update-modules.hash
+++ b/package/mender-update-modules/mender-update-modules.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  4846f39abc254ad2ae2a9f3d5479b064bc1bae5034b9d276ebdb09d8c60f4541  mender-update-modules-d8c4683e6660af6c65069e10ee4b8ee50ec1af46.tar.gz
-sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE

--===============3895657990575578478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3895657990575578478==--
