Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FECE606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Mr4m1NBA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDEDB60746;
	Sat, 24 Oct 2026 11:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bffPpH9-DLzs; Sat, 24 Oct 2026 11:53:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DD1B560679
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842835;
	b=lOJeFq0KCNMumAQabvIXgvpOgA+yLaPO06TlIgJaK5UXSU+Jeh2EmsJ9p46VBsOFHmxn
	 KUkL7lRrQGVtzE0Yh/NAN5IIDdtIuFRxI9GAViROvDiyuwfRmwKiE6NzmjaVXmzVCXSY5
	 oYvN2YEeKwNQ/xniyn2sh6Dz6armz2754pkUCwX2MpIS+YFb9tzo3AtPly0rBMfyWcHbD
	 FGpsSu0I1DKjZ2ixnPYfl6FRT872KarUiMpVXSWxglva7OrUKA0KrsmhR5wKnJj8KeN+Q
	 Du0GhPqlg9k2pVl7iyLz/ZQZl+RAGVO/OT37GeIqquPWPsmmaD1yMjjzSOGst1TFsHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842835;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bGfqF9uD8btFZlx2Wnp0HcU40Eh9kXtEurLTmyIct1g=;
	b=VIfI6QzFqSfVH1wCRJX5olYpyOmDKgvLeEGaDa0ajQInBMTw8icJfNgiMVBA/+zFVCiy
	 VtQeeaXQKAc5DWRzj3ALY2pRRs/ZM9BuZudU2DLfLZ5cJtcquFDSVijcMNFI7ty9lz7Cz
	 1mghoimyH3n8PGTxIEYHqb/FN3OOlmacBN/Su36ldXG5we9F+5lO/zmij5iS2eZC3sWOI
	 PlxtIZA9GwYrgQSG2NuJEvzAXvRdlBxwmv9gPGaglBc0047/5IyavtYvM9wwCQsp6iva6
	 QCVWEGq1c5OueONfG0d/ReJofZaOZy5dSNZPqrXnrltHRjsG4jgB6reOaqn8AJNrFEA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842834;
	bh=bGfqF9uD8btFZlx2Wnp0HcU40Eh9kXtEurLTmyIct1g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mr4m1NBA2cBxY8UXXePbWonHXnNgcr2zhBZvhOy9bkZbtGPsQZ5gwDs0c5dp0/MOc
	 f3bUGh0Ymp5jN6fHSXyirTngVQYl0AQiG4XhO5UKE7sXYhEnMFfD4PvlXz9jfDCytL
	 51XwYrBMEJ0xqZtz4WNtWvQY2FLqFgn+SYFCTFQyuNMAZBsz6ZQYUdBXJuN72Yrrwy
	 xuIe2BnOGweh5khBS5pVI/d+Jw3LJkmDjwy84gKkxFWVcStqtqp8lxceiEDdTRs99o
	 TMsXaMvqj+2MaWrXG0sGbDeeDNHZDFFBWYrZvTNqWxue6whGB2SWFYpKLiihdgcZmX
	 gYq2C1RJzaYlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD1B560679;
	Sat, 24 Oct 2026 11:53:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ADA7F356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93D1480FA3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QufwAmwWaj2e for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:53:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C357E80DFF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842831;
 b=j89gEZzV/y6dkHZKvlvZb2Kl1U6a2cWhaqBULepeNPkdDxycKXfAM+HknffB9EAdH918
 emawo60YSbYnZA21wdT5xZk6Ul2wblZCtR2u/YkdeIemauYFfgSMngH1koZAQAQCVOikt
 1yFwdwadeB2UCtHp+qX75qk3ZoELlDip65sd4B1t4hC0IvB8lvqgTRL2U76Dnl2QrFHRe
 4QW20UvbgEMlutacjo4y5+BvPP7KKljLfyiHy6lMssDMzentMvNTKgS2NKaQ0VhMwmP8v
 QtWkXfI1ZPY3bMbvEGCEBPfSaaaT7uHyX7HiCUGKtP0YBY69Rq1KnASqiEb3rihpYYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842831;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GJzeSn6UduV2qzadChGAKiGRIyZgOUU5tg8UXRun34o=;
 b=a7Uqhl7YfJynirdx5Up3AxTY4YT7/bO53mL+A0iuva5cXhC2UhCKRfXp8P3D2JdH7nwN
 84Y+jmaKflGDw3VqWPoesb6oeZz9m5Z4YE+aKvpNoLAiAZSw8/JsPDNqibTaCCIVLhYyv
 U6RnWskn35/dIWxgHD/u0RwtSGmpAkKrqJORExRATMR8PaJd38zcsY8XbK4uyl8PXKVIq
 xE2muuse72u72jj9q58+wXJUc98Xm1lUY44MhfywHG6Z9TdUWAMSjEKihbkSJBsXN0KVi
 qrOtjC1lRf7K/jVtY0EtHXl9/lBInHoGI35bz+z73zjltJViJu5xhmugdXePmV+rpAg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C357E80DFF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C79519C7A5; Sat, 24 Oct 2026 11:52:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 12:50:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21d33623d9a26ae31ed74e65807ac5ed23f289a9
X-Git-Newrev: 9c5c826e5baae18c5dabdcc3eeaae495ee98fb36
X-Patchwork-Hint: ignore
Message-Id: <20261024115226.C79519C7A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-serialx: bump to version
 1.15.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c5c826e5baae18c5dabdcc3eeaae495ee98fb36
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-serialx/python-serialx.hash | 4 ++--
 package/python-serialx/python-serialx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-serialx/python-serialx.hash b/package/python-serialx/python-serialx.hash
index ae0d9d8d02..1726bb480f 100644
--- a/package/python-serialx/python-serialx.hash
+++ b/package/python-serialx/python-serialx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/serialx/json
-md5  2e3b6725772273c234aa24ee08b384ca  serialx-1.14.0.tar.gz
-sha256  508fbc83290b2c368cc3cc034bc2a30fa083d1bdcfae6755a1175f6ec14c8af1  serialx-1.14.0.tar.gz
+md5  a1fe8ade48ff969ed3a16f2f3f6272a6  serialx-1.15.0.tar.gz
+sha256  89ffdae6511492157eb1e957f7f6cb0cacace088692f7477b27c4a6b6dbd4d6d  serialx-1.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-serialx/python-serialx.mk b/package/python-serialx/python-serialx.mk
index 67de7a698f..a745694573 100644
--- a/package/python-serialx/python-serialx.mk
+++ b/package/python-serialx/python-serialx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERIALX_VERSION = 1.14.0
+PYTHON_SERIALX_VERSION = 1.15.0
 PYTHON_SERIALX_SOURCE = serialx-$(PYTHON_SERIALX_VERSION).tar.gz
-PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/19/46/a23c683d997c5d46f34e777abb7f4b0e41e189b115a9f6995812e404595c
+PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/1d/5f/d1496ad01c310ae573921ca24c62bfaad9ff34cf16c583f4ae85f39b77e9
 PYTHON_SERIALX_SETUP_TYPE = setuptools
 PYTHON_SERIALX_LICENSE = Apache-2.0
 PYTHON_SERIALX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
