Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C47CC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5F2080F64;
	Fri,  4 Sep 2026 16:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkWrStf6Z1xD; Fri,  4 Sep 2026 16:22:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F15D981161
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538942;
	b=U6gl3zB3/QkUKpqPTMah0zcEWdBoT5W2NCOJBFCaM/MM+/bWE9tcgNBu7pT6BKAw/Ybk
	 FmYMplATjWjldUdQWIYtoAtGuDgsDAjgRPlarTJ6Nil7dK1IYZKMKXyu+b7f7GvvRuNxX
	 /IM9S4MX8O9J23i7y8Lr8G2u3aIr/sawfzFfeNRrJk82iYFt/wTgM9seAs3DFjmHiQxqm
	 sPzfl1ehi5xd7hYZOokuzmLdp1JSM25tW8MtlzjCtVe+aWD9JxRkMKHWRB1AVA1Vtw9/r
	 cciv2sktN1cvBbvWjfWy+7bbp1Tsa9Fs4+sEGaU8sz7SlEen6Nebm8cSyXln+KAAAZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538942;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=E4LO7+LmBj9NBPS53zuUaRS+kmIT8rFmPmcAe4Ty3Bk=;
	b=dehFTs7P3q+eW/TEqZDBkIcDRzo5xRMPVslt17mu+g017CdwJRCmM5yLwewzRb6EteL5
	 PzoYCkfSUUdNNqe0/JqCsHi79Ahn69nYiklSonKN3PI/36w8TTHrXGAiuXRU0YcI2q88J
	 3mmpRgodZARc+u8yBd/+2js5OKT28rnbrrsCDunPhA3g48PTXHWsLku3PaajqVEditKlB
	 1jvbLCjgGOIApTOjshdBND927qARvBMbBSVLaiDjcHPVJKkGmmdGhJ2MtR2NMimmVbKOm
	 F0ZrQFmeL39/MhJIRFVATfU+T1bCpw/JLxjYiEz9XBFr+IcPvknCV3dESTgDBckRlQQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538942;
	bh=E4LO7+LmBj9NBPS53zuUaRS+kmIT8rFmPmcAe4Ty3Bk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AgBX3oShotC4/XXaWNIPD1kEw2/t9UhvHWbYTCcYEHfIwEoD2ilvY95JmtYunGvPo
	 1+5IAcMMo52W3EtY9YNXb0gtSoekp/TaAj7RvllX5hOxFQx92TOIY5+oFitssSMTE0
	 v2GlffMEbxg7FXQhcxqRDNRwJ5ZobhYSCeM1FQK7zdswLOUKy4KslLqtmbEBHWY3is
	 PsPB2znEHtiWX/JHecMxC/GnhoJ5ww2Uhh8i1e/yJJMCVjBZyL2iWDIEc3aoAJCYnl
	 LKB7hfvrVAwY1CuUXTRHoc67LrM/javLs0XY9XVKQKZ7uw4eHML3xMDYWwYJZt4eBe
	 vzEsXdybTJ7lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F15D981161;
	Fri,  4 Sep 2026 16:22:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E8B0F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E74740116
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8ME9mOOU9MV for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4E9EE400E6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=nr4rslDdSL8/+r30bmi7UaKzkZ9RIzFIVe64trpAqT9ojHiqwOn+5AxSO/6zDacea6Ul
 Z4HmXdxZuS4NItxuGciw/xFzDQqtGPOkheHiD5zrvIoBaAv/HvmSeIHFUruggcYddRkq2
 EXoBqg14FG9byFk+JzsYs7Xz8oP2qK52CvUijIy2hx0ctHMUh+aK0oYMrGGPCi8Pn1rma
 8vGIBdvfol5R2AA/QRl4OHZ0uMUCwtwtlEEcJsx4A/sjBntqNhzigfgWAGWF8nsHvCpjr
 FZU2a5SnkRsKWkDm9saA5DkushUGwvlSYdvHpLbnDvKb7SQsCK9AZXFSh8V+qkLxcgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aeP5jybjP3qrXnT9Ic/Hw3Oqg3NIkOEp4ACzpf7Hymc=;
 b=MShyXc/d9semZdRulhpwF3TeH7VUbaAJtxvmm3/rRvY1r5UCTRQ6eBrUHTRivTZbGJxi
 +3liWig7TXE0tVrtO9aTJ7W8a2/D7Eg9oqDn7cvn9HbfAjc3hZD5OwxXVyXkqNyyI1Pc0
 KbbW7oqKl0GPskJPJR6xCJbsq+/F9Tvga9Crc6UvTmpCqxmPmJLHGArMnjoYNXj4klf7B
 10UPgK7SIpb5Bl4DarsgeVFaXWB43aS4JU+p4uf2xnvrQX51qyqMxJBWPKBVKIOyUlfWH
 fWvwgJaknhT6C0PK0dVNIjE19p0pojzjexUIa2MgtQIQw/f9ppq6AnkRYToWEw+mTyw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E9EE400E6
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A19F294CE0; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 23:08:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 009d34015b44075e15c632a514511bdd27074aea
X-Git-Newrev: 4221e786e0be6efefc4fffbf1ec4ee2c4374e608
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.A19F294CE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnspr: bump to version 4.39
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4221e786e0be6efefc4fffbf1ec4ee2c4374e608
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://hg-edge.mozilla.org/projects/nspr/log/54e7c1b0803d151e142e30dc0d05f12e1ec67a13

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 9148cf393e..9a0da47e23 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.38.2/src/SHA256SUMS
-sha256  e4092faeab77bdc9b32db1113e4215948ee768e26c4666db3b5a60b35f2c9105  nspr-4.38.2.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.39/src/SHA256SUMS
+sha256  bbd02ee87a55676063a63e5bc819e0227de2666b47307b2a0134414cdf42368e  nspr-4.39.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 3c7351c2d7..49fcf30640 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.38.2
+LIBNSPR_VERSION = 4.39
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
