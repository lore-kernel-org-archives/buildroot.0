Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CAC606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MLirklTl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D138409C7;
	Fri, 23 Oct 2026 13:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRqxkIdHmsVJ; Fri, 23 Oct 2026 13:21:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E754740992
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761696;
	b=LwDuS+SAepzUmG6ETcFd5lplmyqGOnAX1jUFpThikusoerX+0ISk7qyeZaBSpUV0m2F1
	 3gvq7ZaBuNMevzBttgU1Vod5/yn9AAPeyysicwLRE5vAhf1dCXnq7F/a2kGsVA3z8Q0xX
	 r3isIBLwWjpIg0xoMW5q+SGecYfyO7UNG6IEzQRBhT0W3RIyBoxJjYIRh6zOQxFJXIT3B
	 a1+KPsVF/UKdJ54eTekZ9zP6GGFIRuvbiKyYftVLexaUCF0rqoOl6o+y/ovzL3I3oD9lx
	 u899C8baAoXCNi4UGMPOeZoNiJAbQTn+AgZeFxOmhzdMMnUQ7gS2mUgt/Pmjeivu59A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761696;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MNNFa8axkmjD0x4baK8xlhnl7E2fVyYRRf5wUz1bpPY=;
	b=WEZLD6A42Pf6JVaCBFErqxc4ChF/18rMVRXNhirKPwfZ4HCWF/A3Tjh4sm/LnXERm1n0
	 8pMRtL6oCU026R3PEcRl153ki5gIA8Nfub4BuBG04veBih42Syp48MuJVAJN5160aoVJN
	 DQj3cdwSGA9YPv8MsLMPOOE94C7swEfVTu0VLVRGw64aEymrPE3ClqFilhXgPfr+cTMSQ
	 Z7W1pSaBuR4A6K3/UYXkBf6ZXDzj3g7we3M99Wwt0lD1nWRpC3ifPusA5l25qTRoYt6DL
	 fvA00C1J5W7r7zjKqJppoC22gmAswNn+odWhvjNlGI1qqn6qadP5bPAGYWg2BiCLQtg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761696;
	bh=MNNFa8axkmjD0x4baK8xlhnl7E2fVyYRRf5wUz1bpPY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MLirklTl7CsHdEKMBKuekQXyrTugbUTG3HzCy+bLb0v4Fo3k+Pw93mjTOxfR8s2u2
	 2IDknH3Tjc8prsPF8c8tKK46nLajN7mft21S8cAr18PCTV5Sx3exKicesxL+nSkCj8
	 /7Kjf/Sp31AsBqEPCgwxcVyUpCn19uOUVVXD+yPHxqE0Om2hLyYHC4T/S2yuWnUqP5
	 E1Efod/5Tb2oZEXMhkQfTuBdL5D11VZBg/b0zj5qVbsDovhbIrs/a0WFttRN4KQU9S
	 bl+5KQJO6iK46a2OAHwQ2dJH3oHPQySgrMUtOueSW5YGnAS5WWi0DQ5y4Zo7bZ8Ujr
	 MOEfPU7D69M2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E754740992;
	Fri, 23 Oct 2026 13:21:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B4AA356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CDD681496
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyFiwpyyC3lw for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 610A48148F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761691;
 b=qQyomyjsEJLOujd3KwYvJDLx61WCXyt60N8rOdqUiusOUQphnY3pGSL1OfRKdziX+nX3
 6yy+8YvFmInYzEuI0MyhGnzR4POCnZSrkUIPesK6g4GtPQ48wVlEYZGTr+7EfvlReCwpW
 0f0u7+aEx0btLDYS3v02VKzxDkb+8yCLyViuPbNJc41LYuGL6PkPyuhqJqo4e0iiW1/ts
 ESAXMGsIVNew6tKBL20XX9ezUXO29nsZshyWWIPvMqI92vguqjD8sRvCxdFHexA4Sd5x9
 FHU6tmOSmE719wq+Rhe5/5KfpMPtgceVCk2p9vvX35CCmyQuV1xxDWo/PQ0peNU4BDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761691;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=NbKoHk8wqtcwFwGRSL2DxvXgOgTAlstx86GQRePdz/o=;
 b=b9H/+yRKJfaV6/0IoSzS0K731dQkObhAJ/QsfDt9ZLAd0rAfFOfq0MsG0kXPHebOUPUH
 3L6dlnNNW46Pp02K63XuF4fA5vUyoRliz7jIZXQSyD1XlJPFegheXrV8UVoIAHU9Knh1f
 DcaeCPqwJIbEFJt8zn68xRr+FzR1BkXQG431mFFzmctpqhzaxRDJjxVxL9hxgt2J/AVZH
 0yRhx68Lrh7p5fp9hW9p7eViOyHBEvMzmLdrvOZu+QM2a4nmL0OGEoIPsYVXaYEshsz5D
 /4em/F/yxM8vl94CCoW7fdCsmjD0Qbh1dvl4oE7KmMjOFR8rj2wACo0jgAZiUBa3oMQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WGUJVUJV; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 610A48148F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a1e34ecb02so5600935e9.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761689; x=1793366489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NbKoHk8wqtcwFwGRSL2DxvXgOgTAlstx86GQRePdz/o=;
 b=QSRpBCs8wx2EcY7PKUx0dNGmpw9XGIqRY7gtG7g8QatUsu6ZbO+1JqA0uflEv/aDsy
 FuJcVH5VAy6GFs0QNSqW+qsl0AM4dE2/TTyqx1R3f6kvbH+SlMc2WDaXmyhBp2QzUGdh
 E8pfZ8tdLhACg4yjlkZEtD+J+0cKJhI18ygmGN30KJk1IjNZd9zeEAsZFJMZXWutenJc
 JY7X+ZYyFjX/jRQ0T+CK6zCQ6LYSlK6V9Aap4QPegxbM4hVcRU8gwjSp4tr6lNhIFPvc
 EEXzRFLJGEcQ6MjTiNxvmg8KGttPOs8HfmSfugmeWFl7mg83vTLHdWu6uHRSUZ6evZmJ
 SWAQ==
