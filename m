Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A48606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jmVcfhLY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=AflXyvmO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 755B760721;
	Wed, 28 Oct 2026 22:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfahfMZltZXA; Wed, 28 Oct 2026 22:32:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 93FA660709
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226749;
	b=gvJg62coDAflhkK0fq/iwwhAuRbq+DLeIUzj74TDIq9yH7ZDA511R01wdzDAoXYulEC4
	 JVe19vBK3PX9J+RZMwS9g2R/cZJuJJFZJ+5Of3KmIQg/K+uclkxGFvScYGPZ6ivSKDBE9
	 Lsm1acBSSIyYZDWIP2UmG4MKkVePbbRRGl/9ZIzWlJs9h4DM4FQf95MrOAvuASpCaodDj
	 MPQZy6LTf5Mj5r7ycH3FZQ1suzI55xMgehq5r9w+scaJN9RNSukVU1VCJqP1L5RUmyM5K
	 QwkEjVbEhdTwVw247wzjVlQCQUxBwzhJoaMD28ibaGhSyTUgDMfp5XlN4+sk5Q2bBIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226749;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GeMTD5vN2+I8653VmHzWwrL9Rv4jzi1W3zEt/sHCXDE=;
	b=B5Azw7Qr9TCMf7Rlahif76wQbWe0d9aScGtJRnff3p3k1G8aVsvPoCoWtF7llgVrBryW
	 mhmSSLxhHk0lPVKF/6Ha/InmMcUjKORuzPOiKiU7iu84Uz+N+rap1MmJ7KL9d16FElv8R
	 zyVvJ1QksilRNX9zpmLaqsswN0ipYR8kZOEV8i/GtxLEX+98CUcwjaB6hgbQrQUOuM259
	 CvniA3tSXRLCakynW5nGrhXl2FDTi9Shsb0/rme+GIJQGMJH01Lk5HvGavOzRlMDnalfv
	 rqaOun2MSqsL8oPRiCF2vmk7ov+byrR9tw6fUmq64qaKrZ1VQemvdxpP+F7rNDTYpug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226749;
	bh=GeMTD5vN2+I8653VmHzWwrL9Rv4jzi1W3zEt/sHCXDE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jmVcfhLYixlzjrCJqqmrtRnq7ovxmlPToWu2b6SZnxqJ798b8jKzzEcagmnYcbOTj
	 36zovea06VINVHIkCV1bIjV4+lgfQvV+M820O4hOEO7Ylq7nKBaWZDReds7yZNS5Td
	 gpcV6BS0W5pqCpzFavAaR0MwMoLuIZ5p5PjigBjA0dDB1nyx1hQSCraPPynhtCWqRF
	 Lx6lcKmUAYzBSoi+FhOnmOeUXIUOttdwq6dzzH6746doxOtoyIgq9tTWPMfTqV8NfK
	 puxQsbcWNshbujrYyfFcx9XB+uQMt4ldlBVJiM9X+msomOTAtay6HTyioHWikdcYYx
	 Z4hnSZuA7xlSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93FA660709;
	Wed, 28 Oct 2026 22:32:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFBEB2E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5D6C400B5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BwQJNDFvWA3 for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:32:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2E2FD4004A
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226747;
 b=Z1oDMFBpZqiF2x+oVxfYorWZBbT81S+ElIvpXF0REe7HUX3/6M1674PM1DtcT8Q8U5cF
 WSjhdf5o029Cz490n81wpFzl/28NpQ+kpev/LO147lOl1tmbIifBoju4+SkMQATlpES7T
 RdqMMDwYwHD6BInNC1MUsDbq6NjIdRlDTAxYYK/miDpzgpyeoee/5uvNPNkTzCwb62kJJ
 0J45gySvsxTlmCkKQYi66oSu9HeMxaRr8BswmBhDet28DgXsZFi2lzGYaLV6gOM2HWR98
 G5whEPbvR4x2S3BqbX7oit9Qe4+MuEbEmPyakaCcX5ydyorx2ucwyWAK0UeV1OASHDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226747;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=AUeMt9ZWdEmtExS7v+ohmVp/up3VpyulzGs6xXiSAtI=;
 b=RmiudnqnpiFyohANXzR5fRbA8qsIpWRDEjjevfGQMk/Xsz/IUqnAufnNw1HizGgOS8RQ
 0L9DxKXJ/YeVmNd5WJ6v4JnEeYQMzRZYCztQOullbdVTe7uZ8wnzGvanrZWwkYOt8fj61
 YFnvs6CTqAYOZ3jkqCcffOsOEhTSvTnytJdSb/Vv5tcp76Dd9A0A5r8xWDlTkEwKZcbS6
 Nlf6l/090SrpsJdlmf+IsC4gpOClSSHLPaOY7o/Nrglr1CAK4gIl4ljkXMLQf3qXC1w7p
 /+J8mceFft7eidP5DkVIueIQSXJjLGu+YPHGP/POgupXyMr2c37+yheAMUwwNniHiyQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=AflXyvmO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=AflXyvmO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E2FD4004A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226544;
 bh=AUeMt9ZWdEmtExS7v+ohmVp/up3VpyulzGs6xXiSAtI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=AflXyvmOzEEVjxHFPrWQ1HO/qXthY70K53zxxHfV/w5wK974KlW+7Fopc8XXtQLM/
 G+BC/JfAkFe6Ant9ktRkld2XOqQ4DbHI/yEhgEy5t0Py/MPPBZwHlujLmTtHLXA7rO
 1vS3UpUcDrJXFWrUpHqef3epf/xvaujqVUAfWeOJ8YE1VWe7OYXySMvH9kNASgXCd7
 tWVJCTChQ3EiTG4zNUykaTLx8CBwuDFrem6u3YOcU+H8mkYPZFnmX4mgVp1TFp/nAt
 KikVPRGUXSNsMCikAxjc6aaW0BfMaAPQodNyaOMcl1ot5XgUsZRANR3f+tXOrZc1Fk
 9uz3geWK4abMw==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 AmE6QrLHFxACZjE1pCSYskK4YnhhqBe7iZe+1EBrsl9HTXaJL0pSop3YT3HajdmTiFyQmCMc7W6
 5MEf+Ydbxo4ymzO6BNegh+ZvbjNjJgBzzPUSvD56i5UijydTtCRzvYLiZkuKRL0UzORHGkia4pR
 UMX4zPtSbidlV8UHhtVoVc8nWoLF+ZsGK5Zzo9JgN3PeeH48apKVv7eRDZnkLz6rXnfV1gU2mFB
 80I8qzfYUyHH3t0ay4JBJu8hGCpcJq5ZmmcGeGNTcBT/WWHUMTAD66omyuffdTn5sHfWMI07gE4
 A1YOJqHfbt/28liz7ti3IFpJdgqgkxRotqVPDfMnk4ZPVjqX5XF4hpjPeEXbXmWhpICEOr6k8nG
 1U2u/VL0WanQ5ILkVtczsUxZejWAUHMxfQbtTOtn+RL7ihy0P3mpbAh7ytIfcKADoLgTlkiPhcP
 v6BcLy+Y1yVyI2IGqr1zQWJktdC9OnGIuN/TJlDI4G/MPWFpz7K2+p9Hlcsk4dIQUit+sJdnxYy
 DxIrRKZs5VQUp22/1jnpYzYqFEQ35w96qWX6tSv+5kKmPjTWqlg8ptGlTwFREDFLi8RjeGRB36Y
 nZ27
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9354EA4C6FDF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC8A-000000001Tt-2sH0
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:21 +0100
Message-ID: <20261028222822.490779-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 20/20] package/kodi: empty commit for test-pkg
 config
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

test-pkg config:
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y
BR2_PACKAGE_LIBUDEV_ZERO=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
