Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666D5C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3903660BD9;
	Sun, 20 Sep 2026 14:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJoPQGRCyPsz; Sun, 20 Sep 2026 14:55:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4FAA660BBD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916116;
	b=db7jUalUOpTr503HTuy1WXaiflwNiK6wUntnJRrrOslatvLBs73TIgQAPQkkfW8E/B7V
	 hXaXRC8dqof33okBqkuytijR0oyNWMG4JiVoOnWbl/xOD1jThz7dhGHFeJ1+KowmxensD
	 bqVhObEeiz+bRNodZH3RAZ9ZLiLgnTzxRGoK5Jw30aGCvgnJp7feNLxmY2eA5uHRIwJMk
	 u/xUhr9ro/AZs+VMYEnJlU9FkvecE5moT9qPGCvh82HdSvxfiCnxx20wJoQUZTlUn/X8J
	 3cBaCSA1iOUer1rkPHTt0fAjVX1z176uW4dCcdiXBsfH26nWmmQCn4lcCg6HO2y4vsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916116;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SDafXcqSBs1sKF3wzGhMYTTLZ1VbXwf6FVwEomLpfEQ=;
	b=K04JsVl6A6WzjyH96cc6jXGuyN32WUZWsgPnOAQwchnpSCNaknhrJ4R/mRnS+ZjW9HyM
	 Uo+6ThJyo6kCLBQI2aAJDaS7vK7d/h0V1bE/BEyKAAlZcjrbo96TaPBX+f4aeMbQKCYEy
	 Edb4iBh6gsk7oXBXRTjl952j184ken30wl//1tleFq0SRwSXEW4TbLc4QXCRk8WIme1Lu
	 iD6lT8oyYCK1f6X3fzluy40WuBC/nQ+Pih44TIDDWAYgS0PWoDmwqxWZ+6ZlMqDhZhHuC
	 WPaft4rS7qWCXfbwAAaHg6tU56w/T3bgx3ezIGK44a515rXaWkKxFaj9RuxBYhtdzKw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916116;
	bh=SDafXcqSBs1sKF3wzGhMYTTLZ1VbXwf6FVwEomLpfEQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yp+yEzih2IBZZGpzkaKFKptv6QtuIfSkdnQiOcI5KJ785fi71cQiruluqMVl9mMxi
	 cKRxjKOCAk9MUggk8/EKMD9aAoi4cGgxbt2IrraNNQ1X7pSeU8bj4HyVlK0nVGrxC1
	 z3Rw5cLu438LLis4AjpSnFk8DcrM6QdoA4vEtjnqShoQ2di+bQvcZVmT5hUYWo0QwM
	 il5QUeoTGnHdanp5uWPLb7JRwAJJFyY4p18ppumtKtJnZSIRpYZxZkuamrL+motHK3
	 J93jdPwfsI61mk8ihd9igZ/vsDu/1mTI6R/SOZOiRQPdNF5TwNbm66kgA47UiKTw5W
	 VP6FcL3NwyOeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FAA660BBD;
	Sun, 20 Sep 2026 14:55:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1499637A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEA7781006
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnDHfMEKxNdi for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:55:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1148880F9F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916114;
 b=pXnioywlZIREq0WyVRk3gJ0+lXvhkis/gaU7JdoBIZErTDuPLGIljqbSRtH9FU+EJf+/
 tel+AbmPOZ4+L/ARcKFR3Zv897cpaOhSffkXvWhxZHEwMmH3YNkO+WlIrPgHEopGghyZ2
 HZj1XG90YIcDdp+Vgje584ByWM/5TmuzhsAVN3LloyYvrS4Eq9a0kfixmnKyqMp+To8Rv
 PYl841hFFLvpS4t8YJPwZdXaRcohJboRL9EJmC0MaAoK3vHmaBtn8cbl5U0MZrLuST4hv
 abnHX5ti9WYklnt4hh2wt/KuYBhEuRCujX72Sws9eBT025o3qWGpjPQgc9H3owBIt/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916114;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GxphCb1tHQ53eiKqnudJcTpj7G3TTXTw5v8NRov7i10=;
 b=NDNYBvrE7lZjB9X5h8LFR7St8Ka3uggtgj3SL2tYjVWViFggcd0KPAPZZtYuhuUeOKvX
 k8yes4Q2IOXAWXpnoJo/BsZW9OLqLUEHRocVL40UtE6kmyO7KRKkOEiP26sKSzJXm3Xot
 KKzluF0qK5LC2/r8PJHvCc2nlicxQj1o4aPidliwuBXsqGp/ZPJXsWBUsPeU5o8DWBNWg
 hpW1BiPsjMGanUDgUzzFW30tuCs8Wd+sBPMJWDN1pdU3WBhnlVLHLv0CfXEDgdEXsvkDm
 e6nSf0ui2oXuRJiwRbS9upuAeGRjQhr7bn517LQLmFqEyRcEiUBK/bZxGPnhX74OXZg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=r6PvaLim; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=r6PvaLim
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1148880F9F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915505;
 bh=GxphCb1tHQ53eiKqnudJcTpj7G3TTXTw5v8NRov7i10=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=r6PvaLimghvJT4zyB+5dFJE+4myDaGhlkOGP3BVneQUIfknPDeHUQauvLyDgrC3zs
 /bZ9IzO7rItVPuaFF8eeaGjyGTbruOF+l4WnKMRmzuP5oaS/ws9CxxugYGbsl44wHt
 zgKwd0CQ2rnNEOHFz07PC9evEvtrwqirItrA4R1vexvy59JB+v4z1HE4pOIs+c+fnU
 ojjLEHR7Xk44VhTG0OCI2z1d4EaC0n0AWUImghSh6S10o3fwwXQHD9XVa3wzAnqrdh
 bZ9GHBYyXAniXbkDaSZQEZLySCbOTz9a40pvKiNosOI9ZHxxmj22aVMTHRQWWOrtZ0
 2FLEUNTKTKACQ==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:DGtZ41U41ZrsvO+6J04YSQTm+LG5SDLGKqyXrcpn9y9qvvGBDANvIb8HyRGvZIM9LxZsztWm3jVjaAah+XspknixuYl+sWLTnlbuVXAeeNqyU0enT2lBEmZ4F90IkHa8EKgz68IYzgbzAGOoc1IHwxoybFUnfIKmNP5jgkZBzgn9qfgby0hM4PHYlAh3Zhgo+hqq4s3JIZ2ufEHsnZWRuT4duMray7RAPAX829t2doN63bL7Aq29hzM29TDe4zL77cOEv4s0vchEojvLmxmCd+Zx++nN0WxNvX6ydxKrTD4I3LgJWMz2CGQH8bPcPnlrkpDICvBFt1tNWcPBCD0MEq9mD+pvPS9tw6Ik+M14lGWND2Nz+Q181BijOmO4zWF3yF57qlOyYxdsuogtSQ+3zBfMhr8d/ns6tqU3uaXcyEIFsPEhiAU7YF8qIwKjztW6/bu/i56hOCySvwnhnOuPXYYA4PwnHs95xH94FfjiTKYeoyO/6hK07UBYq2y13+/8Q6cjNAOPcZ3aTR0EaMb7ez06UslhAsFd/pOQ36b/iCvEPbHcBri3Ca0bpair7dbDmBfnBkwAGVrZ+fwNQCGxtUFn94tcAjs=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 53203A4C48A9
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imm-000000000hB-31U0
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:15 +0200
Message-ID: <20260920144428.3009612-55-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v4 54/66] package/sofia-sip: Fix build with
 OpenSSL 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...001-Fix-build-error-with-OpenSSL-4.0.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch

