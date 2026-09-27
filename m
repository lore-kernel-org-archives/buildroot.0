Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD30C9833F
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 20:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB9FD60619;
	Sun, 27 Sep 2026 20:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeDUst2dcxch; Sun, 27 Sep 2026 20:48:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 74E2F6060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790542137;
	b=MqNlMjN+fn+HuMZsc8r88FAV7Di832cK2aHs2zQMEnXhfLidUbSbMQZlFb4lpmDsfrrs
	 ++bn0KqLGezEJszSDbZLnCNdAgESat+NSsuKCLhBXsxqhx4tRBl2VfLo/IuPsWkNeylKn
	 copQr3p6bNJ1ijt9vD03+jsduDTROGTt2084urL7BVzOHdZ8mClVAXFp+fkvO+WCovZ+R
	 PlOq4uFxVC0ETcoXN9RxRd09aQm3T59OsWRH19Y7tN+Zw8lSct9RxBxYqM0nsE1Ywz9TZ
	 ow84qmI6jj740CK8b0MQ2j4dbySUjbGbDRmXI/J2P8xblgJzl3Lp3OMCLzz4eEkGjvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790542137;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=geF8zmOPWQRPoMzfi/uybvxrsVxPQjIqB0/5NQaBHPA=;
	b=foQKUnpGYJNmNFIbvBBw87n7f3zYOJM1rfGJNeOSu3b1ql4L2HcrSmzGTwBgCUA9cBgp
	 f5mtJf+XjUT4IFCwVlfBu2NPRc1xK3D9yTLFvPgrUvHU5wvFaRTLemEbhl9Dhz5jFnxFb
	 uwrN0bgrr/OjxEIJKhMP0g7T/vuEKqsx49YdpESaq4OrFVQkzQ7EUTmQu8HoL311zuicQ
	 uYy9qAFAAse0Mk8cgVZKhXP3EX+UR4OV4DV1q7597K4jj/lgIsriE28vn2h/rwydfOymf
	 hz5QV9EJpevVEyP1vdceSBoEiYYiIvOxgMtDsJurl9TBsr0tZAajPYfUdB1IRoAwwTg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790542137;
	bh=geF8zmOPWQRPoMzfi/uybvxrsVxPQjIqB0/5NQaBHPA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hnUQ0Q2MvLDuiXZJnl8hu5iVl8TQDHknHmzyPdmkAMRR4+5ByrQh9hQ86OgK4vtop
	 JMDCJ4NB8IwIqdNYpFq87Pat2KZW1d4wpwggW0MIc0CYcpAwE/jaBIC5ednKEHgowF
	 LEI5VK6DjNa4+YiHLMiOgu+h5xkAq5moULdm9b/uocFol67mAZOo6XfboflKZuq7TK
	 t3x1p358+2IREKUaYE8NTm6s5vh6p6looN+m2u5qflP+ar4rqQLqygmskjCFj1wEpX
	 EZOjQpyt3ZRZCPQ2r2KItvWS1PhB1a2W/XipXoN8t3SL0psXn363V+9HcSIICezJVF
	 FHJ9iyCJDKqFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74E2F6060D;
	Sun, 27 Sep 2026 20:48:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E4DD194
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 20:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53FD680DC5
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 20:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCaxfnr2JvmV for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 20:48:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 74D9280DCC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:36::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790542133;
 b=prR2kgjLxkwMNHS6K91+IMUiTeLvVDKktxpmbvG0ZGKfrAIQQ6M+odU7kpTnkGnYU/Qp
 615b5EfCK+v8iiBj8vT+amCt2IIy9UOTi2Y7XRBacsBLutsqOzfjB0iPEYf4o7WEgsQQA
 tjvV4+5uwNzGqEqmdr8Do882dmHaWXcsC+RsnBrU2Lx26XOrMk2gAdGx0NijRvP6tomO3
 sTUH0Qtur2ebFgXXj3FcQceI4tH6FSBU+GZ4mWYdYcBqTciry8Qtz7446p3NYKA/AzyPM
 l7bXv8jaQQVQ/5m+xKJW7bZLImHmCi254eRa84fjDLJ4wqM2InJ2Kb+OqAXdJ2I4vtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790542133;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=gvgD/pqtQpUcgiKt8kBEM71a20hUK2W1Vdvx2MEur6Y=;
 b=r2oHt1dif3hv6JczZFJGdtaJaP31J+zpa5D9NSQL/9TypEtfVbjsQnE4mdgdjycMQDxO
 IN2sXS0qB8mtCqzDeqMKhDEP+RI/PCqLDjsuTy6lEZigGUsDytPR8TIs1AMt3NamO2hp3
 HC0F0wB1Q+SJdms91DhKsD1xISIHRJOSLYSv6eaLiVxYScDI0bnHAGgSJJFJkKErWjJ0O
 vvqNUung8ySFj4VozSu9Kq/VyF9EkpxeDYnaW/qhj+ZLafDQ4Z4Q0vxC99UtFKX/AyZgc
 19RMpldWdO7m3tScrLL5BfVlLnxftFklLaNe2nrK9BhaOt0xSUJx7bTRDboFhE4+eqw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=j-ernberg.se; 
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b="BXNgly/2"; 
 arc=none smtp.remote-ip="2a00:1450:4864:36::11"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:36::11; helo=mail-lf2-x11.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=BXNgly/2
