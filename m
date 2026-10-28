Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE0A606A31E
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=icDrArpC
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1980140A14;
	Wed, 28 Oct 2026 21:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2o3KJ_GXLTMq; Wed, 28 Oct 2026 21:39:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C4BF7409F5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223576;
	b=DkdBJXSQ4LWczr99l63xlvcqazKo4zls+igvRK34XiH6tZ1CqkgoZouylhffu0li8ae/
	 tjJrlabVpXwNYodAPaBa8Slmt9rRK1Jon0qLzBzVdk1uzgkgL/zTPBsNKLQa8VPk5UheS
	 +Pb1byj3NpKBar+LQULm/5q2Vvs0xYNmqmDuqhFLpW8zYVwufRLVrGV+vZy8KMfrwD1PN
	 Hha5D+jojSNibIze3DZspN5p7lxMfb6SrxPSfpY47Wq2f/c+PFuBTrDCgro7JhaYhbI+f
	 e/r6jwJq0g3GkBB+bqHRs2MItXPPvQGbFb9zuq0tDEdCVSWLm885ud6+P87QaF8ZCjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223576;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UjGB0/leKUmgcPeYwDYlwyXRNsh0vMX/UaCmdqP+/RM=;
	b=Dg8XuSTgNP23FYffjxzHJdR3M06eIkuR3x3kAR6aQtknP9YVvQoG5m/pC6OTKZn3B/du
	 1qUnJT+5Xpkp5nfoecNGoFaxMFtAg0VVIp3q6rnzj3748xNC5tnlTf9EPpqQuA+ACSV6n
	 bO8fQFjps8Aljy3Fec3K5GeeBatvlIZj5DUVs658T13kx7b6A7LfdCxURY6S4LAeH4ArS
	 FN0rl5YgB5WWyoWIKaV0qziB4c7YzhZeA/WCZZr3lsJI7pofBxmAfpfz9tVsX134fTeQE
	 uKndy4Twg10yg2fmpviFe4/9PDtJNorZjM+IM/bUdNwCIzLqdQIJdHBB5t9YYkCpgpA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223576;
	bh=UjGB0/leKUmgcPeYwDYlwyXRNsh0vMX/UaCmdqP+/RM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=icDrArpCCmCZOZeM0SrzAp4o/uZ7zPRTAb5glSaJWeVpid093Z7xGpp1rlk9t9OYI
	 PoINh+6duLq8nxfN90XaAxz/c02i6kWtSR0091iAmUke1k94CXwjih5yB00kG6L0P5
	 Kbe4W4WgI0EOD6Ic2VzifAogpMi7eVLud+wMs9D0Do3nFGcjl1HLj6OUbJ7HfyIM0w
	 GJZkHvtggWFzo2qK+mitWDfJnxMfUzaAnsKRlKbctGQJAD+7/+lBAZrcePQGCYqDrA
	 wy4EJBG9VO7uVRbRkGIIaQxjGW2gRE5aumYY1rGxtItaaSXYy1N4kGZBcpeHXteigI
	 CAvHfXvKtBGSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4BF7409F5;
	Wed, 28 Oct 2026 21:39:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80DD3120
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 671D760725
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wf6lTNZ1Gm2Y for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:39:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6C49660718
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223574;
 b=KciYdb1aggyJn4egcmiT/0kV6IKF7f827uBYSGzx8XlakdWYr4zsq8OP1iSZIjAIhM8p
 BrsQguvCikzjokCQh3POz4/frG8xmdFm9hgh/M8Io4MrfeltPrh6wIvBkrCz8Bcbk0Hyk
 o+z7kMQCkXQjN6LT+heLc6SP7LWMdyii+Gj4RvznQRFFMnSlSix0tBhqhWpC6tEA8B2H5
 gD3ERgQQ0tDFNewlVsPGlJwMEm5GFEkNJIpLKey+tbVd9+H39qtrq1vdnRAnA6wkbiipf
 8c2icCk4LpdOrO5HzQz6jW386lYi7CzcvikgM/9NKTGmDmG3L8puLqePpMy6a6oJphA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223574;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=PZZhaRL4+XUl122xdmrQDp7NVh3dphLPUT+YP8vXKGY=;
 b=Dg7nj2SeWIIzN/EGRZU0vAcbA6SPwffdwIXp+qff/1RH6daQvUeD6XyIuhYfmsRau/Ec
 F7g0+qvFgwOaPRfhynOsUTnmosu+iY+KryILAMRVYabBYsNs5pajpT5X/VIWE8lqpyP9F
 cGuDijVgOjeNqLUPWKAUMi2OfgIL1HiLI5B+R26OzcolS/5FElbdBMUiRJyEVBo3iuQ1Y
 jjP0ka3UtnK95MyLygpGPlvbwdsz2vO7FGb3KtWYglpYgp+rY/ntUgF7XySHawzXhEXzJ
 +VC0SspzRmhMYUU7UhjIxW9aBW9UPegOEIRDslsE1Vqy0dEXyoJ/ujfyjsQEFWBSOKA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=TEMDGzmn; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::562"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::562; helo=mail-pg1-x562.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x562.google.com (mail-pg1-x562.google.com
 [IPv6:2607:f8b0:4864:20::562])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C49660718
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:33 +0000 (UTC)
Received: by mail-pg1-x562.google.com with SMTP id
 41be03b00d2f7-cc4aa18f9afso735682a12.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223573; x=1793828373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PZZhaRL4+XUl122xdmrQDp7NVh3dphLPUT+YP8vXKGY=;
 b=H8bgQLz1Q05P9urZJRNdGi9OZbif6HHFiBCCCcR0ir9CQsxGZd2q56PeK2fCRV1uOJ
 dNbN6Bh87+ph/FF5FFSpHX/PJNQGxKHTgl/8Fr6LeDXfYyZa9vOGBPJX7rJ6K94XtgRW
 QeJgMVZwv/ZTPoF1D+7J1vgcdH0kf9dAmj+ZfVfxWzNZlIGF8/pbQF1hu07S+RsSpbxV
 nF+CWVTiPQS7s5AMuaet8eRu3bcaU3tHQ44nx3aOvHmqix2EQiCB9MIgWYlbjIT66UAv
 1Yo98J+cZTrnhtIbJRtnktBauWA1BfrQ5MM3f/BA0Kut2Mzif70h+YARoffGtjvotQdF
 PZpA==
