Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66703606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KcZCuqMW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=AaiJSZLI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43B6C81000;
	Wed, 28 Oct 2026 22:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUlLgR-mSjoZ; Wed, 28 Oct 2026 22:32:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4A9E681005
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226737;
	b=m1mrwj8PnYUMTxByhxCnxCeWWkXrHgWnTnsoPhPdYAsflTtPe3A4P58IqAcwvXzN/jjO
	 +FvYrvTfhYPIDm7xQePLqTj87VV2xYHMo3vr2VNUf5hX/TpjG1QV0IEkQkKqkp/cybziG
	 ACbDYMiXBfMhOPhq9a/L0DjnkZMFU/6gxpLi3CNMWenuBrrV7c4ivNFeUvACrHPJCFR6M
	 Ek2KB1sdskZ7rhGH2FulMoo0VEfGXa0Oie53aVoLXTw7Wjl7VYtr3k3Q7Yw5X3oMD0lhA
	 FB1QQ5r0hvgAevio5p5n53Nev1i9jfEgCCTqdWVwnOUIKycEIouP8MDlzYDHMlP/ljQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226737;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=141EYcMDs2S6hRsjc4WsNGLmBFfFMPV0Wau9x9HtnlY=;
	b=bsGdydVHhilVOvg4Cjw9dEBx6jY+5M6JQp+mTFImVg94D9jZ9DtbSz3biENAaAlDIDYL
	 Xwv4ugiEvf9A89GbBakQ1GU65Q3rQe40YlkCDHYyskJ2uP7pg3JPtqYzQy2TIQLRfR8Ha
	 lH1NQ0jIzhEp0HUH5PRQekTb4sxWLpNGVYm9bEkhiypiT0ok3NO1+w2gz1kqxL9cinm7G
	 pUzyRCLokhRmNUCvkUmM5E7TllUh4wFxDxWO4YgGhPLCN2nvSlvV2TtlW3E547nHvDo1E
	 ZVpGbroYqXuRG9Lmq+BS5AyC8pUAxUtt4sqAxGQMX0kA0P8LKqOQcLiFa+2YfXtDc5Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=AaiJSZLI;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226737;
	bh=141EYcMDs2S6hRsjc4WsNGLmBFfFMPV0Wau9x9HtnlY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KcZCuqMW5kndunkjF2QkYD2bkzSxTVhJioL+5Fr2a/KmlPH7X0lgAeT1CioNcFyJi
	 j3ChsnivuWoynSoZYrQfRFTN+hEH5I5CElCe+jxkwSHnyH1XMG1jPKnFlC7+zM/VfZ
	 v4y0rbhJH1pLK0ZbiYAaABg5yHdUJPKKmbknldZWjU0PbVCrsS0Y8U6mluQYKpME3J
	 20hvz1iSuUrmhqStjzmUo9CtWEC4/85JugI5RC0KLui0tuy8OPGXa1D9uhfQpI0bNd
	 TF+NaNW1DPpKL4EwGIGudXkY5sgm497oLlSoqYuVX4A/WS8HpjX/YaAQSADSzIH78c
	 DaC+pd1Ql+zhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A9E681005;
	Wed, 28 Oct 2026 22:32:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B6622A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DA6480A53
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CoLhBCnVrSsH for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:32:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CCC2880F90
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226735;
 b=SGkVGWRmB89REmh70spkr8rmto56uEKjX93lxLQQZqEkHH0q/Z7CwERWDo5CsE2fNQSR
 km7KCMPlyH5Y3+0PMtr8k0Rfu1G/w0JvLzV6VSvoJLnjxVUTl1QK2NQnJeAnXsK2rz2yK
 6+sjfNvOMFntNq4ggpYLO7gdJCb7fkbLnwnj5mkNWjG9FQXHMhwRFN8+YT5fjS/9U12nA
 XQSm3uiJ1R8cbOrMW4RTcq5daMXlqb6wrRNqKY0JC8Fe1g16vO5nq5by/DrgMqm9YYmpq
 3KLF7PcW7k8n6ofsSLSJMgBIloqgj4+oZNA70qVdGtl4jk8aFD0jRoY3GYGUbAR8fFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226735;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=JZFRONh0j9NfX+lZddgEQ+gCoTo/flqSfX6RlXSpgUI=;
 b=GYLIKQ4eE0umxUBt36sedcqaQFAIq8q8FsolInwcpFRG21hUmXOlFXA5Y3SnmM7g5VoT
 Ey00h41B0g+gyGQqQSUpZXcpgl1jKOxGiuR1SVWOSpL9qXd7O5cEFeEWKCfstX9dSO4jY
 OT78kpDAgpjgR2PUNzf5k0JOvI9x8PJhoEjufTkmpMYnpAxCbNhefyBBKzxSKK9+JYJs9
 GhMoOVQoUwgdDpaVuVKMocFqUlNbMSpqPWk69/7Dr57n227r6z4UcJW7I/ewVCM4M8e8B
 XwMuHkJoJUdTUfbQYIekXE/C/hBARmjpv/M4vXiPN34ICJId2JCBxC5ICb1gLqhIWiA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=AaiJSZLI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=AaiJSZLI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCC2880F90
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226544;
 bh=JZFRONh0j9NfX+lZddgEQ+gCoTo/flqSfX6RlXSpgUI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=AaiJSZLIO39eHfzRvigjdSHUQTpNaUJgy+w75mehXJ+gYPLq+RP0100N18N990JIx
 tdocF6ktuSzGfFt3cj8xcmnqg1wu/DREyPQ89xzsOY+jGvzCYlkHXsKUymgf6EMr0U
 kniwu8hjeEG0jrwEOEdA1ZGBqXYsBXo5hywcnNlfbwSsGUyospRj8ist8TlZBKcIGm
 5nH/mOQTcjiCuJIGxDFSexMw2HJ8qZbGop5rp450vfDPbhh1fZHk+EeQp2DIWEif7N
 dVkCxVsVSCTI+lIPdopKN7QlXAjoQp0fnCPErV9AgnrHxl0snXZoQGC3F15aadR5Hf
 do1ySlPvR142g==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 ryU4RlwIvcbmkbyQEhXvSsAfwc7o8lwN4NmTYeCI9AwDaZtckd5hW9+lnQRlUbIntVYxE56rPYb
 l+1ygduPARWfBdaSwidlvawCtorDFQyBDcj++mxEfQStm+s5e2mIMAVvrKJyYdNA1UXZWgkrBR8
 /DEeSsNDqQr41XWG50R995PmPuJg4WA9e5LU40ipby2CPGjPyp4gF/ovyAqP3PcuRR0Kk5yfgcS
 ViC86050c4Nmup9oCutNZwKP0n7QDmY37doA04lmN+lz700uTze80YZ2OjneeN8K4FfoPvQbuhR
 U6E/XX8YSLIeUpG6qbSzVvWLurQLzbZjvlMqX6vhPFfthWPwGyzHjCzIuzpOwDA5LOFMZ28Odsh
 pg3eN+4W6lM/Eni792nJ5As/KGkSBt+xnM6J1TYWYQYXvgOWW/dBXKyLE3x5f/30CgQUom60H+5
 8MMV81Kqkx58btAN4rvkpUry+lT5/H3VERwCJXJHB7LhtfGDCtk2DJv2IkOuviEa/Kwha4PEmN7
 VBEysysXwt1EVRU7PlkJQrz1GonTmbms139VpFxuvZ/yjPxn/LN770pcydEh+SnZYVSTvQK9jSE
 5/cAsg==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 77AB7A4C6FDE
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC8A-000000001Tt-2atS
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:20 +0100
Message-ID: <20261028222822.490779-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 19/20] package/kodi: empty commit for test-pkg
 config
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,UPPERCASE_75_100,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

