Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7CFCA5FB3
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 07:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 797EB40D09;
	Thu,  1 Oct 2026 07:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTuVNM_jbaeG; Thu,  1 Oct 2026 07:54:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A2C4D40C9E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790841277;
	b=OvBhgjNQmovtXSKISIXJ0k86nRsbLvOSGkBi20jeTsUrxZPaAJtEbgOnd8Wj72vkNfRR
	 s7cvshlGU3razWGQUoRXXQXLwdiPDNox6dn/jwuhGtlHDBEjUrENZNi40pXVdJfvWbT0O
	 Fhm0gAZsSg/+1LdVTmxVy5c/HqjTEbHBJLD4g8N1caj07Gc5vro+GnfeaRrXfwZOhY/8e
	 6DeUo7gr7bXx15+tu8PX4ABVfKMNOehqMSbXf37kglmGa2mkIoejNble31Jn60mZPUigU
	 wjZays80jnmksw4QlzS6MW65K+8dWFZSOWUjcXOeVwONdZDJVP72Xtp75AgmJ2Z+xqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790841277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=fech2+aHQZnlu20MYEkVygL61rzObSkR5Qmr+1TZi0M=;
	b=g6fNZPa2sRiBKHPt1znsdIEoqdIBhP3dV5d7BidJTt99Vy4c3VfbqlpknOktYgOJDbST
	 LHTr5tnlqpGTsg3To+CyR7ZsCL0ldMLKxRrerH5PYcA2iTLLD4DpJfxdJB1CTHeGQ9fjM
	 t9Lj+o1ekJEI04FQwO+abZklJ9PGAzcwFaZ0UtpTTd0ht80X6npaTOLu4FY5tu+XadZlB
	 ThH0OhIE/XZM8/n/VKF27STyXxg/ho1ATTnyyC06IoV5/H44vQmxoGYUV8VpgMpsggGc3
	 cdmHFySFIUR4CSdE2svVASAeDWDHmy94oQnfBQYWXinoa4jGh/8iheCOIqUjRn0pfBg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790841277;
	bh=fech2+aHQZnlu20MYEkVygL61rzObSkR5Qmr+1TZi0M=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kWviqwW31as8EpO30XUWbhGfv/qhyorfWmQ+qGSUJA/N0fiLiGyD5pRdxq9mEw8d5
	 SAKUJgCuOO5w9yYJT5RsW4D0J4BDAWz7vpYmGi+LOUHKFH0FUpA1xY0QTPBUBcjpJZ
	 6WHxwSTa8L6CTjEJSH12i2qPfsM7C6HeGT5w0KrMuVU33RNkaC5dNvA/JTmLVSNEM0
	 acszE2V49L9Xqrixm8FlaawkPo6cxqHELwCff6fjVgv29X4VVHzgWVZdYcti/MC+nr
	 WBUfVzaCnbgC3IOREFh01Eop7lIXqXwDbTukv4puC2rCE8I63/WLrvEgmJFgCcI7zu
	 1dJUO7XIN5e0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2C4D40C9E;
	Thu,  1 Oct 2026 07:54:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7764434E
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 07:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D2DB8124F
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 07:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0h2lx83FIaeX for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 07:54:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5DBCA81288
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790841274;
 b=Qi6bJcq7vJtoCgB1cTirm5oyuBBkLjf1YtXzcylyUrRNWEYsufMkMfe3TeVESHvgs+Dv
 K9HIX6NSkSM2t33vXWDr5BL/k4lxT98cT2nZ1HSRZaNdIYjbrYD1mOZv/bkB8RceFf1A/
 dyjnh2j+MLsAeseJBT6ty/VZpM7W8cSnqlSZj/OZ87s+u1/Wg8tYoAhdqTsD4QYELObpq
 ZUGV2yjQeGwCRYiSM0tuGYAnsRvJPRbkCMF+/a6vlz+TIGq+nJp6AiV9hdx2MQxLhC1TZ
 vYEOBnDQ/I77j6SekCKbDOBdnTwRT6psNsOHShskNB5NwNW4vWjOdiYNWpqR7Fxut9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790841274;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=IuDu00pgb9Ru8uBlLE/fdtNVFqrNu4rO8GZhAZhKGu0=;
 b=P7fn5Ln8/eYoe4XGjqvyR8up/Uig5y9FPIaLDj0q1m2xmHX+G1yYW++owhPRdQ7iV9fC
 WAvCZAlQTvmj7wP5/v/tLlEDQ0/25Ez0yk/aDLhUdueSq0BAxh/vhhU85V9FjzN0UNNK8
 cwLPhyiRCnRu6hhj4h6Zib50Y1QntU+DU9UnPK/KAkyRnEYGL8fr9y9VMrkowM/wjWUpj
 9eI3Tmpm5EVrZbTuc4RgG74uRhD7wFctvvw/XRJIT75U5m7FmOJc47w7zdKzhNNhP8Tw5
 w9WIRgMW9OqD35BVdBrylT44gQHjfPNRo47f1KdEzML3OwXXUkJcvuwwobduwcEDoQg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=devoogdt.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="bc/6A1Js"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=bc/6A1Js
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DBCA81288
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 07:54:33 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49ffde3cec6so27971995e9.3
 for <buildroot@buildroot.org>; Thu, 01 Oct 2026 00:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790841272; x=1791446072; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=IuDu00pgb9Ru8uBlLE/fdtNVFqrNu4rO8GZhAZhKGu0=;
 b=bc/6A1JsW9szNUlZdvtANtzrxGzYIixi3GR2X3KzKkue4cvN4eSvwU0s4FmBuvaB8E
 suBD7c9jhGMd+ST2FU7JL06nN/4JciciJ2vYLxsgDVdCVoc1iVdOXCVVJ1++Ls/G7fe8
 PVv8fLRj2m1CVeAvii3J5UqbsnIdFhm52bcJHRyBK7GwRykdRD6c3KqFHOlewlQ+MMDn
 5DfYTtr14FQDZFzXmkCoQ0h9xbvojuQJFVoXmeEp1uHk+cpLaVx/zYTA83OORXLBhfS5
 8yTZ3GWigOaw4wVRCumOMPV+Yt/fGT/5qiNQJ89ftOHEGebyWQ5CSqjShuoAU7gJvRi1
 toGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790841272; x=1791446072;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IuDu00pgb9Ru8uBlLE/fdtNVFqrNu4rO8GZhAZhKGu0=;
 b=WoIGeXIy26qdDj9zLblxCtugqius8Ti6EWNGTSKgZ1MUxbQjoI4dtCJx22WiG0bem8
 dkc9qhj9OfNjGRpWBS5f2ovDa4DiUTY991DFU8B++e4A9IJuJQ6ZNakl9OjKJ1YH5gcD
 SgJ8Wc+oDk7hLIvUuM40ArlHHpUXFUOgEbtVw8dxuDzvHv1MVcKW9EYGIximf6gPngyV
 klnrX6/sUE0zy9d8jlsAERwSp4trE8kNJpnlXdC/UHxiPP6NXwoxCoBLC23zstJ7iuhD
 ppjz6cR62MZAAb7gwzZsSTv/a+ztECUU7LGGoE1YjWMjbM4/9ZUX3ntFk6MP57cL9uN+
 hHHQ==
