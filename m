Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDF2C77B75
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 07:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93CF24074E;
	Mon, 15 May 2023 07:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93CF24074E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wj6BLXZN0dIp; Mon, 15 May 2023 07:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8BE340C6C;
	Mon, 15 May 2023 07:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8BE340C6C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 577DB1BF316
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 07:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3085260BE4
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 07:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3085260BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BIodRKWdKKoi for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 07:35:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADA5D60BB5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADA5D60BB5
 for <buildroot@buildroot.org>; Mon, 15 May 2023 07:35:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.220.58]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mel3n-1qYLvN0SKz-00aqVP for <buildroot@buildroot.org>; Mon, 15 May 2023
 09:35:40 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Mon, 15 May 2023 09:35:02 +0200
Message-Id: <20230515073503.3567935-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:SniUl448eFjmJWty4XfSaaUlb8w+bf7mV3FnRlZBMj6NlL0JGNn
 UyMWdZvYB4wFhxvZonwnMxWYSOEJtJqH11oVo+STTDfqRJRCJXYpYTiiHqZxocHMZoAStj4
 JmNA67kgyErhAvFO07zuUTyUtayMTMYZHJlq8fBhHSSKsCjQlnagf78AEYe3wGWlVVEoBU9
 IJNOvtTl7/nTfQu/mS+mg==
UI-OutboundReport: notjunk:1;M01:P0:vRs6l50AOhY=;ioCQNpSI77XKlWYsXSBPMImVj/Z
 uk4Fm/gC9letbyS7ouu001UVriDHFmMG/3SUFIubHOayaUY2cWa1YyCP/+W4OnCs6V9luZf77
 so2O1EVg4luF04xbX+hQGJOUG69YED4YSi4YW8I0Afw9zLdSaM2xbR01lTDqswlBAlarVoF2n
 a4/6grUMCwVJSrqp4xmmEO/Nn0BKUp8v0sLWg8KrVAI9Yu9u+2ElhlBvzjoI80lFEshI14CA7
 dzDWKy6VCz/92JKDlco0Rj9J1hRNQiYFTXMgtpBpDJ8+u4up4DvIA+0wNnOHLYtzceQoSC4Ni
 PlbZ9VakOQItt/pcwkFkSGcnqMsyQCNc4p9K2yvIdUZYjrIC3wjGa3d7pUMBoi6GDg8nuRMbE
 A9oNewLcwtHW0muN8wWN2fesWEN7aO/EVjmQ0QqjXCE2N5W+fSgMkdyHCn1f6zy4cD1rnpVS6
 12QvWbCITJHcoAz51GPUsvFv9v7+VcONOq8a52TNZgWTmid8TyManPkJq24ru4M7I18XNgT7z
 APwKEfQ+0T7unhBo8tqbB/NjBB8RFmH8z6XZJxhubDHPOZOTBWFmAPOMGI513K4N6+xvhR/jA
 4itL0Tloehv9Okg+EjyhG7fbS3tm1lNAfETvw9rkKslnXzi05Tzh+iBR9phtNUI2GF+HJce1V
 yfVkeJmkoN5hHoHBuglCdqMUpomfkBR9K9zB7fLbkVGjbyqT1bzWudkNi/i2mGUyS6Mc+HC1e
 uarFh0ILNOBU89dZOT76xxItPdp1mUWEWGtsVOmHuW/rs8SF2tIlwQKU9/7Z6jc/PW8Pu8lqa
 f5tHP9UJ5aqeRO4YbFSxR/BQDhSYRvdxgZ0P6a6mHJ/27ixF+MmCZ+MB3AS9hfvvgwRR3wlQI
 rqOI36X1YeZ+aKLZAtryEtscHEH5WoafmbbJrjufV6mpvPp6p11jyzwJQAC3Cww3MQrQNQ4RE
 BnuyH59NKNNhTESQzaqSnQs9ico=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1684136140; i=dalang@gmx.at;
 bh=1PjNVsPPxI5uRT7+iB12iixb11hmnNrKsBKDBh+N4ys=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=N/Nxg6oriEggN8HhRod0L4DAbTCFj6OXGmKX0fbIOFTwQxJyzAig160MdWm2TAP1H
 Jipqbc08zhu0kESWRgUvTHsBBEyzRqr3B+qItKfwzQ8HD/UVnWxXGYK8cixnfBV3y9
 u9kmEAE4SLkX4A8sK0MFYfhmBFAtyAxRGwIpk5gWMLKoZcIzQKgTyLyezF4N7nr6ck
 JcEPvOppUE6ozCxI/M2TjKjjVARijNuGOeulqKGcUjsVeTwNOaZ8ijXFdAy++zRBS6
 MuxFUr1CQq6p9pnp/jbm2gWVT60C7Tr3CEkA823O7Xikkl23lfCpCy1AG2cWm1aulf
 pCahJUWlWWqDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=N/Nxg6or
