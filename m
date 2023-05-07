Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C45C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EAE7400D6;
	Sun,  7 May 2023 21:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EAE7400D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-2Oh5lyn15B; Sun,  7 May 2023 21:35:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E980417BD;
	Sun,  7 May 2023 21:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E980417BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DD811BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB450821CD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB450821CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jcftDQZRAhGS for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:35:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A62D821AE
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn20815.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::815])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A62D821AE
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A87oPyCT04+Y9/S8avbLdM7Nxjhlaf41YY8TmW781FNOfZdYB1onZw73kXrdIuSR/xxoIK3gUaKNeb8P/cV0XRR38oT2j5JxhYtVPdlq1S4Cjl+/fTrZ3PtX4mW9lOnzUv7EMDnPG+yYSASUKgQrhbaloNMtI2EQxbTT8ih2KiRu7Uw3lJFDEZAjsjkx7Ck0TGJPJu6cy7u7pX9CnD5NWGt0b6o59TwFSEOwDCNMGjaAfDmjOGTllkoXu3snMkxg6iOjzEJZkemSCEqyOJdjfMPreW+VDSRMaByqyarSSDjl/R4dcydcg4fxnCdMa3CrqZi+EPZliHS5ch2NT4h4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EU8nh/shz/mVFJxalGWq0KczrRn7j9U9iXYanpVDIMk=;
 b=i7mGtf7DtNzVAc7FIf6RxZx5ZS50be7IOMCsf6a82eBSy5dGBL9SmlhtG/0cRXSgsXbb2yNKBFaxm89Iy7JJUf6bMlH0NGYbY5oGeKGihXT5T54HEwPtNuxi+S4n/WOQGBA3yUFtSNY5TfPN4fSEiaFgTfB5SGG2PNaYTWcO86cjtY1GUMwyMgKUNclOzrzMCkS1kKU06jpwuAMxwRgJYVUdLY8qlbEYFZitq94cBgXfiDWqxj8KmnSdXatCK8CeO5CaYm3cvRkirH/iaOQZVYl4vMGOBwkqLNLFOhFr9DkSvMlIX/g5JJDBQiyq+2+NEgvGxvCBxwJIpoxwxwOuZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by PH0P221MB0831.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Sun, 7 May
 2023 21:35:07 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6363.029; Sun, 7 May 2023
 21:35:07 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 17:34:30 -0400
