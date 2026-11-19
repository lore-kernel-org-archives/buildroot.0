Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E729606A32C
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 08:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cHWpkBBm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=HUUus74W
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53BCC810A2;
	Thu, 19 Nov 2026 08:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XlUBh0k6vdB; Thu, 19 Nov 2026 08:33:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EF2B3810B8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795077223;
	b=U9LzsasotCGZJ5sBOOW0/GBFOsxuMU5AOtDugfAe+7ReSVqmwlc+HtoeVbJSk+rQouNO
	 YblTF4pqcuBzrqpWLSXfRUr6OtCY+lJHZ6aVkHgTnM46xahNaX6GEFy/0taxU8wqzTXDg
	 IeH+2ak6Ci7Awi1m1NRYu14YHnuUrZuHrvTdBRpUE5sEoJQkrEPbSZ6edMoD3oBrrvrav
	 ja6f7G9JBPApGHjU/pa2QapdRvpWaI4WZkz+E1kR+8/iIxCy0F7ZfroslShM+wWxtXz0T
	 pzZZTkNYL8+p28K6qkFe2Co/QucT7B0w/kkP3aaAarGZUr1w3iGw6AfH5cQrhn0INuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795077223;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KF0QIXRsd/nT+elghOliNziP9G77T7GmWqQJqH8B4go=;
	b=ZDDq1AQSpBiZxlLXVGa1gY2JlOZUxogmEKKUUuOOV8g0MBBfhU05KS8X4Di6e5rfGy3k
	 hxIxEovVizuPibiJWjGV9TaCyo4rxdsPXblN5oIjK3LhQP357CWrj1+Vb/2/iS+59J02D
	 rKfaglY1OWN6W844zeDp+7gDA81tHQhsWuo/6MC9WrxxWaGpOkzNWFpn26BU99h99P9mM
	 gR3bL0FLepWEOWBjrTstmheJARUWeX7JG6wN36Cw/b4B8fOO9JmLTITy3cfDWub6+6Ec7
	 4v+VF67KRVbMG/fhnys6xdUvO2KoFNpSrAmS+UEnSOyGoz7kb5JvIXuPbA9pPmAJIpA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795077223;
	bh=KF0QIXRsd/nT+elghOliNziP9G77T7GmWqQJqH8B4go=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cHWpkBBmMvwmCVDKjpGtQuW9aocpmiWv8xLPyaz0x2NCR2d562sp8QE6ZjuLkwLTl
	 lzerSbYzzqQuOKvE0fcadVdFA2y7mzkVOyZ7L8mIeeOFW5nP7tbcuvpdywlZRSPpgL
	 YB8GSng1PcqsSsV1Muu8Nr3Vp2q6rSLKNCT1GZ1z6c46B6qyCGcmBPoYFnwVccU2kO
	 UmwaddwfDSbiThFAuCbjZjOz9CNl6s14tVFGQKZ1wdezzXFNjA78c51wzap/Qq89Om
	 VMEvNah5uf/YmUC1AaLP8Z3uedOqirf/IF7kq/hZZRmgKmucpSSFlax8U87D6OEL9R
	 sngElqAX1mysg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF2B3810B8;
	Thu, 19 Nov 2026 08:33:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 054A579D
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 08:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB321400AF
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 08:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8JRXM4b0JuY for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 08:33:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A90BB40072
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=HUUus74W
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A90BB40072
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 08:33:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=HUUus74WyIpz2NN2jLryhjSXK2MIzsj9Eqyl2z8YpytYjTNoh87t1Eb84Le3SrOEr9JZCkUYnmGqrOB2aQjwxkChmdQldShxFPdFe9dvzCecA6ceJ1H5kit1WFQrUnDWi3Dce4rFPoNlFmVc8sJsMAU9xfNMccCPj/Lq6gS0FFGBounEUOH25Uv4Gz3oop6t6LDlspqnLgIegYRtkKD9Jz2btqRAQIQp7ympc2H5wz1tmUzWno5R9sVydhW3ezJ+OZzuyJZYxoLJw7Toe75701Fak9Pz6A/rGMRtj46iFXMpImT0dHZ1SndQmevCmABRpQDDNz0AFhwEI+PAjCDYJg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=y6OlLci75r4hMmcvehJtI1ThCW5rYPxAOMuwudpMxnU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -824664412; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Nov 2026 08:33:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xTxaG-00000000onc-28mb;
 Thu, 19 Nov 2026 09:33:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 09:33:29 +0100
Message-ID: <20261119083331.195248-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/haproxy: security bump to version 3.4.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following vulnerabilities:

CVE-2026-110353: HAProxy 3.2 before 3.4.6 allows a remote unauthenticated
attacker to cause a denial of service (worker-thread CPU exhaustion) via a
truncated HTTP/2 PING frame

CVE-2026-110354: HAProxy 3 before 3.4.6 allows a remote unauthenticated
attacker to cause a denial of service (persistent worker-thread CPU
exhaustion) via an HTTP/1.1 chunked request.

In addition to a number of bugfixes. Release notes:

3.4.5: https://www.mail-archive.com/haproxy@formilux.org/msg47506.html
3.4.6: https://www.mail-archive.com/haproxy@formilux.org/msg47531.html
3.4.7: https://www.mail-archive.com/haproxy@formilux.org/msg47598.html
3.4.8: https://www.mail-archive.com/haproxy@formilux.org/msg47800.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 9f3a08c500..fd0c4ce4d3 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/3.4/src/haproxy-3.4.4.tar.gz.sha256
-sha256  b0c5053c4d46840ecdee3925736fe9a3de6472559b43c69183d70e593d9133df  haproxy-3.4.4.tar.gz
+# From: http://www.haproxy.org/download/3.4/src/haproxy-3.4.8.tar.gz.sha256
+sha256  024bd521a6cbbe32b426853147e6bbd6a89b107c5a34144846193fee5b7c6ed1  haproxy-3.4.8.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index de2df549b1..fa24515740 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 3.4
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).4
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).8
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
