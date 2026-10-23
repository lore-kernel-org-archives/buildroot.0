Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6A3606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Vr+LRf88
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EB1440ABE;
	Fri, 23 Oct 2026 21:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ct76IQ-jHFR9; Fri, 23 Oct 2026 21:52:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 627D640ABC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792343;
	b=qsOrCAV28eFymhSiE1KZ3ZRUq7FEl4H6xc5sdmIq7LVqAqXu2fC+0lr+vmJK4gV02mol
	 1bb4wmZMzQySJRlRZ1yEHLdIAE3dneIcg+VjXjUUqNaO2IH53MEQIdBHiEj9cmzf9zHAO
	 2N+8a0COuBWtf6LVKF0oOBcGbPcuL6MqWFkPNCCmrbiaj/LwWHndG5NKzCnHW5g0LLhQ5
	 o7SERinTY5e2E9EvHUOchKj/8K79xsyh0lV6ydWUnrzHYJIvuus1/bU6U8u0YNyZ9dIvn
	 peb+IRxAAw5yam8IIhck7RPRhoD5JFY01LgsRXS5eRpbH+kksByPhCzZA5m6Ox6no1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792343;
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
	bh=bwhTHAUR84ucEdJjAY/6vh/4xnEhCvrJXINeN22RTsw=;
	b=f6sP3PBvkIYLy7OPd/AIyYL0cIQC0ERSr56Fy4AzPGjBFN7960qcX4oxN4sEl3LGNI+7
	 6jThCTni8rH7CS4qA842/imh3d0WMp2W9jEXU1uFHFwcokQfN048Mxpewblb7UwA8YSV8
	 cTiULbKQzKQ+wZO171hD2V4yC+phJ3H8A068zjnPce9x6hCnuIyqOzra1Cd820DQF3Gbc
	 IVQdC4Fxmk4FAjXDXE5oLKsd8qJ7AYRHCnAo0C1L7FW8EJoaqLXiDsXFCmj+lGfkHKO35
	 kdfU4EXBmSCo2SZH8WjPHN0gvkYfJUNsu0ovP+sh77BwLKdMoW7iYqFVCnwP5FV0QMQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792343;
	bh=bwhTHAUR84ucEdJjAY/6vh/4xnEhCvrJXINeN22RTsw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Vr+LRf88MtU+72Ss47tnt75lEiQLp8JRDmUZ4CssXai3RKziEp8qNn5BddhSnEyWU
	 CzkRB2lgSL1NtF7mnkp6xovQ0gcg8F4+kh/XjKbXdgf8yCfi+6pKfPR67gKyAYumki
	 bpSpj0izW1pkN9Kw+s+M0PFWuLmXgLKo8mTQc4YogInU7pb5N/+SFYbbCCQ3r9OH9g
	 5Ojq1mdJKYuWeHQ+IT9HWvLQhJ+BJ68/qV54cS3BcPe79nbCOh6FTzPmRjsK2yaEzU
	 RrbhIdFVjRZwtBF02ztf4cUgshcSd/gy+NofoJhFGtn7M/tRyz+Rof50vHP7bdGXOP
	 /+VhPtND5m7lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 627D640ABC;
	Fri, 23 Oct 2026 21:52:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C8843D9
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 323FB60A66
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkeUvxjI05n4 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 776FE60A7D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792335;
 b=En7YLPpCPk2G8FvScQUY6rZ8YjBccr7hWmEz/QfIHt9rSOmYctbrIU8BI7oJjgdG5ala
 h8vVRifL/42TG3Z6zicN4fKpLhl3JTFNvJgCZquj33jC9gVI38YtohzS8ILCirGT3jhfh
 T/XmVb+DkyCDCtOllnfmw8RdH52tz0kj/wZxkkHNCymFYsi/QwjAdvAicomoHcvs9qu3T
 oCpU7+4uoMnuuKaTwQLsiMqF2J4EIIWBZrx8RAzEfvzEbAGI1Vi0lZ8FlwqNUHVbBVpwG
 233YBTmJ385cCdM2oxV84dnX0LvXU63jeuxw5r4jPbftSAfKRj8sd3cZdw3+rhywVfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792335;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=diV9EuRy3Yq4E+rFvt2mKE2QklFVYN1NKiFhTf8E2mQ=;
 b=Pp5kDNrLTNz2J1HPnM6gTzRa6W295S2apuREY+VD6XZRwKXf0b1q0kvplSLsOlntxWD7
 F6PtIBPnGTYCO66ykHR5dtwUW2b0eGzrH9K4Qkv+FDk7ZZTJ0amQhN2bVo85iAwZd9J1j
 EohpgYbQCA56QWp3erWxBg8/SsWpviUM3MIpZedJA9u+uATM3rT+e6T6d5Nq2MEvJmcwA
 uDRnBCg5e41Hpy92nFCh9Z67pL/xJzO6AF21x5iQ1E0kBDNVX2QQ+WfCWAOWwab2V82CP
 xL+oBlkkH4vYA7YyUT4Xyj2DREJ0yBPC31w5ffaIgJkN8N1WEyGNXG4mf3nCk0F9twA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=MzUF2m7G; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::562"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::562; helo=mail-pg1-x562.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x562.google.com (mail-pg1-x562.google.com
 [IPv6:2607:f8b0:4864:20::562])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 776FE60A7D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:15 +0000 (UTC)
