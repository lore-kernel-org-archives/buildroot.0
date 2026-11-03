Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94443606A820
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 10:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B4z1sVsJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3GQvTVu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 663E1600C4;
	Tue,  3 Nov 2026 10:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMtCWO5YTb9e; Tue,  3 Nov 2026 10:52:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7508660642
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793703153;
	b=Hn36u6nr6ZLhc+F9rRxZD9y0fxDyZeaSKNQ6ARDVXgaMKQlFPuWxdqdVmUc76XnIpYWF
	 VQoq/zs+zVs+yrIyhO12sTvRUaj4Y0QehaqLy6gqpvb6nliZtLeUTF6/X/UibA4gkLA8t
	 Jo+7RJvF1a7DGR4EilyM0ZHGQd1YijtxLv6eceStOpgkVI5cZUhuE/7C7QRQ5BwXOtLnK
	 kLVSAWA+EOrrgSJCjXYnbXCbjYOREXgpLzhhMPTDXXTJLJvUTYMvHCipvxeM0nqXGEgZv
	 muMiUePe+ovdZOnDNnjy9s+Yt6Xxk54CXoFB29/cw4eD5mtAYTc9oe5IX4DOMTQdHcw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793703153;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eQLW+U5r1wMeqf0KKM0xL+PeNaTCVWf5RLgqfUH2hAI=;
	b=KatgOnn/CTl5lWcBlnQ/Y8xMgp0Y66aVauImtoUNGohcBGxpqfv+5K3QNFkTlhBqKhVE
	 3DclsOPdZCsUequzu8SN40AxZ5RwNuy3e/ddkUxsVlaMSEwk3/V2igjl33364KQH+Mbdc
	 l2oB8QICsyOOqVDVNTP2kfafvpngeIvjJgeJH+PMuF7PLjxsKN9EcbgpCE1zdwYJxmq4b
	 wq0XB4r894mc03AqFnBrOKy3DQRfYn5lClHTAQF01YDhOTNGQWKOG9FiMJl6x4OnuVNx4
	 aSjjKdoqIAb9SWq4+1GDr37a6/g9KsSF7XvDZszFJbJGR+vafpiBChcpLUj+bdeLRYw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793703153;
	bh=eQLW+U5r1wMeqf0KKM0xL+PeNaTCVWf5RLgqfUH2hAI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B4z1sVsJzC8t9kv+/fC4kRBsGrlfyDpfmEfYOONmjtn65X9zBItIx+LDGyCfKlgC6
	 QjSEkt1AHBjnzvZEdih/zFJ7B8ENW52CI7iunBvomTRvDprtUanz+CuCN7aHvFIrid
	 ZN8VF7sK+pDJZJXSETASMPP3RSGLgyTXYBOKj1LvFnkumJf02dUam3Xakq6SSYCy7i
	 wPhtow2AcUZtZUury+8TRFZN54/WZGnDz2+VU4g5zdTSYyySEVUW1UbWbUY5lZ7a3P
	 piRk4y79eXz6RSoLmSPnYgODiPXnUmqXGTNEdnc5sWxCINNqRaxTTMAeV5iuHF4Uzj
	 7dKklejr1+6Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7508660642;
	Tue,  3 Nov 2026 10:52:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DDB93356
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C354B400B1
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIrzrTESzm7i for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 10:52:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C9AED4005E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793703151;
 b=W/0Ehj1PVALDM7ODfozr93pm0OSYP4wVEpsXr8numlv1gYliC8r8ZiHZaqQmyvt46sqr
 WXMtQKRSGmaYwmQjDwkCf5PbT1X63ZrCmtMXMOh2UcGmm4D5HEhJ4DtZNMVJmA2l0Cb5W
 qJH62nIHXYZOF2+V0NfR0iG5gSqq48+lpHF78WR75/P/IsrtX1yIu5D/wYPeLXSThsAG8
 dEJRNwxIoxlP4Kw1WyxP71PRYIbWMlfJVX9dAPB9PJDrBRPpihC2sMBsj/8emtX0ROkVW
 GIgV84dP1ry9NyOA//bWw916DLw8T6UrdAD9qnQmI+nKZJsPLlJ5exFViDcMqcpEXtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793703151;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=dontW4kpDv+YKAlcTbj7ccxNcUHOHKOVPpVZp5d5f2E=;
 b=nrGtF8XH13/2gHOSpJYUKdYu9tJlR8ZdnfczaOGj7lBeLDxrUFAEKsCbNasTdnf4l4BB
 ATzIYbgLgR1AFsX1wjbaF244r1GwOAcXKO4QAHgIDyfdZZESW+cKuBq6iYsi12K/n+PWa
 DW/T1+2prUVUwBHxYdnH41o9rezC9oATztuJHCDN6hwM3XfRtZpCFLgc04vM72T9d7ScF
 DWkB5M6be32qPuMU8NFTE36fFvkFZooqxj25XHBGGMitPI71Y797kbmQvBUYTZ8iQVsdp
 PzcyEVKDIO368CoMogFVcRBd0tZo7wFdBj7fZJ/zwKu5ijB6FbmM8N96WQ3puRVaJFg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=X3GQvTVu; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=X3GQvTVu
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9AED4005E
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:52:29 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso2736445f8f.1
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 02:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793703147; x=1794307947; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dontW4kpDv+YKAlcTbj7ccxNcUHOHKOVPpVZp5d5f2E=;
 b=X3GQvTVuCXeog9EXPu28cZDaIQ6BdbYAjRofRGltYGZkKzACZ/6ANui2fc8VaAG45F
 j0bxwan5mc4qrnh/Ym48wLOTMSsEOjWmDsmsH98oA+3YiVCk4iDI2G0TtZ37JqVYbimw
 tGNobFmm7sfpgfY4pixQqQaElTJHQgulQLOgqKs0C+cOqOgCdPKSiXXmjUcCwVA5Z2fS
 29pp3itqs+xhdHoRDEtYRatZj8RKtH54mEq0cnbwIm2PjtPyRIa+XQbNSMVnm794iwBY
 LeD0tJ3zILIIWqgHD6SO1XbxyHCYi+vjVCUH1sky02SMnRLLtFCKK3p5MjOG7WuJbD0F
 61Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793703147; x=1794307947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dontW4kpDv+YKAlcTbj7ccxNcUHOHKOVPpVZp5d5f2E=;
 b=PyNUOn7mHdRbp/PnoTMtWzgFMibpY2oF/SgEb6hCVJmfdNjR1ggN4m/hEx6cugZDIy
 LIgYLmWdc+Hh3w6q1wo2m5GOUT1Yl0XuMZTP5ODN/lQE8MxDzIDwbWvG9fb083emM2Io
 S09mdJ/mFBKJzEgec8ZH2P/nN/YHW2xIO3B26Qo+381RZqISY3BhA3jmXYHegHkeAoWh
 hOTBg5q6r6UUUx+27ilfP8ZgtDnsnUP6ugcKuReMQugem5SqdoGchG/IlmscSAOHAo9Z
 FcLbqnqPr3S48LRgLJsEjHUDAaCX7gWKalwEEsUkctsrcRhJrEoZQGhzuqOH/if6jI1G
 NJ8A==
