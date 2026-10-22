Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946A606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UFx751sM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KZbgXXEY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FA936070C;
	Thu, 22 Oct 2026 17:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2L7JOpCinEc; Thu, 22 Oct 2026 17:07:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3EE1C606C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792688865;
	b=HOBJp2+MQiS0aVbarsh0hxMx8WHGuInzYccxWVNu6yCM2TVmATl3hEkr3wefCDCa8d7i
	 T2Gvex3JxfAz5L0gsYTVCv3V3L/5WttemrtT9ndjUH9x80pfVLEOyaY6bfRDx9mHQvcc0
	 Tv1mzC2LQ6WmHwTSMT68CFfrbrjpKlQXp5YzubdjOqozW80aYnzSQ3dUEPvidKbgkpwYB
	 2qPYQxR635eEsXnia9zLPSVLbNlNsfP2TauDNkNGWTkijnD5a4Pf42tfjtqIaZkynmwbA
	 QHQyXPc0h5KFD6X2HfZsTTLzpeS0ScQhayUN2On+XwCMDJS/NryVTdo+paJSluAxj3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792688865;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8CI16Jo8kKY/WomlwDChlVw1LB31bEZhKrLlNy4VmDc=;
	b=ryEOeUADWA8cmHOARimRrRfswvEpYNXanU7iPh/4eSmi/vgedQjZjMKrbSgKxRLwxuFu
	 vxXWsWQ5BZ8fwymiwTd3tiEL4ma2qSEaFB1w2WA12oZW+ATXbIxkWeO0rinAplT3ut65O
	 0FWkuPXx11fp6s+VtS+S8GdtXCcsFmEqIHFBGvJpeC0TxL4xnBOAOLRu1BiaZIRI4vpQB
	 WlleEdG95n7ud8bbmVhWad7LOuDIVvR2XomnZamfY1FZVExFsHy2mgyRB5Bu2Ik/LpUYv
	 jmp4vlplV6u+sYaEdUTtRoDhLeQrAQ/kc7qsxJfrzlHM67sKTQJ12tu+OSjMqL1PXVg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792688865;
	bh=8CI16Jo8kKY/WomlwDChlVw1LB31bEZhKrLlNy4VmDc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UFx751sM5tTTWtrPtMi+3OURZrWj2g5gAFYHUSOuAhTh/qsVt5kt671Cfn2y9Ax2/
	 hOpBun/x0z7bpPr2A+cWarLUJ/Z2v22gB3eYU884sWRkEFY/beYDDXFhfNK32uGlK1
	 mnGdxR1bePGGY95fTHSHbLbgOOmEm5HrVDaqRPuCRr2cGwCEqEvfw0okdWuXE+t94h
	 Fhq71g192n/qm8pyzZ+UtP4dby9OAU0tCHrW+otpadEjwlgngFaIOFrfaCm4VCPmnT
	 UynO3jc9M8MC5wK4UbbmaQJKKf3WXXYpOGwAmaUHCt7yX4eGhFaHCV+0eV50HFQkT6
	 V6YjWe9AtfX+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EE1C606C4;
	Thu, 22 Oct 2026 17:07:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7E3291C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D595940959
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJzPTaxbxUAQ for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 17:07:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 257F740952
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792688863;
 b=c2e9PODw7E9OwdU4lxmuDMNj7XM8WFbTv7Y4WcERRfPnm/4uK06Xplo8kIb+2yKFvz9I
 x3NCixbaF6QkM4yyqZbaihpvNSntUXKRm8w1yTpT4lEM2xUu34mPhErSTgTimKpeTARnV
 WVa3XAWw1SSsT0AUqhwij7hvEm2vRaQ8t/ny+wORAL8HACUeKPITbEP9VAyXd2yE/aB3v
 WKZRWN6VVeQTvhJgwn+a3kLoPHo1d6P5Mj8if/ClONBBY9cX5K5I5dmDKuy3moEbyHGa6
 xbxEqlH4+zRDkmXOZsKhYtlGHsefK3EcgjqXuoP8jau2ffPa+hhJwO0fiYhY4boTnYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792688863;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=KjMSGhZtRQZHnY3RfgPMMnlGLUchYcvpTkCutSeYZhA=;
 b=paeiwSjuqD3AvYKJ+c3FihFyZwcHMd+rEzbcKH5Q+SpI0Op35vC/8N7UnLAPZSYSWuip
 wEODqcKQ6DB6GO2sL8nr4WlyHSD2JlIXapQaQrNAmm6fnJCMjyM/JHoOTRbsW1lz2Y4p8
 WhTgC0j3vfybOtbvZjbWW38jBU3uiflHlioiqbVjA58StXXQc2t20rThthfioEdExDC6z
 ShbmtJR9QqhtERQrCxs4+WdNo54YZJyLBZq6/a7PjQrbkHwPdyUzKt3jeRbvfnFpiNEEU
 607wxzQzfFScIXRgMXWLzXa/6MOCZOTYWqrUpMQCs9MO8ty8YlTYpfKVVH31//BReJw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KZbgXXEY; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=KZbgXXEY
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 257F740952
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 17:07:42 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-843cf077f10so2290116a34.1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 10:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792688862; x=1793293662; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KjMSGhZtRQZHnY3RfgPMMnlGLUchYcvpTkCutSeYZhA=;
 b=KZbgXXEYkfam/kDIqE3RdCGBTTT5Eh4rAsGYHYUloOb+/vEDQeQiUu2p+1a1x21fI0
 /GxFmNI46aT1ETBau+4Rm2GbOFkDlAx5IGLuSNe42VdRG/HcPUZZVnuGiPr1qGJWirL6
 LHKAmvfogJ4wiOZdq+loeZfsrjSC/Ld03G9lnAzNfSOU+/u6O4Q6mMNzRxk/UxHGeFz6
 RfwmXJdycUAeD58hiV8jTGDa/FomVwdM79JpcBfeiIAlmkAOKw/EUxNyKVC7BQ4Wijei
 OCnJ9eBXrl4syz7ZY8oz7gk2Qqwizhzen8/ZPett2NqfD8JB7n3ajkfhk9e2nscYb/4T
 dZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792688862; x=1793293662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KjMSGhZtRQZHnY3RfgPMMnlGLUchYcvpTkCutSeYZhA=;
 b=Ec62G0N9B1Dj7Dou+za8b5YUeLaW3eb0m3i920zq7AnJ6xPOq7N9rUlaxjgpZvetMN
 yAe52Mq7Ol3U+Et2JCxmLgyUHlJGQSNzlV7V3uXTc2zoFZ5ukRRcI2Go9lccYjaMt/do
 SqJKvIP/W9Zc8+3uhNp/Hbw/cndvux9ftL/sTvYE3HSZNwfSnZjUFyRvMmEecBze3qqw
 oC5nyYv50gwIb+9VdFwZ4QZDC2SZCKJPyYlkC4N75Obd5xBLSkhbTL9Afu/NIbOId0r6
 FzSXxA5ckWd+jTPMDpn7SOAGMaLpqzR/GiH0YU0FMGiPDvMKcXCx8zC5rLU+FbVBj8ZV
 uw1w==
