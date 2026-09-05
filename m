Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B166C624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 12:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EA9640AA6;
	Sat,  5 Sep 2026 12:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBNWoZsVHRcq; Sat,  5 Sep 2026 12:21:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1E93940C90
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788610909;
	b=YqXHQUVXWsaQCGCGCXylqPofi4FvbHWaEnzQKqWnMQQIpsKrn0f52UH/1Ve0xZD1PdRl
	 d9ExCoYLcGDQR/6tYGS5xOwLqRa5TsFZrL7Kcic9i8zDGjPxS2oK146GCOY0PRDaEOgfY
	 sCBSNqoNfvnhOHUPBFsJ6sHRrCrd0T7Vzog5wkdNsQS0TitLmfNEa2vd47ozK+3kVGdpN
	 JSFnCfBGsETnYSvaynnYINzTYMP7DF7eDnfR/6KvjIKz2iAU+gHx0O6JFtd9e/7iJOnrM
	 jUkImDin6k3vG21OW7F9F5JetbvOtFryOlGkg+J1ORtF0l6GLKOruDKorWc6OC7oPyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788610909;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QeQ2m81KYAHZ/VtqfLn/FfM+Y/PyRI6ynU2VvpsrclE=;
	b=j191o6fSvTIV3EsSVxJbVGFPbfSTDg5UWk7RTITX6h3+Jp7DZvMgF5vMDiI89cTG3tzT
	 DhVeTvN6c11Kg9YiBKjCSXhZ0Q/QyIk3N+98uVkf3tcVWLH8HaNsozEtzwGKeOzPUQpmG
	 4bp3Qrc2iZFw5qa0d3+ZdqVY39jBvJad64958I4c34OJGDQ2A70Fy+9fS2o32n2d7B69/
	 jxPOb/dbJsL9fYkvUR4fuHljdhlhTuI7UvDSX489H51Vs9uM7UuPWTRTi/B9yQFWutNWy
	 ChTCDEWtNW9kZsQHH8LD3vIll2Grs7guXrNBXDORSTcgOXLc338YGyUWgFRgg+TUsyA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788610909;
	bh=QeQ2m81KYAHZ/VtqfLn/FfM+Y/PyRI6ynU2VvpsrclE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kfhf3jGDsvBEkSp36hB5Wnx3V1PDwJUrnXqHiKoCTxUeeNI45+YoExkQ4PRU+JjDE
	 haqpp+ve5PnNT2tuXCxDgXz7qRLiWNiChhAJh2fSNkCudj+JZ1CvQN+vdKEPoRR2oM
	 lvkGddftVbJj5vvRb58dcRGi0LBN4FOCZdWhPrCvmYodvcjAgjnuCO50PUXVnqJgpV
	 t0ll93BgSmK9bDaD32K3LioQ6OCdetNspBKyrSpnmyOIK5BZT98RwgqFQ0neHIlken
	 a00//sA17FEiaWV23hWQgDTQNeti/1P8s2i6Im0hH2V2aeb5NRIajqrOh7UpzRDK11
	 CcZwSuK5CSgKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E93940C90;
	Sat,  5 Sep 2026 12:21:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B43349D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C3CB8111C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJoVwDGk4kr0 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 12:21:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 94176809E7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788610906;
 b=NhZpVQFN0EZwGtNH0sSLy+kzdgOddBG+WEJbKHTIsOQo7dqb0JAIh/uqZDly5lUGLTgE
 2CzvH4KLkxQBU446XpZzOayrRRolqG4/hBptqKglnX4KkqFjASkPkSbvO1yDupoacN2Ys
 SSiUWcMoAq5UtgDn0j7DIdG+nJERiguADl+Sb47aMaPcybz6MNmIz3pyJEeZF6J+MlhCP
 cQj3aVPnf7Gs729y76yB9i77aImYfjuiPYyWblrxh5FTdqy8ZDAsOx/9wmBR5/SIdcrmA
 FuAseLr9ijIW5V2Z+jzRsaKePT7XHsxLSShGk7K6NyMy9vho+7yg3+Ck80NNji/GN9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788610906;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=BtNtlvN91q99B4hQgZ24tXG3uEq4su9NdKA/v1ykScY=;
 b=rSJ6DYrSv4tP/qqgn5iXMjNRi67zRmBvWXCH3DHeBZwvbEL4r4Et5jVFXwq094RFFiKi
 24El7eXQR6LrF9DNSIYYSj9hw072Apid5Q/6r7LWjhGQsCqXF5M8rRw+qy4nENou1ds0Z
 noCxqAuNtOc5AXWjgNs6jOi+tdqSA3qoCVszl1ycL2hp04nYtcvUSI5tjsFeYGtlLuQqX
 mZwJ2+U99ae1leLXphLg1wTc/IbFEemeoeovqFhzo7VhaDuhDkodwKSsb9gDMDndmv+zR
 a3qFebnq9UxUIUBWmfQbO2DtYn1MGNEmhkBRoIAvLKduqmD1eojgnpyN2IzxBAfEEEQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="KW/agspi"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=KW/agspi
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94176809E7
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788610862;
 bh=BtNtlvN91q99B4hQgZ24tXG3uEq4su9NdKA/v1ykScY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KW/agspi1wQEUWU79uSd4DVM309eYpkVTlUXvJ5yp51P+3ErjXd1THcg/5J/8qbqU
 lQowUI9/euVYYivgpoIfilvktc9edUjIowguoC3Wm7K2efmO2wgQNFe2hVgkWm+HgS
 6zK4pIOnPSt7HW4YrkSNnw8fk/AzzUL5nZFmwwVF3wHry5f1tiZV+aaaWo02yC7b0k
 37+WJA5x1nPH3UNmkSQjAEySTbRQ0OnWDDxU/3W0/PcM9W8JJ9FoAL3qbsJvLd6OFc
 7FuDpCfmV6btSvmUKXOM2hCsxzh1Nh5MoGObQeyfzIMsMp1yFwPojB5Cjupr5XaHYp
 gbg7L6jDCklaw==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4CB59A4C3358;
 Sat,  5 Sep 2026 14:21:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60364)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2pNx-000000006UX-1YV6;
 Sat, 05 Sep 2026 12:20:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 14:20:39 +0200