X-Gm-Message-State: APuU4Z8jc37i01wYaW62s3YfKZubZSj8L8ErujItSUMl5qjmAS2jRVIE
 VxO17waW/dUzkcf/DRW+PP28YeEaBX3i2PkPpQ7jyZt6aHFk11xsvXXRzC7jjA==
X-Gm-Gg: AYBFou0xEekv5o0mpRs1pNF5fcLenBDyHLSdy0w+DQ1z2bnnyuHuKLGXHcrsHeI3QGM
 dcYjyifPgccg4wSqy3bsjVC3FZIrX89faOFic6y8tdHin8DTL2kfC9eUDcogn039JklO8AWvUms
 IK3Ku4ebgY25eisB2EDu7AAAKhnDZ3b2Tc5vrRrx/56kjTHFm6x0CHaKyi6z5+Smsra5rkSWtqV
 hwtdZxCWH/XQh3I/7uYIIBFWSQh7D9uvLkAQbjhDmxeh7/YLh0Gf4MBQ8ruTQPl2LkDbNLu881C
 EFNwPHUavTrt+AIS+Qu8eNV1ROjiDKuoJRKOFKcdxqNlviU4fQQ9Xl9iKnMm+NFmI3oP19mpOB5
 wovmHUMp3to4LQqsAiXnqrIrzP30vgfIXAxFNzhS4fD1QHoCxPcpmBqSYYfHhsDcadg7Aqe9a6P
 vsamyPSoZOkNFHM7zd3slJfsdCd5QNwPT3o8Y0+KRGyJGaBs0G4gxpwnI6JN3PopUx9RrSUfPIx
 CLpt8ZsUyBNnJIV4KUK2M2iqNQTUjUiQt1sodlhtScv2iRgzxPCgH9zcOel57XGIIwswXCMlIuW
 cIlKtWmOsmppt2qMphEhmbKPDnV+yWqZy2XVJHrb1I60QVJ6ilFXuQ==
