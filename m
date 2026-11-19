Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C3A606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 07:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=s6l/apJv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=bSssWhHB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 681AD8127F;
	Thu, 19 Nov 2026 07:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTAfPmn-Xiut; Thu, 19 Nov 2026 07:59:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CA5DC8108A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795075195;
	b=M3pR87uhkQZzqKARLKGRsBpnGaEP2eSr7n+96R8MTW46owqAXQPmxfZTAyR5pLzsn+ek
	 pZY2K2X49LfBCwqsPJHuU34wxnQFAjnq+9wXIp8pL73xzEirgeHsI2t0oj0favSP07MBc
	 UBWt1WjVdjW0uv/dGrZo986iG+0qgZIF5aVLMxgiGLmxGwACkv8IVU8RrpWen6PAnPFA4
	 Ki2VsDDLAcnlfmuA64rBgxy+DojOPmu69Dn6AKc/8oS2iOj6RslB1mkayYyTNPaZnfY/X
	 BMtPmvC1iy6XtCAKUUu5WrpI87Jex14wVPg+aPaeNEfe0FzjDw2ELfUM2tKKnCnB5rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795075195;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qXBlNIfQ5qBBYgdu8+KMrjTnWM6V+RqNPUDNiy8ZULo=;
	b=Wh9p96b7JoUKHVnJMIy8UE3SZx9RAHXjAMNMdqULBBEpBA2w86htQeKuYhus+RAUAbd7
	 Ii7tKqJ7+/LqLAmw/s6nHMTslG3lOy9+IhvqtIbBv2APFbVEJcKW8tFyFvMhbdX/k7vtR
	 SdJ6NwKdk4Aw9cm0qVcZPHLa42cE9ce2K9Jm3AzEzAKf1ABIfzRgp6fWxXmBtzYNAu8p/
	 oRFbRO5jqVaA0e0mcY/evXhAuZoZgQuMpcxg3Md9SVGnpUqYJg+3Pq1mJnJSEmgdUUvIT
	 odCCdH1AMylBOx3BL/JPUwrNThCLT2wwTPFUgMCho+9sXUv6W8e2+Qh5D8z4MAqb/6Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795075195;
	bh=qXBlNIfQ5qBBYgdu8+KMrjTnWM6V+RqNPUDNiy8ZULo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=s6l/apJvbFdbfQjbrxIxzo6BFYWpFFAPQqkRscipomlCkF63dbplAzgncL6IUWtq1
	 dAxbIaoJhY7jUFu3ixVmadBiTNLTfvO/WswtrYvv4XdV1quwwKgL7/4/0NIm40fhjb
	 f5bl3dwxDmOAcM0TAY/HSUY+HjX7dQYncLqLHsu70QbEv4skcbcAS6IUhiGB3QMUEn
	 50jhYUfkilCUf6/4d+NWzkitZWZrXkpnBfUzkXJIME01Qsi8nEJICbTePHoWfrUYF5
	 HgccNrQRgVvLLIRzYK/7zkpUumck2+wKCY1LPBSP8Pwbyx6FK+y8nwmRaQlh9LiKHR
	 N/daf1mGmYJKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA5DC8108A;
	Thu, 19 Nov 2026 07:59:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48DE3E4D
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 07:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39ECD60A94
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 07:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWbN4gG1Rl_0 for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 07:59:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5B3B86069B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bSssWhHB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B3B86069B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795075188;
 bh=dyFl6hWjrR77BLCm+pPJ2vYzox/vbEpcwLATAVnUc4E=;
 h=From:To:Cc:Subject:Date:From;
 b=bSssWhHBQUri09u+82YWLT4XK8kOBDhQ8dsPzSTG4Jg3fOLiXdCLY/i/eA0W0+B6K
 LKbzv/MhnPsMFK9fXRfbLuXwCZx2Xd+N8eiVD22OGHtQq8g4FmbxUjiG1c/2qiDwak
 OiYpoWMP3/fcg5wfWhcc1MbsJaFZkQksS6tbcEUWdziA/cxqacUkSGyQuLEEZ/Q80M
 4i3MT1HRGTotgXNNgiuDucbCeFuNDDZ7UlxX0DjrAuh0vs1E69sOIlJ3kaShWws/zp
 LmkGBBgz36etc6Sz0eW79yKb3Dc8AIvEUXlkeKzp3xuKS6Sj9fQ7tt/h8DvvyZW7hw
 df3juZPM7xOiw==