Subject: [Buildroot] [PATCH] package/sdl2_mixer: fix license hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

b1b8d5b ("package/sdl2_mixer: bump version to 2.6.3") forgot to update
the hash of the license file.
In 2021 the file was renamed from COPYING.txt to LICENSE.txt in two
commits ([0] and [1]). The copyright year was subsequently updated for
2022 [2] and 2023 [3].
License is still Zlib - no changes there.

[0]: https://github.com/libsdl-org/SDL_mixer/commit/0f84f242643a913ba81bd6c260c39064c432afd3
[1]: https://github.com/libsdl-org/SDL_mixer/commit/371bf1575913828c46212e9220d4a4685ed66bb5
[2]: https://github.com/libsdl-org/SDL_mixer/commit/3f5a0502e0394aa967179d53e180f31cf038e032
[3]: https://github.com/libsdl-org/SDL_mixer/commit/6fdd4d469b4065ddfb701530d2ea602efaa772b2

Fixes:
 - http://autobuild.buildroot.net/results/302cbd0adc2c6190d8923b9449e26a3c519d2326

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/sdl2_mixer/sdl2_mixer.hash | 2 +-
 package/sdl2_mixer/sdl2_mixer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl2_mixer/sdl2_mixer.hash b/package/sdl2_mixer/sdl2_mixer.hash
index 98c5fda6af..4592014d7f 100644
--- a/package/sdl2_mixer/sdl2_mixer.hash
+++ b/package/sdl2_mixer/sdl2_mixer.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  7a6ba86a478648ce617e3a5e9277181bc67f7ce9876605eea6affd4a0d6eea8f  SDL2_mixer-2.6.3.tar.gz
-sha256  113727180e7956cb9718b03b41da85b63ea54743a33047071a623bf672895a10  COPYING.txt
+sha256  1852c8549e3d154687197d46abababd3e8faae035f19991b2ca850fa3a43ad57  LICENSE.txt
diff --git a/package/sdl2_mixer/sdl2_mixer.mk b/package/sdl2_mixer/sdl2_mixer.mk
index 425380bf5d..074e282205 100644
--- a/package/sdl2_mixer/sdl2_mixer.mk
+++ b/package/sdl2_mixer/sdl2_mixer.mk
@@ -8,7 +8,7 @@ SDL2_MIXER_VERSION = 2.6.3
 SDL2_MIXER_SOURCE = SDL2_mixer-$(SDL2_MIXER_VERSION).tar.gz
 SDL2_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release
 SDL2_MIXER_LICENSE = Zlib
-SDL2_MIXER_LICENSE_FILES = COPYING.txt
+SDL2_MIXER_LICENSE_FILES = LICENSE.txt
 SDL2_MIXER_INSTALL_STAGING = YES
 SDL2_MIXER_DEPENDENCIES = sdl2 host-pkgconf
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
