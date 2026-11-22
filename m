Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA24606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 00:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sRmEfMNh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=si8fUOhU
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA6140685;
	Sun, 22 Nov 2026 00:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPd8ceVVxlLQ; Sun, 22 Nov 2026 00:47:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6BEC04069F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795308448;
	b=TiEHJayLbs/JS5/TP2o0onYIBFhHy03EBjOARHDNLNQp4n0b1gHoLCUF9hsKv4ZmG90C
	 RX2DG4XwKpIEAQfia0vIy3X4Ukp8hDqMgpI2HT+BXRg1cek55AjflOJpbPi/WbYfHtHRB
	 6n7RoDJhP56mY+8pkEFGqtVK6/RYYMr9xGAAr0ZLelybQObH3wYQ3P0PX6JNTrNXkdaIz
	 S3+dwYchYdBSHsi4Pa8usXsbeWCEWSb4fMhFkg66796GXvplSRpwjXTkuyal8LnCx5cjA
	 K2Ke8sTgLEIwRKJh4FB1p02PSurt9VoSiKwPt17DIRfr8P5f9e8YpoWRaHa18K+2Tpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795308448;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=uv4jaHFEM/v8La2apz/8Dn+DHck2P7JWPAFJz/p9V1Q=;
	b=TckDoqanK3vdEC27p+v0Mt9/EkjcE4yXlKgRpdPm6fMuT0RX2z/Bxa9Xi8Yhb90LVGxv
	 qhMwJJuyq588yOnD505THhjV1dgnLKuN1wlkh2hT4s6/qAE9wBwme4OL/QL3lzXFEgyzQ
	 u+gbz7s9yLavmcwNtX5zCHAMAvvEJD/zflBP6Et2AGMdo95v6mAHVio8zJo1bcU/gdxuc
	 s5HGWt9kBLYR0UwyyqsTWFU5MRBCMNqygLMHZ4Js2EORUDTcjEhH+r1Y4JpGVk2ip2K68
	 sW+Y60rsT3Pwh/3Mp5MX5TTOc35TacjdMkFk2VaViMqMR+k1YbeX3hrpWpHOmb6UF+Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795308448;
	bh=uv4jaHFEM/v8La2apz/8Dn+DHck2P7JWPAFJz/p9V1Q=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sRmEfMNhGBvDTY0+DKMBaiaKAlJsKHDAnvijFPtRMcHjaWg4FMjMWV8JsgJIRw/kF
	 93bONDnh9sLDWs71tZD4o//Qx8cBF12opcUnNrzHv4nJNcyxhvaNcHGd3VXHkggSzH
	 m7g+Z3adURa6JAme762dh/LaD09AJ47csPqTuNx+CN4NrdH5IenFVuxlammKhF2im/
	 uVhqpa0iP0bLLM9XAAUvFqs+a87RDYLi4eTFYJTtdfIjv5Ya1O3JRncDNgYgZoO7cm
	 GKHpWwq4OtCArNMsMH6Cs1esDkMYf1HelS9ovzG6MbEII2mn3fFVqHgzj89oTvamDN
	 T61XFz6w0PPXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BEC04069F;
	Sun, 22 Nov 2026 00:47:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED472759
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 00:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF23E60721
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 00:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_FC567qN1JN for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 00:47:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0936660720
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=si8fUOhU
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0936660720
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 00:47:25 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so1121812f8f.2
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795308444; x=1795913244; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9+SDuukIxSIUyH2BKEKOCnFV/p/qmtCa1prC5pWSrYI=;
 b=si8fUOhUw6DHH+PrcSU6OqI2MGrH07o4FRF2KxQEdkN/ZYaDxzGMVQ+A1nJl3f5G2h
 wjQ0wK5dapn3vDJvAkBxUUFPjM2AoMQ5fsNVCyDnJBNC40PH7QGwb0fY9mR3n9uwFV60
 gslotmdYJO1DLRmqg2J/8478x+2acq9yHyKQcz2L7m8R15W081A+IFYEhympME5rmKmX
 r8Y4dPhGXt/iI48yiGoe+7oxf+aJWRokWaCus7PPMN0Xn2HoqeixJCmeJi6F25hGk0Tw
 iHQHSjrs1B8L7hFefnwXwy/I3Kgw87XdM90n5uQ8bcAHsana8Rz8jJKxK3ip9551LXlb
 rklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795308444; x=1795913244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9+SDuukIxSIUyH2BKEKOCnFV/p/qmtCa1prC5pWSrYI=;
 b=oZrxd1WPGjpO6nPVDoq7sMUb4jf6k04jJId6LzjHTnAQC4biSasTi33w/Lq2KNFtoo
 fn3Njk23mLMGvStP+NWBBt0Mvn/ZNk9vH22IGymPFZ2zVaeYu1+2Trvilj/MFxzRnoNW
 A+DOmKlHbtzA5X8r8KvPjscROeq862NwF2EOuIWByqmNaA3L9R8oDdFSZTXmhIpOMdaw
 qT4qBUKOsv+BJLU+YPuSTvf7E0QnErhu6YWu9AD2Wzwve74j6Q8bw+3AdwCKwTp8i1la
 TpqF5SJTiVqpZztRUNDyFpMjLse4XcEuXxL4eW83luC3AeZyYr9BUb20RpWIRPg5SrcY
 ytkw==
