Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073CCC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C332240DF6;
	Sun, 20 Sep 2026 14:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2qrVwsgV5G1; Sun, 20 Sep 2026 14:14:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0035140DE2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913685;
	b=QHbIj+hgorSWwLQwfm+eGEfj1WSMvDne+WQ+egUtS5dyWpW41Px1c/doE61o5Zu7N4UV
	 gGlZTVRjiNWhrKNvKR4timUIZ5W7eM/kg0wWcpQyCt3untUMV3LWwIhra2h6OnP6rKIFx
	 trsA7gMHzs9tAO7C83nahj+6aUtdJ4oALdkchEsH2MKGvQTfeAJr+81H6zVCql9QOfzWy
	 6yzDWUlNJDtS4e+9NRog/8F8Ud9gy4W7ymAIfKUScdpzpEmcEphdZl9GQAHRkNkqJJn9v
	 CF6p35Lvq43iosBh5Oiihp1Nne2ZtzPYGd/g/DLfuctiiOxcMKNcJrIwD0q1Iw1RDsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913685;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3FPubjymHSUzD6get+Z0rxrhderv55hBEp/mi2dXTXE=;
	b=gEyHKhJSAeLooc9tEtVB/9NHVzFIaLgas9soVji/WJAth/OXy8kPzggBUapPWzLJFiHk
	 7EUvB3AtW+Qela6ouIJSgqLuY9SI/h7BotWdIUjol/X6atQuo7qBwyVZt2XXTNmoNFDIL
	 JuV8e92e5IZy9yyzMvWOmUnX8ab12F26G5w+Ou5E+lYn9ETSEZmT2xJzkGUxuuxksgQ/J
	 adDNzTS3lXX6UQnlGYPpbswovBmpvYJYItXxaOaYGbs5IarperFG9A8qbzFW2Q7i/qs71
	 4Zsdwvj1ijTIvZ4YXCqA/hdZOQAb7zjMEHO1U0Bi1IPWHi/Q/K/jxDE80Zmz/EL/lAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913685;
	bh=3FPubjymHSUzD6get+Z0rxrhderv55hBEp/mi2dXTXE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XkzUaYCu2LFmPYNJkATT6EmnaFfJJBX+sF1w0BLEq23RRfwpUMSztGQJ07SklE9OV
	 IqGOuC78SBfInoaHVhRoFXGEsXVRRazYg/qQ5c91g/1g8iNyI+9KQWUDqzAkLvPjE9
	 VXGB/UECc2ABoHjau0Ba4syP9sHuz664AVBCpkKpVPv+z453OjNmEe/Wd/3/XUgjTy
	 Dh5omDohGVVhQqYLQMnEkEI+JzPOaerB9VhKD/bmF0SMRt4Mm6F8egYxv46Agdkl0u
	 f93CYftvCiHenPx5RndBN1sqpOoXkk6QIl7jz1rTvLw2JaqqTfCXSvhvWROZBp7ngY
	 5LED3SJu8allw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0035140DE2;
	Sun, 20 Sep 2026 14:14:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A87FA37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 997F680F19
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHqEBWv07eyM for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:14:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C115080DBF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913683;
 b=KqYJLgaqVKgEdGNl5uyDg4eb+WWP+mpVf7OV6UWWMCZ9cJZ7XoGoPXqDL5Ly1t8AT5kY
 abKEm3dG6mSFHRaNAiB3JxeEjYkcrVuupeFdDJrkd8cKFt7h7gUkjwYxz7pkmkvDlEc+Y
 moW8moPE+fMSFbkBptgKFm1Y7EV3yLPYhzzAXedkay1yEBmQsvylI6TCvG7dDa79R+ICn
 rEhdxSZmy10KZ2wxo3ISGNOboLXGw2ICJ/mPoRhWv0BAz8HE9bqUIIiZalB8lFX6F7zRm
 eTM2TJyvW8C2nyW2QwYjhFuanp15WZV395K73hEn8HlRIJWX+ATsfhvzVZpXaqiP9ZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913683;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=DWqBja6LqOlclvBbPOxQRJyRP3Ezg9Kl0ZLPlYk3eJ4=;
 b=GgvctooX0JF6EdLgvVz28JpRalTspAcUwLCJfzRbGCRlk2nDehKPQTGFD+cg3x427JUc
 8tVSacss9zuCCUo+2/u+e370p0HB5OkgnJ6bcE+87+gO6NjgWmhrX5XOc+gFfuaqLl6Nv
 KcORYgySO2QWnwp/k4fOHQXr2d145hUu3drMB1bU4OP3Mfa4tfef6pvZp6RguLB30aOWm
 jj1yi4/wmH2yyxoFR3bwhHX4U5YlLoUQvvsYcC0i/OKBHAPbgBJ/2uimQflUPLwoSRXDQ
 7TPLQbvenIoSYA9nxUrtZLE67wD1gWXMQmAMHOp0pywWHLMa8F6EuqJabBBbWRmvPLw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pE0R8D+g; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pE0R8D+g
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C115080DBF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913236;
 bh=DWqBja6LqOlclvBbPOxQRJyRP3Ezg9Kl0ZLPlYk3eJ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pE0R8D+gWC12gSWzRaxLJw0J/s6QqRK9OyUBIm2TqAu+2WsfY1gYpTq9oVSZ7FOyR
 TL6n4fmpRYYGC0z2A33EuSHsvihc2yENpvmCSwFHXbEKnN4JXk6U3I7MWgZHN76TfS
 xeDyPhJxe0jDTVjps3phVavOdXuq05i/36dGhd2aK1AfvLv6oT9q7wcVWxhhuTEao1
 xSWkWxzq4vEZCe7bnQPa9moThAyDXyRavSRelaMqhTogdNNxj9oYA4nec4olORCow+
 yVpk4sODVtr3UIJQbUKqKGIRBJMN5T6yS60Szb2CHDm4/u9vII693YvgaQYJUfbpqM
 ewZ8Oldq1NUng==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:ZPyccQtXYOI73N4JNjay5aesYs5wKsSEcpUt/Uqas/F2RZhZ9IMlDCVZKCTw0kNivh5CIxGsh9Q1QB/DU2gszMJcQ3cuW009D2XzliNDS2eGmUaXl1wZd8M0L1mLozS9h3vYc5caD8vItGzmx/lhjCrGyje0iYkN8EEukEx/qkpaxxRGTE6/dEfdhrfdVJ4Go+MC/foezFN8WCtDhk0A/ji+z1clSi8eLEiRgW21TBdA7ciL+1UVN0wQU6/j9aB8XC0Hvmu8xeoa7sweREtG/gTFOvW7ahZgvIQvZqZUbRFDduXYhntGL/i9zXI+WJDUWSscWSrB3RfALdgQXjPNYafn3iyyRe31Lw7Van8yLXmwdmeRwUiS21UvIrZvhdH2GLLKFlIrLKHjs7W5AGtZAY6SU69SqHSpovnSpm+Io3vEA7QVTNaag0S+7+e7YHBjgm/bwPUPz43LL8G7yLJtuDuIUurom23PhJlita6dYJKGSWqAmTRBB5TB4BDno1gBw1Fcwt8X4+vai4y2Whe5WVe3c00OTmdllSmRkam2D1SNnHEuXASDQW3Exm48l8RYGQzCRE78CmIPnI+NPB/jkgywmnBrJi60UDgfqgkgZeh7en
 xbSyIvUa4mIyczJwrbgPx4OtSR4ZzFLIzWBR2DpcR0LIfGADpQM5O5Ex6RJ/hCIaYolBssmYE=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B811DA4C4874;
 Sun, 20 Sep 2026 16:07:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBI-000000002J9-1x5C;
 Sun, 20 Sep 2026 14:06:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:26 +0200
Message-ID: <20260920140605.3005461-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v3 28/66] package/ecryptfs-utils: remove OpenSSL
 support
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OpenSSL 4.0 removed support for engines.

Please note that upstream considers eCryptfs deprecated:
https://lore.kernel.org/lkml/ZyKf6ZSZrETI+4%2FS@redbud/T/#u

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 03e7f3e34f..aed1cae2a0 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -32,7 +32,7 @@ else
 ECRYPTFS_UTILS_CONF_OPTS += --disable-pam
 endif
 
-ifeq ($(BR2_PACKAGE_LIBRESSL)$(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
 ECRYPTFS_UTILS_DEPENDENCIES += openssl
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
