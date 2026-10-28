Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5D606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TuJN+YZe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=AWRuhtk1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93ACB80A53;
	Wed, 28 Oct 2026 22:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZYiSfi0cuOj; Wed, 28 Oct 2026 22:32:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3DE6B80F90
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226775;
	b=CzTW++J3dTSwwezFj5AnFs8LwV9CMUtpOZzw0QOqwsGaPyzkTy8KyWIIz0TFuTi6ODhe
	 SuWgz2xsc7WWxMc33B/HxYJSx51sG/hRCsscQjOZbJ1cax8sXFCM0gf92dvLVmuSmTIcl
	 EWbuqihRJdemh0PfuGsMhyKVPpZqsfcdBYDmhxqSoNvfFrEtr8tEnnly/XKu97Clz/0h7
	 ao7gsh88VZtt/Dws1VYYy9QhZCnR/M9A4IvbWtZdifSmgViE8SSTaj/qdO5W6LoS+JzXV
	 ccQzZUHXWGcjbBzEe3/TjVsC80Kh22lBKCSzXptgKZ8H9wcF09vklqZtBXkJyZkPDRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226775;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6fPZSann7+Mm7875Hg2eHcefXSuMrtqWBRJFszVCePg=;
	b=YCjhFauEFMJF/XeKSqjRpt6/40MvSeAx1ASxdOwU4ZURowjsM+ivhf91HO4Tt/iNDkIr
	 M+QYScjwLdMZJtiolRA5/op4By6VYF3K2vPkSXCI+QcRM/divX/EiSc143x3E8BTCq5qW
	 uH6UNPgnQLdltR2n7buYa8zCIUkJZL8D8GJu//QdyOD5cQxWjIbpcAK3Pf/ZbdesqaHRJ
	 WeXiV6DWLixjKcMa/Xc6055r9hzqiCZf/T2NeC/qFH6f7JRXZY1McM9LROjW61rX0H4m0
	 ytzdPcrmVY06Agx5yNANfxBEJG/5RertJgkGTruzzQs8EX+NfZmPl8OmCHL4MlkPnBw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226775;
	bh=6fPZSann7+Mm7875Hg2eHcefXSuMrtqWBRJFszVCePg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TuJN+YZeMKb1Apf9LFcGW7osXtminAVM/sggmzzngHi8hzfM8EnZDINmyVkgd183a
	 u0xaRj2VwzdGrp3RoJyVWO/evaLM+ZjzCsC9oCM0DERvFi40KD/2bB0I8eTzge7DEf
	 XU2rHn45MedcTbCJ99Umu2Bz+putwq2aumSQ5fy8+elgR1M6IIA+eP53uJ6MFigJVs
	 uSdhxujHArkpfDEsKVyHBiV1JHmC560PtuCp/KvQVh63O2Z7+2yQqb1USF9hvDZbLH
	 /n7xtpMQbICMkOWyY9G6qTIkA4a7bQa82vbBd+Fd99eR5gQJQRYoZFAunVz2VEWTZq
	 Kh86AxSaSGquA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DE6B80F90;
	Wed, 28 Oct 2026 22:32:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78A4A2E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D90240775
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFRkBHNLcJKe for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:32:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C3A02405B3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226772;
 b=CYASR+/UULTsrH/PrZd77/ZcYh9lydxgMqJQVRWisXq9SSaASp/D/FdowxLllrRW1Skv
 JWe4OWKsxpJr8oTXElkqTp2xgcNb20JMZQ7oYNEtjmkp3AGfWECtR1foWMsbA9didqQkC
 hByV7p7E4HoGDm0rBsiBL7Cp6DGbeQ/wR3/YF4vOOG2VY0TWtMJk8KEqY7dpqO23sSZSx
 d7VnK4u+ciDcMW+6epTYzStVkQ/76Wv9LRunTuv0xpFx1TGWKJ2IV/tGdM1vdln2J6oDf
 bPOKulW1Fc2gerIDWiYCfOqvV8tbkUmlH1pEl890+ucn/Zq2tK5TYi9G3D46pM8zU8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226772;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=trix3sVMsEzKxqn8qRC1bgT7d5Ymt5ffnmSoiU/BQuM=;
 b=KrCW4tZVJWABMYc/k5VmvombfbpC5oFcLVxxky7DtycGQPUtkpv20lKJSEi9X5d3Bh5x
 AkaPs5ykKNVvgzU++duvSbEKBmXNp9FRxEK9jih0VI+hjVIrKvD+d+V32qymI8rdYDb2c
 7j250pVIGz6fXl2uJeUNQhjJ2DIQ3IN/zZWEgT7FibXXM9p0nFd6lrcVuXAOwW04q3Mhb
 ShShEwsTdNNfnUTuwY6J3thYf0n143z4dB8/JaX8J0egoKHPXWStndZW5xdVtgq1DP4i5
 I1i8GkXDpz8QuKdV0E7axYXly5EFJE3VNwsUOk1b9U3VRS/RotiRtnk3hBnq1Y+pCFQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=AWRuhtk1; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=AWRuhtk1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3A02405B3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226576;
 bh=trix3sVMsEzKxqn8qRC1bgT7d5Ymt5ffnmSoiU/BQuM=;
 h=From:To:Subject:Date:From;
 b=AWRuhtk18eZqi1sQb6VctfZxLz9zfbP78w64QtVQPoOK1Zlp/x2et/rGdIK4o461o
 9hmh7b9Y2bOJmMUyVhvTxiIrFSa5shOy04Ot9qW7IcjzhxjBhqzUgqfbCWIcjgZRPL
 FM4/utCiZOC+TqucWt92d0CF/cMVBbUKMNqo/Ote1d1QdknzudgR0TDcVH0doJ1j9q
 jhikc03kaYW+58DTRuBjVo1fh7rWFdxn9jD6AjzTgtaUL2yl6EOBvm4Wp1S2vzrLz2
 CILQIEX97Vd2DbW/PTb7fztyPIU5MDWsbD510aYWj77tpo6Y3KkpwuAzFqentlHwQI
 nUwSXRRCFRAYQ==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 mHK0nVkOlqAfG5scT6TZoW0yPRb3b+rYOJ8zUnM9WANnaQX6g4EMl/OScHXCo75RsUwPEFUr61j
 +YdZ0hKa91FFptJ38Gwx+lrg9yH49x/ZaSOff1fMWeLpBm7VkBTiFPywR2HRxP51aVlHS0PgFA6
 dcBa9FWf0GmSdu6N9qLzRbjpXPKOQGQvyBvZ9qFtSgF7fr4wL4ATdsav8vArmyqeoNfyZod+L4z
 c0WpB1EmSgqQuUchlKAmOqdaiMCxu3z0d/8Db74IqEpXn00i8jA9qxprzPXr9S9rS0t4OVA7L0N
 6Kn4nXXNupDhNfECFVcEQzmUM+wHqzx4Qe4QpAaodI86vE0LUB92ylTEo+t4KAfI2gw6nOHGBZm
 Lo0HSBCc3LKQbgGEwYPGfXAQqdTy2xcmMKVRr+GvoTrUon+dMjwJbqLmQA+H0+ePteu5NTj0HGK
 BDzRIF8qUXtpkeDQZinV+7eRejs4Fxa2yJp6IlgxSLlU3NQboPGEIcYceEfI0xnfwyzM73eyGR2
 Af9RC8VrxsGvnwH+FUMXnP2DSqVId7an/W0iDbrmqqMYP4LcBb2juBaTOxIOUO11nAM0vVAUcOB
 yRj6
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7C908A4C6FC2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9I-000000001i7-1D3V
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:17 +0100
Message-ID: <20261028222936.514451-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 00/18] package/kodi: bump to 22.0rc1-Piers
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