Message-ID: <20260905122040.2054789-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905122040.2054789-1-bernd@kuhls.net>
References: <20260905122040.2054789-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 7/7] package/swig: bump version to 4.5.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Daniel Sangue <daniel.sangue@sangue.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.swig.org/Release/RELEASENOTES

Added upstream sha1 & sha256 hashes.

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/3a1e018bd92f929d1acc1882742820bbefe06800

with the exception of bootlin-x86-64-uclibc
https://gitlab.com/bkuhls/buildroot/-/jobs/16323077584
where libselinux caused an unrelated build error also caught by the
autobuilders:
https://autobuild.buildroot.net/results/684/684a779841c26499f2b28f74edf183c73d12773b/

and the exception of bootlin-powerpc-e500mc-uclibc
https://gitlab.com/bkuhls/buildroot/-/jobs/16323077582
where sdl2 caused an unrelated build error also caught by the
autobuilders:
https://autobuild.buildroot.net/results/968/968608bfd41d40ecec3c2cf9544cdcfd1693da3f/

 package/swig/swig.hash | 4 +++-
 package/swig/swig.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index 21590c422a..f3d4a1829e 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,5 +1,7 @@
+# From https://sourceforge.net/projects/swig/files/swig/swig-4.5.1
+sha1  fab5ee9e27b703ea964e55abca585567ebac9bcf  swig-4.5.1.tar.gz
+sha256  7fec50b27deddab5455a9633780b6341eddfb96215a7619e93a76eb27178f653  swig-4.5.1.tar.gz
 # Locally computed:
-sha256  2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b  swig-4.1.1.tar.gz
 sha256  f53abaeed775018d519a1b9615f0ca17894772bd9ca21c2a156bf340ac41c13e  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-GPL
 sha256  7f50d942373a871211c5efee03f3db2f9efd1cff1002b0ef8e3748baa611a5c2  LICENSE-UNIVERSITIES
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 71e5e05f96..e277f5049a 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SWIG_VERSION_MAJOR = 4.1
+SWIG_VERSION_MAJOR = 4.5
 SWIG_VERSION = $(SWIG_VERSION_MAJOR).1
-SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
+SWIG_SITE = https://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 HOST_SWIG_DEPENDENCIES = host-bison host-pcre2
 HOST_SWIG_CONF_OPTS = \
 	--with-pcre \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
