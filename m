Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745B9606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ToMPcK2F
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 511E9816DA;
	Fri, 23 Oct 2026 12:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJCkk5ukpclL; Fri, 23 Oct 2026 12:32:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 83A31816A2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758756;
	b=rR529AQ7CTT3+JeqGriJPwRTKsCtQpHloWvFI7y6rMmz/riq/kGUmJEO5p/QbJgxLXp6
	 v7mWsKAaGxzTUNtpc+WTC178ggBxms24btOmYjxiogqc3bOa0eh+Fzj6DRJEaZ1wbnAH5
	 XpaIq0WXhCFwcZJkx+5a0/pY66ossp3/lY+yw+yUZfRPVHPdT92WIOpInLPS/vACVmg2m
	 RQrG3BmP2FEEM1AI6d/MFk7nmZ0FHgMSI/JK+Oima1RcO1wD21kamhe+1VqPKHNKAy28r
	 KUuA8t+OD+sFkOYJ76JOKifNGT467b928u7jkGyqFxGTBEcl1ocAbdGaIeuHfYrcbqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758756;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+VnK3XGqvrEihPmb3YuC1DU9E/Ub1yqxCvGIsd6ulqY=;
	b=ZOp4wtpe0noUF9VhEIFo3KcIggMPLA9cKx8zI0a8gJSQe69AHQKqqCUQ+dwbxsq0zOOq
	 CtjKLiE6OrlmG36icZS5IiJBK6Vo8LrO8MlVXWtY0FkTmuggILxG+fMZjzx8cM9gi9ZmU
	 OUlon9QHV3fuEcf0qrPsSE5WrnBw2UqxPYx/7LSA63NhICM2RmiGUiIm6RLQ3P159oTTC
	 AFL71QKNXcqgHdQtSTZIqJL0ClxAA4C7bsBKl7K/BS0OjkTs+RXvPLMT3ALeyGRr05Uyh
	 mY8DHJGgoPPTjwuB3+hr/2kNq3C1ZSJsPDnBLim7oAPWOLUXjG4Nq3+u9QUUtMev6QA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758756;
	bh=+VnK3XGqvrEihPmb3YuC1DU9E/Ub1yqxCvGIsd6ulqY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ToMPcK2FfpOnZGTXRDcEtk7rlxXH9XwLA77mgF5LQV1kNEAATdpv7s9ZJraY49juq
	 LzjNCzX4Jx8lN70nVjQjIvx3EFMrSAGrQ7vOjyc82vzr7W6rbKBm6kECyuzUEHduO9
	 KP1uspklR9u2VQNwEO7XWSXVBC88PGZK8/Ps8XF08c3nwOzjNcHEsAhHJ/MEyLMg2P
	 t9O//voKTc1Wcp1Fo0rdpB/VtrfksVXTEWDf9vc1ZwhkPTcjDcCVPojAR14bze+WSN
	 Z81gN3GeGuVUtUQrRF6VuIt8ifgKMdpKQYDXPnQxlbzR/LJ+T+tJoaYwOTLfepJAZ2
	 FdvVjSsN30Wkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83A31816A2;
	Fri, 23 Oct 2026 12:32:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3092312C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22825606BF
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgIOKMDBCzQH for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 784496068A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758727;
 b=qF9Fng768IXjtLP57ikltcuoB9nZAdyszKT4k13QIdx99AFN8db5OxEhCPrKVbPKxa1J
 VK6mFlY9yJ+Tlw9wpVAdAGF7q6TVzpTzgWCuh6DE+QGwrmo2v0sSnzCs44V7Cj503QbAk
 81GuCkLADCOle05NWaedmXzq0Zt+xO7vIwGiUsinxmoE2CNtp1zg5qpA/TFVi+GPH2FRA
 J+/SOq/p+LSUuxf9Vb28Y1HPp2yEpw5VhmIPqhD7VQrJrOVVC9jFqgp9gXEH+HLbjWReu
 cxOev+fXd4FJgiiDXSv3V1poH6SCvbAx8X6CtnvpUQMzOGvw4yYkIiSu+zY5T4nmj0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758727;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Z1POuU9+vuKa0mZjW4ZUT783E7/sWOSs60M8QS6PbNM=;
 b=gQq4ezxzMkfDnVR8OZWKbWptzOl7QLOAVWRxLtjr9Un0wsWNmwybOOjUVKtkhrUSzV6O
 P+ADKqphUxXbcc+yPZ+2vxg9jG5PsjYbv/OD4KPytpxORF4HktPV88vZWzmNQ1njaivVb
 GVk5Dk289y0V2RsdA2Xe3/9L7jVkg2MtmBtPSuCsJIjO2JSHEAIAof3lznpnNWN8MGk+Q
 UTBq2c2sgBMizCNRFAotva2tF9r3IlphNd2Yx5/+kcYf7lkk0svnskoyqTxH1b6BGGKD8
 rQ34i3dBgazsmy6QDxHgZvXuLEHS5sryhLa+Mdve6DQglv1/z7bhPfo+02NLjXS8Bvg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 784496068A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F325C9C66B; Fri, 23 Oct 2026 12:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:27 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 90653b4b276df304637ce96783d339ec3fe24008
X-Git-Newrev: 6c40b598849e8879b7fea47be1c79a2aa7a0ff3a
X-Patchwork-Hint: ignore
Message-Id: <20261023123042.F325C9C66B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 board/librecomputer/lafrite/readme.txt: document SPI flash dependency
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
Content-Type: multipart/mixed; boundary="===============1603006958000440030=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1603006958000440030==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c40b598849e8879b7fea47be1c79a2aa7a0ff3a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Running a modern kernel with old A-TF/U-Boot leads to various issues.  Add a
note about updating the bootloader in the SPI flash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 37ef3af415a830a2eb136704816b3d9735d2945d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 board/librecomputer/lafrite/readme.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/board/librecomputer/lafrite/readme.txt b/board/librecomputer/lafrite/readme.txt
index 86afa855e6..8747a9a23f 100644
--- a/board/librecomputer/lafrite/readme.txt
+++ b/board/librecomputer/lafrite/readme.txt
@@ -6,6 +6,14 @@ s805x SoC (quad A53), 512MB/1GB DDR4 and a 16MB SPI NOR flash:
 
 https://libre.computer/products/boards/aml-s805x-ac/
 
+Ensure the the bootloader in the SPI flash is up-to-date. Updates are
+available at:
+
+https://boot.libre.computer/release/aml-s805x-ac/
+
+To update, write aml-s805x-ac-spiflash.img to a USB flash drive and
+boot it as described below.
+
 How to build it
 ===============
 

--===============1603006958000440030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1603006958000440030==--
