Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14664606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WT6fnJmL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ncwFNymy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6E3D81359;
	Fri, 23 Oct 2026 18:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUuLd6Lrb3iZ; Fri, 23 Oct 2026 18:18:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E990380FFF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779504;
	b=LSf6XZmxiX/KrV7AWzr78+qFQbwWn8Y/qqFXhpgMI4nOMv56AqtY4mjsto23BvycL7Cv
	 NpR4OKHk79Pk1rY3JGGJjVsh7H+Qs/ExhxdlIuAa3IKxsoEXgSRg4LPmZd3TaLmlfVfK7
	 52h1CWW0gcp1rkzNgaPpCBl3jBANQq8NMTYGwMFnYOQ4OWu70LvivYFXCHizi9NdzJzaO
	 ymT7w0+74DPP+kJH5p43tzE0ZaDOdXMoOKpblFWf+7FKgME2EKNhiOrPm3/9ORZ0Ia7Ba
	 Zz7k6kZ7Jooc9zmdcBE+X9BrkPoaZhfXGT7CYSxzRvTvilulXH5K97S2v3fSSB7VUzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779504;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=c35jFdVxxIM43eNePWgQ1clR+T7PQQ/9v72I982ob+g=;
	b=bUovDWV1U3jbURP1TqUI7cd4dqlW5aNySy6oI3GHw4vlBIDdSLQOKA5lg/HJkJPDJqZe
	 hgl30HJzcuznuYJpHi7D6aPc/hbbRqYyPe+BBaT6fBc6QC0U+l+pEoGIo8s4/RhZQEDz+
	 m3sciPwJDt07xYxr+QkdZ29llE09hOb9bXW8nC33LkPmQKZLzb+GMy1WNJy0PydFiBB2H
	 0CFu2+TtFfpUGR2CSSyZqSCLmKCwwj4jZg6YR/N3mguvQqoJMDg0ikhXMBJBb5DgjaVHm
	 SNLmPdRViCoQsk6H1Jcwo34F4pkeI/DqDgZ/waDV4UxkZ+SB2EGrWv+JKO1iN115fDg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779504;
	bh=c35jFdVxxIM43eNePWgQ1clR+T7PQQ/9v72I982ob+g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WT6fnJmLKG2akYEHCEfNhhPtzjRUteAnQs+yEiFD5kLpu3gh4OhBkhYMQcDwu+DN/
	 YdLAqcEwKZCtLp1lHFRNIZXXefmHsxvx4Mduc14c55buka6DSbXRFFJSkAFRwPeZsr
	 VxLnJbXcgUtxjDqxffE27Mnskm0Y82dIbmVRsugTm7HD47+PYNWlTAaKvZHqqqjjDM
	 IQ8AXdjM1VYcpZOBH5OuklWaaueuL1w62KTk37LFCCLIDgRvnRrsgHGFsg8N1YD4rA
	 MjW2rnp/OyOz+1Zq6yS0/20qdu1g1Eha+kN6dq85biDrhxYul9hThNVTgZ0cA9GDsg
	 +2EVTRYmu8hQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E990380FFF;
	Fri, 23 Oct 2026 18:18:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E18B7235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C797860628
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDpwge4V5a2I for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CD67D6067B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779502;
 b=UxaRXeiRMGzu2IpYrZoqBk61/KSryxXxIH8h27bLGmF4Gv0MQdeQ7XaDjb6/4icqn6pG
 xCpKMLCXrW3kVcvOiITJ566DAnbSF9QjI7CUO8W98TZKbGbyKqAu82T7IlWXHSzcklVyY
 GdFG42xoAYg4PrUMS7+Ki662LpGibHe+XEnC1OI+2XWKqy9KPDWFLRU1jHqcqNaQIB8a3
 S24n0M8vCMSNpedyGCfMT4fE8CR9WUCa3ZkoPz8pOfxWRR9F6rnnlFE1gevBZQlwHn6bR
 Ws2V23WjSZkQ5DeW4A5hRY9saXmV6BjA6iPzjctYGAE1iTG0DDZGJTqcFmJLSZ3xy6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779502;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=S4XZdZXBAEc7BmgSMqvOUkBatdTt5lPixMuMIXxDs54=;
 b=p2G0xttsB4+DEDknFpM+wCtqDimX1oACABK44sZYWBQ8DARaJnc+P0Psj3YupiwDZF7t
 kd8sPzjGp8Myd1EErMBo6XXXdCsCAEETYawwVuBW5JLwWz2Dg4slP4k6y7mhRR5fbWZ0x
 qRCYHvz5VcATnuLx6Xy1me1j1uwJJL1yC8dimYk0iGGxso/7+gdxo7jJh0XM0at3Kfrrw
 UP2vle3DUJrP6V5QNxwMkQoUB8pQWifAu6Uu+wB/28etKhK54C9jvpOJoQsi8OI3bIgOW
 hDQGsATO9ssXRkPvN53dkW8gtmnwbXIE/4LI/ZmjccyQRfRDOZ7beRpLaKnJi4h93Lw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ncwFNymy; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ncwFNymy
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD67D6067B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:21 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-6d290b10a35so517804eaf.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779500; x=1793384300; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S4XZdZXBAEc7BmgSMqvOUkBatdTt5lPixMuMIXxDs54=;
 b=ncwFNymydIvaOf6+T5oau8FXfdVoUVa1VdbVHaPhsv2l+q4FkIdQ8hA5awrryCHASe
 NcVAlPYqjraoKH48p+TMh/t2FHxF6nsvwZooOrMht8HYgHGkIOuc9kRNJBulo5lZiuHg
 pp0NxDVP5bRy3XEQctgDFrnPMXEKY9HhHJJR48lIY3pPb+NaUfWyTMrYRp7/kr7h8Z+/
 FiFzdjTlEvaRahQ5og7O+BNg0cnnj6PGLfDaUYUdarlgACZ9i9OJvWSxxjF2tXBKIJOu
 8D9LUoMpUiEBlA4ptBPVhIyyI2+Py1InEdUW9kXpa7NdfyNI+HduouVFi4k9PFMZtkNp
 BL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779500; x=1793384300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S4XZdZXBAEc7BmgSMqvOUkBatdTt5lPixMuMIXxDs54=;
 b=ycHrnIYXZF0LV45zYJSqv4sJaeuo9+I0YSNVrD3zWjs6zriiaCDc1yySJn+mgGaZsv
 agT7HiShj9GhOTltPoD0cVOYaG4ONqjIiNC197vKr2E1R9cxtbLcgR5ju8nyxoXHU+7F
 1XNtrGXceB7iqQ45IBA8/SCXqIygyls0i2jsPHlw19aU3IcYkxEldP6TLUKRyfAXGyy2
 u8BOCZPz9/GMFEJDTHvwOLFzHEjD22hWQas6vI3QtJ36DAiRMiJ1CsmQhGyFfbBojaRB
 RHVDC9FFiDVBnjAZqypT0ScSySPZXqU7uW5B3m1tQtYnKT0NP2QAWZUSuPJR+MDOABUQ
 8xrQ==
