Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F8DE95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E3A381BFA;
	Tue, 30 Dec 2025 13:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cq2V2Xe8rIJK; Tue, 30 Dec 2025 13:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB3BE8124A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099630;
	bh=dQ5oxiOCM6L1fZFT/lW84B2gSPJAMEmrI+GLa/VLQUM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KCEkTYMNemn+0wL1VR3bpzqek+r5ipLcJKam5B96QWFIETvsH7COR/wlGYJZseCpf
	 YyT3UnNrsMIDxMrB933N711QFNgGi89pVq5hBgvKlZNDT89/brGZnL8crfsx+POHsv
	 wM+aJRn+SP5vmhZi+PEp2TDUhQYHooIyT18VV3MHdb8JBdMxs6HoSCsMWoo2zSGTIT
	 rxpPM+kzjpFQrwoTtl8VlakxFtKjulRLGeXK+UVP8Zx6EN9A9W1Fh7IBIh1WtSS0xt
	 XvuJwvOHNN1i1sEVz7kjgZTnUWuGDR5R+XnCRtZIL8OEBWGdDaEOUHntAJSkkCL6xm
	 Yr9OOs7d488Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB3BE8124A;
	Tue, 30 Dec 2025 13:00:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02D2F375
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDDD481100
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pugGuVVGjAh1 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22A5280F82
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22A5280F82
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1006987A42; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 13:44:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7b96c97f9714baed16e23059d703facbdf155f4
X-Git-Newrev: a11a8784c0d84029b85a3d0dd05260ea0854e5a7
X-Patchwork-Hint: ignore
Message-Id: <20251230130026.1006987A42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hatchling: bump to version
 1.28.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a11a8784c0d84029b85a3d0dd05260ea0854e5a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index bb19d63561..b6fb2b6d3e 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  6ffb3087c9b6a9ffbfc1bb394f7ed1a8  hatchling-1.27.0.tar.gz
-sha256  971c296d9819abb3811112fc52c7a9751c8d381898f36533bb16f9791e941fd6  hatchling-1.27.0.tar.gz
+md5  0d40370d4684147d6e3d1e3800298bd0  hatchling-1.28.0.tar.gz
+sha256  4d50b02aece6892b8cd0b3ce6c82cb218594d3ec5836dbde75bf41a21ab004c8  hatchling-1.28.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index 57fd34530b..a5a29aa20b 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.27.0
+PYTHON_HATCHLING_VERSION = 1.28.0
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/8f/8a/cc1debe3514da292094f1c3a700e4ca25442489731ef7c0814358816bb03
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/0b/8e/e480359492affde4119a131da729dd26da742c2c9b604dff74836e47eef9
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
