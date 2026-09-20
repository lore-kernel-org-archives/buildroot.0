Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844D8C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 525B540EEB;
	Sun, 20 Sep 2026 14:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NK-SYGTVYoAv; Sun, 20 Sep 2026 14:57:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6EB6240ED4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916222;
	b=G0ZCjIFYPOwVJ87b3v3T/P8aRE4vyt2C10TpwP8mfyRtMI/ZlkAA/BVKItjuK42tqdNT
	 A7WoglRcyTt5Bt2FDjRkYCpX24fs6SdTIcBynlL1V8/jiaB85CjA4jgVFPT3AjXmduL7F
	 EkgM5yG7AYUcndgtkMfbGGhIXR76VRZiYeEUHhoFTqznDkeXRlSyre9KRBhuhsanISm2H
	 nbbOqOUWzOz+fkF/u0sO7tdjiV/uz7nxL47kn3onbWQAAQArsOyDfWd/VpO6ddVsEwQYM
	 UjEDTV/mSjuX4nHHkMJN2g7zbqjYMo7qnzo3NBVCG1RkWoucVyzLd8OuQaDNQzYeIPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916222;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fpVOd1A/MRbpaDgz2JJ+Vwh1fhT32ciayDeIDpluHzk=;
	b=rg7mLpKlQhBwHQkh277TZMfv8lkVkH8TB/pdmJT5oaIsIZ/JLcCKbnZBIXFr2sPGTbUe
	 tMHQ5Zs3CiK2q22H4nLAjLfI645MKsRbFtfnfY68Tsef+5lZUexIRmntCHa22hWkE1+/p
	 nw/tIHRYEvuBddTg2uzry3dObBaQv0Z5vf3UBySGAIroM8K148zuxI5iSnavsuadMsa3r
	 7bxWoRx8nch8Fzr2qCxux4vRnrxjdxfnDboJCFD6+BMM+m1Jb+j07hCAq9/vsiWxZO/6d
	 38jNeNTSJ+kKb4pL/YGrWAZy4A6QjMfyrITddBcSgDZev6VxvQD5XveFgVg3Bdu9Crw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916222;
	bh=fpVOd1A/MRbpaDgz2JJ+Vwh1fhT32ciayDeIDpluHzk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DTWbqnCh8Fly7JwC10YB2z15AncdOEevVPb84n8FbcgIzYL1t04Sqqjgnw6rabK+k
	 xHoMb51vqDOA8wofPkTa0siApYUFXPozaFP7lRgScH76PRMhmEhLBD3UDas2zrPXg2
	 Zc8a+WId8G+dxM1sp33ZK4IE2X/Yb73pI5kN4NI7GX0QdKX6K26dIi90NzhJ3SdBCz
	 PUGLecHxKLhdxx7yoX88zyjBafLrHy73EtxXqC+eSDb5eWHxbn1cO3xrGG+C/m/oLE
	 madv7DVQlJKBlseaa+PnQjc/sdCK/fl6k83FL9SvhM7PACjXeR1iKMEkL9OD1280fv
	 oa+JDbC3Hjk/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EB6240ED4;
	Sun, 20 Sep 2026 14:57:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CBA724D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E2954002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MvRkaQB8oUgW for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:56:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4887D40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916219;
 b=qByuRrt70Fo+fWT2etWRskhRIGFjAsHXz5dRluKjok5SVD8ydaLphAWIOIcp5AfW+2QP
 nO9Ok2zx0ptkb84rnrYlJBTnGYQiHc22S9yddQH2hWRpgnorakcBMsGUD8PsGXlQzzO2+
 pp3KGjo9gaegnPTJgi3Mias/4FY8QkjVp2DVqPcfaz55nQ041i4p8+KKvgo7DO9RxMofX
 ZD0io/Gxy38FhErkSoTdn90elrneCwD2MJ+d5Axo1SGkCKC9LisPyoTKYksBiFtj2soRI
 nh/SsJuddmEpA1vY0Z3Q4Hz2Zuwfb/zS9v5qKocD0x+aBJoA17An4I2lKV6c973RdaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916219;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=OKN+zq+s0ezsuRpVS7QTYc0bNz6nRlCMaQ6LL22JouI=;
 b=lFW3dHwuELrjABtBNkaL/Z0R1sp1+Dm/tyRsmxnozqqcl1WSZN5GdDhMdAfc8AgvUzlq
 SfI3ziCfix5/LB28+ZikHvDyNlQdA6wo5QLFkbo9H2bx8tvaiiQa1hckr5o6yqGwGLAIf
 My3owORnRusFfOTeKhjJqyWAosw0w9qk8QRIEgvoAolhJ9MUbAlynkh2cyULRiI1eRxAA
 FwsttK9qqxe8MJ9OxCbwr2IxByypc4xeDwsdKA9oqEpXf9DH3+joPDRrusot1Z9YiHLMy
 5P4hKesMS1dY6g2e9rHubwHymaSfTVLAnyzC9MetUetp4s5XuSloVD269SkF85scfqg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=eWN1i6OS; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=eWN1i6OS
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4887D40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915506;
 bh=OKN+zq+s0ezsuRpVS7QTYc0bNz6nRlCMaQ6LL22JouI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=eWN1i6OSGlp9fVHs/0dUGAWX1EpaHJ2mUcOBiLwwXWSYTShQTYxHrqyCuCUgKkyFU
 SwloZlX5IVTaa7v1U/HcSmAGIKNaALLmp8rQnSaqKkdlHetlm1aypOfz0HOWcPQg2B
 Gp2eUhRgVc+ZrsFGG25J3rvHXPbrETRjZe+knZPcyuQ50ngAO+HHZHe+KCuy435a9b
 xRVinOgbRN4Di2dNdO2/8by30iIpuPjB5JtYeTnAZhU26D4Wi0VuQSbt3ogZQX/Ve1
 MLb7KG+tzDsZdExGldN40Blu4tnPIGvNYqrQfkEAzBeZHvjVItydEIZGmuNtqtbmk4
 Qcs0+Dbuq3DTg==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:/T3Eq5LR7Ar/fsyXX4bQXYGcV0ZE9Wf1c1wPbDRdZFcpZHb1+FMDbAHJpRGmcTLSZR7h4ObLxrmg3T/vzGbskNNDwCfyaAJqj5OYRc/eggmojO0kCsVcUQwsXFOlRY6zPL0BsRyF1RHX4EhbyFmnhuXkb9yNqUEFq7GJCeXjLesZLOY2sjWUC5AM9EaGQ/sQ52EGKrjvSKSIraYtSsXJ7refIEWnOOvm+H1VQ91G6PXb4fatySxz3qaGCqaF1tMxnStKqudnltqs1a55o1uKmUOr0+wEMq3bXsfRoAyJKzlPlHrAbuI87PLS93PbkRbTSmLzZSWMs3pEIKkeiJr+B1Bi4T9YKD7BX/uywfsoTY9bRjv1i/RoSuKo84Apg3gb9rs7ET29l3QKnnV15HBiyy7BHfIcVmdbMHk77st1BOC0pmaHhWxUOX4kKy/DSbVnAKXnIqNMgYaJGNYuWX3lM5iJl9W3vTvfTtxEYMv+/N0WBOR0R4RqNMX14Z6PIN4c5sh2UjN3NlBwrgU8qXHT6YLtDb82H81MPxgR6exgEcSsza1aZIvwByb0JS476NOQYuKGF9pNtmETi/HOCw05puXO+Yt/RR9HXq+Q+p1HvGnZej
 qhVWp89fn46MWD73zljQ21LkHE
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 177ADA4C48B2
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imn-000000000hB-3DJR
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:23 +0200
Message-ID: <20260920144428.3009612-63-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v4 62/66] package/trousers: Fix build with
 OpenSSL 4.0.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/trousers/0004-openssl4.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/trousers/0004-openssl4.patch

