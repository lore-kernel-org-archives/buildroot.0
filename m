Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EF560A6F4B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FBVVotb9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F35281204;
	Thu, 22 Oct 2026 15:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbXkrXJpAp8Z; Thu, 22 Oct 2026 15:11:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DC22F811D9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792681865;
	b=Dd9VYp88JojYINyt4logHtdnuJ33ewbj/odkKp7uAkhrO0m9N9oegtY/F9CtFXrLhX1p
	 ZYHPfbOgfyq22mwJqPcESseE8Kz4oJ34mfsquvo8Fd816ttUjJvrSBRJ/9EcFeH+W1vTj
	 8TwaBLz3es6wmlVys7Cj9dhL4YraDfx24n/EwJI4YxT7+GWpjacR5xNQnYZT3Y1OAfY1K
	 iGPALNG/+G3F1WkiY3oq9DJ/N/RJ7sCxj/tCOVVX+9CjhAGhAxIGdKsLodeqKN2/lkM1n
	 rI9AcqneofYa803XbKB+Nh/gwNow/JvY9YqxTemB8KKcFRkeJGxm6S/QNslcLnFSlKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792681865;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Eol2ulCVYp6aI1PaKWApOuIEqjnUdKo0pE54GORWEKI=;
	b=H+MFVWc9fIb+/Q7mHvHjCXNWfYAMVi/ApzSJxhnXhzEou96Obsxi+NSVcNSLzHLcHHdW
	 jr/3osFBxNAwKjhBQ5ny1Gx7+mL0Aw+9sv17XvPTAFZa+85sewl90R7X4VeaGZa7nHlCI
	 DyAYYE22yAjg36EYLL5Yk/2EymxBakq4OxVPQCXJTMN7DIjWKx0BXbQuPeXCNfyJ6d42w
	 +qzHYNhjRtPi52Z8khFMG8COY4qKfUPnyf8QVhhdD5pqq7DGrkF8KmBx6uKGJPWOd+p6R
	 KLxYWsPp+MXhUO9FLIz7m2BHUgOVxdWaCHSz6JtVTS1n+zpq8MY5R09faFJX4vurfCw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792681864;
	bh=Eol2ulCVYp6aI1PaKWApOuIEqjnUdKo0pE54GORWEKI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FBVVotb9WncRJwUpnafGtxRaE2kgBHDcFhatn4F5LxsQqOb0Gb6PFRmfkp6OCCGZy
	 VeNgdXKw3WaE3/i5XYQMRCQUAvNz2P2b9VzlskfYRQBXh3UfCTyUFvBNbAmoal6Ppl
	 edNf4fTKTAoTHq/PlWIhmq5UDx+ybXeawMrGG48TQ4xgXzAIx5Q1dyKX3b0I37PLzF
	 pVRaep+A6aVQeNJ0mshyZALmOzMUEjSsQLQC7A2wHoXpdFTIFjbHHXl3CEQjBqgQ+5
	 nf3khXxs6EnvyccqEXfh/Iv5Cysf3UYI6W95n5E/aM+I9c2xz/kjNbTntwCYC6U0Gf
	 KE+WDbivtkC2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC22F811D9;
	Thu, 22 Oct 2026 15:11:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67E893A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4ECA340082
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBl00Jl4rUXF for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:11:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0231940024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792681862;
 b=ExTIJP4JAewoTr8JH2z1w8qV4cyr7bsV3SQKUd/7p/021T4on2KNlLsudJQuBXVL3fQ2
 ZTy3XV0WARx++8vUu44dSLVQ1zI+Zd1GxBT8sdScVhQapxyvmbVRq3mPcDz1sK2WyPRbJ
 MvkUMX5VX+lyW5ss2D4xEf/LOPTxc0/BDKYy2+px8ZY1VITfBMiMWalv8V/LakR3EOrGZ
 h/lcvV5n6RWv3c6lAf5tuD5Z9pqSE9dtdAcJjCs1gqHKAlPU4zaVcGmiJs7KpubQMB5N5
 Vi5WSQPKG7Sn3PV2WxGW7yi65WEKvwb0+E+YjE2n0YasYZTgRoK1EZorqRWyDXKx6PQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792681862;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cqAS7ysvQnbSyz/ORo83m+6la0swqGiVg9qly1VlAgw=;
 b=SZ6LlD4oamEGFFSnJv/c1h+IZEVf9Gj4a0jl6FuIOx/1xtqpkCxPYGSajBnp/tHy+fBq
 5EUnXr2ybGGHsjWNJyIBJXlrnTwyCodtwYXeEvHNWor8522fAd2bBbHelaletqnHe58lQ
 Y3s2BlEdNgloiWjlFVuCgsBSLHvvhMSLuQg7vb3sCQRCCDvTUtZa7Zvx31QACBKePr3KT
 Pa4Ws+Cvhh8oIdK4LiDDKfO+QV9kFtvV9vRLjAwytBGh1nIscnYDSFw3qU9omnVaR7uX7
 yh4UqE84ruNakxkrdPDKckPQeajVSE3hhZ7pKnIvF+R/QzKyaMuoG4r4Ec1lPEDcbJg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0231940024
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:11:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3B069B9F7; Thu, 22 Oct 2026 15:09:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 17:04:20 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 419fbaa1423a08def0f423dc3e4001556ab69588
X-Git-Newrev: a62ab35ffc9d9a272ca78102fda2e808fb68126a
X-Patchwork-Hint: ignore
Message-Id: <20261022150937.E3B069B9F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] CHANGES: Update for
 2026.08.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a62ab35ffc9d9a272ca78102fda2e808fb68126a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 202 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/CHANGES b/CHANGES
