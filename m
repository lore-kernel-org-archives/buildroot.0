Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D930606A335
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PNnXVlAp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Zrirggyu
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF48407FF;
	Thu,  5 Nov 2026 13:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvGQuifVKEEs; Thu,  5 Nov 2026 13:23:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A31BE4087B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793884987;
	b=NZ5Y5jowRb+tDve7BdXcGjvzzKvp50UG7JVVnAb7wD8MBaRA01t+B6MS9SdC4uOt9GwW
	 1P1DoyNGnY6xZmj5MixyzlU53n0SwFXPaxBCx8BE2JblHqwlUGGAbjyOy7XFDzpJ4L4k+
	 9T1WP+wJV6eCwYR3snO+Brnu/cRbde1xDxdzDsTEkSmQouDU2krlCIcQHx4XDtkPquDZQ
	 GoyqW6TiBne7m5f59Eus/WwHfRGl4KyisLkjTLGK7wvzZYsbnCJzhqg9s5K0Wo2HXJtaI
	 6wWoSH7QX42q1sMORW2FXo8krQhN71GjCNJDXOkJuFpxSh7PVdNkrt0eZCIXuoG5mHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793884987;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=TOyGFqbwM0h7ZeOQWdRIi0/NlqHGrBncMuapMezohgU=;
	b=X5zL9ayBaFS3oT6ntrWAPvnxOK4M0M025o3EReXoeUKDpP45xfTFIYjQ5l4o5y20F0Uz
	 NVQmnuyRDBIKxwtGdOGBr6WfvzWAU9iC2qcREQXAwJrKtOxpd2V7F/Kg5ET3NFhL1HStE
	 3SDWhDbgtslgaClDZ51euxJ8CMvTZGwf8DDMjEelbtS5fKzG4xLrnm0KfCKCgB2ERo4Mg
	 d2A1Czvj6ukoYuJ65MaFzBW0sjgWKatNqx5a85bpddo+32YYUE0D1IzVXr8pkFz81qJ7f
	 PLKQEtZ3WtR9X0p6OTUfIMOpanhqousvcDjkNePfqleHq43HAFVajwc0GIu4xzbtuSw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793884987;
	bh=TOyGFqbwM0h7ZeOQWdRIi0/NlqHGrBncMuapMezohgU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PNnXVlAp1FjCIJYm0VdzY9Kh0Nob8aw1tMARle61vDKqNL4KHTFkRqzb/jpVXhcNC
	 Xr7Djn1LQFyk+7TtLFeGmiujeClydfRMlD36LnX1Eo8Ggkdv8hI5+JL8UxUhZWESjx
	 QF75oLbncKbm7bpzTj4+7mNnjNHHk166tZly0Ghbm0Ujq5S95WmuSZFLsi7TZtn6bZ
	 zMKLllCRWPDfXqmUN6NGeE2OuXRAO/MMXTDzGqtV13xzkhqgQHL/pQC4aXMq7gtt5l
	 zboi8kk93zEh3LYkPy8eQBrThiPGO1jjNaQwlgl/oLdPf0tzbbVFFaVN0zWxDRbnzz
	 dgfuwzDGmksFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A31BE4087B;
	Thu,  5 Nov 2026 13:23:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D283C34D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C45CB400F3
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weWBoZIOWsPE for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 13:23:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D1F714007E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::636"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Zrirggyu
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1F714007E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:02 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c411e139259so207441266b.2
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 05:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793884980; x=1794489780; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lJ3s5F48PNbr13u7lOSZtoZPE6GGXyA/3zXR4HiCwOs=;
 b=Zrirggyukm98YF+JIEB9LBiavmP8EeisVisVthG0dpe5pLjVx1vHrG/wFOR1B6FsRP
 llXHsdYd/KeQnRoO7Gp8HD4dni1zzzH9LHLOVOEJ/w+CC9N2O2W7HIWhWVVemjClDYdf
 ILEgKPUc2kIangoYPfBiQKlncy/MYSYruzSBgsbWKpyWIbF7piQo+Se6DGQv4ecSlaMD
 0jwzQBDT2SSTZFT2fQ5LNt/kyO3N90rMRH02Ns7g/64k38ncPIVwPetrqOgmjF45E//E
 eGh7lfSsa2b5EFw6SlezwI8E1G7nzmm7KwueXLPfSgHeAEjQO/1LeH/ZiBxHkc7owB5s
 kHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793884980; x=1794489780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=lJ3s5F48PNbr13u7lOSZtoZPE6GGXyA/3zXR4HiCwOs=;
 b=Qc8ajmTEqRkon9NxOztbYqM31D33L8CUr8L5u0TJ04EACyqv4kJEc/cASd7v3nUMym
 UDunwDwLmxBa3OYik1aobnf6tOFnkoE4cvirelAztfGq8kmlIVcNcOm3L/tvLFQkH7Em
 8Dkf+gczQL8q1ZHuFm0ys5UWbEWB2FP/IPJjAsHwUV7sJy6BRmkTfirYH0qEf1aN/LyK
 pgAOKlc/ySAPryAVoARP7JWSeP1D5WdAJ8oHtK1W1l2fRJBGyUq0lFlKwMJ+9OMgtXX2
 qoz50lZkJfm+b0aMA/xLaIAfKkU57wOkJjXBOBACr9eimbfSAc7z49YbUrUv55bRJFG/
 t5Zw==
