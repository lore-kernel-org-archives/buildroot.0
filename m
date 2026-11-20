Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC3F606A339
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 06:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WcGjTGoZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B22B60D8E;
	Fri, 20 Nov 2026 06:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyIJmPlr9TCL; Fri, 20 Nov 2026 06:22:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B18AF6070F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795155723;
	b=k61HIVZ6LqkxY5aczNthSihfpMVQLeHgkczAqB3hoZYl3JfFNr6i3yVXVwhAS9nFl+uH
	 MKzYYYdLIBGr60oHKmYIjPsWiIY0AGHCwZS5rCRIbPgE+fz1FTwh3aIMcGIr1Q5NOcn81
	 xeZkiz1X9CAKGEEBCJl2z/zRlqYJ6AvbC9FNmrrsbs51paVjnNLXsNthviIuB+48rJGD2
	 i1k48muaq2fbRElsx6coyZpW44cSGPWyHNNpbNw4PXtpbM6XqL7J3rTSY3XIS4vMW1xsB
	 M7IRCdib5XC4ltA/6pmHjAQ/HWIJJIFwBLFRKEGqrlaBaT/rHPqcIqxWw81NITkztNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795155723;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:X-Mailru-Src:X-7564579A:
	 X-77F55803:X-7FA49CB5:X-C1DE0DAB:X-C8649E89:X-D57D3AED:
	 X-Mailru-Sender:X-Mras:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=c3lr31jT8cXXk8QVPk0nwsTUrWdz37bj9dibyqJJSII=;
	b=pPDS0u+Ph9xRRsBgkAmmABRG9rdYMX8mX08qPP4huUuZt0LbgIyJfjb1r5jFlTvmqG77
	 bmtAI4vI85hTE2LutTvce35PurhV3DQYBpGObU7Fc3NYaXWqYbmvsWzc/wTLoG1IxqyVu
	 rNgISQE86PpR7PUtG2d2c0vMWjtX5s6pS8XKuuvaNuX/8DNMLK1mSK417kVBvALdlk11j
	 IJCn47bW39RVwS9fzOiZpr7AwS6sbByE0hp8LADfI0ANXExOauTLcw+ooEZF/Fmpa2unN
	 TqDORnBjQ2gDmqtUNz1LxU/eJKf1MplJhzFotmdja6wxqa8Scu2PvmKnEnhZZk3EvKQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795155723;
	bh=c3lr31jT8cXXk8QVPk0nwsTUrWdz37bj9dibyqJJSII=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=WcGjTGoZbzcN/bQpeQrJ4omukyNyuRzTmuoZ1wOOdRmuHf0nI0C3L6EnLCg8mnE7h
	 WmfFZ7kgAHbS1VQPtGYShhXc0qBUoYfEEAqDaArifDUIxiWR0R88UyULMXOEPasBAR
	 K6jLIKcoJcAyra8DR7tE6TKQqzjOK+/Ecf8FnRsoA7zqh3uCcZaWREoH8Hq6jkwYEd
	 vQaPO3EQEXSlbFq+jyjhrQCfVJ7caIMdHPAF5pih4nmHphd8Sj8gI8W3CpXQApcjB9
	 J4M3z7GOrJWny4cdHqgVpB9JJEnQ+fjsZO7O2eXM1GcSNKFtuNK6XUmhgLhGJko8Ey
	 0pW2ctdcLb/aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B18AF6070F;
	Fri, 20 Nov 2026 06:22:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D59C1C9
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E9FB81570
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZHE1mqYSdTd for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 06:22:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 211578159C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.176;
 helo=send81.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send81.i.mail.ru (send81.i.mail.ru [89.221.237.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 211578159C
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:21:58 +0000 (UTC)
Received: by exim-smtp-56bb8ff957-dctjt with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1xUI0R-00000000BiR-11BD; Fri, 20 Nov 2026 09:21:55 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 20 Nov 2026 09:21:53 +0300
Message-ID: <20261120062153.211918-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9749DDC91F62168F9AC432E70D1E5EF8459BF4BCE1FC329EB182A05F538085040810539CB2C7AE65B3DE06ABAFEAF6705A253B0545247D95477953514E24547C0F92BFEA5F0ACBE40
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7859DCCA7D399BD20EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B27E25E6EBD5C3EB0A2E070BE324C7D3C4CFD04AECAFBCD1A5BB0A4F435E46E6718B35066C979671628AA50765F79006370BDD70ABAC747F53389733CBF5DBD5E9D5E8D9A59859A8B6BAEE21E69E3F105CCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE75A9E79F66F1C28F3731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A55DD4CC04E475EF4F5002B1117B3ED696F2C8CEB1DFA1980A3E67C18142C611B7823CB91A9FED034534781492E4B8EEADF4F3DF47829F65C7C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659F111C86AE03943466EF8A751342EC07D2B761963C3B3ED5DD6794D8EED3E96A5D7D78D334E495AFCB8341EE9D5BE9A0AE978B1A52E8997741247BA088C1267314F5DA68F36BA99018CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4ZrlAo0bq3TDyw5v+G6YiroYwGoDeJA0nh9Q=
X-Mailru-Sender: 689FA8AB762F73937C9FA53A4753B3138D0ED0EF51B2791AE37C3597EF1135CCF0C68FEBBC3FC08C90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.15.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changelog: https://github.com/libgeos/geos/releases/tag/3.15.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 0441b89426..213d709c37 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3c20919cda9a505db07b5216baa980bacdaa0702da715b43f176fb07eff7e716  geos-3.14.1.tar.bz2
+sha256  d5e5192a686d065eaed082de14dd26244c5c8e02bff16b2c6cce3265f648e00e  geos-3.15.0.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index cc34ba2aca..d3c683336f 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.14.1
+LIBGEOS_VERSION = 3.15.0
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
