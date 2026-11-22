Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D54B606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QEG46VgA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=COaLvupP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55BA660635;
	Sun, 22 Nov 2026 22:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQ9IcvCh1mH9; Sun, 22 Nov 2026 22:11:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 860D56061B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385490;
	b=kN/CuyN0mjHC5Fh9U4rOhUQJVSID4+xpfs/rtOPZE0/3dTvIHxHw/ub1jgYEnnbpjv29
	 APH7sJj+mWxetBSIf6YC0K14sMG0Jby/928YfGk3X6uYHrRyJskTlEOmcOKYIDkU2tgHt
	 OJMwRL8lmAqXTnbd5d4hpBcpV+u36ZvFv5kywodwdrxUI9OAlRgEW/g15lslV/qXZi6d3
	 8XLoEqd2P3Et0j9htfl2kbvex656csYEaE0y99kntWERtyx+7T7GaRLImVli8A2WwCFCi
	 QXf7xvvq9ax4QWwav530+7cKqBKl6jGw5eE7LT+hWpnzpZ20Wnh1QZia3XuayquCE+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385490;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cUEGii9L3xXm9M34z7tRPqI2GHeMEa2r1Qz6+hIyR28=;
	b=Tc9QvlbqLOwNGStrSEYnxqcRR0YDTxBH9rlfDHjHgPJdJtjYYVUh3ROxVASa0XytBaUT
	 8jbdijdthiIATgWyOZ6MpovKAclD6NqV4ozlrgVhlGmeB9ALg3EyF9zf9FWnwviQ9a0jH
	 mYMnujTG51jNBcaEZPWgzXGS4/AinnWtR3LnJpz1rzF5LusNl87Q76bKJ3XLQhwaacHGI
	 fPTldvOGMnBzRhTMk0q3aQPE/6D6xoQ72z6kTPNN33DOxu6SWCtOBje+OfqWZhKl9GUdN
	 8hPD2Sqe00V7slzdSproAzN1ZfZzhhJZ/bcnequhKsfCjWItPkM0krh1Xp4/wkeD3Bg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385490;
	bh=cUEGii9L3xXm9M34z7tRPqI2GHeMEa2r1Qz6+hIyR28=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QEG46VgAZ9tImKwhP/QpkTl7U7f+Io0g8eo16R006dZDv9ZVgw4EPw0MtCfiz2gse
	 9IdCi9fKMCFI7Ca4ZVh+/EZik3cLAtf5WAnePVN52mmCY0MX8M+XJc5S8fbbSzrLJx
	 bb8956HqgLdUOBrY/ber5aD1cB/eXVXIVM5zxIO355HoX0z1+obz725iaxXaIWrEe7
	 4NDXn3s6f7gUYx5YbOcqHMgm/yWiW+ZbM1VhAsSTcgxoZALms0Q4CXpVFufyslBESk
	 /fSakX8X/ZblGJ9UbJ6pBYANxDNJei+FRUv6kRajDSDaS1Bsw2yUNPFASVuZY//7Yd
	 rbSjhHl2XaMaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860D56061B;
	Sun, 22 Nov 2026 22:11:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0156022B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E713C80D09
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpcVzGrrg3VQ for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:11:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4694280C6F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=COaLvupP
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4694280C6F
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385462;
 bh=HMFHgK6C4kzyiURu+QsgCRVFwkTu1q+ArpFewGwOar0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=COaLvupP+cE9se0VxqMYuHN8cAhlbxXbtzzxSNkBN3yOMQ+HhW1znjtT6ZR90KLhp
 qQOfFPHmjstZRPMejDEHTtMR7MJAr1DmOhlSuYLgaPgqlRLJ1f9fTQzbyZ4AoPWefd
 YDIhk6nrhRnrQpx5K+xBWI+8QkDFMMPGhGyU7dcx2VFwGe2P8NGtedZfNTjUvjCtsz
 GMeeBeWSIaeR4VsyWLonpCzHOb6Z3Kg54lAY+58xxGxaEd30qfUnxBZHrDBmRHJs5O
 amgnVHOkskaIbh7Jca99vQdVPMft/JatAkAmJSW9xMaDlHFT5U1LeehEYzmAQbSy3v
 19TiGeFFWNJqA==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 CZgHlVL3i8JX3CxjpRdkRJflt2JFYkI4u7YptB/0sP6wK5vOLvHuqhlgOz1hU+bg4yoGUolNs1+
 pGFD9mFpm/7szL599Z38tKa6mW0BMYRX5orqWNl1sWEGOMPJn+ZL9Iyd3HeAgz9DpYSdMPBlYkJ
 /q/0XqYcDVBsMsq6hqyRoMT97THlfXZ2HsWXBW6UORL/c3u0IiUYa0UiqhrEgdxw4jQCmB/cN33
 ej4K5LV9Hs+ZDaXGcfn6l8fcHzvVVoDhMKV6PERo5YSLSiKR96Ze2+hqYwmZs7iHi2cXMis6aQo
 HHvC3KHBmuFahj/g/zZvmeTsOuYJvApl2Ejt0R57zZGDcZuzJBaIjvZmXgYbxa150PJO9IfJFnq
 yQHw81I+5VuvqzFjKlaGa98+h3lFKJFFAoSp4dXQHxMs5LpQg+GnSGc1anEeZBQW4CiEvQz/Yl0
 VSXRUPwlLRQ2msRKeRrNtZJ2qVaHAyhc4+lktDNypC9q+6eSIjjEUgxwibARsHryIHNxtxWi2yx
 IfzTGAZW8aH6p+xXzfVxwkQrD8AqDg5ZwLWcnWccRK8BMZhpIA+MWvQHDTE7dKuqczwfxhB2/eU
 zOqjeBefe14fnjZ/qBva+9RolDbRuwAP5r56IxmmbSIBOA==
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C99FA4C4E61;
 Sun, 22 Nov 2026 23:11:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-1L33;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:09:57 +0100
Message-ID: <20261122221014.3945599-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 04/20] package/boost: add missing Config.in
 comment for boost-context
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

boost-context as missing a Config.in comment related to the GCC bug
64735. We add it to be consistent with what the rest of what
package/boost/Config.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 502a68ad44..5afddb54a2 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -58,6 +58,10 @@ comment "boost-context needs a toolchain w/ gcc >= 4.8"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
+comment "boost-context needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_BOOST_CONTRACT
 	bool "boost-contract"
 	# pthread_condattr_setclock
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
