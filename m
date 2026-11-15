Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAF0606A31A
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XpwbwoU1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=hhM9HUc2
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D18D140721;
	Sun, 15 Nov 2026 11:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHeNpOe4KVIu; Sun, 15 Nov 2026 11:03:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6362F406AF
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794740584;
	b=Mdo7P2X09BTAiZw5XJQjbxlut1ou71RjvLBIRByiAIbJzKK49TCE2Ak0mXaeVMwb+oPe
	 e8SqFDO2cKJVfMOMDpmXJaLI21widxoL6Xtynr55e2czlh3oJI0GDoAxNjMXs8Z7KmEGO
	 hZzr/RIlqITYZKgtfQ2iMBsSHQCWZoibSvi8Kzjd4dYQv9FAJONSFpYEQjtI/kk7LgOzF
	 dJRGqLIM+blID24ktFVd5U8nxfINB51WMzvgtVWvJJN8jzK7ij3MqVrrE6dByS6wRTz5o
	 3x5Q6KmYAdiln9TByKoULr0yf0E021TTeelMiwTb5+L3vwHFuWOEEvQhyvY4R9HMRqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794740584;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VUAJM2RZSuIhpX1g/YR2QJFr0eE4ZRGenvlX/9J7QxE=;
	b=PqghgCx+JQzK2zx/7c3vgBPKBU1R+CyqRxI9gUNYFtRjCCFgw5Qj42K3uTHGbILVcHr9
	 l1t1/C7RORhgDI3MHeFUnV1MBOYMP1fHNhG+Mqjsc2KIJ1rArM0LXSM+RM2PhFP80jLTg
	 JsBHQ8+dIhnOLnHXMGTevlWTj7Yd1/91jPnX8tO/UDKv9kwPS+RjVw7BgyVQfTY0SLxGQ
	 7ICdI7HbQ6Wv5LUpjoQwLAHlDNzaey5CRbVdkiHPDkoHd5qRo+U2667DzKx05ohAYlajQ
	 QMOIA3wpNEB8JN+G//L96OXkdMSjByhO2cuFF5WFcEM9u6Na13CmRvTcKel8+0kAREg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794740584;
	bh=VUAJM2RZSuIhpX1g/YR2QJFr0eE4ZRGenvlX/9J7QxE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XpwbwoU1T/WNmh5GD70EdatRUy+UO7iNQJcNF3BvSGu7tBNqdRLGwqKGC6NqLMceR
	 Lkbi22cEcny44NRqmxaiz3eGPtc77nVQn4tHJHSrrqvaXHF9fcfAEuoWxL8ElRSHdr
	 NWFr7RBI9C4PIkcI47hA8CWegFh76pweVTqZpspbGlvIewuZp8dx5gbiUGrAnRydEL
	 1pLOxj1dHb4pG+nU9JmWEjOoVC20xqmgLIY2ABq/5XmGF5JW5WqKPytVjOO8inpfpl
	 AtJZwau+RpX1bHDTuSAkAWfgpUzq2UeudYAU8kk8tskznpYOIxR4QpfM1SIWlPWiiw
	 KiyQhO+G9FCfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6362F406AF;
	Sun, 15 Nov 2026 11:03:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F350770B
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 11:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D081560634
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 11:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3N_cFO0mkZBD for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 11:03:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9B5A460628
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hhM9HUc2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B5A460628
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 11:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794740576;
 bh=nP3QsRtShrWbfE97ZVeQpxqygP11tkXwqZyj+VL+35M=;
 h=From:To:Subject:Date:From;
 b=hhM9HUc2rrNhEuap05wZ9NCpZ2k+pqRJdUmAdihJTrirXY/PrReIIweDcZf2tDeww
 pOgyxiiqAYd4oUA7IIWlRnn+bkva1iPToc75OQtxOG0oW4gCsazSn7/O64XhmtvdmY
 7JSz3+LeG+ZfCSDQSlrYd9bUckuV1cUwt+Jp70jA3ZP75KtYy010A0N7mv+i1ClJ7S
 1oP7gwibe7sVVQ9/pH3ky0kICWjkhPGjOh21fqH01EOBSZ0VTx4WVIhNWQUa1o8wfA
 q/MXJOhKi4BR3mG3JnHhF/QeNvJADWnl+keiWQBQDzMHZYFFKgzGxxWy2jhG/slox5
 p5vIyDSk4R6QA==
