Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B9ACA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8FF280E1D;
	Tue,  6 Oct 2026 16:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXwiv5vzAvZD; Tue,  6 Oct 2026 16:31:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EC50180DFD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304287;
	b=PuzSQf7UGjTT34LZ6y+vCUZsVgjoE1dToE3/6hOoe3aLB/wUTPVMN8+IzMMO7OQsyeQ8
	 bb5BwClC7i6qCBOP4N+7tWqxrPqZzP65jtf0KkTb/qKTqlj0n9+jF4hl9Is+UMJGeztp2
	 T9soDYCaE6D93IudHA07Qc9gJ/KmYyNCck4iCAemveplrM5pnhIw+dJdlRAsksLP2juJf
	 TtFbaVrRqhFvqiM8npnwTfxqcR7DH7bBh8bzfk5VPxZ9j4yEKWNQvydcys/dst/s2/hIP
	 ms7V6aWkPGI3XP4mgVfOECOg3U2pV7FdORkJBs4+Iu352gNVOFyY1czSaQlGPSM/HFw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304287;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=42K+AjXjbdRAan+I0i4r+pGnQb0UE/wNngm6Lm0P+1s=;
	b=T6cHCh8YqQICKibEp9AT3rEhNxdDBJ48mwFJz9y+ITZjk612dI23B4JgNRcJ7J7G2kMc
	 Xm8hcywzOTO5NV6CkCVq++8uzu0FcB4zEAoyqeIudHUvinYdKbwj0h8v3LHjkQRAyVele
	 cCr6PNrkv5qn5S5Pdipl0S3ptox1RH3nhVMF/QbU5wqBI2PTgfSL7hCDlcUOBPfoIJ6Gc
	 2gIfpMOUeSEdbPGt2x049A1Bioc7neArjosJR/yCGk9xSmIJP/uIIledZrWQ1mv5bq7Yz
	 q1ipzjPq/Gc/2unGWv2MQRHjGlRzu7GERK5JenwKUh11/yPhTenwa9QAUZWxHlWAw4A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304287;
	bh=42K+AjXjbdRAan+I0i4r+pGnQb0UE/wNngm6Lm0P+1s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZGuBSf09E/q2ALMSIpK6tVQn38wKu26EpPqUCpeRaVptIkK0ICxAXVqZzxKhDIoUq
	 yHJiSEl/Q0oJTUeB42Svx8a7MSdGLDEDmvBT3wc4Vjnh7FXzqmJx1wmu5cfAHA0nbv
	 JCcIB4XNVfylKyOfkAyWxWDUNUXJV3d2Vjr0I/7qV6LdmrlFfBNEJ4Wh74KuNkyBSJ
	 EfZXcfmh6tvZPlE9xj4TeDSLnPF7aw5daI91D6qJRFKj0u5s3UeyF890rJOJeqIuf0
	 gD9fe0pDwC+1z3ZxJIoNnaog0GCfWNao0uiVdVFqmoq6oX8OnjQNN5IOLEVBx9ycgE
	 fy2KyLhgx1jNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC50180DFD;
	Tue,  6 Oct 2026 16:31:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2110341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93DD6606C0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQujpQKjWMlo for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:28:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E9FA5606BF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304133;
 b=kiB10LHSAxk2robply8m+mVpkDRZyy0Sul9GXCy3suf0PreEOx5MGu2BgZJivWfRZB8v
 aW8lRdLBG8YTLVlJuIDfFRKOXKFrlmjJk5AeRPDiSsn3FeOZaXpyE9JKdLXZ/gkJhrXRC
 WJ/U8jcLbKFdabzhf4JR3VgNUG0EuyZlVIrNjNvfC1DHSQModgW9ZB7btb+tpM7qihJUf
 p21K93VEngDZ+U4nKn1DwHZowXHm8h10POwvnAMYkWxoUfnqCF1L9RoJcdTWEfl0CQmJD
 7M1H7yju0PR+PBY6sWqoRC4MBGfUs3doNu8YkLSNmJyyIy31lE69zIOe/9p07B1mMig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304133;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=2gtyKHS0ZUa3TTKBaMqQLsWCtQvgfD13cL6Mqskv0gg=;
 b=SJJMHjm4xGLaPHEFM/jvz3u/wzHpMxREW7evrNoNh01uap37PGhjXUeGDZqn4jxwdb29
 CObd1E55TKSgGO8CusrIB8ue8LkNVTWsyZWDJnFqAvOdJM3/hr/r0udBotny+PpjZhT00
 Cqa+j+X/dLS4mx4qOGbXCNDjb564M25LorBPRrt+hMnVIqywVxPAkCIeQkESGUryoeP12
 5bqjSUyMTMapfeNwl6RDKD8cuVZ6a6CRKYKVNneXCn0rvrHafkw7Ba3eC0FuOITQ+Lnat
 bG90obTtVk0G94YieoWcqsOmTUqZxS0LTM8gQgCZj5+ZzwGOBG4/sW1ueYjZ3AhCPpg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=uDaSvW9N; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=uDaSvW9N
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9FA5606BF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303706;
 bh=2gtyKHS0ZUa3TTKBaMqQLsWCtQvgfD13cL6Mqskv0gg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uDaSvW9NBeLZBgY/gF9NrLJUdpiDIakyHImsBGthKAqzOKv57hb9Dmt40FtHt5HVj
 +ctkYc3IzxWXwwT7muu0+7c0tyoyLA4wxx0ACOtGSsu4hTCQ/TDlCj6v4SrM0Wx2xI
 xXiWqNPnWB5H1P1hZvM1HUNA2GrwNp5JcK0zAeTAynogrDcHPcUP7EKqftvXxhAoPM
 otrHSeuP2J5r0CwqqDGkm5yo+PkphCVqMGWxtfEyLOtWvapua/BpOwDb1J9hLtJ564
 f0MvtV2At4A0vjm4c/E7SxDzlwtabl/b8hg/SMFs5ar/dVuaIYE8VpPB5iSzHJ37Si
 cQBfNMWNZjJDg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 n0J3Wx8iOC6jDChJ1vZzGVjeNsvG0qhJAycJ4bAQsGXrGAj5Kgl6RdQi7rTHg2/IjihUHWx+AiG
 01OWLclwxpcE7NFDlYN/OGv5Nj9azrm26O1BGp2pmvXtO0ly3un/Ns/bZbqsKXMFiXWqAHlGLhm
 QIiGARJzKcTt28mn/DByJAadpbrzVlMqM00+FjAShm9Ci+YX7fTt3Hy3S9knNd3OGVOLtCoRrSK
 joeb3oH8SD1WEKm220XnQt42oEisLmX+ShnT2MD3CCixwcolmnSOL9HQllKkTFmNELkrnQ4nkVV
 cA/NbJmZ7n15MXgn9f/YEEMVNQiHzexDIvnBkg2n3nxPFsd0h75aYYZwZv/DFlvdr1n7J4eZ9Dm
 ANvEOzIE+tiGBuJNfNStimWIy/WSNa07uWcP7qPlxLuKq/RHTqWnss3RylMtXHF6COIol+stxvy
 MqUeViC1MLcQsrHb7q/1zaT+/g3jnmfI4ojIiE3P7+vupi2EnXoKRj1+hmVO/DlqY2HR9SIzCBV
 KjUHeT1zjLjBmSMvqfxtEs1MHG+pVS/zfMMkdATGk35yue+5BiE3dL5Ln8a/CB/O7Bk2UuCOH06
 dRCiTen7wqxOA1s5+4GMzWF/Zd/RwlnkUIJ4qrKx4OsTifk=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EFE87A4C53EB;
 Tue,  6 Oct 2026 18:21:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uh-000000000ir-24zA;
 Tue, 06 Oct 2026 16:21:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:54 +0200
Message-ID: <20261006162106.3439373-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v8 13/84] package/boost: fiber needs exception
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

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index f22f263538..362cd6c95c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -147,6 +147,7 @@ config BR2_PACKAGE_BOOST_FIBER
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  C++11 userland threads library.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
