Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91851606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NONRbDGc
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FB6740611;
	Sun,  1 Nov 2026 17:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfRvej9cz2Gn; Sun,  1 Nov 2026 17:07:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 72F6D40607
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552875;
	b=aQ9cpFkAFPRX6209dFraFcoICjFzl5U1omJkujl2nlEEzTfo1/4bFLfkmINHhc/6RJpk
	 Bhnwosl7O7/EwBpbUMLayGhIBASuXlUfYqSVKQelZQ0mx39aossaxJTggpo0RPaRsoMwE
	 oaUrpO4GGr3O7f3EmiAAC8v/nUogYnROJe42ax3Lkk6t7+3u1SfHvtMMqR35Jslx7Gw1E
	 uPNiEJNxMQST6UmlrPlqtxsECBMkBjrGmFcaEsIsrQD3YKaG/oYy0tiRLu+0GTjO7JSry
	 faWVPaVCXAdy6Zi6tfr0ZA7pn1YZ7hJssXVmHuQhVVZfI1fd9EW2t+ANN9hn+uub80Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552875;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jo9vqJPicJzMOu2xVrvKIaPsnXkBtxlBVLgmPHQyEyM=;
	b=ilEBZNry+Z9xxPw8XiDqPNVmKKAWmle5M3wHhT47DUounwdOU25zgR+3kgs48yYzNhsL
	 6HYjgnrWS2gKV6tm4fT6K6qSj3MzKQG8nh9OQSRWON1wAwmlytQKCBV+CT/qMm7HiLUtF
	 BOAA3ICaicO6GdtZnEesmp0/XWmTTygZBmuZGPBuOH69hxs89SmUwQmxuIzl5fE5cHnDr
	 A6zZmq78SMnFEKj8ZsOHdWSwAmYzqUHb95wEybRaWPFrv8hXA8wuZF7euhDdUesVwBk09
	 xenDTQdT3J8gKFnuijNtTxAECF4GvqDNFwYcV4xGZqoQ+ynhLtpje9wnm8l7FY1yjgg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552875;
	bh=jo9vqJPicJzMOu2xVrvKIaPsnXkBtxlBVLgmPHQyEyM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NONRbDGc8AsFgYzdV+vmML7K91TWkvMGZNmSOJWaNJBSbxdy82/jnEcR4wm9dxrUo
	 mRm1EZ2gyWr0dyVHnTEy451hG8kcKura1LaluSLMYXbVqPof89GuVFUSPIfEgTg2Eu
	 IPSMiGjD1bCG9zzS07oK5s79xZ+pL7Xx6JBUREhew3dxH10FDxImdNB7EITJkZsnfM
	 wOqZMMbWuU+3+LxB32V3AFN/N7IeOxOHLswhqMEYW8rAoX46w321Lf9XsDbpYzeUeW
	 22lLZTY01r8vyYeU3kYwfFX+ssQUwPuY7Apo5vCGfPKQ/jndvihdw/bf4gI31xHZjy
	 HSnoQoy9VsThw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F6D40607;
	Sun,  1 Nov 2026 17:07:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 142CF380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0388D80C97
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YI2eih1NSQ2 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3BCFC80D58
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552839;
 b=r3WvMga6RPYie75MiM7Hdr613d/jeL19A/AnrUe8YvRIUXktL+Eqou2LuZ+KOiaoYIAA
 0KQ1JtHicr5hdDs1QgIzlrmlvn+WrhFxda/sLrWVbAkY9xdMw61Ex9mpOgfRDsNx16a0i
 REgHyN1iZB2gNtMaTDOWYayXGblDxq79JZXMZ4K5b3jkz60RHzhol6TUpCJVvY5dDxk1P
 STpRJPnHcrH+vREcKqVWIw4ZgX7CaTkOFPeBTlAauQAutfL89LgJfHpW7oYyLitKm4Hb/
 ONoUrPQZtAqgGQjh5D6MyycrU6RKIiCkYHpBKiuOx13v3SZGg2zE99kTlu/IKFmAJlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552839;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Vtr659ZxhmfuWaxloD32UXIC2O9HmWYmUtjCOTVAa8I=;
 b=qfv8pbs2vzpzwPEmA2/WpvzKZD8Y/B6qgKSR3bb3eAaCBxKL1V4kv97tewvBFJle96f2
 ocHa+7c3fFsjiN0xK1THo/itEuEuw/drL4xyzuFGUEyDA8jRr/wIcfVPDTJqJto+hJeK6
 a4fpgg0ZqYm0ws7LR5R0fJ75ya7j1LxEfzRMLx1PLiYzCSg8zmmGH8lpCrKAXHVONpEnZ
 qZORkkQg8whuUGze3UnnXjK3TIpGYUQdxzP11lee31h4WZhTKusXJ2xVbxYcLnLcr7A5+
 WXs39kjl/yLoCbWeI08/9oNjk8/d3QHodSN2zG8Vgn0Bbx4k/pVhu37D3nzWCEtLvzw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BCFC80D58
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05A0E9D4FC; Sun,  1 Nov 2026 17:05:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9eda01d66e508ef21e0ecce758104a5d3fe87db1
X-Git-Newrev: 3bd1e58f30df6e32a9872bb4b3f526b4c5b6817d
X-Patchwork-Hint: ignore
Message-Id: <20261101170550.05A0E9D4FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wrapt: bump to version 2.5.2
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
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3bd1e58f30df6e32a9872bb4b3f526b4c5b6817d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-wrapt/python-wrapt.hash | 4 ++--
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index 3092a879b2..13296f6425 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  44850a284b765d6e8aa1fe09ce5fdbd9  wrapt-2.5.1.tar.gz
-sha256  f595bb0185aab3e9dc31950c95d914f56ea8278810c3b928f3426e12ed6d27bc  wrapt-2.5.1.tar.gz
+md5  e235838e46cbca0c9ac504555ebcba70  wrapt-2.5.2.tar.gz
+sha256  551cb49e88b3722faad780303833bc4fa70685fb1773270fb98b40d39d9fddbf  wrapt-2.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d4f66854a24dda2f2a5282912aedebe6b18186b86284510a433d78fadcd88e5d  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index 29f8dc12a0..d10a9cb0c2 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 2.5.1
+PYTHON_WRAPT_VERSION = 2.5.2
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/04/22/89e2f3bdae5cb34e0cab0cd86d7172dbf418de4b46c9b17b9c7a560dfa44
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/9c/b0/f752d19e1e83ab8bd64aeccfde32ff086aee3ef08520f7340b69a8d0a4d2
 PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
