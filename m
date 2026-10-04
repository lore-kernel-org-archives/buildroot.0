Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8130ECA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 08:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B8A8605F9;
	Sun,  4 Oct 2026 08:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5Cu2zRVg5YN; Sun,  4 Oct 2026 08:52:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E93796061E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791103928;
	b=j/AMimrQtwLcJ64wUu8H8VD/LOGGmzT4rjHpVICtaWoO/DvaPLNdI1wvt7tUi+eq8HBy
	 logyzXoSKdUH9C7+lShf9EFDVybRr2HqrcCYLFRchUgFkGNclt1Af4hjB08zOonF8+3XK
	 C/Kc0SrjMzwJx0mZVdrdyi0YY3pngcjHsiMQe3kPlqbC1RC+Vy4E8GANugCvXkm/ZcG4T
	 aXn1UCcI4LN4W6wtAPH0ZaDZedJlBtKAY6YeSftJ9c0eaMPLUeegUAip5Q/PlrarQ9H2l
	 uvS8AFJ2vVRM/jBzt7oJwtMdHKnst3uTh3Ki+UPOMMNxza+JJSalcS4IXESpeNYeeSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791103928;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IrsLrbQo0S4/ziLiXcM0y+87koyKcJpOAOnsThmls2o=;
	b=AF8/Za3T6Ld3jia75/WX6Zy0IPkiFWYpRw/bhvmylHBP47Yzdkf2r6n1z/jZkqTyjz7/
	 ZBdm8nj4fmzqR3UR5NLwJUpW4MwdBO/vgRaczZ8UN7kLAzZUPuPqSwPpKKNb5m5MNKntM
	 bxxzmYCdf3OBElwezzgML3oxK2vhreRkRqqtLiOuW7/DDEpeJy+4El21OXGFEsQzJRzGO
	 qASZrhsNhPkypZyqZHrlHv4LcnyloNM1lFagufRc/KbeIY2Q6yDRH0iDlIcjlg0dbBcJ9
	 CKtvlY7+BWB0xwVj2btIUCziagnJXww3kMt+9Q9ocgkQmFou1HhAfgSM99UENSSeyDQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791103928;
	bh=IrsLrbQo0S4/ziLiXcM0y+87koyKcJpOAOnsThmls2o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=asJe8XFEYy3kmUfA2rQr1VNHMJaJK54A6QpGwvqhIJa2FRStlG5ttNfgrbd4xFp8W
	 dOhMAlj0ezpMBzUSW0g+lFiq6IC5aSueuEACaLh1NTIEpmHPvvMoWh+jkZigtj9W5L
	 wFAs/Sw7L2z/lzDelI6TkPRmlp6JO4O/f6duiva+YSt9WKI6jG6jNp8AvnrfyNlCpG
	 V+TRwcUfyuPKjmpFI8gr0kxiXYKiV/WJZB8PnLT3KMg6uprIkO1mEZf/+dpK15nvoZ
	 sc3aJUkiKo3WJv/X+P87ufFMYbFyV8Gi6OyiLDl6+EELZQ1qVL9p+Nfj2wOguSdlgE
	 sPa36eozZQmxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E93796061E;
	Sun,  4 Oct 2026 08:52:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D952335
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F3E44008E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWrABRsR_dAM for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 08:52:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 63D484006B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791103925;
 b=r4ndFywP32NidJIYOnMSOwi4MWnXtnlmFqSau2YZGFaz5h8v+PSAF9yEx0q+A3qYA3tB
 dguRZxmxGjiaQQvoEnoxilBlrvwA4V4BWBvHU6kPYjmJSaXHnV+7oQHiI3RL1Hq1nH/vy
 bnYGqb+ZoubvgLHMdHXAenei5X8mJe/VRjQVHS+SXrKr59fak/qIH/mqv7UOUgzBFxYTV
 7ocqj7yy7VNVVxZ30PWsDOsO+azT6uI/WMXZIFp3BBi0ICfu+9jZmggnuSRcEF3XkSQAK
 5p814Ar4b3VTZ9vptNX+/SKk+sTxuBVGcN1VyG8HOmeGApMn1Gdd//oflNnvz63Q7eQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791103925;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=x9XrIJaBwSP7w6zHb3xfStcRWOpRquQj4qJkEgTqP5U=;
 b=KaHDOQ8N2rjBGrqoycjgohDa7lwNAjiYjGcSPpNqtaqi/0UGNz0eaXOTgTMYTJuiYSNq
 hdZ2InTlu6wB0KWmxCRKgQtmeJ4ELByySYj7VRRuXxVOo3xuSOPD5Aai08CDM1OgS/6MV
 m+iMbMx6APwrvAn1UhkDNtW6FoNcXpT87v0DSNKo84IFS325mJz2J/8YXf9yMQkiz8dM6
 ziEPVbyb+jMCIvfWdZtDQaarAJ45bJoDoa/+K0vtYPlOXWgsqjJahjh04IHxAeaAlR2tc
 dIeoSpHQRP2FvogW/9JELPEeTqtT/6vx8NfakQ6zyfhduO39fMxqCWjFuwPofu5by5w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YcEVO5Ye; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=YcEVO5Ye
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63D484006B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791103922;
 bh=x9XrIJaBwSP7w6zHb3xfStcRWOpRquQj4qJkEgTqP5U=;
 h=From:To:Subject:Date:From;
 b=YcEVO5Ye0b3TPVqF5zms4+Gmve2qnkpI7ogq779keDHu33ohYWWOW+/CFAwf7w/Dj
 xBtdbdBKp+6yIWtxwZxgHSHXyfLJihfYYL2vbMXaDpXaTwAxuWgkj25/gFOi5OPNvf
 QDc5cJq5mNCF4Fw445X4J//pnd0H1IC7pSOX+OwZsc4wekq8v16qp6N856oyTRK724
 YkaTN4NoOMkBLa5c6+BXK23d2fNVcvPyCYmz5nQVzHGvZrLoscHfSAxEDcelBoBa3t
 2eHyrnOPb5pddyAbuh7yZEL+CG4qeXHPB8q2kyNp+lkIsj0mRK2I/WHPgZEzjMH4gl
 JA8qsBOHrrDKA==