X-Gm-Message-State: AFq9FYJ9s6BUUY6qQAapzBaxOG3qHwDwmXn7m95i6MZ8hY3XCZg7pVxf
 FIDgqI8tGvaHGkyUv03HQrjvdcaQenZYwcgo3DUrzie0ZSXCIufGtXKYTemqMqgaJWOJZ2F4zXC
 UfaA9sA4FXlqELTtdsknS8GEFrq/Nmp8GZ/2lkvO+TjMtLKZbnQgz8o5u7pWTKv4lLqI5vzLQIM
 uXKQ+lNdMPRM85mbctXNRROkoJwVu3lIwcoSi9vgFvRwmLlm3X7lANIks8Oci+pa9P03UqOV71M
 cktybiIZLEUKbClRQ==
X-Gm-Gg: AYBFou3o2MocnRHF5LgcmZvmQ4/zZSfJgeSRnBMEeGzvlMbP9/btt3Siqkns0XLZcGG
 uqN1Dlvf7S6SYfAR9XFDXudrhCaz0NS2N02cgx8OHPXWtOtE5oDUPVrw1+JFI2/UprKiiXkOvFX
 mB9jF9GovgTzlYh5LgD+gMvzF4cJK5ugkaD8sh1sO7cPo7urXSUq9ds8HmGgZn9hWxmNEdS2pvg
 /DO3hK8r5We1DKNVeK1/ZLvefivuoWkpTPuMGeUI7Jss8ZZkkeC8CNJCSTW/wWM8n0hvZZRwAo8
 4hOOr9HGQpMP0sb+6V9cuUnGlnS64YeOXwFzszcYcNyWKWTalmWgakn7M+T+KUmk0rPDIq/EibF
 Taajs8nOzhw7vYlywOlosUERP1Ty04vr2hJ5nOk2MDLsYI1WK+LeedzPmidgG52QeSGJ/NpW4uz
 TAnTW5R8E4y23aPe3X+YCKfpLyc0SRoryBuQpcsUijecI=
X-Received: by 2002:a17:90b:5345:b0:3ac:a7ee:6780 with SMTP id
 98e67ed59e1d1-3ae58316552mr2786255a91.66.1793223573217; 
 Wed, 28 Oct 2026 14:39:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae57b4c0d8sm1196001a91.3.2026.10.28.14.39.32
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:39:33 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f1e62510cso350202485a.1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:39:32 -0700 (PDT)
X-Received: by 2002:a05:620a:319e:b0:93e:c12c:9b6d with SMTP id
 af79cd13be357-94408d3bbbfmr587204685a.72.1793223571754; 
 Wed, 28 Oct 2026 14:39:31 -0700 (PDT)