X-Gm-Message-State: APuU4Z8lFHp2NiFZWXpAXL6snlSl5R8EPUMu/wJzWLxQiZ3Ze7auxOf0
 1QONlsWfCgPSJ81tDaL13R7kHVlQHDwAHwvujqAqfRZPj84xWS+lLZyyfe/EPw==
X-Gm-Gg: AYBFou2FiwOdh6THtMs7ejcm8KLUqzQkrkt+8xzFXkBaGSwtWOj9jRyBuDGczEanr/p
 FMLo2lBS7cjtREXe1MjoeASyPHK0+Nz4Ma6OycwiZAV4sWC42fEG2vi6U57wf+35T3AhUrz8Jy1
 ErXWuyoe8ir/7sM5euHuPeUelMA/BlFFhPpu7oa+485+lP5aerM8ILbpGilc8i1lU0dXeMKK9Qh
 K05nqsUfrOhgJWOQ08/DgPFTlJx9pdi1ZDy0IMGuiQmjFOh1qwmx30nyQVREqiPTr/y8NS1srXg
 cGMAf57S1LO09R4zsHwfnV7aORWScDjgEEgJrvVKnTaUpnzYfPlZ01026pAWipoFIP9qzTg/BO9
 Uz8A1jasfpzioM/+ZbFLMbq80HYmA+SevkqTtTcwMj4CR+clRyitI98GdWgvkmriswWp8N/tXLG
 DDwMiF9UvYeMdKmIsBwI/xj0waeYQEaOH4NFjrlG6My7dpt+lL5eaP5/Zt+dcJVzCP2WPV3WYbT
 dYqm+RkQKmdBpo/MYAZCU6qxsUcmMvntVLVRSYBtydcbU7ZFBc73wu/RNOg1/FOZNGCwB99rDvT
 J089urB8mVWkjo6K2v3kkw+zuOS8p69awxbD+Z+M4Gw9al/rnJj6KN/on98vjT/m4rfQ9clB6W0
 XrLqEgeeD
X-Received: by 2002:a17:907:3d8f:b0:c34:d75b:dde9 with SMTP id
 a640c23a62f3a-c4ca7b22eaamr1771341966b.26.1793884979992; 
 Thu, 05 Nov 2026 05:22:59 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e424fa2sm172522366b.30.2026.11.05.05.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 05:22:59 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 14:22:54 +0100
Message-Id: <20261105132258.1868556-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105132258.1868556-1-yegorslists@googlemail.com>
References: <20261105132258.1868556-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] package/multicat: download from
 download.videolan.org
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julian Scheel <julian@jusst.de>, Bernd Kuhls <bernd@kuhls.net>,
 Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

get.videolan.org does not serve files itself but redirects each request
to a random mirror. One of them, mirror2.evolution-host.com, has been
unreachable for months, so downloads fail whenever it is picked and no
backup site is configured, as on the autobuilders:

  Location: https://mirror2.evolution-host.com/vlc/... [following]
  Connecting to mirror2.evolution-host.com (mirror2.evolution-host.com)|167.114.8.249|:443... failed: Connection timed out.

Download from download.videolan.org instead, which serves the files
directly and is already used by most other VideoLAN packages. The
tarball is identical, so the hashes do not change; also update the
URLs in the hash file comments.

Fixes:
https://autobuild.buildroot.org/results/5a2284d85138c85c74d45b33564cf108ad16dbae
https://autobuild.buildroot.org/results/c64e79e66ecf58aa8dde329a7b5646d47c910622
https://autobuild.buildroot.org/results/a81b2c7ca3812badfc05ec0527e08a4c25565665

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/multicat/multicat.hash | 4 ++--
 package/multicat/multicat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/multicat/multicat.hash b/package/multicat/multicat.hash
index 63acc15f45..e2c69a2838 100644
--- a/package/multicat/multicat.hash
+++ b/package/multicat/multicat.hash
@@ -1,6 +1,6 @@
-# From https://get.videolan.org/multicat/2.3/multicat-2.3.tar.bz2.md5
+# From https://download.videolan.org/pub/videolan/multicat/2.3/multicat-2.3.tar.bz2.md5
 md5  cf4e4bc07d72eda110050d755db14620  multicat-2.3.tar.bz2
-# From https://get.videolan.org/multicat/2.3/multicat-2.3.tar.bz2.sha256
+# From https://download.videolan.org/pub/videolan/multicat/2.3/multicat-2.3.tar.bz2.sha256
 sha256  2be162e9e8b2e6f6aa7686431f102db6c72c8288bd82dbc67ffed631f4a3361e  multicat-2.3.tar.bz2
 # locally calculated
 sha256  94f68aec169fb6c9937eade757251714d38a56812be5dbfc3973914a71ad8d2d  COPYING
diff --git a/package/multicat/multicat.mk b/package/multicat/multicat.mk
index 1d31ec869d..36475acfee 100644
--- a/package/multicat/multicat.mk
+++ b/package/multicat/multicat.mk
@@ -6,7 +6,7 @@
 
 MULTICAT_VERSION = 2.3
 MULTICAT_SOURCE = multicat-$(MULTICAT_VERSION).tar.bz2
-MULTICAT_SITE = https://get.videolan.org/multicat/$(MULTICAT_VERSION)
+MULTICAT_SITE = https://download.videolan.org/pub/videolan/multicat/$(MULTICAT_VERSION)
 MULTICAT_LICENSE = GPL-2.0+
 MULTICAT_LICENSE_FILES = COPYING
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