Received: from mail-lf2-x11.google.com (mail-lf2-x11.google.com
 [IPv6:2a00:1450:4864:36::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74D9280DCC
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 20:48:51 +0000 (UTC)
Received: by mail-lf2-x11.google.com with SMTP id
 2adb3069b0e04-5b5e4f15b78so2055919e87.2
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 13:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1790542130; x=1791146930;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gvgD/pqtQpUcgiKt8kBEM71a20hUK2W1Vdvx2MEur6Y=;
 b=BXNgly/2sMU19FARXQstdqSpCD0L+9l/uHbnJJm91hfyGAdVgbxByr7g9Q0VLha8+D
 T7aCesTR7euRZUgha9wkqsr1CKpmB6QQIaMo8apUaIxXaUcErEU6fpncG0DG5lkH13yY
 Gk8voPtbDUk0R+44BgIDT7IMqYKIEAIW2P+XqvKsLrMZAKaTLkUSj1S7gN9Wl3yqOf/b
 aPXxzL92y9NQuwkweoa2w7KrARIb6gVq8ewWtc3M9Hrj5NASIyoIgLHPHFRtG1f17xoj
 zMa65AG2NwYmdPBcJNdk7Y4k6H1BBFI4hQqP1uCAl8tDAhprPJSfjvJDW7LA7taudHa5
 9o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790542130; x=1791146930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gvgD/pqtQpUcgiKt8kBEM71a20hUK2W1Vdvx2MEur6Y=;
 b=PV7y8YyNsH5Q9O59gPZqkOP6xZPG2RfPHE1ObNdFIVvhzwMOHW37MUPn7T1RJScm1L
 BC7Iwy/0vQgJ1KP7yki8obJEdWBQwsHhHaPPlsraEw6pOsVBUAcdxOUk27mxIWWJZl/9
 XJ5gEBneToiwbExo5BPMUmBuR5+NHv46ov31vo3M2g8yxRvzQkANl93WA+pR4Zni9l2I
 GcJDGCeuLe8Bhpe/HBcvWF8hgQEH6CLHVAicWs8BHORJEmr5EHzdMb7Unf6p2722GjyT
 cq3AD82UeGtsloxUD1q+t6xCWxjhE5CX6K3XEEdhNdWBSPDSa6XG/iArhRlt+YBpmb++
 +0Xw==
X-Gm-Message-State: AFq9FYIRKn1wwJqA0/SAvMys/GhmnXeCySPY+JvrQ3mZ7edPbj00G/1a
 CPSs7P6y7v4Yx4R3lPVyX6aB1Oeorzxp3draohKsjYo1FQr5O471sC+Dcgc+GAK6KC0fxR/dpO6
 ylxTOJdM=
X-Gm-Gg: AYBFou2eQuEPskT8q1Ldk8zOOcbi/Ct5PaogGhDoP/JRBuA47odQDwJ4Rv7ymCtvgbE
 Cp6KcCTy6IKdscdVg8/BdwQuUmL82bI698X5uiJ0YzAULYqwBo3rL/V+FckbgGo0w5PD/fsA1rR
 2b+mSsohsp6gvK5BP3JiipaBsPPF27VqNA9zKG409zH8dn2kIch10hSpQLibu5kkpngw7WbfSZ+
 Fzjv+VCA41EVC5EEeYsdMcH6w5kGeEju218mf9ZW7j4gOPjvAexi0chEhXJ7zGgKttbrNx60Zmu
 N17jaJJRczABONnB19p7DHoHbNYb3G87WbZKweX+6S0HiXX+uYGLgn0nMG0rbxXtkhfoMQH4P5b
 XvGglGv8oJVlCPyql0Ax7kqoqz04h6+q/ZwlWfFaIvlpOjvCdhoa7cinMJ/Y0715Tci427BdAoe
 oRQuzoRuGf6QkHq35n68DS7iJ3gTJEPh8PYhayxrhmxb++pWAyDy//iCUOCVkXVP3r8GAnKRPEf
 Bou/CusJNEK8gBn+oiwbz18+XkBav16BUo3qxnwGmoNB9OQW2ivBPX+B2lwGr3KRVbnaw0zP737
 KaQR57EZ/JAx
X-Received: by 2002:a05:6512:3c94:b0:5b4:97db:b740 with SMTP id
 2adb3069b0e04-5b8df0db4e5mr3995934e87.20.1790542129245; 
 Sun, 27 Sep 2026 13:48:49 -0700 (PDT)
Received: from localhost (78-68-185-168-no2360.tbcn.telia.com. [78.68.185.168])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5b8e6af1318sm2085182e87.35.2026.09.27.13.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2026 13:48:47 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <j@j-ernberg.se>
Date: Sun, 27 Sep 2026 22:48:41 +0200
Message-ID: <20260927204842.1113860-2-j@j-ernberg.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927204842.1113860-1-j@j-ernberg.se>
References: <20260927204842.1113860-1-j@j-ernberg.se>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: glx
 depend on mesa3d{, -headers}
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

The glx feature of xorg-server checks for dri.pc, which is only provided
by mesa3d{,-headers}.

Establish the dependency chain properly, otherwise xorg-server cannot be
built when using per-package directories, and will fail to build randomly
in the default build when a provider of LIBGL has been enabled.

Graphics stacks will use either mesa3d or mesa3d-headers (nvidia), since
those packages are in conflict with eachother adding them both as
conditional deps is fine, we can't accidentally depend on both.

Signed-off-by: John Ernberg <j@j-ernberg.se>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index d1596a8a3f..7bf9b65f58 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -99,7 +99,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
-XSERVER_XORG_SERVER_DEPENDENCIES += libgl
+XSERVER_XORG_SERVER_DEPENDENCIES += \
+	libgl \
+	$(if $(BR2_PACKAGE_MESA3D),mesa3d) \
+	$(if $(BR2_PACKAGE_MESA3D_HEADERS),mesa3d-headers)
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
 endif
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
