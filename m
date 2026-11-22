Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0014606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T9GE5gzM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=s61QAYz3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B9A080D15;
	Sun, 22 Nov 2026 22:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTI4L-JyWq67; Sun, 22 Nov 2026 22:13:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AD8B280CDF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385629;
	b=CsOuCd/6Evv89t5PWO/WzQMKa6QLytec/xRUJsHTtXqzTn58CTRxKzRjNOPOLHI0nAH4
	 LYR3nWRGdkEPInCDCOLmLeX2Rx11bmMHiUo7YpDQA798QxteUtX14Wi93N/9GowUAzCuE
	 ne4o+kdOnHDAcJXqHUi7CduIu6yN8UkJn9QlD9xC47z+cxcxfRUYsMyqdkeij6/W/ewAH
	 y0mM3UA8tSqKF3T5WLNhmzkJq/u1s8aXggYppbE4D0ghY17bJ2Vv2avTDVN/Pm/IXgDls
	 fsN1SbuhE/BrihcjZlPnW++T/di4LtFCSvLcSxydlGksSeqq8maqh66N5i+5IlB53EA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385629;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XjySgq7xCQzxCJ1xFTp6LE1JwNuSw5ZZX9rYPAMPeiE=;
	b=Ew2gG8rzddmuQoohhVquBZs2s/UIMTqOulesOy/asrheWzoijzyRDs4GaXcxoz9Ge9m5
	 58rLj3gV3IpLA5zP4eCfs/ojYPt0SUyzA2PHTpGCFK8C6/xSWrPXwMzeYoCINNlxVPpaO
	 zBPQlGzfcbeH0UnN9tXnT3j5TFkzaMGKOO0vjnq76vL8zzeY7kEEc6iGRMbcFxBFQsPbf
	 AVdFYJq/A8PPWb24sAujk25JHLaenS/5NAqKpkHUrPjP07BiMMnutuveT74WNsKGJum7o
	 pkJgI35n6kTtDZce1LMHPuPU5gwb1x4OptbXsXMQNiuAJ29tOaKjquPyton6NnT0Y9Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385629;
	bh=XjySgq7xCQzxCJ1xFTp6LE1JwNuSw5ZZX9rYPAMPeiE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=T9GE5gzMjs5XtTUDB+gLzhTFCmkXN4QfqzS5lTdKomvItadF5slFIZ6ankAzJXUyo
	 fSW/gQTwhnyVxX83msfs14RjbRaMV8XR3Uscux7349/s2AkOdKAEGLtNpoC4T7r5nA
	 t8FkQdQoAQ68XvlB7zqQ2tNDn5m3PnQaZOnIL8E9bEfL72tyWEfJZbvwBmwDJCQnUD
	 uaFl5zlxb26ZsTvKurMy/LgVsF2M+GaUXr1yh2AzubtzZdjFVw/rrTQX7zeSZKb8Ko
	 e3k4xrrXg6yfSkIE+KsSFTFPOCM6SmRFMfd+06QIeB9Z964qIavXYohyAGlBMK7c7u
	 hRV/WbekZn7jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD8B280CDF;
	Sun, 22 Nov 2026 22:13:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 300CC310
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21B6E405EE
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCwQ4673hViw for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:13:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 66578405ED
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=s61QAYz3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66578405ED
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385464;
 bh=2N80v79Mmff0f2ss4tYrg++BT7mrn/+Du1L5v2wwivU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=s61QAYz3ea9tvCuY+GIY4cXLa7NKsC5KPfx/SWAipGJDah0kaFz8WCOyi9EZ1x7On
 EDSVMOS/Abch+FErNIZco9gFFRBg8d1VSuP9dGQF3JvfWrKx7/bF1h8lz9tQYzv7cQ
 8+JlJefDZ5KcoAXXkCHtatg6Zjg6GGZo2GmRQT1O3iB3ghGL/JKLMk4lO2sS82i+Pt
 AA0tAL3UpVC2vuXGgwYY3EbVz7DkyVR4qKLtEEDo26c+QBbkWv/uXe7vHFq7upjPrd
 YHU66Tp52n0k4voyFM9U8/6ubKs0R4nH+p/xZHlHhLq1NRn5Bi1EAX79+MSah9omIQ
 we1ZV004oT+Uw==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 yl0Jge6gLm9LEobq6o87/A/D9chJLeM6uAXtdulq1bsJ/faFhUD1EC7jSkvLnUjrr5L+r6aGKQV
 swbdRyddvyiQRThIEp/8aPHYgxW3xVQ8Me1iHOapYL7LfuCaUxHOteGoTEjxBNDvoGtg8KQoLny
 Fpq+ol4YlDqYNGf3bYwQkp60diKKE+EQG4rBycRZ+KGzur5+3EJOtaNWYK6N9jjSSR7lfI6Ynr2
 msWOs1MP4WyAZ1rQU4yg6W0j+YnL6EdRFU7DUcewCOVRmOopBA2iIwxZAb4DRSYRS4iQcM4QDoV
 r4b8CZ0QQ0Y2EwwaN4na4TaEOZ32xVFt3hGn1A8DL21RfwA4cuB0d9LRwfUGZDyzIrvhLoL9oh0
 uEiDYdz3mCcvrzzWQipKAr6pnyZjYrLF9u6ydJrP+4y0zJMIsfR3dEc81ZBPbdzjcHmIQ4mLm4/
 SES7wAj3CwF2XfdD9KV6ZRpjfZNuZX2eJEz7NRkTNtLAJL3IEJXyqSrYvK46g2UB7cx0lG5uikm
 drqnWlcQbmtyLyDaPXd9L7BDsP4q3IQllKQQOE5M446gIa4qtoCr+hL69GxApeNZirYvggc52Lt
 2FzRgcxpyQdC+/c0tJd8Ue6ZCaaxN6skp/gh2XK+R/kSezA=
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7B672A4C4E9F;
 Sun, 22 Nov 2026 23:11:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlK-0000000014Y-0ZYq;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:10:10 +0100
Message-ID: <20261122221014.3945599-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 17/20] package/boost: system: update description
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michael Nosthoff <buildroot@heine.tech>

After removing the stub library in 1.89 a CMake config
was added in 1.91 to not break 3rd party packages requiring.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index e5cb0bf3fe..d8656b5387 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -337,8 +337,8 @@ config BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Extensible Error Reporting.
 
-	  This library is now header only. Building a stub library
-	  is still supported for backward compatibility.
+	  This library is header only. Enabling this option will
+	  install a CMake config file for backward compatibility.
 
 config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