X-Gm-Message-State: AFq9FYKXCjs0GljnVKvSRWrpPeTzI/G5C5bK1LNd4Vo8L4hXnCuywxER
 wgwMfoUqpyLz4+JIsUwHYaWMcYighlpP/IgwyEnVumO0vBBNqwZLYV3izAagindr
X-Gm-Gg: AYBFou2BT1w8olBez4lCkqyLi9U9U3I0YqBATWAvSoGLu+XaeHzY15TKo06A2YkEUFN
 P5U28Cjqo8jAHpIV1y1Ef978J1fX4yO0VhoJBa/TLsrvypAQD6it9qSLyJzp3RnoYDb64OWPYTx
 Ii0vnxifI7heKyyH9yC6RKWTaTWnMofmSACHt+KQIvwqr5FmX2TEsiqFgWHUegsL0YU8bnBDzyy
 6NU1gRwp5gjUkjjDXNqJ3Qkpap2Q5mmo/3MEVxVWWLyAAeGlgCnnfLOMZZKMyrCFp31UkGONHEG
 0VOkr75hb9d7QquZhp2+TFXjCoOuqz3Cv5bWCvDxrK0LpPiALEp2ql0Cls8EKG8ngM6muJn2133
 scA+SjyJyFdAmdEek7Zz6BDvaECbmUTHtOst4g+QQJGWQpg6Oo89Q8xqHi/gETPNFO6Xt6Ih/Dx
 Kx/sLOQ27g4epvW45Pjs53Lh/Gjh+SiOuBDRFdxrh9UJTRoYABxHyNlXtnPBdx98HgOiQuljSQK
 V4soSzRuL2yryMaLwzkYhghiJQMsaw2QBp5fzf0ERMrMdyQ6e7qMFcoRtpE3evaopCM9pm0jiiW
 F+imN8S/z0yStBEtgI+HueYvjAo8+VUbCgjhFfq8VDDq0I6TaFSTjth4LjUQCVd1TUv2BFNZCeA
 TTEQ3ZDbnsaYjmO0PR7g3pRd2lmuBCQQnTKybk4pNSBPknwEjR+aGxCCf99Gb5VT8VtCUNbii+j
 ycnFr3RssBL+vDlqaZjzckso0=
X-Received: by 2002:a05:6830:2811:b0:822:b35a:a2c3 with SMTP id
 46e09a7af769-84d05db2f6emr4586581a34.3.1792688861622; 
 Thu, 22 Oct 2026 10:07:41 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-84f7703bfffsm243128a34.5.2026.10.22.10.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 10:07:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 11:07:36 -0600
Message-ID: <20261022170737.3937695-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/tailscale: enable missing kernel
 options
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable NF_CONNTRACK_MARK and its NETFILTER_ADVANCED dependency for the
nftables connection mark save/restore rules. Enable NFT_COUNTER for
older kernels where counter support is separately configurable.

Enable the networking and TUN prerequisites, IPv4 policy routing and
Unix domain sockets. Also enable procfs and its sysctl interface for
IPv6 detection and network configuration.

Enable packet sockets for the TS_ENABLE_RAW_DISCO receiver.

Drop NF_TABLES_INET, since Tailscale uses separate IPv4 and IPv6 tables.
NF_TABLES and NFT_NAT already select NETFILTER_NETLINK and NF_NAT, so
remove those redundant fixups.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/tailscale/tailscale.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index ff4c68f0fd..950f9786ca 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -30,20 +30,30 @@ TAILSCALE_POST_INSTALL_TARGET_HOOKS += TAILSCALE_INSTALL_SYMLINK
 endif
 
 define TAILSCALE_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6_MULTIPLE_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_ADVANCED_ROUTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTIPLE_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_NETLINK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COUNTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CT)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NAT)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV4)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PACKET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_SYSCTL)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UNIX)
 endef
 
 $(eval $(golang-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
