Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76068606A320
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 19:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f9ld6pgj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B93F40A2E;
	Wed, 28 Oct 2026 19:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7XvS0YQUuxU4; Wed, 28 Oct 2026 19:21:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 60EA540A08
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793215278;
	b=R2Xe8AypSIEnv20/PoXv9iwaJDsYVJ4smjlmjLkLHjy8GexPKfuon9KbE3p6lHjBEq3m
	 +U14NBxRV0iA9PbhYpGMnvN32NaDedO+BJHXhYdW9tpP7iiZrtJNv8Imnyft5zyRzJ6XE
	 4k2qbcFltzDy8pLMWMRzW31sjxtR2vZVs2DSfMThWi9M6dMOF8j7LgqfYlCwm6zM4zER/
	 TgkF+aO9jMSecIqdBxPnB4Tv4Wuet6OpjfEFJts60O77HcXbnuvjplHcqobns5o8oLMwq
	 n8WUSRUFagnQDn35Hh1qKnP5MeS9lddsSWamQ2BEQHervpasDBStd9d90KogV2M/r3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793215278;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SuGM6/guMuzBgGZnZ73udnh/8zKrCfTz9je+QRGsKCk=;
	b=Tq+2nGM5i/sU4SKaHQCJ2KdOnHrwsPmqa5gxhJgn0aTxZrwDwbrhQquUdLZjxAD0HzvV
	 8cPFsG78/77hTCiOcAtpJlHWbdLYrSAviErLwi8d97D2OK1rtcbYjODdX2OosV9r510eh
	 T0VfVZYw3MqvLEt+7IvHZmyux0dedKiCNjoIXtPYDtkEVl/vP6SX22GmDxvxyxVN6REYY
	 yNafhOrneYNKwXjL92udjOzqLion3HRxkbE4L6VPOwNauHzfUmJ9KmznvGXQu8hDtRy1y
	 egqCWWgjYTjzDtwU4Kp1C0dvTCfcWEwJ7VBTOiCzeVysbqBF7ScT+xeBu5BXbWRz2og==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793215278;
	bh=SuGM6/guMuzBgGZnZ73udnh/8zKrCfTz9je+QRGsKCk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f9ld6pgjud14hpbi1N/SWPVxAZKNoVPWsc/EWwyFHFc2aqiodBOKEbzG1ZD2ti7yy
	 JfBHWeZeJpiNpus2p6fvzzXcPxtijRNW+zG5HMSuR/vYIqhdGdhuxzD0h0Db002PhG
	 cns6Po4VJU/Lrhojgozn1QiVxtys57BZUQYI1Oxincpl/X7Xvvq2RPmkwZBT4ScxX8
	 DEFGcfW0Ftp+XkILRumcWcN49015cSx/2QcPQbdUquk9LxvdGo5JTTYrXuxlqH2i88
	 CsLC3Cqd2ClkcZKEfeQlh01XSK43kXYmYKBw4OXcDyhtH+mnP/ED6aYRVG9RGVKyEw
	 Yz9YKU2KlcBSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60EA540A08;
	Wed, 28 Oct 2026 19:21:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 208E6120
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02B3C8186B
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-K5xee6DASd for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 19:21:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1BA59816DC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793215276;
 b=FYf29O6rFRlKNBhKXDgKGX2cUk3eMyKCsWcnaESLdoMynPPTB8Op3pUWOlv0dg0Rxotq
 64j171FgDTU0JH80ZfigOs4gxHtes56aB+xLX8UH+q0FwBZunYXyQUCpI/5CfU2LPvBkJ
 EHAEApcmkbp0tcw32MjSDaCM10YOmdt/6t7XrEaEnkVYjoXlwdUtr9UkF7p9quFkihRrP
 nAwggB4elD+RJI47LxlybqeXBdB085wPTehP2tnnZP2h/m+gRtshkjHEv04Iqs6SXKilH
 Df8S/W3p/ovHupW7KPbBZgDmkADG9+6ifH/8YdAXhx87XPaBKWabiAyO5UNfDXHsOWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793215276;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SvE1thUroNEoSWgMCx+NmjrZmaG9Lg+YofLVHGWrcBg=;
 b=T+RjSVEtp4Wl17fOuVR4Utu/nFnhL9daz1AIgJu6569xgo14dFOOc5sVjihPX8ZN6cWO
 P2UjIqABNSp5bg7xfZK/5+dA7Fjg7s3Bs25la9j4CvYclqR0Ng99W+7VTdUtMGHwrtaQ/
 Wz6tg3Z5K0q+M8MzqcA0LlRMXBC2rus019/SjXkGixmsmV7/Qf2liNJ8hTXxYUzr1QmPn
 i5DlIrbQpaF6ONSpWt2Ick4uw5IPvuEkMP6bT3PW//0NuFsDH6n9Z8cIub+NtMKYIqA8U
 hKR8LT7qgSSP9KbYCs5Mrw331KVcoteOpzAF2EvJZlBb6wgcgSBqmNmbgUmjLvA0fnw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BA59816DC
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:21:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11EB29D232; Wed, 28 Oct 2026 19:19:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 20:00:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d2b3e19bc26be5a60c9a05825e29e43602afa85
X-Git-Newrev: 7af7e73ca4b485ba77105d745feaae4fe93cb45d
X-Patchwork-Hint: ignore
Message-Id: <20261028191949.11EB29D232@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntpsec: security bump version to
 1.2.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7af7e73ca4b485ba77105d745feaae4fe93cb45d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 1.2.6 (for details see [1])
- fixes CVE-2026-102486, CVE-2026-102483, CVE-2026-102484, CVE-2026-102485

[1] https://lists.ntpsec.org/pipermail/devel/2026-October/011062.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ntpsec/ntpsec.hash | 2 +-
 package/ntpsec/ntpsec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
index 768ee75a86..4bfe81aaae 100644
--- a/package/ntpsec/ntpsec.hash
+++ b/package/ntpsec/ntpsec.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  48717ea84a8c89bfa082ab5d0dc58b44e6328158632e77d2a74c85b7a509e498  ntpsec-NTPsec_1_2_5.tar.bz2
+sha256  c82f213532d2a5b5e9c368127287ba69a20e3116bc134e64a5c767f7c96565d8  ntpsec-NTPsec_1_2_6.tar.bz2
 sha256  074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff  LICENSES/Apache-2.0.txt
 sha256  991d8a58e0b4be84a174a9bd333a8ca33807a0c1ce6d23a2e25a21f7ece482d0  LICENSES/Beerware.txt
 sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2-Clause.txt
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index 0fa8a3f527..a67308af4a 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTPSEC_VERSION = 1.2.5
+NTPSEC_VERSION = 1.2.6
 NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
 NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
 NTPSEC_LICENSE = Apache-2.0, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
