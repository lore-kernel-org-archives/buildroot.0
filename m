Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC21C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85D8F60619;
	Sun, 20 Sep 2026 14:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ThgkHQvpCEm; Sun, 20 Sep 2026 14:49:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A46F360736
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915753;
	b=Un5jlpMtMLtYyHTEY2b+hAovQMGnZzKC9ThJbtHOMf+GkgOm8TGIln8d355QOCZEmG9s
	 X9qarFSdMs3kah0X+UfeT9qIlLcZKOqMmMWOUCsKnko2j6zyg/V4RZbbN8oc+l539YFQq
	 02YGh+EmfHYcY9EP0hPJi5tplPO+KhESaSI/1O2LGUnvmN2/v9aUhj5yl5Bn/TNYTxVtq
	 MzsnHXsq0qbdPl0fu4rjVXloKZa2J6Zm4ryb+jgYaFyCDLS4XPduVhlARPBEIb5uFLZUj
	 z2epL0DxPO7SZzD2/enLwJJZzj6OdP5R7umPZThxd+IaZBJf4Q/u7JwlzFueLZlTscQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915753;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	b=IN7hD+T9iyZIWzJkQJ2DPdBLGUOEvcClmNjs1oHIGPg+SdUA9j9slzgLW10QdrBXNyxS
	 PtnbuL42GwjgZnRQMaEDOvb5+afQ7BeCxhqkeBHsEI5cvfV6ylp1o6uEpbVCbT2fGcMnn
	 wZ21tHcF9gbJKjMjO1N1sGGOHZMlbnryDwEVF37IbwEF3I1VtcETlJ4NnhBUqq2wC5Gts
	 UUS9GSsc6RG82oocBwsXgZV/Mrf/1BzL9osOJ8YMAzUG+7asuavBHQh65I2rV5t0j5tHP
	 KqRg2/92gi6M0rm4gQJEo7cwV3q51dgrgus+E6a6WBSVQ04g47V32uZ/i5QxhIZPVHg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915753;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0Tv/a1EH290KDSMN3p9cOW4x8AOmKVY5Eqf7L0OnISP0DQPDvAJT9FclTr5jIMlV
	 UsQ7EVvjUumqynGp+vO9SxINgtlNiVgzJClqVBfDXDhMfHd+H2AjEoHNbB7horiIYO
	 RlTBsagnfX7vGjj66p5lkIoAJefTE/hQSTQu202Ixx9AbkkymyugwPorHJbZ2h9Aj1
	 qnTVhxHHirsv+tA1SevBOCCxE65ZKMAPZIylrpRjp+D6Sm84q5lFK0LMyV4v7GsUl6
	 NAxH57GrD0Gw5PDKJmeH1BCjoDsizDlpdzGgz8FpLlrKiLdW5eMUv5f70EsqF09VBE
	 1etRjKJ4KO+yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A46F360736;
	Sun, 20 Sep 2026 14:49:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C77DF37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4E7740A93
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-QrBlkVq8mb for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:49:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BCC6B40A92
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915751;
 b=B093WtaqqG+IIKHoHhzxxJ5VRh9JICLxTQzmw30YTfpE5bUQWOEC9bavqqLIn23JrRlH
 tJnwSJeebvsHUu8oBRorJ29i8RTJHD7gxsJX8hhv+5i0Elxi3rKukqxqTtT+ywQ7Rk+WK
 we3XlPUWqIozJo7Y0E/1voYYRqFyK3WceCoNRZm8hvpDP+UcsnQGHWpPxtAiHi+z5EbD1
 3GeI48o1gPiSbpHd6T6MkOhynhbEpIwjZAI9vi9MpGxHgqyxemKyZuJ/njNQ8LL5cuCBY
 c+/C9LXajtN1+A/AExBsN6ITIK20c0LE4N5GH9iWuOJi00CZRAnii1ge/vTiJ3/48qQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915751;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 b=gA7r/U1aDRyiGT1j4F5QsbwCLIxrAo5yTfvqYmAwit04H5LggYOiz2s5xygxk6V/5EL+
 hPYUAWLsiyTgSin89oqwznX7pUU4PuhKGE3I/tCSWtUi0cBAQj42vtZM0hHhY+SXnYcSG
 N+gz2Oc5V5eKTLSeMLEmiWAm4V6RTeJDCDM5BIB7K953nKn4h+C/4T+Ns11zlFGgDhvHo
 ie9XGcUWpN46245dMAtQT31gZzJtMWapbqFvATeHwoInnwapL+UHe3ab898O1T4d8gz+A
 A/SPDOugjM35ZYKUmtXe+jxCTRSLN+OrOLoFuztijDvfTSU4vhU0NStA0T5G7+0bH6g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=q1sXVq4S; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=q1sXVq4S
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCC6B40A92
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915502;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=q1sXVq4SXdntTby/Q0aSk4a/ZNjfAOLzEyyFwdn5VhqSywM41XzImD0bsdNN1jTl2
 BRmIX2ShTWjGEEiop7k4vgucb1oPaH4J85mOXibyTUnzYhDkQgNJeQXKAuGf3vUpTT
 CD1SGWIEeIbU8dmS2LMPV5MHNlZHCdKiNZX3t6BAVpaDfnfJeVw/efUNYRfObQJwgK
 Gz9q3nj+mSVSrNuQTpcBOvoMuTKuTiSO/y1Web2LDCGQo15hXeyrVuMUWXKfi5UuYT
 zws38K8RRCaGFaE42wIi5MokBKlHU6xXAdBVSnTYlGAqmRhuwaejAmXdMeerUBYoH+
 Ch1gKBC/MrBwQ==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:ByRPh9n9VLEdVoVV78nU2WiSOt52plNrdyoFAZS/s3cNqf+JCjOIEGYPCf2t0o/yo5QG+id3P6Bfq+WWjjlM0/pahcGUvoHbXcvwpbnsU+XIyUDvEy5js7w59JRXOtslPPB0Rpgx7dYQ9G/NgzuJUBwWwh+ZpoomRp2Dmvh1MEdap0IBraz6yvbgrfIocugjvqolmM+gcshy7YNsqckva9bz0u7s3zIqjzlEKksbbngVNiIkwnHS5i9U4VExnKlS6oKcT16P8W/bPbzd5RNuzkBaDRavZi5WE+pVazED7+ZFPB8fRCzC3YV7h9lMdoc3uqsz//BK006PNBEzNSLT/emIoC9S3dMTupY9FCkbRjVYOKIzluP/pe7Bi84luf/aXL9M7tf7LOwIkVOctBNhGT60Yps9kBhHkhXdiKmljjGKdmntyoD5OVY8X0x1CeCw4RU5h6k0xjt9tj1AROw0QfyHjY+3rlzTle5YrJAwrmq2kj0zdhichXBcivXVpYjT5g6mXEd73W4Wi42yBcx+SMLgs+nwRjmAknaduH/Nsqqwf3tFGY3zO8r437NhwT/fGd7qPUmTWMi6C5ECC06dKWma4iXajFQ=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5B89DA4C4876
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imh-000000000hB-3pTT
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:45 +0200
Message-ID: <20260920144428.3009612-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 24/66] package/apache: Add support for
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
 .../0004-modules-md-Merge-from-icing-md.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/apache/0004-modules-md-Merge-from-icing-md.patch

