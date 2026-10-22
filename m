Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A13606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GsWdDAFN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D68460677;
	Thu, 22 Oct 2026 15:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBS_zaf928A1; Thu, 22 Oct 2026 15:42:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D1BBD6069C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792683734;
	b=htGIzA72ehU0Fc1c1C5mcD5w3oQL35zJED5rt0eG9DHFg79bJkzkP5kbAhPOgoygpJFz
	 sz318pCGb9uSsZFSbO0ljaxzSLPs+A4Ymbv0E5o4atfvbdfvCyMNrDv7FfToLwtCdsXWZ
	 RRZWw4I8G3quC4hEPhzEYUvj/klLg48wDhWZjwn3kZIp+wynj/WEB07fOqLq7t9zU+S3M
	 mHC/uL0t6GN9TbzXCRB6xJ1yyoAF6riOB7f77BWLjuXFFOe7tYo1gB0UANqIZ05nwAcU4
	 QWwi2hJSGqZvcqsS4hSL3FyHXAK3XxUS3Ys8Bin0foBEqs7hUrTN1pPHbCmuBQTymew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792683734;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hKyEDslCTgf1yqrWw6Z+bkHS8VCvnPEtwpeYwBTLXx0=;
	b=kWaKvsbR7oLKQYm6aITXWs1ZnSQ2CEhPP07o8tP2FiXqzO8vre0yM1FCk6lzcSGc7uzx
	 OB6J6ncC+C54UZR+13/jUGaMysQ+8zDenqdZtjCvwaOHDw+0gkU3iKVXzIkmDh+XtORJ4
	 +8JsG8MdbAlfePVpCL0qNUerYjr4vZfqVGLvRizgnifxcdAG2ajcjJpMfJa5aRUF+FJHu
	 guR7kJq5TRV72GxbOt40uK1wKkq/Jg//f3mcy2iDwpnopXXX0te83PeIBDDq+8Q63IaDO
	 e3sSPWRGodN727zzsleTOM6kPd/skoX9VjqEwdhng7m6vDkdxwmuEB+wIm0s3FXli/g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792683734;
	bh=hKyEDslCTgf1yqrWw6Z+bkHS8VCvnPEtwpeYwBTLXx0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GsWdDAFNbYebk+EjXlIKbxF6r5gGWdkm2NdTwvMQDr+SyQJX++0/EOA4oST1GXYYw
	 B2lhRVH4UDrCIHuRYe/YoCCcf6A7whXDizpvFh5A7vsY/RUqbdF+MqBrWOBtSij2He
	 /dwt+O9vCBAiMKQW4JlwUvrsndJ02hoPAW25iNIDIDjKZqqAZU4i+9U0Cjn5Bo1g57
	 Ec48F9eba1psjlgzj1hpSPZrCBlRNGYAK8jl8rYyVLWIqGp46tpJlsMnBICNXhh12+
	 Isbbbbl6gmqsD3WGOkxlO+eavjEpz9fhwRxlCjupUBgvlFOcbvRK8WkfZl2mllldGs
	 Geqi9PIoQGk3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1BBD6069C;
	Thu, 22 Oct 2026 15:42:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80DDA1184
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 735D840086
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efZkiN06Ep1F for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:42:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 69A3440082
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792683730;
 b=MDmbSQtm3cUUy3pbcVZSWcZp1acBCEOXgEkRqZpChmm13kIB2JkyUpzBcKXJ/HFbQ7j7
 wt64XrZtUDyE+ClKDrXMegG6uK2zvV438+FjtaA6mfAkygOPy8e4CaiBTOa2vWlvonTTR
 1TKNIDos0qdW+0kZ03w4AmHT7F6QACZ7AgTVXN9FE3AG5jNbhYeKhVPCW2Sbrld9zQ5v8
 PGE+FTfXno9HPwbB33yVUC6njqvFzm7xc1t5fxsG7woMEp0C4/wSGe5OitX3lYgH8V3Nq
 FHqshXjWrBIsTiwsyNmeYgX33QaPEvvyvsh15jkBen0IZ/qSMoUsGyT5953l4OEnrAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792683730;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F1vWoWVOQid1BlIKGgFcXyvBO0987vMzTMiA1Ba9YUg=;
 b=LzjXTjYSISEPjrCVHfMmtmUlRv4WKyPf6qSmTUytmY+wfyiRc8Pg7pEgVcUhuuExtr9G
 PZ53cqGophdxg+WG8G+NxSqKmS+jQBWTV2GpqgvHyXKoTQWHPOCXrnZ4ffLCqNTfGc2ZO
 UJUJdwdZqAynoORAcNeewtXUyCBAAkS8sYM2gtTrtcjTSir3Koqb6QQCLUbrhgACBTfxQ
 h0JdKTjrKag9FvWgfZ3T2LRKA/dKEKwJ89poKEEFIwIY9odzQZzWVjC6HH3G1LlVlGU9c
 9PrxHckBRlVK3MyAOiIfypzfowGpYXWDnWm9Hor8bYvUBQpM9TduOp8B01FDYb1o9cQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69A3440082
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:42:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63A1C9B9FF; Thu, 22 Oct 2026 15:40:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 17:41:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0cdd17f381350857038d9953f854aa4f317210de
X-Git-Newrev: 4b5ba0216478d6a2e7762a567437c928d30271ab
X-Patchwork-Hint: ignore
Message-Id: <20261022154046.63A1C9B9FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: Update for 2025.02.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4b5ba0216478d6a2e7762a567437c928d30271ab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

