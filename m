Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2B0C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2324D810F7;
	Fri,  4 Sep 2026 16:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWqlPvH2xTuL; Fri,  4 Sep 2026 16:22:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 42087811AC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538956;
	b=COOG7JSbtgANfsY7LlXFcaq4hpyrLDl4tGmSpOUAJbeELVQ3I9LDWMF2PNpGfA/Aq7Rk
	 3y6DiUhjNPnGwHCWXksdsvPkPq8X4slxiQFTGaD6ElnV9Ils+MA/BZIT9EZwG1wTqsGvN
	 5L8j1mND0lpCupVbFLJcGDDid1o02zVlWInwhn8/sdoZibrU4s76wPvlOgwThYwNgHrl0
	 MYE53NaXEUhatSHv2WthV0C0qxPzEGNXvFHSReM3bitTmKi6yprrsRiDP19SDbYW4+HRi
	 VjoycuhIWS4pauSw4WZQeZ2veoyRiLCgtsDD5z6ozXf6N3lReEPBrQH4uUzWOOnoclQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538956;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hHDXlnsEToTzaFC6uYnAsFYBPUM2zHyf24Px6Aqy6rI=;
	b=cCZokG4twxM+b7MxlkuLYubt1p78le9GC8wzGTCJxDKvH+tPX4JlfR+7LRhAvTDxVVqr
	 NSFxhKu6VdFW45KbaexDhiYGZfxAgtsMHFxeAv7u+20/LjZInV7bFbNQSsR87o6QpScRv
	 plYn+my4oTe3ENuWS2C98egl5IutrELFJ8LU3MV4JvJ9+eVI6Ge97qe5OIAANWF9xcsvv
	 /HftkufEUFtEFEFfHsOH1Fdgn3rkmsSbqJ6fSvDe2fcG9RKJ7fFQH4pKz+ajXXW0if2FP
	 d5qgqVPGI+4P7aYe9xgCsp4HWo0rlIXhTZG7DWRJlHbe+lj3wKM8MDgi6N+kuL4S+pg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538956;
	bh=hHDXlnsEToTzaFC6uYnAsFYBPUM2zHyf24Px6Aqy6rI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TeeXIkqCLjLWguna0MnYYiHMREgtXUa5uVDRN4f/GXA1KRKEn3q9Ht/8eDqHuQOaL
	 adLDiPUYdS2O5r0BftL9GcsAAy/H6907KHUYZ2oZK6RukIECKDEwn7a5nBAnP249uo
	 TZ3iAgt9XPHhHV2JkfsQ1hfptPv66Exbr/1IcvZtsv0wLDf/6c1WTMP+OsyvIIQItF
	 S+1wxAajSnDxVYN2hZ/0/YL88alx+KIiFIJ8v88XoCdIpkpZmMz6oHwIPG2Fl+cV2W
	 4z5NCdQSni4s8m67k6zL9bFdQC9xvOYE12QwrOtsGoUUmcZ3rr55K5Exr7rRIcSvXj
	 fmgJWBEQLNdxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42087811AC;
	Fri,  4 Sep 2026 16:22:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C43DDB2C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A996340A88
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99-DB2b01yEo for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9EC6E40AE8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=QTOCKBzr4qTsTXD1VuAfMX30K4OMgOns6SCEs7XRa6Hw2Jy+VzKGbbFAY//lRinz9KKa
 1QUzhy8YHwqyKycDcN0oVtfaPUeDBe6kZ4BJ55bVPJjbkRJUWvRezp84x5gKTtenkGX0b
 TOz1v2SQSF11J2oOayKsFxap8S4afy4h6cnFNoPGBRptWTDC06AGuw4YAkq+9jqdR3uwd
 1H/E/9QC9CxQbGEKg6sST/c3XrSDsjGMAdn7s9OtqMVepfcA5LQ8E4m8W9rYPd4tJPFge
 CNwntFSDuwyGu2qL1v3wt26KnOjOrCFZkyQe7JqjFo3wiXT4/QSDwBpISMGPESP8jYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rlK4pUb7hoKI2b2Nt0PH4Xm6y/aJUf3nv2n8NAvie40=;
 b=PE3FRLBbmGnCNVmErgwidnipfIxGbgPBsS7ldD51royrTjKZs8orOprveSjYDxQEu7EZ
 9j9Y4cH5n2hjUf2U+t83+j9qoUpGpEccKjCV5/y1SOQC6QkxYLldYM6j/OUGcjSQvojdT
 zTvVjuhlQUdLDEbzafdKtzRVTlZ9tAW8nLjekhiC16e+bbKGPiO4HSrtiFnqepMudb5N0
 QU2zu9VSdTgGPLbkeRS+EkFoS93Dtt4LvjAZOxCXc1ZJhYak+x2Qr+mfWV43OxKmTX6JI
 /kV0IyYqbFKi/V5jcC+HIj3z9oYMBq4g8fgf/huda/09NTu1EIrb4tfZrep6PHkCejA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EC6E40AE8
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CB4194CC4; Fri,  4 Sep 2026 16:21:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:57:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9c340a3947b7ae2c415bdbee6f76b568a257424
X-Git-Newrev: 1982fdeaa4aa3d5656717bacffc4b1e78bfd6b26
X-Patchwork-Hint: ignore
Message-Id: <20260904162107.1CB4194CC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gensio: add portaudio optional
 dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1982fdeaa4aa3d5656717bacffc4b1e78bfd6b26
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Portaudio is an optional dependency which is enabled by default since
version 2.7.3 when alsa-lib is not available:
https://github.com/cminyard/gensio/commit/71eef5e3cef2232eed85c5cb604bdf5fe3ebf580

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 0c3ca5e03b..40cb0df514 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -62,6 +62,13 @@ else
 GENSIO_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+GENSIO_DEPENDENCIES += portaudio
+GENSIO_CONF_OPTS += --with-portaudio
+else
+GENSIO_CONF_OPTS += --without-portaudio
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GENSIO_CONF_ENV += LIBS=-latomic
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