X-Gm-Message-State: APuU4Z8xDufnf0ZyQW7Qwk3hxBYA6IjcSi2sO6l5Xh1OUDsdnz0k6ZnH
 9/ty5YhFCGXAZsE3txWaPNKPHria4Sox0b0ZbGhSAZRnBk92b/JxkK5GqMNsdA==
X-Gm-Gg: AZFdTZfAWdWSo7gmseFpazxEGUK06dTAXtIa71s1AssCWb4cSkBOso6jjd4Jg9fdjMg
 hUEHb2fePmAFf5vdFhKHQvbIs57/X8eAGTUToYRJOtUYDQVKwpPSxQw8mLk9jCnVzMXK8Wn0YIc
 LmZ0Puu/bLPNP1abTmwof36XRuqvq+8OVE1Lnj3q/OegoajD5n6gRqgTNK00+mNHAZOyliu8Qdb
 OLffKI0F079hnwy3yo2WVuqTHBBNX7/azX6UzeBUpzkTr1+o/AAMIzJOnQLH2QKeaOySE5medJR
 k3oXg41UOHgU63cmPcQU+AtFU5cOMeYZ0Fn+CVSy/9XG+9S3GfwQunllHMLWv50Z8ljyNIIsaws
 v1CPXRsSxB3h7/1E4eRtYiqraPeIEYcBHT1T2JFFElF11JVb1bz/tQXeV2KhGEd8Lq7hTPsEg79
 rXVmG6RqDD0u/+Wjro0dzeBUJ0UuURXO9ciwDfJQaZnYScgC9HaOTnXYTF5Xf5B0vsgdASazGPO
 QkB/9UQ9mbYd6RAaDEj0DF7mSklzQhpR1/u0Qo6mWDIYkiY9HMOJCRkjFYY7Xkml9X/x3/AUdQt
 XEMMLWg91Zpf3Za9JPII7YsVrrcw9MlNCPFOYRpgsrkzaUDxgy34Kl7e9A==
X-Received: by 2002:a5d:64c9:0:b0:488:88ec:59c3 with SMTP id
 ffacd0b85a97d-4abb0f3c071mr15745137f8f.14.1795308443808; 
 Sat, 21 Nov 2026 16:47:23 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67f204sm16046499f8f.21.2026.11.21.16.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 16:47:22 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Andreas Ziegler <br025@umbiko.net>
Date: Sun, 22 Nov 2026 01:46:46 +0100
Message-ID: <20261122004653.3725606-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261122004653.3725606-1-alexander.sverdlin@gmail.com>
References: <20261122004653.3725606-1-alexander.sverdlin@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/2] DEVELOPERS: Alexander Sverdlin and
 Andreas Ziegler take care of syslinux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Let Alexander Sverdlin and Andreas Ziegler take care of syslinux.

Cc: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
- new patch

 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7ae2c73ed0..4de793ced6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -133,8 +133,10 @@ N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/libest/
 
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
+F:	boot/syslinux/
 F:	package/mini-snmpd/
 F:	package/network-manager-pptp/
+F:	support/testing/tests/boot/test_syslinux.py
 
 N:	Alexander Varnin <fenixk19@mail.ru>
 F:	package/liblog4c-localtime/
@@ -207,7 +209,9 @@ F:	package/qt5/qt5opcua/
 F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
+F:	boot/syslinux/
 F:	package/mpd/
+F:	support/testing/tests/boot/test_syslinux.py
 
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
 F:	package/python-decorator/
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