X-Gm-Message-State: AFuF++lxcsf+IFt6cnrLkjTpKyPhBRyX20TPonBAcqCT4jiLhIO3HlFt
 X4fDP07mQovczb1tv3vtawYCJjD5sLOD2o00Y72kcIfo9pivvl02Af9+aHe9ObVc
X-Gm-Gg: AYBFou38Ld//W0mjR4hGh+6qlyQqyvJys0voCuSBhL/trj2jKzqp74gXNoORqTaY1o+
 vUnrKoa5F7smkk6AiW9oSlKFGTzPSdJ3s8JjJ0u+N8Io5XftMSZ00nEzEdbwxtRAVG8zEAb8Wpe
 VHWaSy7u2AUVEQDbkeEqkjD55TUq87F08Wq34f3dPEvD/A+6CN9x6T+T9p3teoZ7MtpBfIzxRqa
 H5XiSYG/eWVtoKJmnopBLW989FZOCS1p/r4S6kULrfDaESoMo3VuhnhmL3jVXVeAUG62B+H15Az
 SxWCo252NnF6Mryh/iwr8svJICNAPZtZMQgluSA7AtkkUwQWJnIvS5LS2E9gHwtR0t5zu98MYPB
 e7BQl4o8u4uk+6TQX5WZz6Qr/J/kSSVVF9bREIz0ufc5DTDZcjcE+fwwYqj++GnolQSG4+tPGHg
 jsEryxNMNtlmfIPo3rScgsZJ4/jl/lp+SQ2YzL996it8t2k/tofPfEbI8lPscl5rQM7LuO8zLC2
 VvY1vgRu4hi6qTS1y7cHcQIjSR+jAyBhmnuPpmOeUXQaGWaytWeW2rLaI52PShCtW/XJmCqRM3o
 v1Qjw9mFBBkMjPJXx604ZVqYfWwKstr23j93wRv4WGnR89An0dB3xaDZeNxcRmzX
X-Received: by 2002:a05:600c:314a:b0:4a0:2391:6529 with SMTP id
 5b1f17b1804b1-4a023916754mr7818535e9.29.1790841271555; 
 Thu, 01 Oct 2026 00:54:31 -0700 (PDT)
Received: from KORLIN40066.barco.com (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4a01fa153f1sm44826955e9.0.2026.10.01.00.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 00:54:31 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Thu,  1 Oct 2026 09:54:26 +0200
Message-ID: <20261001075427.539773-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/webkitgtk: also disable internal
 ccache in the build step
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

WK_USE_CCACHE=NO is only passed to the configure step
(WEBKITGTK_CONF_ENV). During the build step, ninja can run cmake again
(e.g. when a cmake input such as toolchainfile.cmake changed), and that
run does not have WK_USE_CCACHE set. WebKit's WebKitCCache.cmake then
sets ccache as compiler launcher again.

That outer ccache runs without the CCACHE_BASEDIR that the toolchain
wrapper sets for its own ccache call, so the cache keys and manifests
contain absolute paths, and the entries only match in the same checkout
directory.

Pass WK_USE_CCACHE=NO to the build step too.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/webkitgtk/webkitgtk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index a2ceb516ae5..14be8c0cbaa 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -22,6 +22,7 @@ WEBKITGTK_CMAKE_BACKEND = ninja
 # Buildroot adds support for ccache through its
 # toolchain-wrapper, so tell webkitgtk not to mess with it.
 WEBKITGTK_CONF_ENV = WK_USE_CCACHE=NO
+WEBKITGTK_BUILD_ENV = WK_USE_CCACHE=NO
 
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