X-Received: by 2002:a05:6000:4027:b0:48d:f3ee:7cc with SMTP id
 ffacd0b85a97d-48e6e4f4cc8mr26878211f8f.30.1793703147225; 
 Tue, 03 Nov 2026 02:52:27 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e7a1d9d71sm18911099f8f.48.2026.11.03.02.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 02:52:26 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  3 Nov 2026 11:52:21 +0100
Message-Id: <20261103105224.1995953-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] Add an overlayfs on /etc for read-only root
 filesystems
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds BR2_ROOTFS_OVERLAYFS_ETC, which mounts an overlayfs on
/etc, with its upper layer on a persistent device, before the init
system starts. It works with busybox init, sysvinit and systemd.

It is modeled after the overlayfs-etc image feature of
openembedded-core (meta/classes-recipe/overlayfs-etc.bbclass and
meta/files/overlayfs-etc-preinit.sh.in), which works the same way,
independently of the init system:

 - the original init is moved aside, and a pre-init script is installed
   as /sbin/init;
 - at boot, the pre-init mounts the persistent device on a mount point
   (/data by default), mounts the overlayfs on /etc, with its upper and
   work directories in <mount point>/overlay-etc/, and optionally
   exposes the original /etc read-only in <mount point>/overlay-etc/lower;
 - it then execs the original init, which starts with a writable /etc.

The pre-init script is adapted from the openembedded-core one, and the
options mirror its variables (OVERLAYFS_ETC_DEVICE, _FSTYPE,
_MOUNT_OPTIONS, _MOUNT_POINT, _EXPOSE_LOWER). It differs on a few
points:

 - the original init is moved to /usr/libexec/overlayfs-etc/init rather
   than renamed to /sbin/init.orig, as busybox selects its applet from
   the name it is called with;
 - the mount point is created at build time, so the pre-init does not
   need to remount the root filesystem read-write
   (OVERLAYFS_ETC_CREATE_MOUNT_DIRS);
 - the overlayfs options are passed in a single -o, as expected by the
   busybox mount.

As for the /var overlayfs, the options are in the system menu, and the
implementation, including the kernel config fixup enabling overlayfs,
is in the skeleton, here skeleton-init-common, as the pre-init does not
depend on the init system. Only /etc is handled: /var keeps the
existing handling.

The persistent device must exist and be formatted, which is left to the
integration. If it cannot be mounted, the system boots with the
read-only /etc.

Angelo Compagnucci (3):
  package/skeleton-init-common: add option to mount an overlayfs on /etc
  docs/manual: document the /etc overlayfs
  support/testing: add runtime tests for the /etc overlayfs

 DEVELOPERS                                    |   1 +
 docs/manual/configure.adoc                    |  32 +++++
 .../overlayfs-etc-preinit.sh                  |  39 ++++++
 .../skeleton-init-common.mk                   |  63 +++++++++
 .../testing/tests/init/test_overlayfs_etc.py  | 128 ++++++++++++++++++
 .../linux-no-overlayfs.fragment               |   2 +
 system/Config.in                              |  62 +++++++++
 7 files changed, 327 insertions(+)
 create mode 100644 package/skeleton-init-common/overlayfs-etc-preinit.sh
 create mode 100644 support/testing/tests/init/test_overlayfs_etc.py
 create mode 100644 support/testing/tests/init/test_overlayfs_etc/linux-no-overlayfs.fragment

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
