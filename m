Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C76606A31D
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q52y+9CR
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5FD340742;
	Sun, 15 Nov 2026 12:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCH6eeFyGy_5; Sun, 15 Nov 2026 12:30:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EC4D44073B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794745817;
	b=gswYIN804NhR9JmOY85sohaJNX5sAvpMRywPe08gDkt/M8he6ueaO7Rc2UlkQmvpBk6H
	 0z53nY2hWnp5r7t+f2IJ3+filhJ20fcqpBEu27hWM2oHEgy5PLOb0U59dIuhR8xqYcJxn
	 1izEfvLUQOZF1zAMfUdr9mdWH8Me4c1XcrvBVqUi5MMUikf+SOJ082BPuHO68fVLqTJKj
	 Q/oxW86/3IjiPq6m+13CPcip6el9v9OEvSxhqWlvWguvcpyn+bnlK8hJXdYSHDG+ziWk6
	 HAQIqJFGbabQdCVDQ2j4v+BssSVp+QbbJZNWhChZgaZxkTNi5HxX2xTBTgkTfSWRy4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794745817;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=q4LUF/O3yzlWd8Bj/2RDYt1kC3KWgEK3Kd4DmPRWKeE=;
	b=d03rgpjaQqi0wwuwoiSxwWSZ8HlCT3OB6e2N1ZSMNlLGJG66vOzD6nHrAB8h/az1gOYc
	 zr2iw7yqylJ4CMPSzelpM4orXVTmER03STyx01ugGy4NIdamdEN1mL0jVSwO0SaDaGqZG
	 Qp95R6m+iTkCIVoB50mTfnUEjY+vUVlSlVWwSFJN+nwYZzeWqqEKqfoBWYHK2CSY+j9Vs
	 PDsnCcifZpyacFOElldZZMezJ6/gotAFbM7NSV4ftjpkQPskSzNlnUc5vFXFz+GLgmwUn
	 ManOJhB9ZN0oxFOeet+Cq5iePug7+tAb7m/URlztuO92/rdhDlGxszEnUAmkJJ9j3mA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794745817;
	bh=q4LUF/O3yzlWd8Bj/2RDYt1kC3KWgEK3Kd4DmPRWKeE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=q52y+9CRhrGj2ShYmvn3k4QpriejgQAH+Fu+6wZgX0okEFR3G8Zk/as8S575b9iOI
	 4GqaJBbmvfnPwD0c4QJHMmBGc7Dm6rPXqB8wPbiXFB6sSKlsjki3WZzz3m59AjQkVp
	 d/eYVQI+U8dod4l37NnJ0+3O+tO+sLthY8A6V2dogX3ZoAquknR2loUAa5VSin9HBa
	 rCVE5wH9Ja2JAxRV3KnlwagT1jbnLr71eLjYOV/G/hyQLEtJBjzi7Wh/JUXTPDmgQQ
	 jUge/IxeAlYxB9eST0W2yOmbzclV1RDDNtzUt2EnF3Mlp35cknnsLvB/OlSjsECxwp
	 QNsrPdRf96qVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC4D44073B;
	Sun, 15 Nov 2026 12:30:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39CF32FE
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 12:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22B876061E
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 12:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lX8S5WoNJIuT for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 12:30:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EC78C6061C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC78C6061C
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 12:30:14 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4FFB75FFB4;
 Sun, 15 Nov 2026 13:30:10 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 15 Nov 2026 13:30:05 +0100
Message-ID: <20261115123005.1448809-1-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: test_syslinux: fix test by
 selecting BR2_i386=y
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit [1] changed the default CPU architecture from i386
to Arm AArch64. The test configurations which were relying on the
default i386 architecture are now failing.

This commit fixes the issue by adding BR2_i386=y to the test
configuration.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158062
https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158063

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_syslinux.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
index 17fe904263..8e3820e9d9 100644
--- a/support/testing/tests/boot/test_syslinux.py
+++ b/support/testing/tests/boot/test_syslinux.py
@@ -4,6 +4,7 @@ import infra.basetest
 class TestSysLinuxBase(infra.basetest.BRTest):
     x86_toolchain_config = \
         """
+        BR2_i386=y
         BR2_x86_i686=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE=y
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
