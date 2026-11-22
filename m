Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0315606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=alQpE4xq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=QyyX/Fpp
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A3B080D0F;
	Sun, 22 Nov 2026 22:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlHItLDRKtyU; Sun, 22 Nov 2026 22:12:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B379D80C6F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385543;
	b=KMBJ0P+S/xsFSSaNKyhuCLFY5x65A+h1pSdXlAT6QTQ/do/6Piqd3GZkQO0bgAsclA76
	 zoA3TXRo/gbAECZpLd3vLEWCN4pl/ds1RVDmS/PZ4VepUC5WsHhSPNaKOkEL72hU5nd6z
	 tJ0tUnybPcCI1Zc8SA5UqFxYnkNIHzAUf3yELyRPDex/FK0OfzNUgdOeSZLwxcA6x+yYv
	 2GhMRlJBPBzZbQIbUdFquFnEMyLEDqN5CvXPp9lcB+CbTdhkd1d6+3XYrX0DzZznsWz7W
	 O9S4JOD+Eg96HyLUI88IUSWWrq9Xw9VpmhaayyOYLktuSsaTnI5lxwMZW9/dCe7794w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385543;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=O0uTgcmCsiOIMKsnLHvMHRj4OhNcZQg57+c/D248tlI=;
	b=fpurqq6IyWO1X052i6hM7TTVJLehqrxaHIIcMDsFCDcOR4ttxt0f/w6vCPlcefjz9qsv
	 d53OAVzyFxAU7SkrgxQ6jid+sLWlcy0QNOSw7TmXYmc111uKeCcnYa3bVKiN850t9ePU7
	 AsQB/M+yBkA7D3w8ckYs4USqBv30l5l4W8QTpsae/uQg2+fHibf4r+vb905dSZTBH+s+M
	 9eUIF1/skwp724qLOYxlvlT/ulZjW44rGEgOUSK+VyMgSXtZgWzcxkj9HS7/LhgR5v/0W
	 gSN+Y8s0SUngQo3w9EhOxi7kieOboQypkzIZFF33b8yLbkQHNq4bzz3/dWNcBfHgLNA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385543;
	bh=O0uTgcmCsiOIMKsnLHvMHRj4OhNcZQg57+c/D248tlI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=alQpE4xqviUIfOiWysnv+VkTEQzKfGz+581D2Ncu0MXV5Q0NIjOLDNIuXh9+rKW96
	 pq2+RXGsFVwuqyfd/2RZeQ6xTSe7/VVH0WRvKyaKdecY8vfVe1GX+OVrLA+C9pOVxg
	 gxhicHcJEXMKn4y0HQ7Sp8fYwkd+y1k9a1Ill6mnLWgXdBasgtlqPD9zzy5Z7gs34W
	 YABjTaXlf+68QbXZXwSSysjUfJL8B3hDlfUw/L3BPqBzX/0PsWH0jURf+NTUKJhY1q
	 DEf7MuzOxbw5smOXabxHULJ0AC0bepwaQ9+3GYxtFVrdYwb2Ju7+LNu0G5WOxivjsN
	 SzZRrxsUTufbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B379D80C6F;
	Sun, 22 Nov 2026 22:12:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FF83DA6
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DC8940081
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sd1wJQFbx0Qa for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:12:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DDB7A4006F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QyyX/Fpp
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDB7A4006F
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385463;
 bh=SvJv+izju8zXvEoAx9GPSn2LH5l/Couw+FxdWv/+rzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QyyX/FpppagGupwq+DFP3jfqZ7bWplWlRSioZIraGggyV61gMOZEb1MDF3Qwha/3l
 OkHsz0/j4mVIf7fN0fGk80vhMQcxLqigzE266fx6okwRRhck3FERNdpwqsNhsGrB2+
 X6wQy+a2kUWYza7gGyUWccYDwh0CBxWH7jToOBys8OFo7eY9XrbIvlTZiioVmCtuT8
 4RaZUyp1PiOBFdW7H+VknwuJt3K8QNiRajBa3dVr7POl8gnZaqjRKFaMYO6O5lEty9
 FclKH1YNQixotf3DoO50igVEGgypUnuXcRz37cKBEk5+wGrQ86HLawnmjGVbLrepAD
 pEoL0JXGSkT9A==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 rN4r+GCPX86Q1wCNpY0OeeclMraFLmVw6s8hQa72pbYw+cXP+YH8O/GoSD2L4sfg0eNjFcOla16
 GCo95iZymJ+GwDauLv+Me1FOCoaYbVjv8lJTfDIy3YFZU3ahDma7vkxzIvDe/luxEXdOAqwCzM/
 bVR0Uu/O/TSWE1NXeCBWKP3Nrz7LRCMSb4xqJ7WJUK+Q4ulFNOgLbVC33vTPd7mK4kymlNzjcaE
 ecZVBVCGTtskXa5rrv4Lim8f52WFGqYLtJmp0qU/GP99nsXFWVFOnF0mbJV5z6h81k1djWdvoJx
 ZlVLWbLJs1EVfNlC60CHRJWickcFIfTm8qCK3FDuAAOtBGVaT0q8wFZRdQln3yMiGR36gqmp/wt
 /ubB1GnNwURFTTlqzCAZ0USr7xjRwMFNNfK7hYLu+E4TvFXoSySGIH5ZqBow5EETFOAocgSbiEI
 3Ww279/cyPV9HiwhseOiwmiJ2CPsyNgz7DegNNajHTAHmHm0xtHfZHe5SmDT+ITB2zDhiXUQYjb
 xjJ149EEyY0NF/x6kWfEZTzfOSAWg7XBxhIZeiMVEBKweLlxaLEx6qM/E9CZQP2lXi2s5IIF4Yq
 8FG0cAhIN9eDevrejXyY527RbdR+KvJK6JZ1iwtPweltDHCSoB82ZEKJRdrxB39t39fpEJMPKWt
 tRR5iw+KokgiXpQ==
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4E270A4C4E7D;
 Sun, 22 Nov 2026 23:11:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-2tTD;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:10:03 +0100
Message-ID: <20261122221014.3945599-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 10/20] package/boost: math needs container
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

From: Michael Nosthoff <buildroot@heine.tech>

As of Boost 1.83.0 which is currently in Buildroot, there is no
visible impact if this dependency is missing, but as we're about to
bump to 1.92.0 this missed dependency would be causing
problems. Therefore we do not recommend backporting this to previous
LTS/stable releases.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index a6135adb70..4da4a5cd91 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -244,6 +244,7 @@ comment "boost-log needs a toolchain not affected by GCC bug 64735"
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	select BR2_PACKAGE_BOOST_CONTAINER
 	help
 	  Boost.Math includes several contributions in the domain of
 	  mathematics:
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