diff --git a/package/apache/0004-modules-md-Merge-from-icing-md.patch b/package/apache/0004-modules-md-Merge-from-icing-md.patch
new file mode 100644
index 0000000000..b4f04ba47b
--- /dev/null
+++ b/package/apache/0004-modules-md-Merge-from-icing-md.patch
@@ -0,0 +1,57 @@
+From d534e42b07969755b27eff2892ea56cfd909f063 Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@apache.org>
+Date: Tue, 9 Jun 2026 06:44:42 +0000
+Subject: [PATCH] * modules/md: Merge from icing/md -
+
+https://github.com/icing/mod_md/commit/9fd90380db0722f0ccc14ff1c4da0ca21d4da75c
+
+Add OpenSSL 4.0 compatibility:
+
+* Use getters instead of direct member access.
+
+* Struct was made opaque in OpenSSL 4. Getters exist since OpenSSL 1.1.0.
+
+* Keep OpenSSL 1.0.2 compatibility.
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1935161 13f79535-47bb-0310-9956-ffa450edef68
+
+Upstream: https://github.com/apache/httpd/commit/d534e42b07969755b27eff2892ea56cfd909f063
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/md/md_ocsp.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/modules/md/md_ocsp.c b/modules/md/md_ocsp.c
+index aee799a7b3..2e7f14dff3 100644
+--- a/modules/md/md_ocsp.c
++++ b/modules/md/md_ocsp.c
+@@ -533,13 +533,23 @@ static const char *certid_summary(const OCSP_CERTID *certid, apr_pool_t *p)
+     serial = issuer = key = "???";
+     OCSP_id_get0_info(&aname_hash, &amd_nid, &akey_hash, &aserial, (OCSP_CERTID*)certid);
+     if (aname_hash) {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+         data.len = (apr_size_t)aname_hash->length;
+         data.data = (const char*)aname_hash->data;
++#else
++        data.len = (apr_size_t)ASN1_STRING_length(aname_hash);
++        data.data = (const char*)ASN1_STRING_get0_data(aname_hash);
++#endif
+         md_data_to_hex(&issuer, 0, p, &data);
+     }
+     if (akey_hash) {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+         data.len = (apr_size_t)akey_hash->length;
+         data.data = (const char*)akey_hash->data;
++#else
++        data.len = (apr_size_t)ASN1_STRING_length(akey_hash);
++        data.data = (const char*)ASN1_STRING_get0_data(akey_hash);
++#endif
+         md_data_to_hex(&key, 0, p, &data);
+     }
+     if (aserial) {
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