(cherry picked from commit 0e800f37f3767be20fc2f33ccad3016ae9b8e87d)
---
 CHANGES | 218 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/CHANGES b/CHANGES
index 126230638e..a3bbf87872 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2095,6 +2095,224 @@
 	- netsnmp: unexpected header length in /proc/net/snmp...
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/110
 
+2025.02.19, released October 22, 2026
+
+	Changes with potentially large impact:
+
+	- PHP had two very serious vulnerabilities: CVE-2026-109618,
+	  CVE-2026-109619. If you use PHP, upgrading is *strongly* recommended.
+
+	- Some trusted certificates from the eMudhra CA have known private keys.
+	  This means that it is extremely easy to masquerade as whatever host
+	  and public key infrastructure cannot be trusted at all. See
+	  https://emudhra.we-have-a-problem.com/ for more information.
+
+	  The ca-certificates and python-certifi packages have been updated to
+	  remove the root certificate that signs the vulnerable intermediate
+	  certificates. If you use ca-certificates to validate TLS connections,
+	  upgrading is *strongly* recommended.
+
+	  Note that some packages bundle their own set of root certificates,
+	  including libnss, nodejs, and dozens of Go and Rust packages. These
+	  have *not* been updated in this release.
+
+	- BR2_DOWNLOAD_FORCE_CHECK_HASHES=y is supposed to make the build fail
+	  if any download cannot be successfully verified against a known
+	  hash. It did not do that if there is no hash file at all.
+
+	- Wireshark was bumped from 4.2 to 4.4, which may have
+	  incompatibilities.
+
+	Important / security related fixes:
+
+	apache: CVE-2026-42356, CVE-2026-42528, CVE-2026-46729, CVE-2026-47360,
+	  CVE-2026-48005, CVE-2026-56153, CVE-2026-56154, CVE-2026-56449,
+	  CVE-2026-57941, CVE-2026-58415, CVE-2026-59685, CVE-2026-59797,
+	  CVE-2026-63045, CVE-2026-63292, CVE-2026-63686, CVE-2026-63718,
+	  CVE-2026-73636, CVE-2026-73637, CVE-2026-79768, CVE-2026-93546
+	bind: CVE-2026-19033, CVE-2026-19662, CVE-2026-19666, CVE-2026-19667,
+	  CVE-2026-19668, CVE-2026-19941, CVE-2026-75029, CVE-2026-76163,
+	  CVE-2026-77119, CVE-2026-77692, CVE-2026-78301, CVE-2026-80274,
+	  CVE-2026-81563, CVE-2026-81736
+	bubblewrap: CVE-2026-87766
+	ca-certificates: (no CVE assigned)
+	cannelloni: CVE-2026-37539
+	expat: CVE-2026-102633, CVE-2026-77214, CVE-2026-93990
+	gawk: CVE-2023-4156
+	gcc-initial: CVE-2019-15847
+	ghostscript: (no CVE assigned)
+	glibc: CVE-2026-8674, CVE-2026-89092, CVE-2026-97399
+	go: CVE-2026-56857, CVE-2026-56866, CVE-2026-78659, CVE-2026-78660,
+	  CVE-2026-78663, CVE-2026-78667, CVE-2026-78669, CVE-2026-94439,
+	  CVE-2026-94440, CVE-2026-94444, CVE-2026-94447, CVE-2026-94448,
+	  CVE-2026-97030, CVE-2026-97031, CVE-2026-97032
+	gpsd: CVE-2026-58459
+	htop: CVE-2008-5076
+	kbd: CVE-2011-0460
+	libheif: GHSA-4rv4-953r-p24q, GHSA-9c75-9g8r-4728, GHSA-fqpw-fj22-78w4,
+	  GHSA-prgh-72vc-3xmc, GHSA-q492-cfcm-895h, GHSA-qwpf-5wf7-r996,
+	  GHSA-r7gr-2xm2-23wf, GHSA-rhgw-q5g8-xjh2, GHSA-v8qw-hwjv-44hw,
+	  GHSA-vg7w-rp49-4fc2, GHSA-xrp2-63fq-jm8q
+	libopenssl: CVE-2026-35189, CVE-2026-35191, CVE-2026-42772,
+	  CVE-2026-54872, CVE-2026-54873, CVE-2026-54875, CVE-2026-72897,
+	  CVE-2026-75804, CVE-2026-75805, CVE-2026-75806, CVE-2026-77696,
+	  CVE-2026-84782, CVE-2026-84784
+	libpcap: CVE-2026-0799, CVE-2026-18238, CVE-2026-18313, CVE-2026-31911,
+	  CVE-2026-31912, CVE-2026-6244, CVE-2026-6554
+	libpng: CVE-2026-46675
+	libseccomp: GHSA-2hqh-5c36-grrm, GHSA-46fr-jh49-xvhx,
+	  GHSA-4q85-33p6-j5g6
+	lldpd: CVE-2026-46433
+	m4: CVE-2008-1687
+	mbedtls: CVE-2026-25832, CVE-2026-35336, CVE-2026-49300,
+	  CVE-2026-50579, CVE-2026-50580, CVE-2026-50581, CVE-2026-50583,
+	  CVE-2026-50584, CVE-2026-50585, CVE-2026-50586, CVE-2026-50587,
+	  CVE-2026-50588, CVE-2026-50640, CVE-2026-50713, CVE-2026-54435,
+	  CVE-2026-54441, CVE-2026-73064, CVE-2026-73096
+	nano: CVE-2026-6843
+	ntpsec: CVE-2026-18321
+	openvpn: CVE-2026-84471, CVE-2026-84732
+	patchelf: CVE-2022-44940
+	pcre2: GHSA-2p8c-ff85-vh9x, GHSA-3r4p-g7gg-ppmf, GHSA-9qww-pwc4-77qq,
+	  GHSA-fmgr-6ggq-9859, GHSA-q7rw-r7qq-2hx6, GHSA-q8g2-wprr-34m9,
+	  GHSA-r9hj-j2rw-4q3m
+	php: CVE-2026-109618, CVE-2026-109619, GHSA-6wmf-4rv5-p3rp,
+	  GHSA-w8hw-w9fx-j79w
+	python-twisted: CVE-2026-42304
+	python3: CVE-2026-15310, CVE-2026-15806, CVE-2026-17084,
+	  CVE-2026-19445, CVE-2026-19553, CVE-2026-19672, CVE-2026-82049,
+	  CVE-2026-87910
+	qt6declarative: CVE-2025-14576
+	qt6svg: CVE-2021-45930
+	seatd: CVE-2021-41387
+	tcpreplay: GHSA-27v4-xhfx-g2rx, GHSA-2wmf-4p77-784q,
+	  GHSA-4hqm-8v2c-9pwj, GHSA-5cjx-62pj-pmgq, GHSA-5q26-7fxx-v8fh,
+	  GHSA-777w-9599-w8g4, GHSA-fwcr-mqg6-hqmx, GHSA-jj65-mrgg-f5fx,
+	  GHSA-m655-53p4-6qm8, GHSA-m6w7-8497-g9c9, GHSA-p3f2-88rg-9mch,
+	  GHSA-p7xp-4gj2-x56c, GHSA-pfqg-243f-8q25, GHSA-pjh6-6hrw-vcwr,
+	  GHSA-pmmx-m8p5-969j, GHSA-v8c4-9w98-9v6v, GHSA-ww62-mxv7-pg55
+	thrift: CVE-2026-41608, CVE-2026-61373, CVE-2026-61374, CVE-2026-63772,
+	  CVE-2026-66054, CVE-2026-66055, CVE-2026-66081, CVE-2026-66331,
+	  CVE-2026-66837, CVE-2026-66858, CVE-2026-66859, CVE-2026-82458,
+	  CVE-2026-82459, CVE-2026-83632, CVE-2026-83663, CVE-2026-83745,
+	  CVE-2026-85086, CVE-2026-85087, CVE-2026-85088, CVE-2026-85476,
+	  CVE-2026-85483, CVE-2026-85493, CVE-2026-85494, CVE-2026-86535,
+	  CVE-2026-86536, CVE-2026-86537, CVE-2026-87117, CVE-2026-90440,
+	  CVE-2026-91135, CVE-2026-91137, CVE-2026-92834, CVE-2026-93925,
+	  CVE-2026-93926, CVE-2026-94633, CVE-2026-94634, CVE-2026-94635,
+	  CVE-2026-94636, CVE-2026-94637, CVE-2026-94638, CVE-2026-94639,
+	  CVE-2026-94642, CVE-2026-94644, CVE-2026-94645, CVE-2026-94646,
+	  CVE-2026-94648, CVE-2026-94650, CVE-2026-94651, CVE-2026-94652,
+	  CVE-2026-94653, CVE-2026-94654, CVE-2026-94655, CVE-2026-94656,
+	  CVE-2026-94657, CVE-2026-94658, CVE-2026-96277, CVE-2026-96286,
+	  CVE-2026-96287, CVE-2026-96288, CVE-2026-96289, CVE-2026-96292,
+	  CVE-2026-96294, CVE-2026-96990
+	tor: TROVE-2026-012, TROVE-2026-030, TROVE-2026-032, TROVE-2026-033,
+	  TROVE-2026-034, TROVE-2026-035, TROVE-2026-036, TROVE-2026-038,
+	  TROVE-2026-041, TROVE-2026-042, TROVE-2026-043, TROVE-2026-050,
+	  TROVE-2026-051, TROVE-2026-052, TROVE-2026-053, TROVE-2026-056,
+	  TROVE-2026-058, TROVE-2026-062, TROVE-2026-064, TROVE-2026-067
+	tpm2-tools: GHSA-gwfg-w3jr-xh66, GHSA-qp88-8f4j-wv7q,
+	  GHSA-v7w4-4gc9-qcgv
+	turbolua: (no CVE assigned)
+	unbound: CVE-2026-77860, CVE-2026-77955, CVE-2026-78227,
+	  CVE-2026-80225, CVE-2026-81634, CVE-2026-81642, CVE-2026-82717,
+	  CVE-2026-82720, CVE-2026-85501
+	vlc: (no CVE assigned)
+	wireshark: CVE-2025-11626, CVE-2025-13499, CVE-2025-13946,
+	  CVE-2026-0959, CVE-2026-0960, CVE-2026-0961, CVE-2026-0962,
+	  CVE-2026-15163, CVE-2026-15164, CVE-2026-15166, CVE-2026-15167,
+	  CVE-2026-15168, CVE-2026-15169, CVE-2026-15170, CVE-2026-15171,
+	  CVE-2026-15172, CVE-2026-15174, CVE-2026-3201, CVE-2026-3203,
+	  CVE-2026-5299, CVE-2026-5401, CVE-2026-5403, CVE-2026-5404,
+	  CVE-2026-5405, CVE-2026-5406, CVE-2026-5407, CVE-2026-5408,
+	  CVE-2026-5409, CVE-2026-5653, CVE-2026-5654, CVE-2026-5656,
+	  CVE-2026-5657, CVE-2026-6519, CVE-2026-6520, CVE-2026-6521,
+	  CVE-2026-6522, CVE-2026-6523, CVE-2026-6524, CVE-2026-6527,
+	  CVE-2026-6529, CVE-2026-6530, CVE-2026-6531, CVE-2026-6532,
+	  CVE-2026-6533, CVE-2026-6534, CVE-2026-6535, CVE-2026-6537,
+	  CVE-2026-6538, CVE-2026-6868, CVE-2026-6869, CVE-2026-6870,
+	  CVE-2026-76879, CVE-2026-76880, CVE-2026-76881, CVE-2026-76882,
+	  CVE-2026-76883, CVE-2026-76884, CVE-2026-76885, CVE-2026-76886,
+	  CVE-2026-76887, CVE-2026-76888, CVE-2026-76889, CVE-2026-76890,
+	  CVE-2026-76891, CVE-2026-76917, CVE-2026-76918, CVE-2026-76919,
+	  CVE-2026-76920, CVE-2026-76921, CVE-2026-76922, CVE-2026-76923,
+	  CVE-2026-76924, CVE-2026-76926, CVE-2026-76927, CVE-2026-76928,
+	  CVE-2026-76929, CVE-2026-95387, CVE-2026-95388, CVE-2026-95389,
+	  CVE-2026-95392, CVE-2026-95393, CVE-2026-95394, CVE-2026-95395,
+	  CVE-2026-96415, CVE-2026-96416, CVE-2026-96417, CVE-2026-96418,
+	  CVE-2026-96419, CVE-2026-96421, CVE-2026-96422, CVE-2026-96423,
+	  wnpa-sec-2026-100, wnpa-sec-2026-101, wnpa-sec-2026-102,
+	  wnpa-sec-2026-103, wnpa-sec-2026-104, wnpa-sec-2026-105,
+	  wnpa-sec-2026-106, wnpa-sec-2026-107, wnpa-sec-2026-108,
+	  wnpa-sec-2026-109, wnpa-sec-2026-110, wnpa-sec-2026-93,
+	  wnpa-sec-2026-96, wnpa-sec-2026-97, wnpa-sec-2026-98,
+	  wnpa-sec-2026-99
+	wolfssl: CVE-2026-15442, CVE-2026-89102, CVE-2026-89133,
+	  CVE-2026-89134, CVE-2026-89135, CVE-2026-89136, CVE-2026-93302,
+	  CVE-2026-93304, CVE-2026-94417, CVE-2026-94418, CVE-2026-94419
+	xdg-dbus-proxy: GHSA-r7hp-698j-2h6c
+	xkeyboard-config: CVE-2012-0064
+	xlib_libXfont2: CVE-2026-44950, CVE-2026-59679
+	xz: GHSA-5qpq-xqfv-j9pg
+	zabbix: CVE-2026-23920, CVE-2026-23921
+	znc: CVE-2026-82373
+
+	Toolchain:
+
+	- glibc: bump to version 2.41-163
+	- linux-headers: bump to 5.10.271, 5.15.222, 6.1.189, 6.6.158, 6.12.112
+
+	Infrastructure updates/fixes:
+
+	- utils/generate-cyclonedx: mark host packages as excluded
+	- utils/generate-cyclonedx: support schema version choice 1.6, 1.6.1,
+	  1.6.2, 1.7, 1.7.1
+	- arch: x86: add support for XOP instruction set
+	- package/pkg-autotools.mk: also handle libtool 2.6.x
+	- utils/docker-run: mount and pass BR2_EXTERNAL dirs
+	- enforce BR2_DOWNLOAD_FORCE_CHECK_HASHES=y for missing hash files
+	- utils/docker-run: add NO_NETWORK variable
+	- checkpackagelib: improve CVE handling
+	- support/docker/Dockerfile: make $HOME folder read-only
+	- utils/getdeveloperlib.py: fix regexp used to find package infra
+	- utils/checkpackagelib: support other identifiers than CVE
+	- utils/checkpackagelib: check IGNORE_CVES identifiers match patch
+	  trailers
+	- New runtime tests: tests_flat_stacksize, test_erlang, test_squid,
+	  test_bubblewrap, test_harfbuzz, test_sqlitecpp
+	- runtime tests: fix TestPythonPy3NetworkmanagerGoi, TestLtpTestsuite
+	- runtime tests: test_generate_cyclonedx: additional tests for scp and
+	  for vulnerabilities of packages with multiple possible versions
+	- utils/check-symbols: check for undefined host symbols
+	- pkg-stats: sort latest version by state
+	- utils/genrandconfig: reject qemu user mode on hosts with large pages
+
+	Removed packages: ola
+
+	Updated / fixed packages: apache, asterisk, bcc, bind, binutils, boost,
+	  bubblewrap, ca-certificates, cannelloni, chrony, clamav, cpp-httplib,
+	  dhcpcd, e2fsprogs, edk2, erlang, exim, expat, falcosecurity-libs,
+	  fcft, flutter-engine, gawk, gcc-initial, gerbera, ghostscript, glibc,
+	  glslsandbox-player, gnu-efi, gnuradio, go, gpsd, grub2, gumbo-parser,
+	  haproxy, haveged, hidapi, htop, hwdata, i2pd, ibrcommon, inadyn,
+	  intel-mediasdk, intel-vpl-gpu-rt, iproute2, ivi-homescreen, kbd,
+	  kodi, libabseil-cpp, libarchive, libest, libgphoto2, libgtk3,
+	  libheif, libmpeg2, libopenssl, libpcap, libpng, libseccomp, libssh,
+	  linux, linux-headers, linux-tools, lldpd, luvi, lvm2, m4, mali-t76x,
+	  mbedtls, mpg123, mrouted, nano, netdata, netsnmp, network-manager,
+	  nfs-utils, ntpsec, openjdk, openjdk-bin, openvpn, patchelf, pcre2,
+	  php, pulseview, python-certifi, python-googleapis-common-protos,
+	  python-grpcio, python-grpcio-reflection, python-numpy, python-scipy,
+	  python-twisted, python3, qemu, qt5cinex, qt6declarative, qt6svg,
+	  rpi-rgb-led-matrix, rtl8812au-aircrack-ng, screen, seatd, setserial,
+	  shadowsocks-libev, skopeo, sound-theme-borealis, sqlitecpp,
+	  strongswan, stunnel, swig, sysprof, tcpreplay, tensorflow-lite,
+	  thrift, tor, tpm2-tools, turbolua, tzdata, udisks, unbound,
+	  util-linux, util-linux-libs, vboot-utils, vlc, webkitgtk, wireshark,
+	  wolfssl, wpewebkit, xdg-dbus-proxy, xen, xkeyboard-config,
+	  xlib_libXfont2, xz, zabbix, zfs, znc
+
 2025.02.18, released September 10, 2026
 
 	Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
