Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD97C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 20:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A07E06F4DE;
	Thu,  2 Dec 2021 20:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oPDuyRZ0wSyh; Thu,  2 Dec 2021 20:51:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CBE36F4D9;
	Thu,  2 Dec 2021 20:51:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 611481BF343
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 20:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DA9883FA8
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 20:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inbox.ru header.b="kQmLKjC8";
 dkim=pass (2048-bit key) header.d=inbox.ru header.b="T1Iz+x7R"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MwiXrbrHAdLy for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 20:51:55 +0000 (UTC)
X-Greylist: delayed 00:19:32 by SQLgrey-1.8.0
Received: from fallback21.mail.ru (fallback21.m.smailru.net [94.100.176.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F409F83FA7
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 20:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=cd7m96JloHXqIjCDtGAoI5KJzLtHw/qOfZfyIfe1PwY=; 
 t=1638478315;x=1639083715; 
 b=kQmLKjC8A9uwAlNvSDh1Q9LWJJcGexm2uGKCWPbJ5BgK3abolTlsf2B9Rrdiz8u/XsDIjHktpxlFKbfr0VARPh1O0sd5a+/IroxA3ekxm4zJCqU6ekgG9UW7FTTurBStC5tWnS1KBNSu7URQbiOi9U/WJZ4kb+cUIiCGop3SDts=;
Received: from [10.161.55.49] (port=53656 helo=smtpng1.i.mail.ru)
 by fallback21.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1msskd-0004UV-QQ
 for buildroot@buildroot.org; Thu, 02 Dec 2021 23:32:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=cd7m96JloHXqIjCDtGAoI5KJzLtHw/qOfZfyIfe1PwY=; 
 t=1638477139;x=1639082539; 
 b=T1Iz+x7RZE1fwCVQjzrpVjwUM23rIMpA/NMBD1It1i+KZfvjE9bO8Wq0J2LuqqXg4rcTFCTSJml684v//PyfdFI9itA3cCU9tWjLrmYvvWo50HrJOhk6WF6PIrCq20L4ImltFPM3twLbCy06PbDwRiIW7wzDPAJoc/3aAAwakh2qx3JNVSP3Pt54yXGK/kakU0W7TbpbW1lp3tvBlDDCRC7wwGefRwe0dTBoOQ8hyfuXxO1JY7Uq7S+EowvELo7Gb9bTZB1ZZXDPtURa7K9gsuQI5gsEi6AJ+Mf44rr++racBpQ4kATfY0HXyfKHWIrkp2RXPzoxbBP4Pab0jWRlBA==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1msskV-0003Bj-Eg; Thu, 02 Dec 2021 23:32:11 +0300
To: buildroot@buildroot.org
Date: Thu,  2 Dec 2021 23:31:54 +0300
Message-Id: <20211202203154.3571442-3-fido_max@inbox.ru>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211202203154.3571442-1-fido_max@inbox.ru>
References: <20211202203154.3571442-1-fido_max@inbox.ru>
MIME-Version: 1.0
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD93822B471089FF64DA800EFA0B45871060D552154ECD16BE5182A05F538085040B1FEA7F228F6F03060E12C9901DCE553AB57F9CD4E32B7F2E806229FDED2F1DC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7227E4400968B082FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376CE4E8B6A85920B98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A7CEECB53F7D7B4B96645CCCD69E3F326F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE77E7E81EEA8A9722B8941B15DA834481FA18204E546F3947C989FD0BDF65E50FBF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637F3E38EE449E3E2AE389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E73542F54486E6D6388DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CBD1FC2C1415E7E9DF1E7EC03E40E235918A2151DAAA041549C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EF197FFA0EFC27E0ACDC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3430FC2BC1B917F018B9221CFAAA0D57E3744F6B263175FEE469B8C3A0B3F0B5021CEBC3F9604D59B31D7E09C32AA3244C9FE48DF4E243DB00103EF5B29DB694067C0C08F7987826B9729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMMFVqzO9sR05zRr9DVkkvg==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5D6903F68D8AD364E83D5CFD5DAD4A9DA198CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 6242723A09DB00B4297D9AD4AAE60BCB73DCF6C1D8861912403EA7C376CDF3DC049FFFDB7839CE9E5E34638419BF5A1921EAAC58F8433D04EA18FA96E6855CC82AF91C7D76C12465
X-7FA49CB5: 0D63561A33F958A583ABEA32025174E8B2415EE5C42C7E2EA8E8D2DEA1E8EE89CACD7DF95DA8FC8BD5E8D9A59859A8B6668B94F0A65C3A0CCC7F00164DA146DAFE8445B8C89999728AA50765F79006375E736154DD9B2CBE389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8C15841AC4D79B974F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE7A9D141641BA1E09E731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CBD1FC2C1415E7E9D312449E8C8CB9490C4B1F2D164A7121B9C2B6934AE262D3EE7EAB7254005DCED8DA55E71E02F9FC08E8E86DC7131B365E7726E8460B7C23C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMMFVqzO9sR02qpyG9fDXyA==
X-Mailru-MI: 400800
X-Mailru-Sender: A5480F10D64C900538CFDDA562D7B4DA9893A35FE56E93C729DDBFF5F51B3B6A617D5758B347092CC099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CC77752E0C033A69E3453F38A29522196
X-Mras: Ok
Subject: [Buildroot] [PATCH/next 2/2] package/postgis: adjust libgeos
 dependency coments
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

Since 3.10.1 libgeos needs toolchain with threads support.
So add it to BR2_TOOLCHAIN_HAS_THREADS comment list.

libgeos depends on BR2_INSTALL_LIBSTDCPP, so add it to
BR2_INSTALL_LIBSTDCPP comment list.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 04705f7e16..2642115026 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_POSTGIS
 	bool "postgis"
 	depends on BR2_PACKAGE_POSTGRESQL_FULL
 	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
-	depends on BR2_INSTALL_LIBSTDCPP # proj
+	depends on BR2_INSTALL_LIBSTDCPP # libgeos, proj
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
-	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgeos, proj
 	depends on BR2_USE_WCHAR # libgeos, proj
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 # libgeos
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
