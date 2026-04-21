Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D495F94CB5
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 23:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 244E260B42;
	Tue, 21 Apr 2026 23:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjJMRYnyIl_R; Tue, 21 Apr 2026 23:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4609660B43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776813173;
	bh=5qM6h0k5Xy6/SNinYDSz8IEeg4jO8mMPCf0Dh/6nF1Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NtfPHckH4bA1PYEQJc2Hq3flCYLerVTwWtiyCpoenJ0bCbAZyh1KNuKZ4/0OmKN9g
	 7Iy8HhjeYnyX2VoVjc0zz1Szacr3W0aca2rbyP8DBIV2XXjUPfnjj8ze6MMOXKvqMU
	 UjvCfk/v/WF2UNwdNcowWiXqvk0fNGKLCBjwGyeGD6f8ihP/G+RqyzT83bBhLFwM1O
	 QHWjAopoBHvuiIayTXGt2vZ1DabLeJvgC6CFZ/SdjdySSHWcsfYNmeL38i2Sv0ISPM
	 KkhdrQ+itV7LS56dzjE+OxgJ6xQkvK2tPYrIN7j6ySy0D8FTpHNjtCbq4jrz6TdcVr
	 0H/mywUDDNbsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4609660B43;
	Tue, 21 Apr 2026 23:12:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2D50183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98656404C2
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJcpU91_Nyw2 for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 23:12:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CD1D404AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CD1D404AD
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:12:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10122821F9; Tue, 21 Apr 2026 23:12:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Apr 2026 00:49:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 317c0081e9e6476dddb82f2e579bd4e6f102748a
X-Git-Newrev: 298390ade47965a39e6fddaada1f7128aaa6ac6b
X-Patchwork-Hint: ignore
Message-Id: <20260421231251.10122821F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-magic-wormhole: add CPE ID
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/298390ade47965a39e6fddaada1f7128aaa6ac6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE ID `magic_wormhole_project:magic_wormhole` is valid for
magic-wormhole. See:
https://nvd.nist.gov/products/cpe/detail/591D7832-786D-4BBD-A16A-04CBDE20333B

This commit adds the information.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-magic-wormhole/python-magic-wormhole.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 11d4a8867e..7b74113df1 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -10,6 +10,8 @@ PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/65/34/08813
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
+PYTHON_MAGIC_WORMHOLE_CPE_ID_VENDOR = magic_wormhole_project
+PYTHON_MAGIC_WORMHOLE_CPE_ID_PRODUCT = magic_wormhole
 PYTHON_MAGIC_WORMHOLE_DEPENDENCIES = host-python-versioneer
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
