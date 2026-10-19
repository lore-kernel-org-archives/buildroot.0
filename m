Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1809A606A31B
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X81wGsx4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=RJMoCi5w
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44DFE6075D;
	Mon, 19 Oct 2026 21:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbQvV1xmxMUJ; Mon, 19 Oct 2026 21:14:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A077360600
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792444454;
	b=Xq7QO8DhlIq4JwBwdfR+gNR2QKq11CnToUPGDo8qWqBkq1SJD48+ctI9RgX/1rRCdxOr
	 TpKniklCgpCFhuaDhLPPPHajDSLgqNsbsH96XZHOec+v1MSskDQVfUtYHdbljnH6mtATw
	 USipi3JAZsX7TTnAeUqtmcQ3rqJCUIewf2K/9qHj88kp0/g711U4vaVvwCNoj1WDP5iyU
	 YARdDPO9S6pkBv+acqQG+4ocbX5tSAfx5HrKbaDDHBY+89OBdEPNqqvU2xnckIiH5dXZ2
	 A142R5K/GJuLWLBeUJU+qH+Y+Hc0GUik3/qfZJgoqxNh9ilC13Igv6++r8b7cA85Zzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792444454;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UXpdisb+eYW0Pix8YhHiQ1kUvZK/fExXikMO45uuzxc=;
	b=aP1PU7S12rBJsh1QjKNFJH4MRqx0n7l3ovSNzfbdCNLc6XTTiczPF0SUKAPzRJ4MrRKm
	 RsD8STnDDsA67kTPXs149KHbd54Gqk6M5tHFNkSrwYwsaTQM8w+yNriKOvOw+hwkeQlFU
	 xX1Mspy0P5jApezWXyrlIohjikleSMnyw26H2B/n+8d/hNqWEeX2HgFmp3JiWvfhrCZDz
	 c/JCko17AU7xpLwJ7rcPH2kr5/em94/ReefU3hDKcnM8qicM35DW5zSyPiJELSZEGkceg
	 eJNAEoNVFrbnsd3RpMjv1D/Tg96AsI2q5EtDsCDNfUs3HakqYNMCRYu/xEzy4rsy0GQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792444454;
	bh=UXpdisb+eYW0Pix8YhHiQ1kUvZK/fExXikMO45uuzxc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X81wGsx4dVcRY/Ja9ninR4qyQsx8VFbNS6lnfDiQZ7WGmtDNa4WNTdYG9pvAOA/xw
	 YzfDc8372xUYrcahPhavzeyNxCrNKCRJ54mXIpQKPS79JFtvlRgJOJPJdxJ9MPHU3l
	 3NpCw9j0ybbbH5YCt0Byz7T7S2HILTsEy9Wd9XX6s6LFHZS+K7P9vXlw8POJHKLlsB
	 w7i2oOkP7Yr0/ElwWKLqM6xxb9RVeftq2eivZyERzsBMIdwUxyODYD7HTPjl1a9gpQ
	 T2MOdwylyqV3sTxy1LrAzuUQeRRW7qOmyYcrYqPpToxM4OvU3/XVZA1cYke3xPLGFv
	 wGbTDRUzdON8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A077360600;
	Mon, 19 Oct 2026 21:14:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E52823A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E815440475
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pVWQc_94pph for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:14:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 65B9D40400
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792444451;
 b=AG8fvlrUxzt8gYRvHQj5+1Zg06Zhtx8gFzum4vkFzDHnWh7MV6oH5AjCPVDm0cjHG2PS
 7nUZeUeWJoZs3D6ZhT2MiWGnpXR+azh/oXiWf9oNGApiaYu/+9Jr4mNskRzzk0w+5lEmC
 CrQyCvD7463hxwaHvEGr+rkstC7iCeuR1OvIx+K/a6JXXnCRDdIzzhzaRmRhHwEMNrxpP
 OBBxF2q4uPX8ZZwfy78ZsgLdOZFDRaeWdpf0LazMwGPveKwP9vs8Dj654DXtQntkoGXrh
 EQBDJSDRC0WFHoplTvAyBcp0I2rSKGrr/d+NUBICk+JvykeINhbGWcRWWW/u1ElI9OQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792444451;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+Ect3LmdCP8qT1I+x+eNc5Q12LByHbwtCR8Vbj6HfUc=;
 b=p6a4AdLd6kMH4sIg9zlujmQcieyzc2h1Mk19wN+kVIHcEkGciIRt60V8o+YdLEqN143r
 ydV8McRa4pXmt0Aoab9cU1M6UXw5Hmx5rOKktQTq6vZukz18KGJkyQ+nSf+DIj8vAQmes
 lCE/J6Av5gu0PhBsHvn78Qcxx0Ynt7xvdqrN3pEUDq4N/T+Br5wswum3LHWbyPUB8TMoy
 YExDbuIOXZyMYclLl9L0v2Qz8R9QFQovzS67OJKD7vgz6rBUJYvXqhPTY6qYBRh6StrJe
 NkfBvaGuz7Bq8/WT4NX6pGeiRcPxfs8cS0FJqC5Z7arYlw+0mgWJDDBM7HKdGjcccwg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RJMoCi5w; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RJMoCi5w
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65B9D40400
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792444445;
 bh=+Ect3LmdCP8qT1I+x+eNc5Q12LByHbwtCR8Vbj6HfUc=;
 h=From:To:Subject:Date:From;
 b=RJMoCi5wjgJzql8laP7Hy7/7+3J4NrS+xnQWeKM267MA03t6gTteEUd3tfPSCNbMJ
 meH8OYGe3fJ1i4VHSRj7K1Ks23snubRAsrBwjfy94HMEzvJgFGTsqyrSUT8kh2PNvg
 GwWj2x8J91xurwNr8HFDM+QY84/qPwnv3E1eFfHyEgD9Aqauo9uuForvueg7oYKlpy
 62ehweJN3CXbB0g5EFZovTqrDuUacUOQUJ3+d4RMQsOMZj7FUzXiBdvlnh5NitCGXz
 oUi80y1L/6uZuF3ObQWmlapWPOcfpw4yNUzZNrJglXB+EOt7UwIotYrhIIyB99fG35
 F4Gev+g2drxnA==
