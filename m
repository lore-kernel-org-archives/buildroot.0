Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD172606A330
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Lf4ldeqt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 983CA814C2;
	Fri,  6 Nov 2026 21:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eP8oq_edqGH2; Fri,  6 Nov 2026 21:15:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B033B8148C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999707;
	b=LJFXY4GE15OTItSDLJ8rbApWK5ZnqQjcNYRX4Bwz/KRcXICxpta8W6Yg14HRArSQohBd
	 K6SrpUXruMJPVVVn5bS2UWGimfczkV7E8GFNvfRNdZRwQwYhg47wd2x0rQ3GpWIYRDyy3
	 dQxHDl54ui9cuuVGMo8rIShzT7cDrbmIj/KlUY+fnsiRbtBbj68uDt+XSTH0EYX8XQyxe
	 X3MWgNlY4TJQMCduUF0f/5ds67+7BXGl9o4SwRjrd7vLYk+380FvJWQ0qv/xkOUX2pjxc
	 Xa/JDAjaky69RG1Xv2FnKV2rFTE++ZihyupL55LJnyOIdux3tYbmMGeOJh8GhFQkxfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999707;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Y8hJoj7+1ActT66mwVVd/o6Y2JIkNquGf8F3FHzXabY=;
	b=NJ4ZIhZ1qt435+4TAv4/K3oofZOfK31U6iJlDH9bKKb6MvEewTp0XdCF/e1y0DnGtp9M
	 Pqu6bTKX1+65ofOBHK5I0+n0SWJ8K7FevBe2Doi52qN6s8nhrPivrCsfIHIrvFi8FwQJK
	 ITt57DGiV+2rSD+2cyXYIq0mhDAWMqgyQMZiZTWQI8GZprVJTelICRhKeQjCf9oHbu+T/
	 Pv+gryuS7zvU7+rz8t/RnKezY0kkPBaA8eZU+wR5XdT+9/+jgbwAwapzRhco6h5AOgB7i
	 h+TVsYVENRb68nsfpXrfe7YwYeWOdL36ckL6m3n2zsL6lCiyqc6NHK1KTsEvPvFSxGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999707;
	bh=Y8hJoj7+1ActT66mwVVd/o6Y2JIkNquGf8F3FHzXabY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lf4ldeqtpH+Ruya8bk2vi7spAyqDR4qwODGrOYEBLUp2yVqLxpPMVPZxb4bGGqzAV
	 FTzb6zPlUL0OL56Drpxk30Z5BSFj5b/t/Fm7wyZR32yitfxJMTfr84crl1HxpyH5BL
	 F+8e3L9glz6uhx1JvuTWvycx1tm0dWsxwOJXKj6o5GIrhNQMt8bCXrLlblceFb0CGX
	 aYez/VwF2Wt0nqX/WSmHWnvchxFMniEF4asEhQ4ho0oRWfgt72BrkCOpQRhswuzGsj
	 o66ecQwOneJv4SbEbkF6+wN0d2VTETUDwO2OIfgdMGlcVfqYviS4sMvI6KgKnNPe5n
	 8iSSIXoY2RXnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B033B8148C;
	Fri,  6 Nov 2026 21:15:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 398DA32A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AE3481220
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgYrlpDiQ7Lx for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6C4BC8124A
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C4BC8124A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8741D9DCF5; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a3529f119f189fc44d5553b3000111f83f09a50
X-Git-Newrev: 55e4b7d561f75b4cba2bb0913a87821437078b2a
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.8741D9DCF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typer: bump to version
 0.28.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/55e4b7d561f75b4cba2bb0913a87821437078b2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-typer/python-typer.hash | 4 ++--
 package/python-typer/python-typer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typer/python-typer.hash b/package/python-typer/python-typer.hash
index 463df2bf86..b13709f74b 100644
--- a/package/python-typer/python-typer.hash
+++ b/package/python-typer/python-typer.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/typer/0.27.3/json
-md5  d1883b55e7e3f5f7b5891513352483f2  typer-0.27.3.tar.gz
-sha256  d0396f770a560ab1b0a8504e13b5f254b728cedb05c61cf0359e944e50ce8901  typer-0.27.3.tar.gz
+md5  75ca761a4d63d04fb0ae9b20c1c49be3  typer-0.28.0.tar.gz
+sha256  69ab84ef79fd601cff071bbd2566d855ecadfd93adbc4b3360b9924359bdd857  typer-0.28.0.tar.gz
 # Locally computed sha256 checksums
 sha256  58992cebcf8dfb6e40c4e2112ed12126c243666dca3912a3d78b7ecac4859d49  LICENSE
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  typer/_click/LICENSE.txt
diff --git a/package/python-typer/python-typer.mk b/package/python-typer/python-typer.mk
index 44555488e6..b03d3254fe 100644
--- a/package/python-typer/python-typer.mk
+++ b/package/python-typer/python-typer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPER_VERSION = 0.27.3
+PYTHON_TYPER_VERSION = 0.28.0
 PYTHON_TYPER_SOURCE = typer-$(PYTHON_TYPER_VERSION).tar.gz
-PYTHON_TYPER_SITE = https://files.pythonhosted.org/packages/03/51/d33db42cc72ffd8c30777547b42d01f0cbf9d95a770457698d0174b3ed71
+PYTHON_TYPER_SITE = https://files.pythonhosted.org/packages/ad/8f/21021859316f44289101638dc74d82e13d722d8533e4b8708a3ab7c8461a
 PYTHON_TYPER_SETUP_TYPE = pep517
 PYTHON_TYPER_LICENSE = MIT, BSD-3-Clause (vendored click)
 PYTHON_TYPER_LICENSE_FILES = LICENSE typer/_click/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