X-Gm-Message-State: AFq9FYJ7dIkbhyQSQqbzxhJ8MBY3AGJlOyqpIC3Iq8kSM0W76ypEZC2m
 8fjpM9wyYJ7HEktn0TaTebqID5rAe/+pKhqCsqykaNKsueVUeybK6gaV6qDwlQJ8pvF35vcJGzj
 QQ9ZmEr8=
X-Gm-Gg: AYBFou1zJvUMK2r9yR9pc9UY7bra9Pe+kPfwascRccLMTTb5mw9b4leQI+f71NB2pzH
 pVDdE7Sj9vg8qhSiEPzKdeOlB5YkMMRE94hnCMuXtgyHfN1OkbfLT3qt0DW6swiPy2QMZhHsfyP
 Ae0GuMQbfR5ov7r2NUj+WfTEgOc88ngos7gOOf2MZFPzou1gg2PQ6BDx/aPJzpUD+wl87i+AIHy
 njy2G1VpaXwpOgjOREyXZUR+Oc/b03TPt6CUQyUrLDowOyvEu+x1LBLLNLsr/rlXF4tpG3SNV64
 I2CAWOmA6/Ada+G1N4c15YC6DcpcFWyXIuUF9q7ifr8GmWQWrY9dyZI2rnv7cwGB0TNT7SfMfOE
 skmwvzM9eV5MmgiBSZBRDfQsWvjsY/SGghVNltm3XLByV8/T9kTQKCK1AqUBttNy/fO6MrhD87o
 SLAKaJ7uEnDoz61G79sBVcNvvQYQBxQCJuPpU+QW+Vn4LUWWfXrwNtadCS/gU3VSAO7+BChrYom
 LCLVIbY/3Cf+w4hvD+r+QzDetmAnFNHnye5HFgAQrot5GhU51XjnjKERMa1FEXpeu6GK7/cu/dF
 Ws0=
