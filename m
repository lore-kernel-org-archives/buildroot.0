Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D77CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 725C8815C5;
	Sat,  3 Oct 2026 15:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PCSCfSetHqsq; Sat,  3 Oct 2026 15:56:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 820AE81497
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042962;
	b=DIjztqTQ7xwaHCZtNZAYxCcS8kQlOa5aaeq1ho5p9XscotQgNIAknHFHbsVMA9mSNynr
	 fO9KNyevH7DLhWDpDJv8tzSi1ICV4f0NkWPYxSf0PcrDmi2X2aFPx2NUHh0lyQ2Hso8Zt
	 Qc8pyvB/LvBNtEpUeonL7PyyB50Ka/mchhSNhZlBuOJnpv2Zrcwzl1uFBibB+NZxeFm9X
	 1L/56mkqYJ1e8cnBB3BzxO5EOXK46vr+VlPRmouXB8KIoPkzFQPTy5x4WYfOHZ5Bjn1+j
	 PKjCwpEMcOEzlK2ygWpsgrUtFa9SYid2TI4Ne5NpRBt3jkvHSXWoBAAeNACKmmrhOoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042962;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oZlQjmmOdK9gpSkXj6H3U/ROow1c7pFtZcqM6ldcNzA=;
	b=p7Cx6d9UUvZhfcF0t38Dwmem9aPCdtJ2OlnB6G5kQuojlkz7UG+1xkMELhJiTZRUIdAt
	 cHuqFAb1KGr1kfi8gOcOKl+NbDxbFBABbOGYhAzTO7rDbk84CNheOOQ2vyd9vXCGOTDTw
	 DDs5whfXWdUzNocmEysDfiPL0bgNTjjpoiQKcB3B/RyF5EisEHf4ZFCmZtsNvggwk1FB6
	 zOY94aUAwTb8/2YJfvG3BVCZH50mavY5Cm9/tkIgKGSPejeWhyhvVMeMQZhgQDriqZspI
	 ea3b7TPg5ydg+r4ZdIUcO33PoRrMmlox33We/M0KZGsuC3K+2eLfhvnydfVpBVgxSmw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042962;
	bh=oZlQjmmOdK9gpSkXj6H3U/ROow1c7pFtZcqM6ldcNzA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s4Y+qW5QhWQxQTITZr90VdmT2R2YCD5iA2LJsl76WWkXPyAmRAR5IfH+uqlvcmVb7
	 hFoyUXzmnNCmwhBuAvkWVITRCQEhT8o5+XGYObXrhufzUr3goMcOtzxOINxATYocIi
	 uQJJ/9WFl1NimJ5pjzJBPBfgC+rDTFeO7oXeOkgGqNodlpYgbig2gZn0ShhJdRG/s4
	 eaK4cFMIIpiCY2GwkuAqgAwB7Hq8ourrGsRY83MX66Npnh6EXsWECLRD750e+5/D84
	 0yMwHY2YyzHR66KT+ZwbUww1WNM2cPoT3M3USZswGYLRgtwoyzZoCZ1tHuh0VDmaq2
	 3jw7vPCl1G3Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 820AE81497;
	Sat,  3 Oct 2026 15:56:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4C2F476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C917606DC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LhaCJzFSGiZ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CB8D9606B3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=NbGUclOWDmEdbXntbzN4b3YpbFWCPTz/YRWSo1Rs/6LqXy0UxmgBrtsQ90TETJNbP5Zo
 zbfiecCk/KZy8joK+oqOHQFuQYNEJi7xQQL221Daymqwrfjmwujdi1/gNJSOK3bZz8tfD
 ZCCsm/nVbqRAXdXzYZ3QOQlfH4cmzs7LY4dX/GT/9q7Ev0eV33ynEgeNi/7tmu8Ud/5Kz
 J2Ay0YC/NoB9S37mDoI69Eu87UK+m1T0HaandDtYXFrXSI3CxFqixEfSjwauKCc9x/X5G
 ugFsNb5+IFn+nba7pkqN9Tb1RoEpqfwq8VZBq2g9yHUIL2QUSHsQXjE3IsVKoDpgsHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pvfjUT0PFfdjbfIXD2whW0fpUBFKBxjzJu95liTVoe4=;
 b=e3ZBWAASGxRA9ZPo42WzNw8qPty+g1HbosO4d7XYkqEQ/D7fSSzTCnGnKLjGaYfWSTYb
 Qm99D64j96U1PVEXXT3eHL8g7KSNkr9G0EZCkkq43bJfBwfQ1Z3JlFVnw3hFyuSFMzhdF
 9d+P9KUmLu1M07nJtT97T5lKJJLzYQg912uRhymKEURth2zBRaQ+n4L5qoSBWsC2Zv6SN
 jEGq7eC4INB+a0YsxcESD2FrEHRz7KMqMaQD93zq1wkku5JzdUJaMj/IHV65XExska1T9
 S3+dYu1pnazIgkFdk5sTIQ+GA7yEcP4hnEde8V+XJOq03GdztTVRkOJryRKwoL21NRA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB8D9606B3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17E108A30A; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2982edb3103ef985a6c8e78316342dce42570664
X-Git-Newrev: e325baa39cc45b350ce142e1e209a134a1d62355
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.17E108A30A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-twisted: security bump
 version to 26.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e325baa39cc45b350ce142e1e209a134a1d62355
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/twisted/twisted/blob/twisted-26.4.0/NEWS.rst

Fixes CVE-2026-42304.

Updated license hash due to copyright year bump:
https://github.com/twisted/twisted/commit/ac504cc8088734e0bcb8c9b372d52534bf9252e9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index f3cf53bcaa..beb1c7f3b5 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  845d6782c2236ef764f3849948f4bfad  twisted-25.5.0.tar.gz
-sha256  1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316  twisted-25.5.0.tar.gz
+md5  931ac3e39a52c490f85d36bcb4c77369  twisted-26.4.0.tar.gz
+sha256  dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9  twisted-26.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256  16b7f6825ee8aaed193e7fcfaee67ab493087302c700483f8991f22b70c539e1  LICENSE
+sha256  d7a2f74fe5c2b3f610052b75b5a131728c49823b28088893dacacf8d58849a4d  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 8db5d3750c..09198d2afc 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 25.5.0
+PYTHON_TWISTED_VERSION = 26.4.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/13/0f/82716ed849bf7ea4984c21385597c949944f0f9b428b5710f79d0afc084d
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/db/97/6e9beb1e78247ae6dc34114f27d538cf2cb183c4afcd3609dfdf2b0439c8
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