X-KAS-Sym: v3:f51bdf72230551df:h0k9u6v3FmTPHTQqPKkQgaYIoty98XJ4gX3t4z5g+0hNU
 trNBsNRhIO6QSTu4xZqGE9tCzysnRnc5GQUKbhoVdlM9KDYKrn5/vh4CEYNBunsCNerGc/A8AAp
 /KdxqXrYmwirQM45uqSVaQRJXCajZH77ULBIMgDfGQx1rTp+1lWUnumZk1ax1bjxiRQJ43IgcUe
 Bnd7pmXOaKR87s/wat5lshYmBw+fCydGo6/JBRfuGVZy52C2g0/LRgGfQkRcpKGImqXr2lQsVa7
 x/kaAMRqRUUO0L0IQZ8qqAs+5eB7CMI2cwHl2+V3FAr6tFdveyFaBLIKaVXvCGT9PoA2dgfg==:
 Yp6XDg5GwEfLt3rL0Kg6Ao8UIxVuRWO9Bj4RBClf9Pa1oNptCukGWF9R6B93uiwJh+vBRZCxz4n
 y148j59iIB0/WvkN27qrH4f4In0wGRf6pbLauSP94AjZDl1XU2lSWYbp+k+N4U9VIpXQDggg32I
 KPv6+8pAxa+/wc/Pen22PVxCYKhv04DsutNel5HFWYVTcB/co3LFW57RUJBZL4p8VVeKe1T3HsR
 Ey/AKQdRf5JzIjTC07TvXvcRNZ3kH6W/WLhw165DbVKRTRNxQpwR8jypA3Qm0rLWfiz3yc8xBe7
 jUQJmefubhSo9hoLGi8CLnn/sdLOTml4hp757fNDMNAaudIE4Qri+U3m1SmVrOu0JJ7yh110TYL
 WgYqmGV43FNeeJdHIFClWOrwIOrXhx3iELzgQI5Ml6t3BYS3esACgbD98mhwekgftZptbqRhTAC
 Z8Xaskc02Pw0ywCoBmVlhFBZe6Ik17Xq/dWZE7I++CzIOsG2jn21CH4R7dyU0eJpj/09yfpo2/5
 jekfZWMMWhElKFwp7g50Gywmsodw3jTjfBh53B92jIhJrjOKsMffjj54i+pe2Bsh+1CkRYbH6Bc
 De00Wgy99CtC4fiCtVGvRDbdMXfog4TMfhQS0GsSqMUSyg==
Received: from fli4l.lan.fli4l (p54a1b778.dip0.t-ipconnect.de [84.161.183.120])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C8F5EA4C4E81;
 Thu, 19 Nov 2026 08:59:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34120)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xTx3c-000000005Qr-367O;
 Thu, 19 Nov 2026 07:59:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 08:59:48 +0100
Message-ID: <20261119075948.672535-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/nftables: does not need wchar
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joachim Wiberg <troglobit@gmail.com>
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

Buildroot commit d01461f3365aff8bffae9ee537716b86394bfcf3 added the
package with a dependency on wchar in 2014.

Buildroot commit 5e3b150cc44d2fa6fee583af40118d44d3e2f52c added the
dependency to nftables to the docker-engine package without adding the
wchar dependency to docker-engine. This causes build errors:

Makefile:586: *** libnftnl is in the dependency chain of nftables that
 has added it to its _DEPENDENCIES variable without selecting it or
 depending on it from Config.in.  Stop.

As it turned out the wchar dependency is not needed so we remove it from
nftables to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/12e/12eb8e8e6f91d4b8498b1d22a5a50da751d8df72/

A backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d446443f17807b82a88504dd2aa10a0b4e0356a7

Run-time tests passed:
https://gitlab.com/bkuhls/buildroot/-/pipelines/3087719359

Run-time tests by the Gitlab pipelines passed on the 2025.02.x branch:
https://gitlab.com/bkuhls/buildroot/-/pipelines/3087796804

No, I did not try to check 12 years of upstream development to find out
whether the wchar dependency was ever needed or since when it is not
needed anymore ;)

 package/firewalld/Config.in | 2 +-
 package/nftables/Config.in  | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
index 6e460910cf..40c1b79711 100644
--- a/package/firewalld/Config.in
+++ b/package/firewalld/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_FIREWALLD
 	bool "firewalld"
 	depends on BR2_USE_MMU # gobject-introspection, python3, python-gobject
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on BR2_USE_WCHAR # glib2, dbus-python, nftables, python3
+	depends on BR2_USE_WCHAR # glib2, dbus-python, python3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python, python3
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index 514682ec48..c1abb04fb3 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_NFTABLES
 	bool "nftables"
-	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNFTNL
@@ -23,5 +22,5 @@ config BR2_PACKAGE_NFTABLES_JSON
 
 endif
 
-comment "nftables needs a toolchain w/ wchar, headers >= 3.12"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+comment "nftables needs a toolchain w/ headers >= 3.12"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