X-Received: by 2002:a05:620a:319e:b0:93e:c12c:9b6d with SMTP id
 af79cd13be357-94408d3bbbfmr587197685a.72.1793223571039; 
 Wed, 28 Oct 2026 14:39:31 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c6ed36451sm62806156d6.34.2026.10.28.14.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:39:29 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:33 -0700
Message-Id: <20261028213744.511429-13-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 12/23] lua: rework post-patch hook usage
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Francois Perrad <fperrad@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Arnout Vandecappelle <arnout@rnout.be>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Bernd Kuhls <bernd@kuhls.net>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

In preparation for the introduction of out-of-tree package build, it
is important that we don't do different things in the patch hooks for
the target and host variant of a given package, because the source
tree will be shared between the target and host builds.

For lua, the post patch hook was modifying luaconf.h before the build
to get a 32 bits Lua build. However, passing just -DLUA_32BITS like we
do for other Lua compile time options is not sufficient since
LUA_32BITS should also be defined in the installed luaconf.h so that
other packages linking against lua get this defined as well. So, this
patch changes the post-patch hook to passing -DLUA_32BITS in
LUA_CFLAGS *and* changing the installed luaconf.h in a
post-install-staging hook.

The host variant also modified luaconf.h, to set LUA_ROOT to the host
directory. Since the host and target variants share the same sources,
this can not be done in a hook for the host variant only. Instead, the
Buildroot patch that sets LUA_ROOT now allows it to be overridden on the
compiler command line, which the host variant does with its CFLAGS, and
the installed host luaconf.h is adjusted in a post-install hook.

Cc: Francois Perrad <fperrad@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
(cherry picked from commit 827ed461ba2b00acfebcbd01e53d93a148594833)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/lua/5.1.5/0001-root-path.patch | 24 +++++++++---------------
 package/lua/5.3.6/0001-root-path.patch | 15 +++++++++++----
 package/lua/5.4.9/0001-root-path.patch | 11 +++++++++--
 package/lua/lua.mk                     | 18 ++++++++++++++----
 4 files changed, 43 insertions(+), 25 deletions(-)

diff --git a/package/lua/5.1.5/0001-root-path.patch b/package/lua/5.1.5/0001-root-path.patch
index 41de4ba2b938..81c5eefa3d90 100644
--- a/package/lua/5.1.5/0001-root-path.patch
+++ b/package/lua/5.1.5/0001-root-path.patch
@@ -1,31 +1,25 @@
-Adjust installation location to /usr.
+Adjust installation location to /usr, and allow LUA_ROOT to be overridden
+from the compiler command line.
+
+The host variant needs a different LUA_ROOT than the target variant. As
+both variants share the same sources, it can not be set by modifying
+luaconf.h, so it is passed in the CFLAGS instead.
 
 Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
-Index: b/etc/lua.pc
-===================================================================
---- a/etc/lua.pc
-+++ b/etc/lua.pc
-@@ -8,7 +8,7 @@
- R= 5.1.5
- 
- # grep '^INSTALL_.*=' ../Makefile | sed 's/INSTALL_TOP/prefix/'
--prefix= /usr/local
-+prefix= /usr
- INSTALL_BIN= ${prefix}/bin
- INSTALL_INC= ${prefix}/include
- INSTALL_LIB= ${prefix}/lib
 Index: b/src/luaconf.h
 ===================================================================
 --- a/src/luaconf.h
 +++ b/src/luaconf.h
-@@ -94,7 +94,7 @@
+@@ -94,7 +94,9 @@
  	".\\?.dll;"  LUA_CDIR"?.dll;" LUA_CDIR"loadall.dll"
  
  #else
 -#define LUA_ROOT	"/usr/local/"
++#if !defined(LUA_ROOT)
 +#define LUA_ROOT	"/usr/"
++#endif
  #define LUA_LDIR	LUA_ROOT "share/lua/5.1/"
  #define LUA_CDIR	LUA_ROOT "lib/lua/5.1/"
  #define LUA_PATH_DEFAULT  \
