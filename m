Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C3E606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mnMMt/kL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=i2UCf7Y/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04D276071D;
	Wed, 28 Oct 2026 22:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77CES-y_KlBx; Wed, 28 Oct 2026 22:28:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0107960709
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226512;
	b=TOIp5sNZo/YTuz+PAkM0qxPqMtSilJRy3Jk2d4I2AKo7JyS9IDM4RNzahbBwWDsOiVba
	 cMAwxRE/VWxTwTN+iimdPwzySyt0aoxqYKd2VO3jFg7PFvbBG4l6jq4obJ2STbGXVhqCC
	 Mwe72wptKW1+hh1jKVyg7NjJlSDed26ZQRulnj52+w+ZBet6bMzZIMoSze6AqiSS2bC8u
	 1sDfuWed2qrq3Y0khxmbs25sfUiapEnzDsW2vxR0pCn+CwuuC3kmRByv1zMrMNsH5opwy
	 WUv8P5biIxx/cjQMqzK+4zg2kfQZZWMTJA0ydyolhS/vHkrfi12ByjYKLPRli9IveyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226512;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sDlouEqckLAPF3a3wb/+LVyDzBxKkKOGillSspTxDzw=;
	b=Fw40D65TltSW2oEiwcuMalN8bcEHjTsDtalKdiPp+pX8RIO+AOkuH5n9xu2G6e2YmDOA
	 waiZ1eplAv1AWiFxLAbB2jj9BvgaMvgOXSs6nB9x+mni3Ci3YSXWbFD7LZJuMg4UDAvCV
	 tvgSwVkXf62IfJWedeBj7fMlDevsObClVn/hjugroWnhZzJo0GCgryLM0dZvEqjxCC2tn
	 MgQIC3/a6cs8MafR2xtaSFPrgP3eYzh0WAGWKY0SwjGqtfSH6rhzHUTFLtXt3KSEGIdKq
	 oacBcT9ataHUl3WA04QLtY0mkhprppqeK/1gP5suedmwkhZRz2iy4SeIHHRr3zlQ+rA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226512;
	bh=sDlouEqckLAPF3a3wb/+LVyDzBxKkKOGillSspTxDzw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mnMMt/kLS0yYjSJdgzRMsFmK4cwNk0muz15BadcUl+yEVDRHLcPEwkLCg1uBdiLKN
	 QRccUZN20N5ngfdJODJVKJwqhXHSEHWrpd94F8nyxxclTgJDHSSjh9IIl6ToezRKt2
	 LwLEogE6Zqi6WEosKasWkm43SE7Tq3Mp+u9KD7bfTGZA3W99ysS63oMjjtSlLRcX46
	 RPX3ASeWB6BHvL8NVvpTIZPqabhb7O2eRwoEyW/DDkAfExZIkzDppX6gsTa/o01Bp2
	 HlzYUROrnZR3FcyKJh/k6VZNSoH4Y6oYN/5QdzT//0FFKyMjni1nYF3LhNEJUfoY7I
	 idi+FnTc0Talg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0107960709;
	Wed, 28 Oct 2026 22:28:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 659BC3AF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AD254078E
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Igd5iyaNsqFp for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:28:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4D93C40786
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226508;
 b=nF/SVFxVWQfJb7OpyNp7yz2EfpA1stn0CEEDFSWHxBg9OCthgj/ENgYq6V/kJp1WcSpZ
 5OsCw06JO9ioxODO+vuN0AMpDnmPToQx+bbywYErFei/T1xrfA/2/P5djVsvNIx5nNbgE
 NqJJBjfESs01eYvMKwr0M4PLeaEmK14f/rT2lEtnmZGYcclJeCgmC5IICZylziICrohSH
 kpUdDBqmbhNLnZEkrmpOEYlaS2a34+56wtf0lpCvNqEqtgHK4/QJGOIdXQ+d/6RsfP6oU
 M4pwaj30soW/4uxYywlCujxhCn1pamAUlrAmoD/ewNo4kYIROjFktS3+09NjUkGMl9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226508;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mokyY1zYvBBq1SdE5J+QRDFTQZ8e5iV8VR8VJ8l4KS4=;
 b=gFkFqVfVUNW3i/PaYE0WAfjcEz57j61jReFg5IMcBZeDPJCYr9Pib/VrR91wSsJ6HVT9
 iHxL1ogDnzDwyBWq8L3BWPr1wqEqqJUwpGDIO0G8f1bayoRlFhLXDg5Es7wY/ZvzqXGmy
 T0BR8F+uGp9L+/xzGQ0DWsbW+dxI5MkicAU6eYHl+CgdbE9YvAlQo1inPk57LHoH0Eo/g
 v9SgiXMjpGAkJ1Zwrn/TP5kyGG5cEe53cX1xDG4CgqYBROU5A6sz6mN45hAIt5eg1Urao
 tiHDxthRk9bfZcwygMFHu9hxyjjZNvl1YpTOBVo9Z36dt9FtZ15qeYbYh5X6Zlnf2cA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="i2UCf7Y/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=i2UCf7Y/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D93C40786
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226503;
 bh=mokyY1zYvBBq1SdE5J+QRDFTQZ8e5iV8VR8VJ8l4KS4=;
 h=From:To:Subject:Date:From;
 b=i2UCf7Y/6+lZ4pKqyaBiEr719vl+iKqy52fDxxkJ4TEDxhmtQUhbQgILPd2z4zFqz
 T87qG5+Xhv7qpHoi/1J0WYLpI36DFo//ldO9b0ciG9Dut2kSTfBarDyu0voO56eXTR
 pVkPglJ3R7yOzNb2bjo0aiBf1Y40dOgMoroMW4ac6a8L6AHJegYO6xHVPy7+fABLE4
 EEq1Op9h+nUurTTFND74x6VOROk2BHE/51ePGTc9WRb5Yw0nwMkoEPUyLlObxbT+zg
 A9fgTDysQRvh/ONj1PSHvuhqWOTTzLBMELzlbM6m2AtiPwQWzKHhG6cn1vBVD+1xjY
 kFnEQLGsa14fQ==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 aAgagBYWdA41UiaKYXxZmtE4wjXDG6lhC7bBbN2SOEgxOwA/kFW1qRLDa9z052UelGY37BY9iXb
 saLvX6sL35idX3u6rI1xYYL+CSWZDCGuHiykMurkEzKussDpCIY++rTZwfKVkNyKQLfs3yndgS/
 FmpwK6oc8dU9JbYMIhN49Q5I3UkfV6KvD5x6DxaJC5RuIWZECb/E5m1sQGhQf/EgbT7TEVb8yq5
 kMEoTUXtGOCCRAPsRRamA1IEk3V2QgZ/ciwVnYt+TnXVd6KrNdkjcm7NcxE1Y8zYJx4sVGrIQWH
 Nk3rrARimhVT76eu/1gU3r5fF55GNVJ9K1D2C9eou1bFFBnRtt8WoaktenjWBHWrsVbvL9CJI27
 ++YxL/Y2oEwcYaTAvDIoHdSPCr41GohE5IdFkUuS4AGeHBrSQEAPZRtH8IhCwnFGt5TGLl7Yvxp
 6ybDGjThjOAw3C2ykkxkv0j12Rogt4+u2r20FWxExsneVG1eidPbuFrZFcbkpjG+7W9iHYuXtUG
 MFm1UmpKpRgGilrqn0SwtyquP8AJdJbTfxvp/aRDKIbA/8RBByY1fhrCAa+YlNs5JxNQm6SP8QC
 Q2cP
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6E3D8A4C6FBA
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:28:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC87-000000001Tt-105w
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:01 +0100
Message-ID: <20261028222822.490779-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 00/20] package/kodi: bump to 22.0rc1-Piers
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

Bernd Kuhls (20):
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
  package/kodi: empty commit for test-pkg config
  package/kodi: empty commit for test-pkg config

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