X-Received: by 2002:a05:600c:3507:b0:4a0:1b14:e283 with SMTP id
 5b1f17b1804b1-4a211c787eemr39054345e9.1.1792761688872; 
 Fri, 23 Oct 2026 06:21:28 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a21534a306sm29820065e9.0.2026.10.23.06.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:21:28 -0700 (PDT)
To: buildroot@buildroot.org,
	Joachim Wiberg <troglobit@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:21:25 +0200
Message-ID: <20261023132127.1607978-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021094247.2931801-1-troglobit@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/firewalld: fix
 CVE-2026-4948
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> The setZoneSettings2 and setPolicySettings D-Bus methods are guarded
> by the polkit "config.info" action instead of "config".  The desktop
> polkit policy shipped with firewalld grants "config.info" to any user,
> so a local unprivileged user can change the runtime firewall
> configuration.
> 
> Backport of the upstream fix from firewalld v2.5.0, g5fb3914.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...K_ACTION_CONFIG-for-set-ZoneSettings.patch | 41 +++++++++++++++++++
>  package/firewalld/firewalld.mk                |  2 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 package/firewalld/0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch
> 
> diff --git a/package/firewalld/0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch b/package/firewalld/0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch
> new file mode 100644
> index 0000000000..b875e69903
> --- /dev/null
> +++ b/package/firewalld/0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch
> @@ -0,0 +1,41 @@
> +From 511a305c504e4c0928eda670598528309da3436d Mon Sep 17 00:00:00 2001
> +From: Sizhe Zhao <prc.zhao@outlook.com>
> +Date: Tue, 31 Mar 2026 20:46:50 +0800
> +Subject: [PATCH] fix(policy): use PK_ACTION_CONFIG for
> + set{ZoneSettings2,PolicySettings}
> +
> +Reference: https://access.redhat.com/security/cve/cve-2026-4948
> +
> +Upstream: https://github.com/firewalld/firewalld/commit/5fb3914ad830feff6cb2b0670457c60a323c6c6c
> +CVE: CVE-2026-4948
> +[Joachim: backport to 2.0.2]
> +Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> +---
> + src/firewall/server/firewalld.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/firewall/server/firewalld.py b/src/firewall/server/firewalld.py
> +index be53fbab..ceaa4322 100644
> +--- a/src/firewall/server/firewalld.py
> ++++ b/src/firewall/server/firewalld.py
> +@@ -946,7 +946,7 @@ class FirewallD(DbusServiceObject):
> +         log.debug1("getZoneSettings2(%s)", zone)
> +         return self.fw.zone.get_config_with_settings_dict(zone)
> + 
> +-    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG_INFO)
> ++    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG)
> +     @dbus_service_method(config.dbus.DBUS_INTERFACE_ZONE, in_signature='sa{sv}')
> +     @dbus_handle_exceptions
> +     def setZoneSettings2(self, zone, settings, sender=None):
> +@@ -970,7 +970,7 @@ class FirewallD(DbusServiceObject):
> +         log.debug1("policy.getPolicySettings(%s)", policy)
> +         return self.fw.policy.get_config_with_settings_dict(policy)
> + 
> +-    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG_INFO)
> ++    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG)
> +     @dbus_service_method(config.dbus.DBUS_INTERFACE_POLICY, in_signature='sa{sv}')
> +     @dbus_handle_exceptions
> +     def setPolicySettings(self, policy, settings, sender=None):
> +-- 
> +2.43.0
> +
> diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
> index eae8afc27f..d2c87267c6 100644
> --- a/package/firewalld/firewalld.mk
> +++ b/package/firewalld/firewalld.mk
> @@ -9,6 +9,8 @@ FIREWALLD_SITE = $(call github,firewalld,firewalld,v$(FIREWALLD_VERSION))
>  FIREWALLD_LICENSE = GPL-2.0
>  FIREWALLD_LICENSE_FILES = COPYING
>  FIREWALLD_CPE_ID_VENDOR = firewalld
> +# 0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch
> +FIREWALLD_IGNORE_CVES = CVE-2026-4948
>  FIREWALLD_AUTORECONF = YES
>  
>  FIREWALLD_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
