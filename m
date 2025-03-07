Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3A0C19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 08:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4E6B414C8;
	Fri,  7 Mar 2025 08:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HbufpByTpiHe; Fri,  7 Mar 2025 08:37:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1654414BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1654414BE;
	Fri,  7 Mar 2025 08:37:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6252371F
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 08:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DC8C6100B
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 08:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhqSBw3fPs37 for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 08:37:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.103;
 helo=send264.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ACECF605D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACECF605D2
Received: from send264.i.mail.ru (send264.i.mail.ru [95.163.59.103])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACECF605D2
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 08:37:17 +0000 (UTC)
Received: by exim-smtp-8cb569c79-6dn7r with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tqTCj-000000007MO-0Z02; Fri, 07 Mar 2025 11:37:13 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri,  7 Mar 2025 11:37:10 +0300
Message-ID: <20250307083710.1699963-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9C8AED3E6A44DB6AB09B64268BF6FE0DD2AA28AB0457A3495182A05F53808504058854C489F40475D3DE06ABAFEAF670599B8BE2F457598631EACAA62D4B3045D73C1DF025D8865E1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7519D5B419DD3416AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375666B3C118DAE8E67002E95CA72D089B0D7C1E7B3F75EA32C454CEC636B407A7ED68EEF46B7454FC60B9742502CCDD46D0DEE16715F795C715CF6B57BC7E64490618DEB871D839B73339E8FC8737B5C224915519F706774CB6ACC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0F6FAE79CA2B8C2908941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C315AF0D0D4FC4FA3D35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A52A7EDDBD92604EB15002B1117B3ED6968E19B2E0D3008D93E99897350C7C491E823CB91A9FED034534781492E4B8EEAD81B3E0F64AD3EF57C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF7CE9D093C42C1605840D9799CB656CEA24616FF4DC6A2AD3CDD087EAB0070FCB7DB53F1827808597EDA8A7084F1AF31870D4C693BF1A2292217EAABB4CF15AA56E952BA50CD086C4111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVQiWK+2I7Y2sebyHoQrX58o=
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA21908301980EC2C77EBAA7AB643A5B97E305B12607FBF30CFF390DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=+VaCL7Pj/cIoZ+YhwS5k8oNl/rY3UD4DlHAjyUPfKto=; t=1741336637; x=1741426637; 
 b=VSsWpKadaxoQFczkQPs96KWVXB7cWLc+JAt1XGpTxzFWmY5E8wcTJ7xTpE/Yjy/taoNCSEX6Bc+
 hL+xAmWo8ASpgGM9Pxi6duupqMLvnDzP+lN1FrZ1ejTMlPUCuqdS3Ptzh1MzQKRaTifEI1UgCR5D/
 8xlYmhg4tClOLbBRxOFadoEzDLXAp6xlp/rIBAJSJY/7Fm31hh/TT9n4HvXBuzXOCKDjYUfVyjfa/
 A61vKUh7Ft7stQYKDxU38sCxpjl90zLedljE2w4tDEZ5idH6Fz/DHdeqp6sOm5BmptJiDFIZOFIcj
 jkomTuWBmW5h8jgYhFPEMNcS4yCJV6YzjOMw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=VSsWpKad
X-Mailman-Original-Authentication-Results: exim-smtp-8cb569c79-6dn7r; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgresql: fix build with external
 gettext
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

Postgresql fails to build with NLS enabled against uclibc/musl:
-------------------------------------------------------
/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.4.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: scram-common.c:(.text+0x65c): undefined reference to `libintl_gettext'
/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.4.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: scram-common.c:(.text+0x6cc): undefined reference to `libintl_gettext'
/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.4.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: scram-common.c:(.text+0x73c): undefined reference to `libintl_gettext'
-------------------------------------------------------

uclibc/musl toolchains use GNU gettext for NLS support.
So we need to link against external libintl.

Fixes: https://autobuild.buildroot.org/results/244f154aece46d02747b875faba4c51e7b5d0dc2/
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 2b6e78b941..7c023bb7aa 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -13,7 +13,7 @@ POSTGRESQL_CPE_ID_VENDOR = postgresql
 POSTGRESQL_SELINUX_MODULES = postgresql
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
-POSTGRESQL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+POSTGRESQL_LDFLAGS += $(TARGET_NLS_LIBS)
 # We have to force invalid paths for xmllint and xsltproc, otherwise
 # if detected they get used, even with -Ddocs=disabled and
 # -Ddocs_pdf=disabled, and it causes build failures
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
