Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4C3CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39EDD814C3;
	Sat,  3 Oct 2026 15:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5gzXi93r3Up; Sat,  3 Oct 2026 15:55:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5283C81082
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042942;
	b=GROy8dD2AiN9KmIuKBxgQEDQedkrinuyUkd2FwSWgLctlsQAAEwi6B3KQTdubp5TW2+l
	 DMs1My9rwKvxWTMS4iU88ka0PpY/OFmoWCMTl2IvFrQvQEJvB4vIywqe07qhdwCI6B8qS
	 d8vFBPj1SsupV7bm0vmAi1ec0F4OVrYoQHWhG6KdcRsfj6y1XL53vgp9rDwC6NPjb8EaR
	 jtLVuIobdZMRlPgQLcVQoq4G30gXWVZP9hn0ACOYnLizcVsP44qR4cRIEen9DutnKJ+2N
	 Q360b83wM7NzAPXxJxBEUiVg9Ikwh4bgTqgjd2RqM0zpe/2LYJMjaHC7NbIDMzeRlDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042942;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jXUzGmrN5N4G/4/iUr4po+k8iihfj4gAZVVUn3ac9So=;
	b=tApCEnbw0Do5uqOmHJuEWz5evwpg16qBh5fS1nOsPGslTwMK/XuHM0EnpS88QfBEYMqM
	 /wYQXyYdH4RQHN9M4yHNrG/ZNbJ2eWrQxxcDyv4FbXPPGJZZK8a7Lr5fQySBe5Y9Uw1Rc
	 nBmUdmrAep3Ve/+gIZ2tTSQXUqTySSJ0jC1N3H9En5Za89N7f8vfxtTZEht9uelqmQOCX
	 IaLQXMrkoIvHIuTrgmedQiCnrKRCIbP+MO+ci/Uj/K4W/XBob6XK8Ksgn2lpQ9sCko+O/
	 Rttl2sZsRyWY5ZZPT63EzteD1qu1Xz44K4TpP/HTxNUfI2InM7RjplTfHA2uKHmVNBQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042942;
	bh=jXUzGmrN5N4G/4/iUr4po+k8iihfj4gAZVVUn3ac9So=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WULwT5jtr3b5Mg1zL+uI9W3Xh9BZuE25pud0eoGK2PuCpOKv6r29HnjZBO12nsbNo
	 u8MALJ6lfFIWhWuYGCNwLyxbctG/ggmzC0zQM+FV9RK/Zpr6ogKxzke7XQ1MwRP1aP
	 ekFaEjfbVFieYHyy0GkcOQuDqO8LEwq8Wii8FSJhzG4KfMLHvA4kqX4q4mDAskNFHz
	 dGb9Eqp0cy1hntgeSWOBpJqCwG94rioAg20fRUbXQ+FsPnF1hjz26fGBaIRsGdBtsS
	 +piNtOj4zQb1EWpxZGjfX8GnB957pqrqlYBA3hW+mlngl0jY+yTSwYYZJ5bkWa/HHq
	 AdKwuHX3W4RYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5283C81082;
	Sat,  3 Oct 2026 15:55:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96B50335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C458606BF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kehTubXLkiaw for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 68DCD60666
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=CfGj0ZHK6mlowZS6WJ2J28p4NsU2H275mNullqctCEKPh47QrP5waaAMURdyMZf4Hda/
 cJYd9fArErJlRCMrP1Q7f36K65CBc8jvHJ3Ap8MudbIAI4xyvFYHaZe5AOxUWJ7i/M0LZ
 nCDVOByTX4WFssizEyoyhzpGkL8CVo2+chCbgjAaoVAJwa3acKRB1VLQuLR59H7HtidC+
 TO5NycN8sErb9B1xXxGZPUIUMJCL46wqvip8p9n9kBAu3Etf1FcoykbECjB4hcGykITIx
 U4cP4S7QX3WrSOcli5UorwQv6X5sv5tLQ+HYD9pgUV+vtR0hBFntFMrYETGoC99DiTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=iOsUKYWXI0X9Ap9c/d09JLBk3OJHa5U7Oa2zQGNldEw=;
 b=iQ4qEOblhyF4wePfBVttoTanfcciRSWWW/QwjcJPzpwI8JMHu20i6afXcZj5/yBmr4uv
 qGSM8PIn917YrQdq9KRDXOurDG95ouNXAjRvJxGYj4p+7eYfAAS84VU4YqnLSd7VlefZr
 Y3HEii75DfIs5vAOreAuOSjeqUMMPNmo+OsdpWKfYMTjASeuP7b4Z5KIGzwUmTtIt0QnD
 HIR1Q6xsdth9FlJOevvQ26fsTiaf6H62jfGcuQ2TWX9wK6E7Du9/DhlvLjppZ+l+mFSfj
 cPVKv7+wfYRDXpqy+3AS4l3jfr7OQb0tTDm4KC9PDMFlDoWeSafsNQFbTEo0j2cNoWA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68DCD60666
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9AA38A309; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17d760c667a205e31992910f9c8ab68b5a79eeb4
X-Git-Newrev: 7fba54c7238c0b72c8dd7f963ea8d654b3f236b7
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.A9AA38A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tabledata: bump version to
 1.3.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7fba54c7238c0b72c8dd7f963ea8d654b3f236b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/thombashi/tabledata/releases/tag/v1.3.5

License hash changed due to year update:
https://github.com/thombashi/tabledata/commit/10cf6635129960103edd9c4018dd656ff919b274

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tabledata/python-tabledata.hash | 6 +++---
 package/python-tabledata/python-tabledata.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tabledata/python-tabledata.hash b/package/python-tabledata/python-tabledata.hash
index fb3471af95..58086e8930 100644
--- a/package/python-tabledata/python-tabledata.hash
+++ b/package/python-tabledata/python-tabledata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tabledata/json
-md5  c0efbc178462c94920c02c52da56bf18  tabledata-1.3.4.tar.gz
-sha256  e9649cab129d718f3bff4150083b77f8a78c30f6634a30caf692b10fdc60cb97  tabledata-1.3.4.tar.gz
+md5  453c912bd7bbf49cf90490e42e9a94bd  tabledata-1.3.5.tar.gz
+sha256  98c64d0ad6b520846b41000fb3f5b2f42fa7ca2675c2c669e5ccab6b93082a36  tabledata-1.3.5.tar.gz
 # Locally computed sha256 checksums
-sha256  4434f353a12dd0236a99e5d3fd07fe3b3a453f9164fe10c57a11d6ca86b50c08  LICENSE
+sha256  df528c57bf4606fc7ac4022b3a65ded8a4915e04085ed75c3f810df562b3701b  LICENSE
diff --git a/package/python-tabledata/python-tabledata.mk b/package/python-tabledata/python-tabledata.mk
index bf845b7a7b..cfc3abc6fc 100644
--- a/package/python-tabledata/python-tabledata.mk
+++ b/package/python-tabledata/python-tabledata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TABLEDATA_VERSION = 1.3.4
+PYTHON_TABLEDATA_VERSION = 1.3.5
 PYTHON_TABLEDATA_SOURCE = tabledata-$(PYTHON_TABLEDATA_VERSION).tar.gz
-PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/b2/35/171c8977162f1163368406deddde4c59673b62bd0cb2f34948a02effb075
+PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/75/65/2f54f0dedd775dde48e300023d20e13ad329a51e33dcadb6d47b4dc95768
 PYTHON_TABLEDATA_SETUP_TYPE = setuptools
 PYTHON_TABLEDATA_LICENSE = MIT
 PYTHON_TABLEDATA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