test-pkg config:
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_ALSA_LIB=y
BR2_PACKAGE_KODI_AVAHI=y
BR2_PACKAGE_KODI_BLUEZ=y
BR2_PACKAGE_KODI_DBUS=y
BR2_PACKAGE_KODI_EVENTCLIENTS=y
BR2_PACKAGE_KODI_LIBBLURAY=y
BR2_PACKAGE_KODI_LIBCEC=y
BR2_PACKAGE_KODI_LCMS2=y
BR2_PACKAGE_KODI_LIBMICROHTTPD=y
BR2_PACKAGE_KODI_LIBNFS=y
BR2_PACKAGE_KODI_LIBSHAIRPLAY=y
BR2_PACKAGE_KODI_UPNP=y
BR2_PACKAGE_KODI_AUDIODECODER_MODPLUG=y
BR2_PACKAGE_KODI_AUDIODECODER_NOSEFART=y
BR2_PACKAGE_KODI_AUDIODECODER_SIDPLAY=y
BR2_PACKAGE_KODI_AUDIODECODER_SNESAPU=y
BR2_PACKAGE_KODI_AUDIODECODER_STSOUND=y
BR2_PACKAGE_KODI_AUDIODECODER_TIMIDITY=y
BR2_PACKAGE_KODI_AUDIODECODER_VGMSTREAM=y
BR2_PACKAGE_KODI_AUDIOENCODER_FLAC=y
BR2_PACKAGE_KODI_AUDIOENCODER_LAME=y
BR2_PACKAGE_KODI_AUDIOENCODER_VORBIS=y
BR2_PACKAGE_KODI_AUDIOENCODER_WAV=y
BR2_PACKAGE_KODI_IMAGEDECODER_HEIF=y
BR2_PACKAGE_KODI_IMAGEDECODER_RAW=y
BR2_PACKAGE_KODI_PERIPHERAL_XARCADE=y
BR2_PACKAGE_KODI_PVR_ARGUSTV=y
BR2_PACKAGE_KODI_PVR_DVBLINK=y
BR2_PACKAGE_KODI_PVR_DVBVIEWER=y
BR2_PACKAGE_KODI_PVR_FILMON=y
BR2_PACKAGE_KODI_PVR_HTS=y
BR2_PACKAGE_KODI_PVR_IPTVSIMPLE=y
BR2_PACKAGE_KODI_PVR_MEDIAPORTAL_TVSERVER=y
BR2_PACKAGE_KODI_PVR_MYTHTV=y
BR2_PACKAGE_KODI_PVR_NEXTPVR=y
BR2_PACKAGE_KODI_PVR_NJOY=y
BR2_PACKAGE_KODI_PVR_OCTONET=y
BR2_PACKAGE_KODI_PVR_PCTV=y
BR2_PACKAGE_KODI_PVR_PLUTOTV=y
BR2_PACKAGE_KODI_PVR_STALKER=y
BR2_PACKAGE_KODI_PVR_VBOX=y
BR2_PACKAGE_KODI_PVR_VDR_VNSI=y
BR2_PACKAGE_KODI_PVR_VUPLUS=y
BR2_PACKAGE_KODI_PVR_WAIPU=y
BR2_PACKAGE_KODI_PVR_WMC=y
BR2_PACKAGE_KODI_PVR_ZATTOO=y
BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS=y
BR2_PACKAGE_KODI_SCREENSAVER_ASTERWAVE=y
BR2_PACKAGE_KODI_SCREENSAVER_BIOGENESIS=y
BR2_PACKAGE_KODI_SCREENSAVER_CPBLOBS=y
BR2_PACKAGE_KODI_SCREENSAVER_GREYNETIC=y
BR2_PACKAGE_KODI_SCREENSAVER_MATRIXTRAILS=y
BR2_PACKAGE_KODI_SCREENSAVER_PINGPONG=y
BR2_PACKAGE_KODI_SCREENSAVER_PYRO=y
BR2_PACKAGE_KODI_SCREENSAVER_RSXS=y
BR2_PACKAGE_KODI_SCREENSAVER_STARS=y
BR2_PACKAGE_KODI_SKIN_CONFLUENCE=y
BR2_PACKAGE_KODI_VFS_LIBARCHIVE=y
BR2_PACKAGE_KODI_VFS_RAR=y
BR2_PACKAGE_KODI_VFS_SFTP=y
BR2_PACKAGE_KODI_VISUALISATION_FISHBMC=y
BR2_PACKAGE_KODI_VISUALISATION_GOOM=y
BR2_PACKAGE_KODI_VISUALISATION_MATRIX=y
BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY=y
BR2_PACKAGE_KODI_VISUALISATION_SPECTRUM=y
BR2_PACKAGE_KODI_VISUALISATION_STARBURST=y
BR2_PACKAGE_KODI_VISUALISATION_WAVEFORM=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y
BR2_PACKAGE_LIBUDEV_ZERO=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