this series bumps to kodi and its addons to the new release
branch Piers which is currently at rc1.

The bump is needed for compatibility with python-3.15, the current
kodi version 21.3-Omega will fail with the new python release.

Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/1762ceba373049243a94cb96eb51cabbb322d433

but they need
https://patchwork.buildroot.org/project/buildroot/list/?series=1468

to fix build errors with the new dependency to exiv2.

Runtime testing for several weeks shows positive results.

Regards, Bernd


Bernd Kuhls (18):
  package/bento4: bump version to 1.6.0-641-6-Piers
  package/kodi: bump to 22.0rc1-Piers
  package/kodi-audiodecoder-*: mass version bump to Piers
  package/kodi-audioencoder-*: mass version bump to Piers
  package/kodi-imagedecoder-*: mass version bump to Piers
  package/kodi-inputstream-ffmpegdirect: bump version to 22.2.10-Piers
  package/kodi-inputstream-*: mass version bump to Piers
  package/kodi-peripheral-*: mass version bump to Piers
  package/kodi-pvr-hts: bump version to 22.9.6-Piers
  package/kodi-pvr-plutotv: bump version to 22.3.1-Piers
  package/kodi-pvr-waipu: bump version to 22.10.2-Piers
  package/kodi-pvr-zattoo: bump version to 22.2.3-Piers
  package/kodi-pvr-*: mass version bump to Piers
  package/kodi-screensaver-rsxs: bump version to 22.0.5-Piers
  package/kodi-screensaver-*: mass version bump to Piers
  package/kodi-skin-confluence: bump version
  package/kodi-vfs-*: mass version bump to Piers
  package/kodi-visualisation-*: mass version bump to Piers

 package/bento4/bento4.hash                    |   2 +-
 package/bento4/bento4.mk                      |   4 +-
 .../kodi-audiodecoder-modplug.hash            |   2 +-
 .../kodi-audiodecoder-modplug.mk              |   2 +-
 .../kodi-audiodecoder-nosefart.hash           |   2 +-
 .../kodi-audiodecoder-nosefart.mk             |   2 +-
 .../kodi-audiodecoder-sidplay.hash            |   2 +-
 .../kodi-audiodecoder-sidplay.mk              |   2 +-
 .../kodi-audiodecoder-snesapu.hash            |   2 +-
 .../kodi-audiodecoder-snesapu.mk              |   2 +-
 .../kodi-audiodecoder-stsound.hash            |   2 +-
 .../kodi-audiodecoder-stsound.mk              |   2 +-
 .../kodi-audiodecoder-timidity.hash           |   2 +-
 .../kodi-audiodecoder-timidity.mk             |   2 +-
 .../kodi-audiodecoder-vgmstream.hash          |   2 +-
 .../kodi-audiodecoder-vgmstream.mk            |   2 +-
 .../kodi-audioencoder-flac.hash               |   2 +-
 .../kodi-audioencoder-flac.mk                 |   2 +-
 .../kodi-audioencoder-lame.hash               |   2 +-
 .../kodi-audioencoder-lame.mk                 |   2 +-
 .../kodi-audioencoder-vorbis.hash             |   2 +-
 .../kodi-audioencoder-vorbis.mk               |   2 +-
 .../kodi-audioencoder-wav.hash                |   2 +-
 .../kodi-audioencoder-wav.mk                  |   2 +-
 .../kodi-imagedecoder-heif.hash               |   2 +-
 .../kodi-imagedecoder-heif.mk                 |   2 +-
 .../kodi-imagedecoder-raw.hash                |   2 +-
 .../kodi-imagedecoder-raw.mk                  |   2 +-
 .../kodi-inputstream-adaptive.hash            |   2 +-
 .../kodi-inputstream-adaptive.mk              |   2 +-
 .../0001-Update-to-7.1.patch                  | 106 ----
 .../kodi-inputstream-ffmpegdirect.hash        |   2 +-
 .../kodi-inputstream-ffmpegdirect.mk          |   2 +-
 .../kodi-inputstream-rtmp.hash                |   2 +-
 .../kodi-inputstream-rtmp.mk                  |   2 +-
 .../kodi-jsonschemabuilder.mk                 |   2 +-
 .../kodi-peripheral-joystick.hash             |   2 +-
 .../kodi-peripheral-joystick.mk               |   2 +-
 .../kodi-peripheral-xarcade.hash              |   2 +-
 .../kodi-peripheral-xarcade.mk                |   2 +-
 .../kodi-pvr-argustv/kodi-pvr-argustv.hash    |   2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk  |   2 +-
 .../kodi-pvr-dvblink/kodi-pvr-dvblink.hash    |   2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk  |   2 +-
 .../kodi-pvr-dvbviewer.hash                   |   2 +-
 .../kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk  |   2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash  |   2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk    |   2 +-
 package/kodi-pvr-hts/0001-gcc15.patch         |  26 -
 package/kodi-pvr-hts/kodi-pvr-hts.hash        |   2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk          |   2 +-
 .../kodi-pvr-iptvsimple.hash                  |   2 +-
 .../kodi-pvr-iptvsimple.mk                    |   2 +-
 .../kodi-pvr-mediaportal-tvserver.hash        |   2 +-
 .../kodi-pvr-mediaportal-tvserver.mk          |   2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash  |   2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk    |   2 +-
 .../kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash    |   2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk  |   2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash      |   2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk        |   2 +-
 .../kodi-pvr-octonet/kodi-pvr-octonet.hash    |   2 +-
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk  |   2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash      |   2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk        |   2 +-
 package/kodi-pvr-plutotv/Config.in            |   2 +-
 .../kodi-pvr-plutotv/kodi-pvr-plutotv.hash    |   2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk  |   4 +-
 .../kodi-pvr-stalker/kodi-pvr-stalker.hash    |   2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk  |   2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash      |   2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk        |   2 +-
 .../kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash  |   2 +-
 .../kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk    |   2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash  |   2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk    |   2 +-
 package/kodi-pvr-waipu/Config.in              |   2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash    |   2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk      |   4 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash        |   2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk          |   2 +-
 package/kodi-pvr-zattoo/Config.in             |   2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash  |   2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk    |   4 +-
 .../kodi-screensaver-asteroids.hash           |   2 +-
 .../kodi-screensaver-asteroids.mk             |   2 +-
 .../kodi-screensaver-asterwave.hash           |   2 +-
 .../kodi-screensaver-asterwave.mk             |   2 +-
 .../kodi-screensaver-biogenesis.hash          |   2 +-
 .../kodi-screensaver-biogenesis.mk            |   2 +-
 .../kodi-screensaver-cpblobs.hash             |   2 +-
 .../kodi-screensaver-cpblobs.mk               |   2 +-
 .../kodi-screensaver-greynetic.hash           |   2 +-
 .../kodi-screensaver-greynetic.mk             |   2 +-
 .../kodi-screensaver-matrixtrails.hash        |   2 +-
 .../kodi-screensaver-matrixtrails.mk          |   2 +-
 .../kodi-screensaver-pingpong.hash            |   2 +-
 .../kodi-screensaver-pingpong.mk              |   2 +-
 .../kodi-screensaver-pyro.hash                |   2 +-
 .../kodi-screensaver-pyro.mk                  |   2 +-
 .../0001-Fix-build-with-CMake-4.x.patch       | 346 -------------
 .../kodi-screensaver-rsxs.hash                |   2 +-
 .../kodi-screensaver-rsxs.mk                  |   2 +-
 .../kodi-screensaver-stars.hash               |   2 +-
 .../kodi-screensaver-stars.mk                 |   2 +-
 .../kodi-skin-confluence.hash                 |   2 +-
 .../kodi-skin-confluence.mk                   |   2 +-
 ...rePacker-allow-build-with-giflib-6.x.patch |  71 ---
 .../kodi-texturepacker/kodi-texturepacker.mk  |   3 +-
 .../kodi-vfs-libarchive.hash                  |   2 +-
 .../kodi-vfs-libarchive.mk                    |   2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.hash        |   2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk          |   2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash      |   2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk        |   2 +-
 .../kodi-visualisation-fishbmc.hash           |   2 +-
 .../kodi-visualisation-fishbmc.mk             |   2 +-
 .../kodi-visualisation-goom.hash              |   2 +-
 .../kodi-visualisation-goom.mk                |   2 +-
 .../kodi-visualisation-matrix.hash            |   2 +-
 .../kodi-visualisation-matrix.mk              |   2 +-
 .../kodi-visualisation-shadertoy.hash         |   2 +-
 .../kodi-visualisation-shadertoy.mk           |   2 +-
 .../kodi-visualisation-spectrum.hash          |   2 +-
 .../kodi-visualisation-spectrum.mk            |   2 +-
 .../kodi-visualisation-starburst.hash         |   2 +-
 .../kodi-visualisation-starburst.mk           |   2 +-
 .../kodi-visualisation-waveform.hash          |   2 +-
 .../kodi-visualisation-waveform.mk            |   2 +-
 ...rePacker-allow-build-with-giflib-6.x.patch |  71 ---
 ...02-VAAPI-fix-build-with-ffmpeg-7.1.5.patch | 117 +++++
 ...erFFmpeg-fix-build-with-ffmpeg-7.0.3.patch |  67 +++
 .../0003-RegExp-remove-unused-methods.patch   | 127 -----
 ...eamAddon-fix-build-with-ffmpeg-7.0.3.patch |  49 ++
 .../0004-Introduce-PCRE2-dependency.patch     | 192 -------
 ...ImplLinux-uClibc-ng-provides-gettid.patch} |   0
 ...igrate-PCRE-to-PCRE2-and-remove-PCRE.patch | 486 ------------------
 ...006-cmake-Set-ARCH-to-CPU-by-default.patch |  41 --
 package/kodi/0007-Update-to-7.0.patch         | 338 ------------
 ...cated-use-of-FF_API_INTERLACED_FRAME.patch |  98 ----
 ...move-deprecated-use-of-avcodec_close.patch |  30 --
 ...precated-use-av_stream_get_side_data.patch | 113 ----
 ...ve-CrystalHD-hw-acceleration-strings.patch |  47 --
 ...layerignoredtsinwav-advanced-setting.patch |  51 --
 ...Use-new-audio-DTS-and-ATMOS-profiles.patch |  98 ----
 package/kodi/0014-Update-to-7.0.patch         |  47 --
 ...-Use-sysconf-_SC_PAGESIZE-to-retriev.patch |  42 --
 package/kodi/Config.in                        |   8 +-
 package/kodi/kodi.hash                        |  15 +-
 package/kodi/kodi.mk                          |  52 +-
 150 files changed, 389 insertions(+), 2508 deletions(-)
 delete mode 100644 package/kodi-inputstream-ffmpegdirect/0001-Update-to-7.1.patch
 delete mode 100644 package/kodi-pvr-hts/0001-gcc15.patch
 delete mode 100644 package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
 delete mode 100644 package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
 delete mode 100644 package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch
 create mode 100644 package/kodi/0002-VAAPI-fix-build-with-ffmpeg-7.1.5.patch
 create mode 100644 package/kodi/0003-AEEncoderFFmpeg-fix-build-with-ffmpeg-7.0.3.patch
 delete mode 100644 package/kodi/0003-RegExp-remove-unused-methods.patch
 create mode 100644 package/kodi/0004-InputStreamAddon-fix-build-with-ffmpeg-7.0.3.patch
 delete mode 100644 package/kodi/0004-Introduce-PCRE2-dependency.patch
 rename package/kodi/{0016-CThreadImplLinux-uClibc-ng-provides-gettid.patch => 0005-CThreadImplLinux-uClibc-ng-provides-gettid.patch} (100%)
 delete mode 100644 package/kodi/0005-Migrate-PCRE-to-PCRE2-and-remove-PCRE.patch
 delete mode 100644 package/kodi/0006-cmake-Set-ARCH-to-CPU-by-default.patch
 delete mode 100644 package/kodi/0007-Update-to-7.0.patch
 delete mode 100644 package/kodi/0008-Remove-deprecated-use-of-FF_API_INTERLACED_FRAME.patch
 delete mode 100644 package/kodi/0009-Remove-deprecated-use-of-avcodec_close.patch
 delete mode 100644 package/kodi/0010-Remove-deprecated-use-av_stream_get_side_data.patch
 delete mode 100644 package/kodi/0011-Remove-CrystalHD-hw-acceleration-strings.patch
 delete mode 100644 package/kodi/0012-Remove-VideoPlayerignoredtsinwav-advanced-setting.patch
 delete mode 100644 package/kodi/0013-Use-new-audio-DTS-and-ATMOS-profiles.patch
 delete mode 100644 package/kodi/0014-Update-to-7.0.patch
 delete mode 100644 package/kodi/0015-UDMABufferObject-Use-sysconf-_SC_PAGESIZE-to-retriev.patch

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