X-KAS-Sym: v3:f51bdf72230551df:ccZpzhTaXAva5heAhLiXJsBUsdub9WegvsrhIb7vkwm+d
 C12mbwEpT0qsmbzh9S9MZ3RYL5xMGvCq4CuewLAcZafybYYivseEWpo/Go/37/yA85Zgpaw0an7
 GPysBSpSBFNsOXMnTW/3qCsBQx2njTayNp5pEP78ATuPUQgM2ckEZvbPRmYEMKq+7UbBuTEZNqM
 DD32z2dnuhHX0UhBi4djQpsfS4SgVhOFckrMEdo1RE473eepVBKBBYe2Q7A1JozrF1rLlrtl0sT
 pK4y5R/81Ef3eAD1VscMoqGq+Idq0yZ+MzutNjwj/yXyQ9VSHDig/ZWVK4FWB338SsiO41Ag==:
 4fUAD9yWkMYBPhuYw+GNSKBOEoZT20/Zgp1XlT1p0J1b05WWt+oYwOCRgYOQxombFid3JCbDLMM
 918dq8bCav/170H1cfGqUhIK4StcXb7gMG1h6W9HUDDHw87CP0GFEot/HnLra8NLC8hCpzlHsF1
 4gOuXJgq12NYsC4Er3/XI63vFzIxxJFkx4opGzIynAxmxuNhsh11xwCYpaLG1EQEF8Pe2wTkqAU
 50eaTlByOvxS7P4yt+VthuPYU+3rL1JiruijQLPDePfL54gSHvZ13o4blbgpKKIplolXdsY7CTm
 h+5GJ2P5sTYZ+kNQ/sZO4n9VKmDEtY78eyery/IkfEmbtklk+QYLRT7mp84vRkFvyJy1Lu3VfqZ
 VbogRjzrrmFyryolh2yCLafIfnHLE5kXg6ILORu54E0MduJtqdH06cF2yRiPp0VPpijs/qaQ5OX
 FpD61KdHaJ+xGkzIpW8u77kuG9sCU7YMDItVXTmq1XFYhIUFWtegfKe5OSTeJj/lQq2706P+Pgb
 boWoj48FqnmFRzRxfJLC5fN7rSSR8U2Mm0s0cOsHf+gx0XJ6IZrR0e7MwK4wQKJw5riEQdrYX7t
 ot/2
Received: from fli4l.lan.fli4l (p54a1b069.dip0.t-ipconnect.de [84.161.176.105])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4D358A4C4726
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 12:02:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56992)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xSY0e-000000006z7-01b6
 for buildroot@buildroot.org; Sun, 15 Nov 2026 11:02:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Nov 2026 12:02:55 +0100
Message-ID: <20261115110255.230943-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/openconnect: fix dependency order
 gnutls vs. openssl
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
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit c70e0c08c7ad516b4fd20bf92dc1435ecbea94b4 added the
package and correctly forced libopenssl when gnutls is not used.
This does of course not happen in following case:

    gnutls enabled
    openssl enabled
    libressl used as openssl variant

where gnutls can be used by this package.

The order of dependencies in openconnect.mk was created wrongly because
in this case openssl (= libressl) was given preference causing an error
during configure:

checking for known-broken versions of OpenSSL... yes
configure: error: LibreSSL does not support Cisco DTLS.
Build with OpenSSL or GnuTLS instead.

To fix the problem gnutls needs to be checked before openssl.

The problem exists since the package was added to buildroot in 2024 so a
backport to LTS branches should be considered.

Fixes:
https://autobuild.buildroot.net/results/5f8/5f81bf35bbf8b268daef3094e5e8693fb8b7f198/

Build error occured on 2024-08-02:
https://autobuild.buildroot.net/results/e4c/e4c27b9ac6864198b8586e9feec5a930a86f074b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openconnect/openconnect.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openconnect/openconnect.mk b/package/openconnect/openconnect.mk
index e9a3257edb..f0f86552be 100644
--- a/package/openconnect/openconnect.mk
+++ b/package/openconnect/openconnect.mk
@@ -15,12 +15,12 @@ OPENCONNECT_CONF_OPTS = \
 	--with-vpnc-script=/etc/vpnc/vpnc-script \
 	--without-java
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-OPENCONNECT_DEPENDENCIES += openssl
-OPENCONNECT_CONF_OPTS += --without-gnutls --with-openssl
-else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
 OPENCONNECT_DEPENDENCIES += gnutls
 OPENCONNECT_CONF_OPTS += --with-gnutls --without-openssl
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPENCONNECT_DEPENDENCIES += openssl
+OPENCONNECT_CONF_OPTS += --without-gnutls --with-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_LZ4),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
