Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D24DC6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 06:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B2274156E;
	Mon, 13 Mar 2023 06:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B2274156E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OqZDR7XH7fzo; Mon, 13 Mar 2023 06:13:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC404155F;
	Mon, 13 Mar 2023 06:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EC404155F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A66141BF4DA
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 06:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ED754155F
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 06:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED754155F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lfu6MqXH4oKp for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 06:13:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F0AA41558
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F0AA41558
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 06:13:27 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pbbQz-0002hF-2d; Mon, 13 Mar 2023 09:13:25 +0300
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 09:13:23 +0300
Message-Id: <20230313061323.173744-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9BCEC41593EBD83570AA601AEA34798F762667CDDBDD24CB6182A05F53808504002462106159579BDA1B7BD5645319AEC794842050CE0A409EFA6154402761735
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AE28AD3C7270E452C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE74B44AB1D52BB6B9B8F08D7030A58E5AD1A62830130A00468AEEEE3FBA3A834EE7353EFBB55337566F06BC40FBA96F9629B589D6DBB570BC74626E0349ABB0DB11DF9E95F17B0083B26EA987F6312C9EC26055571C92BF10F618001F51B5FD3F9D2E47CDBA5A96583C09775C1D3CA48CF69BF13FED57427F1117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE74CF195F1528592878941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3C9BE88FFEDFA497A35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5486BF27ECE754F6944148DAA9BDB4214AD2112B2AFC46B8C4EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF505830FD47C92F6C63
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C2E47CA9A5606090DE04E77F59CD74914187574A3B654C16FDA3B86520E4267AA86E556D43BFA55D1D7E09C32AA3244C4B96ED4BF920F3E08142DA1699F6A182D9ADFF0C0BDB8D1F729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojN3wBDQf4j7MKclzIIKOTrQ==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF51742014EE7C452000D4BD35A8A35780D98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=7G8zeXztXhC1aLxwXitLDHp47DobmM2Xl/mBK8IojtI=; 
 t=1678688008;x=1678778008; 
 b=NuTptsK8+YIfDymXo851nrwG7Uv7DIQA92TIroZlAoL0XCCFeno43CWePifD9m0gUNIfZTbNc16V+7+7SC94miHFmPj5TBN6vO1LtrSAsBBLfIqG4TMwaijfAsdsd3KiuHfbG2TyBap47BFBQe61jAiqazUvwMFiihsJHhddAZU9lV4NUFI9du2IfxUe5rowWgpRSNpe3e/OxpDo8x9ZeHlrAydxtcTcdcrqCeUZOjPR9FQ9d81kWW+Bzq4ZfJVkCu/gokxsnM5pZtondYRApiNyOTbomJvJcOBjOcQ5bKSHUuxtYt5Dk/+NpOZuaYWGZ86DxxLxdnkcBqjDcZ2xCg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=NuTptsK8
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgresql: ignore CVE-2017-8806
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CVE-2017-8806 is related to postgresql-common package.
It is false positive for postgresql, so ignore it.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index a2aed9a2eb..e46622c0e7 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -19,6 +19,10 @@ POSTGRESQL_CONF_ENV = \
 POSTGRESQL_CONF_OPTS = --disable-rpath
 POSTGRESQL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
+# CVE-2017-8806 is related to postgresql-common package
+# It is false positive for postgresql
+POSTGRESQL_IGNORE_CVES += CVE-2017-8806
+
 # https://www.postgresql.org/docs/11/static/install-procedure.html:
 # "If you want to invoke the build from another makefile rather than
 # manually, you must unset MAKELEVEL or set it to zero"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