diff --git a/package/trousers/0004-openssl4.patch b/package/trousers/0004-openssl4.patch
new file mode 100644
index 0000000000..5ef6cb19b0
--- /dev/null
+++ b/package/trousers/0004-openssl4.patch
@@ -0,0 +1,26 @@
+Description: Fix for OpenSSL4 compatibility
+ Replace direct access to opaque ASN1_OCTET_STRING->data field with
+ ASN1_STRING_get0_data() accessor. ASN1_STRING is fully opaque in OpenSSL 4.0.
+Author: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Bug-Ubuntu: https://bugs.launchpad.net/bugs/2155003
+Bug-Debian: https://bugs.debian.org/1138451
+Forwarded: no
+
+Patch downloaded from Debian:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1138451#12
+
+Upstream: https://sourceforge.net/p/trousers/bugs/240/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/src/tspi/tspi_asn1.c
++++ b/src/tspi/tspi_asn1.c
+@@ -237,7 +237,7 @@
+ 
+ 	if (*rawBlobSize != 0) {
+ 		if (decBlobSize <= *rawBlobSize) {
+-			memcpy(rawBlob, tssBlob->blob->data, decBlobSize);
++			memcpy(rawBlob, ASN1_STRING_get0_data(tssBlob->blob), decBlobSize);
+ 		}
+ 		else {
+ 			TSS_BLOB_free(tssBlob);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