diff --git a/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..4e1b2ad87d
--- /dev/null
+++ b/package/sofia-sip/0001-Fix-build-error-with-OpenSSL-4.0.patch
@@ -0,0 +1,42 @@
+From b21b4cc7d0dd4c3eae1a98a3fa38f4cdb2e5a385 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Fri, 17 Jul 2026 16:41:11 +0200
+Subject: [PATCH] Fix build error with OpenSSL 4.0
+
+Upstream: https://github.com/freeswitch/sofia-sip/pull/337
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libsofia-sip-ua/stun/stun.c | 2 +-
+ m4/sac-openssl.m4           | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsofia-sip-ua/stun/stun.c b/libsofia-sip-ua/stun/stun.c
+index 22ca7c7..aa4b574 100644
+--- a/libsofia-sip-ua/stun/stun.c
++++ b/libsofia-sip-ua/stun/stun.c
+@@ -1368,7 +1368,7 @@ int stun_tls_callback(su_root_magic_t *m, su_wait_t *w, su_wakeup_arg_t *arg)
+     /* openssl initiation */
+     SSLeay_add_ssl_algorithms();
+     SSL_load_error_strings();
+-    ctx = SSL_CTX_new(TLSv1_client_method());
++    ctx = SSL_CTX_new(TLS_client_method());
+     self->sh_ctx = ctx;
+ 
+     if (ctx == NULL) {
+diff --git a/m4/sac-openssl.m4 b/m4/sac-openssl.m4
+index 289d3e1..76ba9f2 100644
+--- a/m4/sac-openssl.m4
++++ b/m4/sac-openssl.m4
+@@ -30,7 +30,7 @@ else
+       	HAVE_OPENSSL=0
+       	AC_MSG_WARN(OpenSSL crypto library was not found))
+ 
+-      AC_CHECK_LIB(ssl, TLSv1_method,,
++      AC_CHECK_LIB(ssl, TLS_method,,
+       	HAVE_TLS=0
+       	AC_MSG_WARN(OpenSSL protocol library was not found))
+      ],[AC_MSG_WARN(OpenSSL include files were not found)],[#include <openssl/safestack.h>])
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