X-Gm-Message-State: AFq9FYLwhCmhgon+sqWaFe1wqQ1nc9153p09HRlcpI22l8K0wny9tEp5
 vBvnwbXW4yxaUH21HFX0ug4EpTrfWUbmx+Bx5C7wtIifXKua7yxKaxZwW/NNdg==
X-Gm-Gg: AYBFou2B6l4exCrzQt6HwLqwIMQEVDel3RFznfXaeRtK0HM2OMmm7SrTF9Y0wwUpqKI
 tIMas8iv6MDe/pnkSXofmSpWwVaeRpR+8FwNtAb4/d0ksULwhuDJNbHKf4y/LGmlBHS4iinD/Et
 UKGZt8B9wyTFcc4VdBb83w278zOe+UT+rJOqrbgK5BMgnR+H6HIPYdk1eM49jWgHyAWh3JO1NYl
 Z7kZfZOVueeuBqOEM8bEKhqryw1Mc5gLG0z6vyBsrCDuLG5jrKT4Dx5cUesft6T5HF2UtMR2eiO
 eq/iPCJKi14BKKXJpTDDlNMRr7BMh27fSr6gzbGn3CuexUIohnRGl4WuNO+CjOnfS6JOIztPEj3
 ZC4gp/xWeTiEgbbEzMjquoYN1THO+g15hc3ZHhvz9KuXfWXRkPvWFBvJ7lrvpRfu2gvMnBpl/n/
 sllOi1fMTQ9bjnqpeJR1meMdxb1DmWaQwbQl++pcUk8LCd6hCgGl3TF1bZhsFX8z4PxE3sIIjST
 7SRQijzP7fRGycCGH+aMX0npNvttINcWtIAjXgUdHlJyaNqvze3i38WfwNyQpQFlEmI/z2Bfu2y
 SitlpUAjqGjRqu+igBqE+a6iCTOQrhQO6ipNJhJVFQDV/YX2aYEhWo7yRkQQrn1jmB2Nt3iIm6b
 togvG06P7usWQyhdQ8kB+DS7HyFdaGDxezrN3XpwIdjXO48KaGyjAdsTjZsbV+IBbE/thaJ/Nn7
 LoFRcSexR8bxVQLwm6ZuO10cU=
X-Received: by 2002:a05:6820:258d:b0:70a:6888:2281 with SMTP id
 006d021491bc7-70b88abb136mr1574691eaf.69.1792779500106; 
 Fri, 23 Oct 2026 11:18:20 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:18 -0600
Message-ID: <20261023181818.920329-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-alembic: bump to version 1.20.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index 2f886103c1..9287447bac 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  d221e130339edc326f8333cc315e8c32  alembic-1.20.0.tar.gz
-sha256  db505480647bc60386c5369402f4a57a506b7539c9e9ef5e270d45cbbe4939bf  alembic-1.20.0.tar.gz
+md5  bb84aa125492dfc16d26003dcd181311  alembic-1.20.1.tar.gz
+sha256  83490def1f723413db5096591f7609ac52544805be93849170088ed04f5a2e0b  alembic-1.20.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6e68d94a03a0e3e327ddf3e86d1ebedc14eece3922022618fc246a36296fd0cc  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index a940e14eeb..6f189c977b 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.20.0
+PYTHON_ALEMBIC_VERSION = 1.20.1
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/ed/aa/02910bdb8e2f1444f6654d5b296cd827d126f82209050ee7b1000f92ac4b
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/93/1c/00909e0fbebad2121d916fdcab044cae988146680e9ee4387ba25fef8747
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
