Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C11D606A31B
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=O3SUzboc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379E980E11;
	Mon, 26 Oct 2026 10:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5loETujUig13; Mon, 26 Oct 2026 10:35:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3386280E27
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793010912;
	b=GkX+v7xPLOMJLCzzRr4K4AFwqOfSWR1oVWAmCHeMpA1gvYIMP9BL0y+TVkTCX8Ggs3Pq
	 UywLaQQKkVhn2UX4oCXtA8ee+Pc7xTmZdQXw6E2vmji1n9JlNcpexT2jZAVljXcaTAgDH
	 GJ3D9fH+UUQVV+8Z0d0oVMfOjgp1NSPzlU2gxxTpsHtsPW5O4nA0VlxpG/hCaahh9qrMa
	 89jZAa9Q9F/Ay9N16t+KuL5xu4h7K3GDH8l7KzsCh1sRYb3nwGo1EIaARklDLehyqE6am
	 j57v2IMrZN4Kdc4VDhtA8i32KWQloS0NqhXtyPKjOiKppFaZHoJmaZcTPI1kp5H9oIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793010912;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Errors-To:Sender;
	bh=xPgnR6WlNnIAlWe/WRSk/VG/cVqTKRHe35LB+jQDVRE=;
	b=XUSuNZ9lD3YSxwZVkB9NpbGt/qx/ZpARzVp4uvhql8orq2qu8XI0OU9wL6ngItQJvgu/
	 XwXPcDrdjncmScS+cOLOj+G3zPYK0QMJoYz7+Dc4AqSDGOrRMBk+I3G60vUXR1V2JnFaS
	 IbA2AOMwVy/JroqmAd38PR5QHD88hBTaUi0fj8nEHFjgwJrTUQdEnuhPH88CoyvUMlYHv
	 Bgoe1lWeP5Ri5NA5ImM5P43jX38igL5mrgpNxnI1u7dye3UqolXullw0g2Qc6mDnOvL+P
	 etbLB87fTUHrnrro1/etEzrd0YGphuNfdJa5AeIlGZuq2rRAGDENa73ZUwBi5aj5X1A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793010912;
	bh=xPgnR6WlNnIAlWe/WRSk/VG/cVqTKRHe35LB+jQDVRE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O3SUzboc6NElV9IsBVin8Yp+84Ear5c9tzjCqG7O7lcopm1zbfSNH7l5nQj0JBQYr
	 xou03hqlIGao1Sb/a2+yWO78d2umvS+6uFWzHVzFV059gshrou14vYcunqiKxO/HxQ
	 dA+N51fX+Ufi9PdH6oSBjehnP1XCOkWOkbbZOce99i8U63HH9V95gIZ73Pmqqn6AcC
	 zZjyoQg4gAi52rIJT4CCfNLu88Uf52c5mUKJT9mWLXRDppc8HMTjQpMBRAfmjHPPu3
	 qV35NM3sT1vv0Rey0iwheVgxe9Q7kI8QF9EQKvl/LW3UoauMOvnCZ2MFSfI4Bu935O
	 cXK7ro9R3hGXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3386280E27;
	Mon, 26 Oct 2026 10:35:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84012356
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6994D400F8
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzWxchNtcTCW for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 10:35:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AC2DB40072
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793010908;
 b=ZenU3st4MMNB/aOXKkadJrEFNulJ8DccDfW05jRqwbO10BWGgB3/ulrdtEF0254V4Gbd
 oFLw9DcHlbj/00c+EsWiy9KbzHRj/6UOMQhcUw4KarhyGVau/wmB2Lcm4+k6s0od28DoY
 Fge+6F2kbwkLNry/o8xVkiL63OFu/iVEScgx5MOtTCt/k515/E1PoXY+NRv1s2UhVnCJF
 HL7GQExj4V+mvGT3fwEDy4wO0o1uOG/ub3l/VYenIs0EUdiuFZ2Vsk1v3eyt+M4w506W0
 zLdTgTq4PMp5iWCrs016VKrOq9pJ6I3M/fp99xstQIVXfF7wkDLUCe0RJgHGrwKE5aQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793010908;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OSf0qRfvgf818+j+MiHGlsvspX1wOeyLG5klFa3UpuU=;
 b=FxbizGqZWo2+YH7IIcGbMFvxjA8hs05Vqbs35XM5RV546ibqu6FfHFmOmC3eOBXmrs/d
 qyUNKtaxtdXSZq49TtXFzY8Lp2cdcQfuZcy5X55oPCtvp2YgXuGgQF1XCnhod+CfXNVIt
 GW3gW5QaUej+wsIZSE1sVbBMyT9xLDBEhvSTU3TiL3Qn6A/8W5OY0lesu4/paWfhB5o5F
 +4tGz4Xri6T/w1XMwC9AmznGtIk6ts0s8KMOUVimvzif7AkoWaVEtenNFA1akjF1kDxZ5
 mN2qYlzFqRWJe4pvGh01/2HqmOTvw6PIeNX7EqHC3a0bJujLLQQ9i0riyhAofiU/b9A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC2DB40072
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:35:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C66AE9CF7E; Mon, 26 Oct 2026 10:33:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 11:34:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40a0fd471abd134f73db3749a885e4abd84e0308
X-Git-Newrev: 571a3c64f4abe1e433338bf83dfa8d6adb7633ae
X-Patchwork-Hint: ignore
Message-Id: <20261026103342.C66AE9CF7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openscap: bump to version 1.4.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0191927070600049002=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0191927070600049002==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/571a3c64f4abe1e433338bf83dfa8d6adb7633ae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog is available at
https://github.com/OpenSCAP/openscap/releases/tag/1.4.6

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openscap/openscap.hash | 8 ++++----
 package/openscap/openscap.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openscap/openscap.hash b/package/openscap/openscap.hash
