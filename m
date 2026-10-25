Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C52606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rw1CGAJk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D2886060B;
	Sun, 25 Oct 2026 21:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62ehpJ4UxTIk; Sun, 25 Oct 2026 21:27:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9AD91605F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792963674;
	b=ESOc98+TcCqU63NdPLjYLO3kk4JSKdkuic/jI0GRgZrA5WI6+zuq+kCX6Ot8qrbcfl8h
	 /VHUOCvLHvP8DMqnOQh7XMjSHszQw03fjc1vvNin8VeMEiHLnSo4QqtRzhRtIz4hGMO+Q
	 MT6edXi3DAoOY6rJlZKi0JC3RECXjOuh8BqrFB+3inwUfMTiXIXy6vGHLS9faw7KKwr+D
	 eBmGSDaBNs7jej/Q0E7SzqI+pBH4E4RomQfxmb5qqBhTxSSEN+O8koawjVB1Nyk3WL4oK
	 YydtyjS3oeqONx2W5/bWol5cMXQ7cN1FQGuCs+8gr++fVfMBvIu/QBcyXHj8R6c/XBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792963674;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/T/ISr7BLmYA9k0DFSb+mZVUlbapseX0R6PV0Wmdv24=;
	b=M+uKSSmRky6YQUyuNgM568W7CvexZtIjOg82KLogckKk/Sy6TfjOLzWLqmb9DBK8l3Fz
	 Xcf7yGi8N9bXUB75idleP7NWHbEbipUhzN6Qraj+XAjWYk8roHO26R0WU1VfN9RGuoTDD
	 pGxvxVR44rcF70Uh9XF2UKGiee5NvtSxeVcQyILXatFyRJ7zCvDWKEc+MebuTM9RHJK9e
	 dndEVDBdwFyZmNwXWZHiWljJ0xyqTPulof4uyy7CNInvlL9vwmmMdkdNuSuD9DWwALDFH
	 8MPnYqEe60J0Z/ikHiD+G/g516+YZrvWykxOzZxeBXAi0yRmUAQ4gCiCHJ/f5d21zXg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792963674;
	bh=/T/ISr7BLmYA9k0DFSb+mZVUlbapseX0R6PV0Wmdv24=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=rw1CGAJkCqOYLs/0XDhhf7vIsAJt+znz6zUY1fHj3GVOFyHfJaF20ANwxddjETFnz
	 TXWyxL8HBvXD2X0pYIpP3fqPTWsnbzU76PUo8sB2IdIcXyb86ZC2v1U4HXHqhItEvR
	 mXtpelFRldfLCTV6tqQgoovnDS33ffyM1spQ2FT7bKZ2SRKKIKLH2mUHUASTynH5DG
	 muoaIU2zGkwKEV79SN/lu2BodpSIQIPqjIC4E0zhTeExScZpwFwRSFx9tRyVuIOBl4
	 2foOJQ/dullJtVHwmIMKfkifhAZnth+38NeBbwmbAU7ys9PqbggzI7zlLZ5PCfrfA5
	 //+nZjTO3HQnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AD91605F0;
	Sun, 25 Oct 2026 21:27:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 981CA4D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E320405F6
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rqYE_Qhugi0 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:27:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E4C6C40585
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792963672;
 b=sgqepiwDxe0akvXZgabYOxguU63Bi6ErqCtyOxoE8A3dh3KKw7lNrRMjEj4rYqKJV+Y+
 Q0Gd/PkWPfNOJ5W3jzw+6HDbXytipTSRjRJeWLetqD0JnibmUsSJWR4Kmul5TSSAjozn4
 Pti2pZtQNBTboB1iWtCV36GyDPjLBZqHsTekOpQDjZ22NAotqsxOsG1GuUCRH/e6hxPlT
 SUDu8SP1Id/MrFdsNp3p3w3Ol9XpK7kZ8+TGRxwB1UoaQJ7Ke9a34mT34yQsbiOuAcoIo
 nRt5cSnxyE/YVWF8GZcZ20azs/d5UGvA5wPKb7ffeWteuUKUguwJoT3jDUTHPATC0tw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792963672;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=f1/49+9cMim9KUSpUDciMoRuG1VIspC4rYnhWpKEMwo=;
 b=BN5GywRlZ23E3HgVecuv5dpCW3l43aiBnqO4kgEwm8XssILPVUbhd2QeIMMvpPdVmq+4
 0RhuJuDh93oKbIsB1xnTMDN1Erp5d9oMXGGsCq6UfUy2DMTjSYZlpIB3VjmU2/icBxzzK
 C9NWkXdikjV2ZyYVlgmaDeWaFOnZC0Kg5AjlkzdbOMBKdwD7FFipNlVDGQMtbDnb5hafm
 TyC+MiqfT3lGxEraSJ7+4fmTj5jpn20KeLYf7Lz7Ryf/FewWTo5LHAH5nMQ/GKWAUACWl
 UY/8V1AC8ymbPD8BysL41A4H196ffspZ2EfhjOYWY1l7dLI9uqSeY8oInfHhFEFLYwg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="F2j/iuns"; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4C6C40585
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:27:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6Mt-1wllCa2RLH-00c9D4; Sun, 25
 Oct 2026 22:27:47 +0100
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 22:27:32 +0100
Message-ID: <20261025212732.4111719-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:u9w6ERy2bY2XV9Ul5Ciu24ZXiJK7hPd8d8f0mqQzIZh1xyvaLFE
 J8pkP4AgCFWzcGky+P8TZARMQVp7S25PgMboRe9vBMZ0hAzEeXSTkIh7HKraViJIEAcgzaX
 1R7V5DfNa6mU0cJLCL8+Jgaa0WoQNgPu2+vSeXtiAhmLEklMsn4ohPB8sv1+hXKDPkdgJ/2
 PomZjoNmV/Smjx3mLdF4Q==
UI-OutboundReport: notjunk:1;M01:P0:bp/QJRG89Ec=;xpnSM5EbZcv6I7w7sOEh0YAEWX1
 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
 T4rpYOC7IISjHiivqua0BwgTBuBd/w/3t
Subject: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: skip
 dependency check
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Upstream has set an upper bound for the setuptools version [1],
banning >=84.1, which had not even been released yet at the time
(setuptools 84.1.0 was released 2026-10-19). Because of this the build
fails since Buildroot commit 2027954db7f5f42ed976ea2f4655e0cd224c7ee7
("package/python-setuptools: bump to version 84.2.1"). Nonetheless the
package actually builds fine with python-setuptools 84.2.1, so disable
the dependency check.

[1] https://github.com/jawah/charset_normalizer/commit/a05917f87b5f71d6022d8abe2b0af239f65c1111

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-charset-normalizer/python-charset-normalizer.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index d8c69899a3..630db33043 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -12,6 +12,8 @@ PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
 PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-cython
 PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_CYTHON=1
+# as of 3.5.2 pyproject.toml bans setuptools >=84.1
+PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