Message-ID: <SN4P221MB06822FC17FE7B81EA017CF06A0709@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
In-Reply-To: <20230507213433.4128-1-james.d.knight@live.com>
References: <20230507213433.4128-1-james.d.knight@live.com>
X-TMN: [81iivAxDoi9R/viMCo0lD3AtDPYWFExG]
X-ClientProxiedBy: YQBPR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::20) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230507213433.4128-2-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|PH0P221MB0831:EE_
X-MS-Office365-Filtering-Correlation-Id: e6265083-3df8-458a-a285-08db4f42ed5e
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvtRtQtMOsBtDaMYSViNzYjv1lhXwhzQRi+49ytDFUqx4E9vEuaiyEv8Q3YOJcHSLN8IJjgmMr9R2bR6F9q2QjLMXYthpVTxjIVxKxTofExpHcYUmrExJiJIYXyIwt1m0kFzvkNTNIhec3ct702/3OW0D25LFJ4S9IlImsMx/9tw+KO7YbCj5Nv4qQ2q1iEyR3kdiiVS8tGKZeuMupbY0kcICTYoq+WEcQBpZW9MvVLgTilY/11+bLVzB9lm47+/bZqRvKY2/FgVdmiFSKoOHTwhCSxiRL4NBLj9fYYIeaBhxpKfsD6kq56ZScd1JwlKSvr62wSrMCzLjbifCz5yDlWuTBFZ2KpH4Isf/XcdA2m8DerlEpzmYYdGcVvCxsVG6QDW/NJT9WpgqVA5E6/SaBpOH+7GSzq6A5nj78Cds8cjRRblmvT7WP8Bqq0DbsxH1Q2IrDbUk7ur9gm4czIEPlvrMSopni8ERW3vMrUYr0f1OIWSoxUsh/F5eyVMsxFEQbQbv3Fu8gYYKEgt0CXaDduIpwUvhY55jNN9EwYQj63LbsuiO78V5dvuvydocdf8BP2BMGakKaZfPaiRvC4bSFMrqNIEKM4vDGHRo8SOKs9Rj1MyFuwb8oViQ34JL3I72ww192Iciga3vi6KjfkWd1Gqq3WNzqJ9LypGq/mxmYD3gbcEYBXKEEUvdPbCSsEVhfHcEyldb6+qbmym5XVRZj9BySMErQEUH40zD0XKtRlD9zySwBGPNAMyH//SRWPJuIs=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vUzVWASl+KLr/dLcKWn9Zzm1qOq+pTCMaHoQxbKwqZzbQNuFHI0VNX0n8O3RpTWA/HmsTt9CZq6Yjrf/bgzrABYTHl8siuk4ehnqupOH3VclKajstIt3SYEUh0m+BWWBrqF+e/MR71Ydl4hKRCDdx5OkvO2dCpvvTD/YnFe9JYT4IBP/sUJ4Uu/OHFFYXzaF4ushb+54qTTesXlt2gp2YhhqUSg5gr17y+Gs6DbosSEBD50LVGDuZyGM1oTsAHrgxVsLJIG4WVvPyyrg77ioSB6NLxab1kaG12iJrZTfmiq/AAgy/BCi9ma0KIkp9WFQmib2Br/THlxt2ISeKzSxTBJDelvpTgvMLjCrDk0xm7tyP2+sKq++Q2wZv1kdrhoxdIvuBTuBsd2/ye3OerCJlMnxfyRMlMlrSjOyzskZtFj4x5vXFYitMJo1RaOCSHKyQ9q7ey9ibKnCDijoZxk/wyoSvv6e8WfiyiREDtOPUgBwD/xMrzC9UESiijmM0uqRD99utLUpVvLJKDNQyhQG3LuMGTcaRPxOALiVlyBVVnDvYoGeezlbZcqPuNU+QKbQ7PcsJS52p1SC1vik8TeTcZJgfGYxUscDkkqV2Q53GahZIooo1iZfGVeLahF84Xqm
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nZszbgKYW7Ujfp1+cEUlJhexF7HT5TJOnzkVhjZT78jKskGKvy4wFGzTTUc6?=
 =?us-ascii?Q?ynx40d0bbyEfqAEsmQqgqdza5++RC5W/2b/tpcEWSpJH4zGvzaRHFxciRVIZ?=
 =?us-ascii?Q?X1xvvi1LF5adukeM7hvieEXUB/7SlCxkv1Lh0eyWrBzp7M4TMj45QKYzgue+?=
 =?us-ascii?Q?v9qGZiBzIRtEjEiYzyOe39AKLfnZAdiv6hawjDg22HVz/N2FnYWdhiDbHAjZ?=
 =?us-ascii?Q?UeLldQmAo31ydA1gZrE7ELcraDWoeir08RFqrKqNCDLvkuvuk/5JYiupZB1Y?=
 =?us-ascii?Q?zeFA4Cqwoe7akvAISiutVYAEyJw7BLrv9VIlTyAw8eXjdHyyIRk8/D1XAlyP?=
 =?us-ascii?Q?zU+Y0DEP66wybcYtDQIAm2Oad89DJJqqg2wUhJmnnxB6A2jvBHxz2aYAE64w?=
 =?us-ascii?Q?4RMqR5IROvG7YVt76aE35WIElK0ToKASlmRXef01S+UvqCuCwdQDHuJ7Fx0Z?=
 =?us-ascii?Q?DUizRD06NPTWUMiLZv1N53cSZUPwELKOkepdKeXn//r1A3eZm8cHe91yTDyF?=
 =?us-ascii?Q?7h7SLhwDCqz5NbvXn67k1Hw0XNj1rY4OFTyTpu0/BzJkSoYnJeD9ia2LB4hl?=
 =?us-ascii?Q?7CxpkGWY5pHo6DvXcdPHSY2fngkUvRD8iatqxlZ+An3XPUWKRLiB3tRaxo48?=
 =?us-ascii?Q?o6AGz3c1ZR1vvRZ3bbYPOEcbhLQA+Vs7FzJsJhmGxekjSwP8rX5LE/zTB+b6?=
 =?us-ascii?Q?loMT2EklGQ8lQa0cEBS80PSwzs7u96vWe+tmt16b0hPUNj6HIaldcUfx0UVO?=
 =?us-ascii?Q?JlRvOkSIxKn276sW437xx/OtPey2tZK54bNng7lMpJPwlk/KS98mR5CY5VZD?=
 =?us-ascii?Q?tFmfSPvnqh54cbJkReyFJIs9twddH+o69lsDGCuOYoPGEaexJX+SpY6E40Uw?=
 =?us-ascii?Q?2aP/83cjU9IHmJiuDvVU7Ra/CY9lFS5cLPNA73/jR5kgeoBT7qFwK+4NnyxN?=
 =?us-ascii?Q?JkY35N7COVaZGgTcsopa3lBc/TWbTmUfllZRmTZwOISbKuEN3AWmB2fgYKt6?=
 =?us-ascii?Q?IqkpSZHID+97O93KdQNwAYD8YNb7XRAoejJ2469Nf67SLhq1y1McE8x2Lbem?=
 =?us-ascii?Q?2ngGj70aSmJf0e9ZCpb6YD1cGuAFePJaTe+2BjEUS8LUUYA6XWUEem2I9/cX?=
 =?us-ascii?Q?hG8zmQmg6lR2OFEhUwoXIEHkZXvTpA5apaDTVcZ+s6aj6oXJAklLQ7nvJyxp?=
 =?us-ascii?Q?LClktc3L35n4wCywvceTw9whnLwrpdU0vxdJW0G8221suhDZkXgHDUv9Uhw?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e6265083-3df8-458a-a285-08db4f42ed5e
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2023 21:35:07.6090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0P221MB0831
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EU8nh/shz/mVFJxalGWq0KczrRn7j9U9iXYanpVDIMk=;
 b=Gs6klsmvlTWEOeC/tsoHpzc576/OX6EJ8P4v/gf4V8mxnjk8GYF6mEOmkkwtZISgBQc6Wc2TZAXRuyV4If21jMVbd2mEppVxg5PbSiQ12Dd138ceUPdOOkt09k+LRgmazKGYzIM5rk5rpcLP8/U8EmPg9tCBS8YOjPv6P8RCtIMgz1Vl21xZI4Yzq3jqHD1muL+GnFH0z7mZd6uV9m7ESpRmeCTV3Yr20Xc8r8dxklL+ZxO+x9pWyYnVpW/Vc/yZaykVDd7shz2KDO9Pe2ejq8MC0u5f7sNpmP2Gqkv/SxcGxplEDt8tscfQ6zXH7nIPS2+taeXdFMir5WQnXmCo8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=Gs6klsmv
Subject: [Buildroot] [PATCH v2 2/5] package/rpm: add more disabling options
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adding a series of feature-disable configurations of options introduced
over the recent versions, but where never added.

Signed-off-by: James Knight <james.d.knight@live.com>
---
Changes v1 -> v2:
  - New patch in v2, with changes from the original first patch.
---
 package/rpm/rpm.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 08bcb85ae41701a192330732984401d7092cd492..38e4ea2160c9e4e2b9bd05a038bca8ff35d1e296 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -29,7 +29,10 @@ RPM_SELINUX_MODULES = rpm
 RPM_CONF_OPTS = \
 	--disable-python \
 	--disable-rpath \
-	--with-gnu-ld
+	--with-gnu-ld \
+	--without-fapolicyd \
+	--without-fsverity \
+	--without-imaevm
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 RPM_DEPENDENCIES += acl
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
