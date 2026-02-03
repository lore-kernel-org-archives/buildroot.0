Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E895EE8B36C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD7FD404F5;
	Tue,  3 Feb 2026 21:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mA9p03lBmPwf; Tue,  3 Feb 2026 21:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79FD94032E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770155783;
	bh=H8OEt0E9+MhGSRClWFj3SOTtvggTbvZ9qpZp6Z7TT3c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FqQrz0pTeckoVzwYKcpOt8qNgFVdzpvr6Qc/Y5macFSN4JW6LGWtC1T8zt3qJaWDy
	 pIOz+turZPWEMzssdm1trU16JE9eVD3005jEDP99IgFYmXLzU6WLx0kZKtof0hJVRw
	 wE89Qe54oN8JXRK2/hQ5fRYIey+Zs97c23h2i8Xl3fHmI7pMod0V0aJCq7vTnjBClm
	 BSxj4HY2iko4gaUV4BT1244i1XOu9syzFgrxvZNQl1YsbYRFhjNJge5nXKn0YLADCw
	 DtzqPgkasgNhH+EhtmEe5rBhygrbovE7tpVpFawocRIXhpT2eXnAydTWUAX/P+DAr7
	 a+SFsvKz1Zw6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79FD94032E;
	Tue,  3 Feb 2026 21:56:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 823A7F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EF5A60901
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7xca0reYuu0 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B769608FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B769608FD
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:56:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F5978676A; Tue,  3 Feb 2026 21:56:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 22:53:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7aa2c23f42d4a4ce5086a12f28f54c99aaa5701a
X-Git-Newrev: f366204311b48320e5474178f4d853858f807f62
X-Patchwork-Hint: ignore
Message-Id: <20260203215621.4F5978676A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: switch default
 crypto provider to gnutls
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f366204311b48320e5474178f4d853858f807f62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when both libnss and GnuTLS are present, NetworkManager will
get linked to libnss.

The NetworkManager project doesn't recommend one over the other
officially and has supported both from day one back in 2007.

Arguments which one to prefer can be made in either direction:

Points in favor of libnss:

 - It's the default value in the NM build system, so it would be the
   preferred backend if both are available and we didn't supply any
   options to the build process

 - It's probably the more mature of the two, given that it's being used
   in Mozilla products

Points in favor of GnuTLS:

 - While both backends seem feature-equivalent, the
   _nm_crypto_verify_pkcs8 function is stubbed out in the libnss
   code[1].

 - Both Debian and Fedora explicitly select GnuTLS in their packages. At
   least in the case of Fedora it seems to have been a conscious
   choice[2].

Given what it's actually used for in the code base, the choice does not
matter a lot. However, since it is marginally more feature-complete and
seems to be preferred by other distributions, let's switch to GnuTLS.

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/36f8de25c487fe1570a19fe917c85ec065b0339e/src/libnm-crypto/nm-crypto-nss.c#L523-540
[2] https://src.fedoraproject.org/rpms/NetworkManager/c/29a9c41beafb5e549c10bfb50ee23ee47bdbc42f?branch=rawhide

Signed-off-by: Florian Larysch <fl@n621.de>
Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/network-manager/network-manager.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index faf162f6f3..76f4b09fbe 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -77,12 +77,12 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dconcheck=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBNSS),y)
-NETWORK_MANAGER_DEPENDENCIES += libnss
-NETWORK_MANAGER_CONF_OPTS += -Dcrypto=nss
-else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
 NETWORK_MANAGER_DEPENDENCIES += gnutls
 NETWORK_MANAGER_CONF_OPTS += -Dcrypto=gnutls
+else ifeq ($(BR2_PACKAGE_LIBNSS),y)
+NETWORK_MANAGER_DEPENDENCIES += libnss
+NETWORK_MANAGER_CONF_OPTS += -Dcrypto=nss
 else
 NETWORK_MANAGER_CONF_OPTS += -Dcrypto=null
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