X-KAS-Sym: v3:f51bdf72230551df:eUWdNwHS488KdLrxKunf7OFcn2SpRGcSFFpPZKDpwkk0y
 Vx2Ha40iXUCg7DWqu/X6ZAbdxLIeRijV0gTFljwYOhwQM30X9hV3qVraeR5grwoS9zm/b+SX+cn
 3jWfE3OzmJidqNrudhUaBVUrHm2nU30TLMQhQNATJsDUhv1b/fWLabzYgHyo2GhalpfGhM8IlIY
 K7ZQEdUHl+a9NvjA7ptOecyUwtTn1oeEHLNOH0IYP69cTRK9NnaIrIfzFJ9yOYifmvcqDxjhiCZ
 TlSZkTDksBimAu0YDT9x0/vknZjkypeArz0pl2NhSipkpvui1Mlr3WfzlBv+Cx3RsTIbYHJA==:
 Sp84YC36PvLsHYLnbJ7qIZyyisQ+mu0ww1DQghdzokt3vBAEWXapuIju2CSMpo1eViK4xUW6KVJ
 g/F/nlUi2iqWlMf7mhbUtm9EXcKYrML/E2lsM5eafe42MxBCwFmXHpAgfyPkKV2waEYzAqfVKqy
 G/JjmyLneZnSVi5E4H8meRqZWUW+Mq9S0+NapLLBQySrstWLYDLRukc6BIr/+eHJrpxX5AYarD0
 zvcmc94oJ32w3CtyyTieUZuiBCXA8JUp+lk46J+K2sXy7n9y7e8ekfEV6Vc5smhDQ2gxI/Azy4F
 QNjE5Y5Fk4a5ZwvrUqYQyzOt8dRlU9GZpaEz76HmLF1Tsz4rhMVx1QtPY5xWWWxYpUVIUUEsEtn
 jsUEfrLon4n4lr/FSJd1XsErrFh+S1wmI8aBjzH7uhODaYO4/RjZ2XrJXTXdPo0gXp4Z5VAGukW
 aURoQcVSbYWYqsSgWK3j6mMscNBjcOfOgXh/sW8QRUpfv42JZLfFBgmzz3uMzFSK7U8dJaitmoK
 e7qClmYnvpnpIiDPGFmlMJONuC5AoIPD+zkElGaLfMaurf3bRp3xAYMwolOI2qCqC9Cw/FVuijY
 YiJMifrxWX8VV04WAO/PoXgHiYdGdDpRJlmKSPwyHOTS
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1435A4C538B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 10:52:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60126)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xDHww-000000003Il-36zz
 for buildroot@buildroot.org; Sun, 04 Oct 2026 08:52:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 10:52:02 +0200
Message-ID: <20261004085202.593973-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://sourceforge.net/p/fetchmail/mailman/message/59406635/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/78a350d5befe5a818605e8ef05c0eefc865d2259

 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 0fc6eb55dc..3c41bbeccf 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59396310/
-sha256  fff279d7ffbf4d9449110f715c0deb5ff5a2b13b317914b6f2c810ea12a0b7e1  fetchmail-6.6.8.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59406635/
+sha256  3dfc47192e76099b5614f2b2a42198cb41fa05d7ca9b5073e08c051e9be81435  fetchmail-6.6.9.tar.xz
 # Locally computed:
 sha256  48aea24325e55932dbd79b30f558b9c87a416d675fe5f94445e8be5cb6606fde  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 92cf3fa090..35f48944a2 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).8
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).9
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