index 4cb4c095ef..1b67cc8c83 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,205 @@
+2026.08.1, released October 22, 2026
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
+	distribution-registry: CVE-2026-33540, CVE-2026-35172, CVE-2026-41888
+	expat: CVE-2026-102633, CVE-2026-77214, CVE-2026-93990
+	gawk: CVE-2023-4156
+	gcc-initial: CVE-2019-15847
+	ghostscript: (no CVE assigned)
+	glibc: CVE-2026-18374, CVE-2026-8674, CVE-2026-89092, CVE-2026-97399
+	go: CVE-2026-56857, CVE-2026-56866, CVE-2026-78659, CVE-2026-78660,
+	  CVE-2026-78663, CVE-2026-78667, CVE-2026-78669, CVE-2026-94439,
+	  CVE-2026-94440, CVE-2026-94444, CVE-2026-94447, CVE-2026-94448,
+	  CVE-2026-97030, CVE-2026-97031, CVE-2026-97032
+	gpsd: CVE-2026-58459
+	htop: CVE-2008-5076
+	kbd: CVE-2011-0460
+	libde265: GHSA-mm7m-v26f-wf8x, GHSA-xp3h-6f5r-8cxp
+	libfuse3: (no CVE assigned)
+	libheif: CVE-2026-84450, CVE-2026-84451, GHSA-4h82-g446-83fm,
+	  GHSA-4jqm-2x34-6f6r, GHSA-4rv4-953r-p24q, GHSA-73p7-m7gg-w2jv,
+	  GHSA-8857-r8x5-7499, GHSA-8fmq-r4pf-7m57, GHSA-9c75-9g8r-4728,
+	  GHSA-9rj8-5mp5-26c9, GHSA-fqpw-fj22-78w4, GHSA-gh5q-69gg-c964,
+	  GHSA-hh47-fhqr-cj2r, GHSA-jc8f-p23p-5hjg, GHSA-mw6f-29j3-76f4,
+	  GHSA-prgh-72vc-3xmc, GHSA-q492-cfcm-895h, GHSA-qwpf-5wf7-r996,
+	  GHSA-r7gr-2xm2-23wf, GHSA-rhgw-q5g8-xjh2, GHSA-v8qw-hwjv-44hw,
+	  GHSA-vg7w-rp49-4fc2, GHSA-w7mc-p8jc-p853, GHSA-x8r2-mggj-j6wr,
+	  GHSA-xrp2-63fq-jm8q
+	libopenssl: CVE-2026-35189, CVE-2026-35191, CVE-2026-42772,
+	  CVE-2026-54872, CVE-2026-54873, CVE-2026-54875, CVE-2026-72897,
+	  CVE-2026-75804, CVE-2026-75805, CVE-2026-75806, CVE-2026-77696,
+	  CVE-2026-84782, CVE-2026-84784
+	libpcap: CVE-2026-0799, CVE-2026-18238, CVE-2026-18313, CVE-2026-31911,
+	  CVE-2026-31912, CVE-2026-6244, CVE-2026-6554
+	libpng: CVE-2026-46675
+	libseccomp: GHSA-2hqh-5c36-grrm, GHSA-46fr-jh49-xvhx,
+	  GHSA-4q85-33p6-j5g6
+	libxml2: CVE-2026-11979
+	lldpd: CVE-2026-46433
+	m4: CVE-2008-1687
+	mbedtls: CVE-2026-25832, CVE-2026-35336, CVE-2026-49300,
+	  CVE-2026-50579, CVE-2026-50580, CVE-2026-50581, CVE-2026-50583,
+	  CVE-2026-50584, CVE-2026-50585, CVE-2026-50586, CVE-2026-50587,
+	  CVE-2026-50588, CVE-2026-50640, CVE-2026-50713, CVE-2026-54435,
+	  CVE-2026-54441, CVE-2026-73064, CVE-2026-73096
+	nano: CVE-2026-6843
+	ntpsec: CVE-2026-18321
+	openssh: (no CVE assigned)
+	openvpn: CVE-2026-84732, CVE-2026-84790, CVE-2026-88964
+	patchelf: CVE-2022-44940
+	pcre2: GHSA-2p8c-ff85-vh9x, GHSA-3r4p-g7gg-ppmf, GHSA-9qww-pwc4-77qq,
+	  GHSA-fmgr-6ggq-9859, GHSA-q7rw-r7qq-2hx6, GHSA-q8g2-wprr-34m9,
+	  GHSA-r9hj-j2rw-4q3m
+	php: CVE-2025-1218, CVE-2025-14181, CVE-2026-109618, CVE-2026-109619,
+	  CVE-2026-17545, CVE-2026-6103, CVE-2026-91765, CVE-2026-91766,
+	  CVE-2026-91767, CVE-2026-91768, CVE-2026-91769, CVE-2026-92842,
+	  CVE-2026-93682, GHSA-6wmf-4rv5-p3rp, GHSA-w8hw-w9fx-j79w
+	python-twisted: CVE-2026-42304
+	python3: CVE-2026-15310, CVE-2026-15806, CVE-2026-17084,
+	  CVE-2026-19445, CVE-2026-19553, CVE-2026-19672, CVE-2026-82049
+	qt6: CVE-2026-13326, CVE-2026-16762, CVE-2026-19248, CVE-2026-8168
+	qt6declarative: CVE-2025-14576
+	qt6svg: CVE-2021-45930
+	redis: (no CVE assigned)
+	sdl3_image: CVE-2026-35444
+	seatd: CVE-2021-41387
+	skopeo: CVE-2025-11395
+	suricata: CVE-2026-45747, CVE-2026-45751, CVE-2026-45752,
+	  CVE-2026-45759, CVE-2026-45761, CVE-2026-45762, CVE-2026-45763,
+	  CVE-2026-45764, CVE-2026-45765, CVE-2026-45766, CVE-2026-45767,
+	  CVE-2026-45768, CVE-2026-45769, CVE-2026-45770, CVE-2026-46352,
+	  CVE-2026-46387, CVE-2026-57222, CVE-2026-57224, CVE-2026-57227,
+	  CVE-2026-57228, CVE-2026-57229, CVE-2026-63446, CVE-2026-63447,
+	  CVE-2026-63448, CVE-2026-63449, CVE-2026-63450, CVE-2026-63451,
+	  CVE-2026-63452
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
+	wireshark: CVE-2026-95387, CVE-2026-95388, CVE-2026-95389,
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
+	znc: CVE-2020-11022, CVE-2020-11023, CVE-2026-82373, CVE-2026-82374
+
+	Toolchain:
+
+	- gcc: add microblaze frame unwinding fix to v15 and v16
+	- glibc: bump to 2.44-57
+	- linux-headers:: bump to 5.10.271, 5.15.222, 6.1.189, 6.6.158,
+	  6.12.112, 6.18.55
+
+	Infrastructure updates/fixes:
+
+	- utils/docker-run: mount and pass BR2_EXTERNAL dirs
+	- arch: x86: add support for XOP instruction set
+	- utils/checkpackagelib: check IGNORE_CVES identifiers match patch
+	  trailers
+	- runtime tests: test_generate_cyclonedx: additional tests for scp and
+	  for vulnerabilities of packages with multiple possible versions
+	- utils/getdeveloperlib.py: fix regexp used to find package infra
+	- utils/checkpackagelib: support other identifiers than CVE
+	- utils/generate-cyclonedx: support schema version choice 1.6, 1.6.1,
+	  1.6.2, 1.7, 1.7.1
+	- New runtime tests: tests_flat_stacksize, test_erlang, test_squid,
+	  test_bubblewrap, test_harfbuzz, test_sqlitecpp
+	- package/pkg-autotools.mk: also handle libtool 2.6.x
+	- checkpackagelib: improve CVE handling
+	- enforce BR2_DOWNLOAD_FORCE_CHECK_HASHES=y for missing hash files
+	- utils/genrandconfig: reject qemu user mode on hosts with large pages
+	- pkg-stats: sort latest version by state
+	- support/docker/Dockerfile: make $HOME folder read-only
+	- utils/docker-run: add NO_NETWORK variable
+	- utils/check-symbols: check for undefined host symbols
+	- utils/generate-cyclonedx: mark host packages as excluded
+
+	Updated / fixed packages: apache, asterisk, atop, bcc, bind, binutils,
+	  boost, bubblewrap, ca-certificates, cannelloni, chrony, clamav,
+	  cpp-httplib, dejavu, dhcpcd, distribution-registry, dtui, e2fsprogs,
+	  edk2, erlang, exim, expat, falcosecurity-libs, fcft, flutter-engine,
+	  gawk, gcc, gcc-initial, gerbera, ghostscript, glibc,
+	  glslsandbox-player, gnu-efi, gnuradio, go, gpsd, gumbo-parser,
+	  haproxy, haveged, hidapi, htop, hwdata, i2pd, ibm-sw-tpm2, ibrcommon,
+	  icu, igh-ethercat, imlib2, inadyn, intel-mediasdk, intel-vpl-gpu-rt,
+	  iproute2, ivi-homescreen, jemalloc, kbd, kodi, libabseil-cpp,
+	  libarchive, libcamera-apps, libde265, libest, libfuse3, libgphoto2,
+	  libgtk3, libheif, libmpeg2, libopenssl, libpcap, libpng, libseccomp,
+	  libssh, libxml2, linux, linux-headers, linux-headers:, linux-tools,
+	  lldpd, lua-lunix, luvi, lvm2, m4, mali-t76x, mbedtls, mpg123,
+	  mrouted, nano, ndctl, netdata, network-manager, nnn, ntpsec, openjdk,
+	  openjdk-bin, openscap, openssh, openvpn, passt, patchelf, pcre2, php,
+	  pocketpy, pulseview, python-certifi, python-charset-normalizer,
+	  python-googleapis-common-protos, python-grpcio,
+	  python-grpcio-reflection, python-memray, python-twisted, python3,
+	  qemu, qt5cinex, qt5knx, qt5webengine-chromium, qt6, qt6declarative,
+	  qt6svg, redis, rpi-rgb-led-matrix, rtl8812au-aircrack-ng, rustc,
+	  screen, sdl3_image, seatd, setserial, shadowsocks-libev, skopeo,
+	  snort3, sofia-sip, sound-theme-borealis, sqlitecpp, strongswan,
+	  stunnel, suricata, swig, sysprof, tcpreplay, tensorflow-lite, thrift,
+	  toolchain-external-bootlin, tor, tpm2-tools, turbolua, tzdata,
+	  udisks, unbound, util-linux, util-linux-libs, vboot-utils, vlc,
+	  webkitgtk, wireless-regdb, wireshark, wmenu, wolfssl, wpewebkit,
+	  xdg-dbus-proxy, xen, xkeyboard-config, xlib_libXfont2, xz, zabbix,
+	  znc
+
+
 2026.08, released September 4th, 2026
 
 	Various fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
