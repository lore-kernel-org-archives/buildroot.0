Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB47606A31C
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VZHoPHWv
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16AB64069B;
	Mon, 19 Oct 2026 17:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-CoRCZi6AT3; Mon, 19 Oct 2026 17:32:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 242974069C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792431164;
	b=LDMaFWOtN6LBNLZ3aRpmYoDtbqKgauBZk7kzA3en09UXOrH10D1Vviu9cD8bTbEpyRGp
	 j5EWdGjzKPxFNZO59cX1uxpslM7kZcUFFsm4lcsplT/mhmO1HlbfBVZ5QRnMNxGK773wA
	 e4vJxg5iFbJ3kQbnKJM6pPsdYmbxOfmA3VClskCgRWvgp0/VQ3iSY1Jt6ttdFQDJ0iZUk
	 5lthgEsD7HuBqpPk9d4PAJTpjVFaYmIwDCnqyvFOKdcxwLWMA7mAflTnhuQ5ef09sVYXk
	 kNGWQ05G6W14bAPu92XH40WNtYF4lsQ76lWFMZbTDOqf6o3wlY4j63tErGOG9eel+wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792431164;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OO9XLjDJE5kZWyeYn30BN197KmHsYgMhlICncx5iQDg=;
	b=Qt4u8HdKClj0Cd7wppcW0vAxk1cseM8NQ81AOqYoKNbr+3jlRsoNvTLym1B7XkPxCOo3
	 zBbdMTxLtT/wu/ScTOgLXcqkEzOfL+EsydRFkuz/UJobxLIOekcZ2R+Iwm5tItFdLqtsZ
	 LOwQzrwngb8az7fqSNN3IjWT9A7jsWmFZIJvwNvyW1qCRdib/bM6lLXMbrpqO/BxB1JBe
	 7CfDU9TmZXdNxy0pQBR1KNrGUzKrunig5kIwq59pLtjuwof1qbOMo4BEmd7aHuBXlWem3
	 lGk19kwhYAT7CsHtfgF/xskzelg2ieMErn01HU5+XFu13YoJGfL81AGraQG1Ae2CbHg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792431164;
	bh=OO9XLjDJE5kZWyeYn30BN197KmHsYgMhlICncx5iQDg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VZHoPHWv7G0/5ezPscDbU/C5tZzzg4ODw1b7D+/srn5+Idq+VFzNtstLrboG8Aq+B
	 WQkYUlz1gOoIeqlQryAWVBjV4Z2Yqx7zjjeTDOL7Jwr2NflmamEINdBotrqa6d8g8j
	 sr7vc0LccPZmK/jWezNWhHT2iM8oxNoXsa8ZrKkt+FCzQ/HQUu6SeKlMb0i3z39MH0
	 jJ1k4fLWGTb94J+3+i8Ln3LVtHAa0cyA3VjjLzVkzjZcxpoHJqNXa3YTpLPIO7dTCu
	 y4CS9E6HfTnJNJDQZ9Ny9cuhr3vX6LIDQ3LWD9F87xZ5H229ZWyhXr0Ubw/qlv95YA
	 MCg91HOMtMmwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 242974069C;
	Mon, 19 Oct 2026 17:32:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93B771DE
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8379C80E34
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaCayh79pW4h for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:32:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CE37880E87
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792431155;
 b=K6LTpgfHfY6t/f/9Ge6kLr7QJaRtW6FVFASJeV2mzO+GLYIhSxpbgwp7QEwjKP7/L7GK
 1nETht9pKubhj1aAi3x7RleyaxgDhvZ7zSbeUcMJv74UYtrrEElU9IOU2C2EOgjIFydG/
 LSe8+wXTHKYZSVii0gCxRmei0MmDDVFExuFX0wUIWgq7+q/lhLQPFIZ8213nni0Xu7BaB
 6lBcWrblTr8SkeVHhU7Av6Sf0Mv3QT1hyEI+/q1Ma87Jk36mRz44kRWENk5CI0SPvwWS7
 1eViyzspVxl7b6gLWpNMExvvN/o8HXMlZUWDI3GqwC6gmm+NdumAL9BnUjghyVOkKtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792431155;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=N/7uveagq54292Hb0LVrfLcA8ud19VAnVBETDHcUGOA=;
 b=hpRCWcfeset9SDtq9xOXAwhkdr5kXo4QxHBQdpv+6T+5FmK1YnJooZUmnHMc4jSv1JW4
 B26821/+5BPIWdWQqpbhduObANuEjoENo92nuunSrY1ISIvfsKuZKZqyEK/V1Ei1upFF2
 JJJ1AfWZM4gfov8GNFDVIcv/0RuRTO1kCsK1UJ75kfj7H3ZoI7YAd1x8IDfFiS27AdpcW
 vvhbM/wkrqqRuTwfnn76paC9t4Gffn7V5Wbc1a7UwQsbUpV4s90IpzNGUt8vB0GROk9ms
 QT7ozKifSPnopSsdojS+LZT2ITfwSxmCq/epv4/FpXPM3/+XeMs9b/whVd2OA+GVkoA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE37880E87
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36BBF987A0; Mon, 19 Oct 2026 17:31:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:31:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0db8c26518d7489d1e09749a8dba8474da589e6
X-Git-Newrev: bde0ece5c21deb6e9f50c274025a98de4e8f40c8
X-Patchwork-Hint: ignore
Message-Id: <20261019173113.36BBF987A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mistune: bump to version
 3.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bde0ece5c21deb6e9f50c274025a98de4e8f40c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mistune/python-mistune.hash | 4 ++--
 package/python-mistune/python-mistune.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index 1dc3277c31..a96d43142d 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mistune/json
-md5  d04c3e2670b837ddc418f3a70d4357d3  mistune-3.3.4.tar.gz
-sha256  58b5c96d6fcb61190dfe5fae498d2b2065f99cf61e9649418fd54cf1ada86dfe  mistune-3.3.4.tar.gz
+md5  e1d93cef6a725ca96d983f0022bee284  mistune-3.4.0.tar.gz
+sha256  2eaf7952af928ca8d33b779762effc1da517b62c6ad85ec8ca957e3b07b9782a  mistune-3.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  539013fd8e19f744f8bf0e27a532bbff54cd689ecef7a800f56ae5dc824be870  LICENSE
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index 30868d8e47..5e72a66842 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MISTUNE_VERSION = 3.3.4
+PYTHON_MISTUNE_VERSION = 3.4.0
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
-PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/7b/92/328a294a6de83bacb95bed01f04e0eaff4e3616ee359fc821a5dfc539b02
+PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/96/eb/749a4e69bf7396e751ae37444abe997eff2254e695a8095b84d1c89c1181
 PYTHON_MISTUNE_LICENSE = BSD-3-Clause
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