X-KAS-Sym: v3:f51bdf72230551df:kU4hKTW7Zh7n+Ea1AqUH4AfIY/CwzOedDmz2nvjGlKzXc
 j7ZMZbq+Vd8TyOxdD3EepEMKH26nzveVK+BIdisQXaVim4ZAH8Lvr91OtmveQT8jZVuFBg5xOjr
 4xwEItUuVRA/+SarmrSNxS1cRMLdv2tlUOxDuyHWhFsONUV1ahtsG/4bO0Z5jhtZeMfsCe/URQA
 leDldnaG884tpr9YnKgcE/N6WaTiKkKNTX5abX87y7Iuncr1n232RTNuh6iZMZwsIDkH+E4vrkr
 emxw5wPFunc20TpWBO2m07gi5WZb6DzfPU7YRP5dYJfmaynOdiMByen5efMkijz1oZni7TmA==:
 OupO94xvsnWIRV8StnN1PoX6tJGfOvrr4R/7lZd1JNvE8ivwldYZDH1BfLUhMlCCo6nS7IxhuTo
 iLc/joxb0QMW1obvS9pOiK5NlfMxRm8ukAm2jpQEaJMUrOD5N7gUzSVU0ImHhC0HwtF+YZkCwMM
 ogyaNcV/YfKxrH4WPNUhS1YiKQYYJpYGkzttw85Vhzusnw2qfdcNZcdv9PozcyFtlfkq6FPVwUU
 ohmFL8LPnsGR5zE+dZl3EEDzjZoRkJWR47uYLP7ziZY/LFS99633/QB+WJcpcLLZ71wKyaMucni
 ixlupjYW18WR0VNDrB8idIHuP26yWD+zTDVzjxMmyTAEuipG+9OAO8Raf1PA9j2O3tEEeGpPmF8
 fzvH6CB8+FZN5MfiDLX1FXLEGnceUXxKvPi5G6s9hVfCltc1K6S6u4+alvoMiJ/LcB8/RHGEt/K
 fSgCmAyp6dpGlc4+nmslmEVLBnN1sCBBCXEVDnHB+ZwRCYSToZ3YJrVz/nRPuvMWijX6A/qVu5j
 ue2266MGDCRw9AtLsN0C+B72agy6Xehj2gPCvuJL3HwsgKOJP1e0NSrVl0VIeJ67dRFnUCAIb7B
 8Q==
Received: from fli4l.lan.fli4l (p54a1bacd.dip0.t-ipconnect.de [84.161.186.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1797A4C5DE2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 23:14:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59276)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xIugH-000000001Ap-0O4b
 for buildroot@buildroot.org; Mon, 19 Oct 2026 21:14:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 23:14:05 +0200
Message-ID: <20261019211405.93925-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.54.1
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://sqlite.org/releaselog/3_54_1.html
https://sqlite.org/src/timeline?from=version-3.54.0&to=version-3.54.1&y=ci

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/51a55cf1c7dd54f8eee1a27e599442be8481f843

 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 25ac602fd7..80f1a5bad1 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  134ec0802dda5795816e25d25872d20b312cb3973438c49b30bc40b7705ea9ed  sqlite-autoconf-3540000.tar.gz
+sha256  926ef8d3eab93fbf6e06011901273eec076b25594a4e1cdadd50c987f4f6d64e  sqlite-autoconf-3540100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index df22314091..f77233bc6a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.54.0
-SQLITE_TAR_VERSION = 3540000
+SQLITE_VERSION = 3.54.1
+SQLITE_TAR_VERSION = 3540100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
