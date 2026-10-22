Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B5D606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Lw3gNYpO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8777960744;
	Thu, 22 Oct 2026 15:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-44TGCV-evt; Thu, 22 Oct 2026 15:39:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2A776606B6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792683557;
	b=mZVziZ3y7kdoY4jY+dNN2HirRCqHZb3p3wU7faK39EI3sBvYYAMjjGb3h3vSULzytZQP
	 AyIenpI9du7W8+lsVAw6K5MCMubmhzElsbrqGYSkK+gyEQldDFGg8Ownrka4QqE2ZnFoy
	 bxPw//MQyKPo2DNt9AhPdW3o0lgMyCE6BHWPQvrR5q74q5W61uKaxxGIT5bVtUqJyWgxm
	 ehhbmqimFpfHxvTBExeIS1zFv5I22NT76kD1Ds+ROBnQwdW3EeCuw+kitw/WVCtNw+Gvo
	 N9aBjbsYcNRBVN67wwjaMZD7DRlcsNicBhfkrzOnP/pmVCnhBezW9ttuL29vfLthTIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792683557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=847FmfFJFQq83VKx/6DA4GxL0Qe3xckQBv8arG++9Bg=;
	b=cz3D9hbs5g6nlUJzeQU0gB0ypuTQ3UrR5h25fmZ7+B5xkLyfXWHo6CXkfB5ypKkulfzA
	 ALGzhRBgbto6Ewm+qEM4mPj3LCp4nNCXTng8FpFmcrMdUodT8wC8S6ylJyKBr8Ppu1nu/
	 IvF/fMrHLj7/dpRYVPzm5AHP1kPwnbrmJRxvnGielkslcOxnNm6Tjl7BuPrSJUvxRZzuP
	 ZITa3m66f+IQlf7Kr2fIZVxtr2W9QkMDyDltbPp4/beyZ+OTzYiDnKf8AtvtYJ0H0FnUU
	 MxV9XmRHfmM0sNAJlCP0QKcE57EQXzF5LnZUOcU15u+x477fBWNenx7xNR7b2yC4yQg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792683557;
	bh=847FmfFJFQq83VKx/6DA4GxL0Qe3xckQBv8arG++9Bg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lw3gNYpODejNXfNh2VChd1L9woMmWVBNQeyDGTD5yCSyatMhb8tnjO5nHv6pL5Pk5
	 SCjQ9OpQ6+KSHZAQ0ENv8QPTD87/dZRLHVpEMmgS36gcL4rtwI1cQVf5ng2jA4cEri
	 L03MqHVUa2caNHuTEFDvtZA4JppJjOYrCNunnzlmGMOlgnvQYRs6NioCwHyHLdloai
	 AMyX2ugiI+68hiJJ3TeyZQ5dVTAt4RHj3lR2aaVOjw7xosH49ms3K/wycg08ceczA2
	 Gk16FY/BcV1XujeKg5HdatjsT6osRorhJI4Rl8evafcMDIAz4slszZwsXqiRAY9RMr
	 1UwL5qja3sEdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A776606B6;
	Thu, 22 Oct 2026 15:39:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE9691AB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7E7D4055E
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZpGVbjA7-bN9 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:39:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B64F540554
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792683552;
 b=iN4hDkvR2kGwPuF1cBL4omthKQAVYvc4FFuG3YufSxlwBmBYJOrm53ueSXwIwSKgW2WM
 jFsRuV/f1tHFsDkZg2G8Bbe93mWJ6wiYezs462RmjkWRdvJQepbfJFKASj+ctD5dmq4DR
 +23SxCkCyeT4dNoDqTPspXjd617Tc9y2czaFgteuudJsezAj+QLEzbqLJBn5HRjp2CDoF
 xlOGwvnRUrXwrb3OODhkeWUKgT/DGllKF+AIui45MOuR5S7tzwYDCX9lfRrBo9OLefoWv
 bu4aTpIQEsIJtZd0Bmfjd5VP9ZR4VhGDLlFklONaRJqSttIHUStd53A69vHvPLa5xNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792683552;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=B7VQjFtzMbaZQlRurW5y9wwyUhrXB9fJ9d+i0KaTGT8=;
 b=BFFarY7/w6snEgaxzZ72kMi+eRtOVEXC0zULd8qDdX08l6qk6VawZUyeCiAYaEHf8A6n
 F7IDwnw/JeBCizzhYusYRxBw3tb1sFUEZfT5Dr7FLF7zKyK1Vb8K/riaIZ5mwYdAON1ZP
 LAufB9aqM9x8HamkHw+Pafcvo+ZTMPCdkd7FrJL34tcE/HGGu29wsw7xaur//5xwB2/pq
 kGMAgzI17PpFbUZjbI08bo2a2ZDm44uL/gRQOB/XTIKDmgoUC1PUb2YCfI7jfidexTc1+
 j3MjRjeLdebd5GcrBndNLpKUUAyKRm3CLmWo9Oy3MNXLnydZuaoD8Gr2XNxOqwPUxJQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B64F540554
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:39:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A51F49B9D2; Thu, 22 Oct 2026 15:37:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 17:03:27 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 96a5f9c8632e234d2ad873fb82a4d8a2cd48b666
X-Git-Newrev: 0e800f37f3767be20fc2f33ccad3016ae9b8e87d
X-Patchwork-Hint: ignore
Message-Id: <20261022153748.A51F49B9D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] CHANGES: Update for
 2025.02.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e800f37f3767be20fc2f33ccad3016ae9b8e87d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 217 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 215 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 71b96f6377..cb883a1c0b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,8 +1,221 @@
-2025.02.19, unreleased
+2025.02.19, released October 22, 2026
 
 	Changes with potentially large impact:
 
-	- Wireshark was bumped from 4.2 to 4.4.
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
