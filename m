Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3A0C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 16:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8430402BB;
	Fri,  7 Oct 2022 16:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8430402BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qj1-mXCMpmqz; Fri,  7 Oct 2022 16:27:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF7F0401D6;
	Fri,  7 Oct 2022 16:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF7F0401D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8F7D1BF470
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 16:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C982A401D6
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 16:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C982A401D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1NrubV6REzSt for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 16:27:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9B9240189
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9B9240189
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 16:27:38 +0000 (UTC)
Received: from localhost (003.mia.mailroute.net [127.0.0.1])
 by 003.mia.mailroute.net (Postfix) with ESMTP id 4MkYcn3v4Kz24hwy;
 Fri,  7 Oct 2022 16:27:37 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([199.89.3.6])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10026)
 with LMTP id XePW4ObdWUV9; Fri,  7 Oct 2022 16:27:34 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 003.mia.mailroute.net (Postfix) with ESMTPS id 4MkYck12kFz24hv6;
 Fri,  7 Oct 2022 16:27:33 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Fri, 7 Oct 2022 12:27:33 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::895e:aa1a:c80e:9f5c]) by
 CRL-PGH-EX19-1.crl.local ([fe80::895e:aa1a:c80e:9f5c%7]) with mapi id
 15.02.0858.015; Fri, 7 Oct 2022 12:27:33 -0400
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] Force cmake packages to use makefiles
Thread-Index: AQHY2mmzg1GQoGReXEeVFFAeJTprFw==
Date: Fri, 7 Oct 2022 16:27:32 +0000
Message-ID: <94745932ea2dfa030e3d438d7cf6b84f1ef2f69c.camel@carnegierobotics.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.1 
x-originating-ip: [10.212.134.107]
Content-ID: <991E6CE79FCC454ABAA5E286F2EE063A@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=mr01;
 t=1665160054; x=1667752055; bh=ra0lOGxNr5WxgOKu160b5vtOeCzvWlPQ
 bi+IKsdCuL8=; b=MBb6mQOLbRZNpbRkcfXY740usdSTTbT6iAdVaN1C6nbDTaJy
 rPyKuBYtHwN05PtcuhwXDZGahkxTQGyAx8RkNFcJbXMigJE8y6jFXCkmsykM+its
 73ozFNmF1fOIpLYk7WsnVAWVY4of6iFD9GeP0gYcErxF2TzNJy2x5oQG5uIJRhjf
 p6Am4k54OjB1L1mXER8dnZqvfkse8CjMSJBUrqgCxIhklxgenKeECe9C7D7dEB6O
 rl8SzQaPIj3YLWN+CBz2oDCzm1TCQWWSRPVWNtz5QUHBJac1CGgQ/YtqyRTK24/5
 MaqvWXc7kSJteGWkA9/Ls0wJmZY8hi9rDTrMIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=MBb6mQOL
Subject: [Buildroot] [PATCH 1/1] Force cmake packages to use makefiles
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Woody Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woody Douglass <wdouglass@carnegierobotics.com>
Cc: "s.martin49@gmail.com" <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Force cmake packages to use the "Unix Makefiles" generator
in case CMAKE_GENERATOR is set in the host environment. This
patch further isolates the buildroot build environment from
the host.

Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
---
 package/pkg-cmake.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 081960b5bf..db9fdebb8d 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -88,6 +88,7 @@ define $(2)_CONFIGURE_CMDS
        rm -f CMakeCache.txt && \
        PATH=$$(BR_PATH) \
        $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
+               -G"Unix MakeFiles" \
                -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/to
olchainfile.cmake" \
                -DCMAKE_INSTALL_PREFIX="/usr" \
                -DCMAKE_INSTALL_RUNSTATEDIR="/run" \
@@ -118,6 +119,7 @@ define $(2)_CONFIGURE_CMDS
        PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
        PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
        $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
+               -G"Unix MakeFiles" \
                -DCMAKE_INSTALL_SO_NO_EXE=0 \
                -DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
                -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
-- 
2.20.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