Received: by mail-pg1-x562.google.com with SMTP id
 41be03b00d2f7-cc751eddf25so704371a12.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792334; x=1793397134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=diV9EuRy3Yq4E+rFvt2mKE2QklFVYN1NKiFhTf8E2mQ=;
 b=kW5oewIQ21Yoe9rrOX8MkoahoBze4HMHlKAQ2Hmnf8E/bnzRS01c7qr7+ve+awaGZ8
 ZG+zOkbldRx6KPElD5lDVU8XEVkmipKj2aqi+yagBT8AzbA5JEXCLW6zzjjY/wmdjHmB
 6mmO7WmvfHgAiTU7+p6uW1lWSyjLjrSWbsdX6oUGel6M7SAkbTigG8J3kzvVhzYEnxty
 8P/IM5gFdIlUgETCVEAflmhCrye+o27FyLB0UWj/Wkxl6BwkP1g9dOOvmtPBX0INMOLk
 5eVv2fvhepCV1arcVhAIv06+U0lWR5QmjZBgoG8uSE1zt4mVaUdzLfn/0tGlkG4alIVM
 VJBw==
X-Gm-Message-State: AFq9FYLzAfcWJqruveUvz0vV3TMIL/HJD+wb7PFBMeIHUN7B/ZRXmlNk
 W2/fUZrhnUVLJe/N5vsi6NyiMF6lTJne/QNolzW+O/MqnlHe4icbvU3Bfl6Km4OriXt/L0as6gP
 /lA7BW1wVQSn1oGvIhP2xY+wZLqFGlXLFrLxetvjqT08MU3piQPqOEZWp84UwosGbqQ78bXiNWv
 BuNQ1TRqx/kV3Zkp3VmRFzE64IyGxkjhITCIh5vT/hxpo43TfWY3Qo1L97SPRe0L1W2UYRPKKBW
 demWt15tLnc0Vt7ckcK
X-Gm-Gg: AYBFou23MJJJs7SpLeHN3qq4ooo1qux1hwovX8oMS+3yH9hXOQ860nBOV/fDqP17T0P
 HFb2+873hRLWoGeGRf6Z6eSDvRypShjr3L1bIPTLIWY2R5XHphIsIIU3nwOanGqoK9d2hh57IY8
 aAhXWwyohc9Ge/OtfNU/TWnFjsgwl05NiL8x6eRx/Z0hcuclDZlzCmAGz7KYxuVZKEIpE4x/EhW
 hbs7mOlxkSxugiYxKyXg5BhC6OTYSAC4ry6JfDCSO/XnFQu0h5CiOOy9P77SuHys2a3drsZdBrO
 i2FgI0YXhMPzkg5w+4rkNnYLO7Z05sLHAlkaq/92vlFfLn+TxpmAkvgh3Z1Ari9ufN9oReYtENW
 ldSkBa44wwSMPSaSwA4WtTZy9BOu8sCkggTQTx3pPlmvufBoJAfTnirU6c6LVupXwYxQ9hF3smQ
 KrHnczQ4WGx6/mGZVJ0gr/k0mGdH4dpgIvFSjNz2zGOVA=
X-Received: by 2002:a17:90b:2252:b0:3ac:80de:44e8 with SMTP id
 98e67ed59e1d1-3adeaea178fmr471591a91.43.1792792334305; 
 Fri, 23 Oct 2026 14:52:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebaf1dabsm174402a91.3.2026.10.23.14.52.12
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-33c35f5ca6cso2282605eec.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:12 -0700 (PDT)
X-Received: by 2002:a05:7301:e0c9:b0:353:5d0a:dba4 with SMTP id
 5a478bee46e88-369e86462afmr726185eec.36.1792792325969; 
 Fri, 23 Oct 2026 14:52:05 -0700 (PDT)
X-Received: by 2002:a05:7301:e0c9:b0:353:5d0a:dba4 with SMTP id
 5a478bee46e88-369e86462afmr726024eec.36.1792792323358; 
 Fri, 23 Oct 2026 14:52:03 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:52:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:31 -0700
Message-Id: <20261023215138.2301146-10-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 16/23] package/{ffmpeg,
 libvpx}: use $(@D) instead of $(pkg_SRCDIR) when possible
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

$(@D) points to the package build directory, i.e
$(O)/build/<name>-<version>/. $(pkg_SRCDIR) is identical, except when
$(pkg_SUBDIR) is used, in which case $(pkg_SRCDIR) is
$(O)/build/<name>-<version>/$(pkg_SUBDIR).

When possible use $(@D), like we're doing in all packages. This will
facilitate future changes in the package infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
(cherry picked from commit b1791fe7c10bc312328926b45108553dbc674254)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/ffmpeg/ffmpeg.mk | 2 +-
 package/libvpx/libvpx.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 4ce129132d9e..a6815c15b6d1 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -604,7 +604,7 @@ FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
 define FFMPEG_CONFIGURE_CMDS
-	(cd $(FFMPEG_SRCDIR) && rm -rf config.cache && \
+	(cd $(@D) && rm -rf config.cache && \
 	$(TARGET_CONFIGURE_OPTS) \
 	$(TARGET_CONFIGURE_ARGS) \
 	$(FFMPEG_CONF_ENV) \
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index d6b84ffec37f..2523e7ca9931 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -30,7 +30,7 @@ endif
 
 # This is not a true autotools package.  It is based on the ffmpeg build system
 define LIBVPX_CONFIGURE_CMDS
-	(cd $(LIBVPX_SRCDIR) && rm -rf config.cache && \
+	(cd $(@D) && rm -rf config.cache && \
 	$(TARGET_CONFIGURE_OPTS) \
 	$(TARGET_CONFIGURE_ARGS) \
 	$(LIBVPX_CONF_ENV) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
