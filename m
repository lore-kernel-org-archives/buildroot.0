Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7096CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BE0E8102A;
	Tue, 29 Sep 2026 18:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zaGKgNYNkAjs; Tue, 29 Sep 2026 18:40:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9351481026
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707245;
	b=gge6++A9lZVR2dyzjRg8Jrjz/yD4JMfH4MIYW6cixJxjWEvUNCAFhs+rpJyj0szmS3Km
	 ristteHFaGWuZdpkw+bB4gCzZm6NjAnXGC9aRcuckTGY84av5oSvpeEPYNJ0HrBLv+9KH
	 sceJQp7kOmtvgK6+WKNPuXcnrxtD1ihBXXXq8WDCxXNJwSyfdCZPn88NrP7J9GpurKACh
	 7H4FN8yX23zrUH8crGdNfBpgV+VUo548XTl1u/zs9UUE62p480VnGhM5auSYSt4YZqBZ/
	 fotS+Bb6CPe6++2eBHtHiAfFamH/JUey+HIE5NOWaX+64lgPx/bC/jGWuBl0zZEGZog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707245;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RLFhJOmcqcoE3Wg439D1qEaAFU8gzV+WaHooO+re0r0=;
	b=Jz1NIzh7iFZl4T6zbVRtEj18MhLYvH5yiZrlsvHxkO+uDlLhWs2kqxcgyGXQn9jgjkht
	 Tti82SAWc04CyIf4Gipyy27E/WGClfzmIf+xOOhqP0mRqAMRMrzS8MLEnDHNsLK1lfz6c
	 POWnaUqFuOkNkUY0dLO0ku90KFXP2ufzrcgUGRuR70YdRnpiLPLz2gaXQU4zn/bP3rDYY
	 lBCbl4RmxwdoP8GCTSAldY9RtPinB5e0PlgHyyvOMz/O3SKFdEwSAIK8CDu2abvoK10JY
	 HadL+Ya7X9YPCINHVTaZ/PABqaNEPSPlBWfL2WymZ0JztchqFUMATP7YZ96t0B2txLw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707245;
	bh=RLFhJOmcqcoE3Wg439D1qEaAFU8gzV+WaHooO+re0r0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PcUFNcbLJrBW62rD6vd+bxdHUHys+tZICtcEeCb8gR7uL+KPeQhVARlYYYAVS1zH4
	 nPbwpNhtp46P4qwJmA/k9qX0hj4vghj/5VZRRgb+p5hRbqDQXzlV606r5OfWBWpP/j
	 wZR06KfvcgX3nusr3NcK19Ejy09ciS9eGdn62BFhzEKbmDxAidJVTuBDO54+842DNE
	 vmKLKHegrEzVW+p3YHXFN4XyBEqY6qqOzQWuRHa8SoPbgEqrf3vH1S0oNfyWfV4rrG
	 PBfwGenY0p9hNCFJRod48FOxBRncukG5yPnKTLIGnj9HVTzGrdxDzWh25vh3d8VaSm
	 vvIoIkdv9zLDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9351481026;
	Tue, 29 Sep 2026 18:40:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58DE414C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EE08607FE
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WasvTA82nKJo for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:40:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 955BF607F2
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707243;
 b=qE6TBbR5BOsKiNQ7/lCtqAgxQziMX5KXk3E8v7blSzkEeTkPpy5ZIE6Mxu8GlR3cCkHK
 +Q+9oS9gzM+3hAv8lGpI43bLBHTclq7I9X9z+DXIQh8k0IjcjlyP6STm1b+2tBemVp+ge
 sNW9cUTiOJpwfhVz1WMcAbFwqA06qMJa/Zpk42x9928JOuPwXhJ6h7oPicyqh8WmW4u7W
 I22aFDRCZtNVqHWFlMDRJ4hG8D1EDKSVI6gKDmi0YD/T9MIYRqVJ26gXvZuTMUKaHBCUa
 DaP+Lg00gHJonT3KcQkAwNPyz6GAsi/RUVsG1l5Fl12C/vanz9nfBJ1aOX2+7Bme56w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707243;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=T1ptbVO29J9Gmr1+gMoaLfQbkn9ZtEElwjROnVpfgzo=;
 b=r2BoPz3mapENv2orR03P7SMbdJMZJwoSXbo0+k+NlPOF7oPWb5q2neV8O9DESd42fnM/
 1Gqkg9QzYTXeDRkfm9//eZsJfSbK+pptQpmThWSP5ERW+DcMtOePFNgEZn4pLmT2NnbzX
 93xERHMlqbacLvOHysujcGPBtYINpNMh9Gz4VaupUZO3lugaMjSVoaOZys0i6LTDUcT6r
 WhhmYiuBpCPdjvKKLhW92H6FWq+R4FLhcAMgIa0qu9NHAwjLiUMJxsz3XOnshoHvLZA8Y
 kPMxMSJY8z7p4UoLVGA/SDGseh0qJRQ/tVp+QvyTWK8oG0I9l1aRl8H/Vy+XT8ayglw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QlYYQH1X; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QlYYQH1X
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 955BF607F2
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707024;
 bh=T1ptbVO29J9Gmr1+gMoaLfQbkn9ZtEElwjROnVpfgzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QlYYQH1X6GDDpmy59uGzLuNI3RFEKkV9l3By6UDTM2Xmj9Qc8rzSAdWJrJot/zA4H
 qaPGfVCDGzaxUySrN5ofQGcwxO7aY6SaH+1YqRLEBpcIH2u2wYBeqctDLOVibZwZ0W
 euoiZstuYS2q75/jYnM332O3OfVzw5q1wr1S6SZRZoG0mICY1Vz/L8bZErWi9HR5T7
 wQu6uFY/sL+hk3RehZI7rlytQVwyLcI3jHt6qHysrM0JEn+dlTuMmkKfBUvS8c8GA9
 Po0E8bCA0G7gu7wucbLPsD4uWh6UjyVbO5ruID5txLESCeqZJxZSF9BOGTrPVEx3NZ
 V9CSc1t+JoDSQ==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 vp5ad63ooZbIr5+LW88GdaRcG9jm22fRm156NUgr5diT/wmo0vQOhlpyNHO3O1VnwCIQZ/pC/9J
 QR46QscmKNxVLEN7LHYiF44319B5jqjY32wRaC9dK0CK3yIfF0o+B5qVv4aUrhzwCaYNWf5ufeT
 +6SU7WELFBNnSKyJMCotz6+N9CzCP8Oso5G+axNdf4MTK4sF0M60Jxw3robJW/p0bsntpwYwcjN
 t9EK9OH28YBsyG3GH+DX0yIhzitgTnKCy81OAsGT1SMRCEYjuT6Nc36UrC5Ey51c+Je74JycrUJ
 YnI2JVrrAklgi8hHA4gEPp3Fn/yOp1Ekdw2GxPUfEzNyTYvdBR1+xl4VnRg6To8ChJBgpMpdVRv
 bpBdxFxbk1hZmm6KjPgdV8sZ90whiex4xyIz1b1yRVaZzXZLvQIv/kjlEWvL5pnrpm2oXsew/uh
 NFnPXvlVLKmPxOyvR9W4b4y4xVJPA8c7+u90E1Im/JK6ddnOuMfCiEr1XvfXYC09/Gy267FKYiY
 bK1avucC0YUka1JF4QUWnReU/vehbISkpZaAGTBZs5PhI5P0eK6j+50k9gskpliqOaGwjw+i40v
 Ppx5qZzgIsS/chc7fEtcUqerGn/L3BRjLtt8ltyRohFudKsaX8FfTypmZtlR6N0/fJuRcUg6B2K
 Mm90IlwTHw9tWVLATBQ==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D824A4C5198;
 Tue, 29 Sep 2026 20:37:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgf-000000006Jn-01qD;
 Tue, 29 Sep 2026 18:36:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:13 +0200
Message-ID: <20260929183607.1849293-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v7 14/66] package/boost: update graph
 dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

needs match, serialization and thread

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Johan Derycke <johanderycke@gmail.com>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Simon Dawson <spdawson@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 362cd6c95c..63c50d9835 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -170,7 +170,12 @@ config BR2_PACKAGE_BOOST_FILESYSTEM
 
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	select BR2_PACKAGE_BOOST_MATH
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The BGL graph interface and graph components are generic, in
 	  the same sense as the the Standard Template Library (STL).
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