diff --git a/package/lua/5.3.6/0001-root-path.patch b/package/lua/5.3.6/0001-root-path.patch
index b41df3ecb74c..f6273349be27 100644
--- a/package/lua/5.3.6/0001-root-path.patch
+++ b/package/lua/5.3.6/0001-root-path.patch
@@ -1,4 +1,9 @@
-Adjust installation location to /usr.
+Adjust installation location to /usr, and allow LUA_ROOT to be overridden
+from the compiler command line.
+
+The host variant needs a different LUA_ROOT than the target variant. As
+both variants share the same sources, it can not be set by modifying
+luaconf.h, so it is passed in the CFLAGS instead.
 
 Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
@@ -7,12 +12,14 @@ Index: b/src/luaconf.h
 ===================================================================
 --- a/src/luaconf.h
 +++ b/src/luaconf.h
-@@ -200,7 +200,7 @@
-
+@@ -200,7 +200,9 @@
+ 
  #else			/* }{ */
-
+ 
 -#define LUA_ROOT	"/usr/local/"
++#if !defined(LUA_ROOT)
 +#define LUA_ROOT	"/usr/"
++#endif
  #define LUA_LDIR	LUA_ROOT "share/lua/" LUA_VDIR "/"
  #define LUA_CDIR	LUA_ROOT "lib/lua/" LUA_VDIR "/"
  #define LUA_PATH_DEFAULT  \
diff --git a/package/lua/5.4.9/0001-root-path.patch b/package/lua/5.4.9/0001-root-path.patch
index cec9066eee98..69d142a8f242 100644
--- a/package/lua/5.4.9/0001-root-path.patch
+++ b/package/lua/5.4.9/0001-root-path.patch
@@ -1,4 +1,9 @@
-Adjust installation location to /usr.
+Adjust installation location to /usr, and allow LUA_ROOT to be overridden
+from the compiler command line.
+
+The host variant needs a different LUA_ROOT than the target variant. As
+both variants share the same sources, it can not be set by modifying
+luaconf.h, so it is passed in the CFLAGS instead.
 
 Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
@@ -7,12 +12,14 @@ Index: b/src/luaconf.h
 ===================================================================
 --- a/src/luaconf.h
 +++ b/src/luaconf.h
-@@ -223,7 +223,7 @@
+@@ -223,7 +223,9 @@
  
  #else			/* }{ */
  
 -#define LUA_ROOT	"/usr/local/"
++#if !defined(LUA_ROOT)
 +#define LUA_ROOT	"/usr/"
++#endif
  #define LUA_LDIR	LUA_ROOT "share/lua/" LUA_VDIR "/"
  #define LUA_CDIR	LUA_ROOT "lib/lua/" LUA_VDIR "/"
  
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 6dbdc950021b..752b67b45333 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -66,19 +66,29 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_LUA_32BITS),y)
+# We adjust the CFLAGS for the build of Lua itself, and then the
+# installed luaconf.h so that package using Lua also see LUA_32BITS
+# defined.
+LUA_CFLAGS += -DLUA_32BITS
 define LUA_32BITS_LUACONF
-	$(SED) 's/\/\* #define LUA_32BITS \*\//#define LUA_32BITS/' $(@D)/src/luaconf.h
+	$(SED) 's/\/\* #define LUA_32BITS \*\//#define LUA_32BITS/' \
+		$(STAGING_DIR)/usr/include/luaconf.h
 endef
 
-LUA_POST_PATCH_HOOKS += LUA_32BITS_LUACONF
+LUA_POST_INSTALL_STAGING_HOOKS += LUA_32BITS_LUACONF
 endif
 
+# The host and target variants share the same sources, so the sources can
+# not be modified for the host variant only. LUA_ROOT is overridden in the
+# CFLAGS when building host-lua, and in the installed luaconf.h.
 define HOST_LUA_LUACONF
-	$(SED) 's|#define LUA_ROOT.*|#define LUA_ROOT "$(HOST_DIR)/"|' $(@D)/src/luaconf.h
+	$(SED) 's|#define LUA_ROOT.*|#define LUA_ROOT "$(HOST_DIR)/"|' \
+		$(HOST_DIR)/include/luaconf.h
 endef
-HOST_LUA_POST_PATCH_HOOKS += HOST_LUA_LUACONF
+HOST_LUA_POST_INSTALL_HOOKS += HOST_LUA_LUACONF
 
 HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
+HOST_LUA_CFLAGS += -DLUA_ROOT='\"$(HOST_DIR)/\"'
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 HOST_LUA_CFLAGS += -DLUA_COMPAT_5_2
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