index 60b34287f3..74cd13bac4 100644
--- a/package/openscap/openscap.hash
+++ b/package/openscap/openscap.hash
@@ -1,6 +1,6 @@
-# From https://github.com/OpenSCAP/openscap/releases/tag/1.4.5
-sha256  f4fc0a54b50441b3c6bb3527c292345cdb3bea16a9d23435292beb508eb96e47  openscap-1.4.5.tar.gz
-# From https://github.com/OpenSCAP/openscap/releases/download/1.4.5/openscap-1.4.5.tar.gz.sha512
-sha512  cb39e53a5cfe8e0bf69418f04ff2175e2579656620d59ae84bab4de482bcb35a58580d598f86dfdfc7613bb7c1c37dd99aa9c9bbb8ff015f4772ad62fecd6267  openscap-1.4.5.tar.gz
+# From https://github.com/OpenSCAP/openscap/releases/tag/1.4.6
+sha256  7c6064ea52bc0002a21ba8d49e33bb25f55c388a06ba60b3c5ba02783b8acf8e  openscap-1.4.6.tar.gz
+# From https://github.com/OpenSCAP/openscap/releases/download/1.4.6/openscap-1.4.6.tar.gz.sha512
+sha512  4f4008ab6505bc4f4a68d2c15611062f3c41762f5dd37a02fcf1f37a5415776c0d52b4f32b3289adb4b22d8f82a8921fc59362a3cd130905fb70cd68dea96325  openscap-1.4.6.tar.gz
 # Locally computed
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/openscap/openscap.mk b/package/openscap/openscap.mk
index feb70048ed..d90e8cbdd5 100644
--- a/package/openscap/openscap.mk
+++ b/package/openscap/openscap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSCAP_VERSION = 1.4.5
+OPENSCAP_VERSION = 1.4.6
 OPENSCAP_SITE = https://github.com/OpenSCAP/openscap/releases/download/$(OPENSCAP_VERSION)
 OPENSCAP_LICENSE = LGPL-2.1+
 OPENSCAP_LICENSE_FILES = COPYING

--===============0191927070600049002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0191927070600049002==--
