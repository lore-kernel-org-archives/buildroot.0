Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5809CEDA68D
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 16:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1325040B24;
	Tue,  3 Mar 2026 16:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHkiC4M0jnsd; Tue,  3 Mar 2026 16:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F21D641B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772556032;
	bh=sS1B3RNK9elKvZKwZM/ldX1hE6H/2hjjYeFbQVggXHU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=dKzlUWUHncqCcivH9fWSD6gsQOk2Aq3sOSw+ofeCATvkEXD7Fy6ETBiacTCgJxnJc
	 e4eq5g3bMLwZmQF/KDQqM8//4Wo5xGO4pnkLQR09SQ3ILXuErt5Lkld+Gly6hlROlG
	 pu1c7jhr7Xt7zRj7VJSCCdJDV6WGBPj2ZLERf7kNe3hoG0RkOTz4i4mSjSSjPkauLa
	 bbXabFDt2hBXSu1yuyjwt2FtH4lb/MEYHzfJLCW6rxzGIStNFjC7tp6UIuKMhUgDUj
	 5otzRB/VcnK+nZVhauUJWeYAs0OEK5uonhbNy6O1WUQ91Pn31M3ejihd2Dt5LEknZT
	 DvT4skBEgvgBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F21D641B01;
	Tue,  3 Mar 2026 16:40:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CC52231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 16:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7265941B01
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 16:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJzrq3q_gCjc for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 16:40:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c214::1;
 helo=gvap278cu002.outbound.protection.outlook.com;
 envelope-from=martin.bachmann@designwerk.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E8DE40B24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E8DE40B24
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c214::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E8DE40B24
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 16:40:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2n5qxDhd225jNpTPPbdzIbkzlhVajP+BJBY/xG67CnUZrz3LolKIx/WPl+MYJDjfGzu6fokKUvLKGaDaGFLLUqDrRY5NZG7ZqY/urR3jQYinc3ttOoMZGQe2Ohh83/1O7lLHCNQwGnsUQCGeg98ZJWeO7xDTaJxPXJ4fBAoI9dEBp/jt7Y64SYABSUlRGXmxZZj9iOvZIN9qjOpTbFHZQrbsrlqIfQZ0lSn77MDSR3SGzb181HmLCVwVchqqQ8j3B+u8GpXkIP6PLO714OGb04NrjjlQs7nR8pmyY7nVtjrCyuMPFQ3FZaJcix6rso4Xox4Uq65hyvhGEFk44zl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Daef47utRQUg/ECZvAaok4JxrNBtNSiG/V6jXBndDsw=;
 b=DC+Gei+tdsxynuPpzRbkY1WyhylofQi79L5es+Rj1OMfxjE2Sefa+lojYFyMoaKLKSP1NquM8vqiDwYUQhSDlRe89likYOmXufO0NDGxTxbx0f9VjcZcDGNt5qEntOYlaBMMdJHEvzV91Z/a/n9YpCq3F9QaFUcLm3Dqrb8re3xVRpg1PnLcduYY+porxoSOkch3V5yu0Jup/0U68oPMpRq8b4/eTpI8M+l+igqzNTbj0akWTmARMpomwBz1pRkcXmUxNCAX161PI6KbjhSje74wKrkRet59LzHZcTXpZHT/OBzi9lHub9fpXSxcHWFsxdtUaiRcGS1OacydWGKxkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=designwerk.com; dmarc=pass action=none
 header.from=designwerk.com; dkim=pass header.d=designwerk.com; arc=none
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:42::7) by
 ZR1P278MB1487.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:99::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Tue, 3 Mar 2026 16:40:23 +0000
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900]) by ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 16:40:22 +0000
To: Martin Bachmann via buildroot <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] package/python-pyzmq: bump to version 27.1.0
Thread-Index: AdyrGz6bQbZd9aUyTpy70lnHwXqzOA==
Date: Tue, 3 Mar 2026 16:40:22 +0000
Message-ID: <ZR0P278MB08692A2F9F236892E04974FB8B7FA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ActionId=826ca66a-5b2b-4559-a4e5-ed0e35355d94;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ContentBits=0;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Enabled=true;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Method=Standard;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Name=defa4170-0d19-0005-0004-bc88714345d2;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SetDate=2026-03-03T14:35:55Z;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SiteId=5f12add6-5f96-40e3-ac41-2307f36545c9;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Tag=10, 3, 0, 1;
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0869:EE_|ZR1P278MB1487:EE_
x-ms-office365-filtering-correlation-id: 86bd7078-1af3-4e04-4f5e-08de7943908e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7142099003; 
x-microsoft-antispam-message-info: syUeGXxWTuvCVdpiJ8Pj0CksO0CqGxUljNekP48VnJkmB5TnYOnY+cIZa/5slJX3wZL+GS/lORXHaaE4aTwvCU/20Alzp1OJ1Gu417uLVHtSP2aTmfyR439YKzUIa95o8rT+WC5egnCouE0PCovkSmE3XZq99AfzXN+U4Li+7DSHA/ZtQFvrE9A0r5g9WspiDCohNzLseHZS/AM76ABB71NM7ua/oYzG3ahvxztnx/TIMZ+uO6wDsAOHQCOvX2MkDpmcqz7ww8/OHj82+/iA9IIMt9Z7hcy0upuWyGF1oNx7wkE/nlMa3JMm+2xoWRRagkiNk1g3j4xnZu7d2MWqogRGi+RlO2exbvM/FnQ90Yo/bBAcG7Ks+UYsiY5tBpPD2eFdadqdI1LZR3PRxILRjPM0b8H9+GKmOFN7Pphz9JWk+YCF7BEj5puvpt9XrAaURWa6N9MQ7hKTkk0TJuZSG2mIp+mVerDgKXlQX80/KrjXLpCpHQKMpzDZALTl8EQN7P8PnJUgI5bj6sDaJIhh4qNE3blGS83veWZ9+QWYFf5n3tICWOqNhiPVE5cXKjXLLS2n4eHLbN+7doRJiN5YzT7jUR5DQXTC8ND/gdEc93gPTzolF/IvQO2OrE0TwRSPg5obU7PsfANgsU1HrEgcWdl7k2rlGuqI3hibkgAnWyaGNxdVW1d8O50K6MvlgYh/t6Dzmqp5/Qz1AiL0qMpsSN9C6QU89SkjvwVf8OVRtA4Nu1NksfUwP5+3zFZPu91t
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7142099003); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7xj+cOBZG+PsOTzkA8kpU2Kj5lgZE9D8ShGt3ckzg3QweHITZlO1sniWtUIY?=
 =?us-ascii?Q?Fg0o4h1DBhBoCOFzErZod9cYnI5uyBYQKX9oMME/KnyCIdqE0psI0zdPdDZ4?=
 =?us-ascii?Q?5MCK/kHuQHQ7LOeWrqyH6+8dBbvc2KPM2qGho3q+bHdVKnbivsH+q/N3G9Tk?=
 =?us-ascii?Q?TYUmJN9vkqlipGH8aF3BPmKVUoRqhKuYS4gvnDsi61XIY2hCWOvXhztDSjCG?=
 =?us-ascii?Q?Y5GzNfH2xCURJOar+PNdTFgqeNa9ZZ0bPcICH4iTp69Olb4hv2hLbHz4J0KV?=
 =?us-ascii?Q?Xho8d7N5wjMQfBMVu3Q2/yYTnE0hwkJ8LNL1IAcCXnl9rKydJ0AkKOK/kY5c?=
 =?us-ascii?Q?JfneB2LLusEQB3fJpmcpteGWwGojCql+ZoxbFg0U0XBhxHoobU/AI6OaFWSv?=
 =?us-ascii?Q?DsMN8Xy/YyKrSr/JdAUmntxPyIs5M8h3lEffRk7hsdPI37cRpFL4Scw03cO4?=
 =?us-ascii?Q?prXgyIng7yflMjKWhIF/YuWnqS2gRroKXNi+M7IEXhaKnpQjvLsj8mHwhF95?=
 =?us-ascii?Q?OMpt1u0g0gGCp2YEVkUTpPlriYzNH7oUx8leYvBv3roRjZtiaQ2Mu1y96HVa?=
 =?us-ascii?Q?KWwi31/LwI3RpOIpUox5urRPuGUkWZWz7WIatwYl+Q3PHyh/qvAX8T4RhVri?=
 =?us-ascii?Q?IarJFUtU8otOdAIIsjojtt/9B5FkipkmT4f/TeiO0tmrVKvOpTWhLdB6AnZd?=
 =?us-ascii?Q?mxwavBJEGX8cXBHXZVZpE0zoj+TkwV/TUX9OW+dGgezJs6HXDGmy+JQ99WFI?=
 =?us-ascii?Q?6PfQk1bGIUo9y/WyKksOTfkOvTR/K2Gr32QNRAEW7vbdQOM3rEO6BjUVKy0D?=
 =?us-ascii?Q?KfrgXFwex6Uele+0LbcDBlSuylr23LwLD39BIV3FLiYg4V8+7yxkZnohr1rZ?=
 =?us-ascii?Q?gUnKV3F37H47QA19UHJecFB35vkY00br3xUo4NIM3hf7688XJ9yLvaG2u5BW?=
 =?us-ascii?Q?kenBWQayfokFfIzMrlylAQT1/TfHADxMPXoIid8b8rE4TroJ+omnFFCPJnQw?=
 =?us-ascii?Q?xxUnvJ5ezZURYpuqfEYN0u1yHNaQYkFIOyp4JncLW8kmoEUJKu+gNf4NA13m?=
 =?us-ascii?Q?H+ONtKRrJtKptWqdQmeuZHO/g1bNbSJXvsREpDFqtPcbasIuRg/Ab3kcwYUb?=
 =?us-ascii?Q?7HNguXRv1RC6ctHWox/OWFexjWrexNpGBSXfX0f7TiL17Ew+onO4kP6zqKRq?=
 =?us-ascii?Q?UlA2pTKNAQwV+6W3hflNO9CHIjsLYmdyjZjN0hBLtIdkQEgqo/CVpTZD1C03?=
 =?us-ascii?Q?o3lMtRX9rRucYr4WYwKvaTxQP+w2OuFlrZI5Z7r4sLcokYE40D3YR2tt5ztw?=
 =?us-ascii?Q?0MPo2NozJO+5DyPz1cerF/9E/SXrtPx2kB4sd5LD7nfuPUb3BDQW8FAxH4te?=
 =?us-ascii?Q?y0LMjDzTPhpyhM6/nK38cBEjUnZYKHDfoCxxCJdcVx8VLnzg6FSCXdbL+l4s?=
 =?us-ascii?Q?AJyBD2qEyVPZ3N9C9n2cnzSoyTw7A8iRKGkSYEZoaGJP76hxdV+FZJ69ldqz?=
 =?us-ascii?Q?+w/jK97j8RGzLbDkYSR3VZ4GPOOH1UwYnv9IsJqIYUro9HTaAU4VbUFG991K?=
 =?us-ascii?Q?SR1wz3Lt0/Qv/z+5s38bMNvFJbKRQIo8ORja3SL+rMSw6h7UOrMYU0gWpJjj?=
 =?us-ascii?Q?ydJbMgaBUlbZdHd6NhZhMS3BvgH0ogusHCZI/V+hT0CDkgFOs/ZNVAQdjzhg?=
 =?us-ascii?Q?Q543AHmGnk40x3l3e5dlspdEnz6ozVXdiK68FyoFlDz7nkbL5hARFTF5TW35?=
 =?us-ascii?Q?lv/QC3kl/6HmoEi513kqMgX3/ccTFpc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: designwerk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86bd7078-1af3-4e04-4f5e-08de7943908e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 16:40:22.8147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f12add6-5f96-40e3-ac41-2307f36545c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kqiq1H/a1goygrmX09/+XpPQcftm6w+dX7j7vnGVnUv5c8SwbZ5n5xb6XJZ0sh0r6sxtq4FbaVvaFDfj4tXzUp9jeudA8LhDS5LZemhNcOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=designwerk.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Daef47utRQUg/ECZvAaok4JxrNBtNSiG/V6jXBndDsw=;
 b=FjCGQ6fs5DxQ3o/bGOdKXL4IQjLcgCYKj7UrUral27q881PMkx5sugFYmO0WM9Utp5bnsklm208JvCg4ktyESMPMSNCyDIXwNO/muQYCOAhg5PAwYcavSfQl8tG91S3XAP2p7d0WnVQHHzGlKDgnB9w9/yqSHSXpDgm6s0oCoYs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=designwerk.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=designwerk.com header.i=@designwerk.com
 header.a=rsa-sha256 header.s=selector1 header.b=FjCGQ6fs
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=designwerk.com;
Subject: [Buildroot] [PATCH v1 1/1] package/python-pyzmq: bump to version
 27.1.0
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
From: Martin Bachmann via buildroot <buildroot@buildroot.org>
Reply-To: Martin Bachmann <martin.bachmann@designwerk.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PyZMQ is relicensed under BSD-3-Clause since version 26. For details see RELICENSE/README.md.
The new version uses pyproject.toml with scikit-build-core instead of the setup.py.

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
---
 ...e-ZMQ-version-check-to-the-ZMQ-versi.patch | 67 -------------------
 package/python-pyzmq/Config.in                |  1 +
 package/python-pyzmq/python-pyzmq.hash        |  7 +-
 package/python-pyzmq/python-pyzmq.mk          | 35 +++++-----
 4 files changed, 20 insertions(+), 90 deletions(-)
 delete mode 100644 package/python-pyzmq/0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.patch

diff --git a/package/python-pyzmq/0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.patch b/package/python-pyzmq/0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.patch
deleted file mode 100644
index 18553582f4..0000000000
--- a/package/python-pyzmq/0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 8eae1193457f72899f9cc2254ae1489026df9bb6 Mon Sep 17 00:00:00 2001
-From: Michael Rommel <rommel@layer-7.net>
-Date: Sat, 10 Aug 2013 00:44:35 +0200
-Subject: [PATCH] detect.py: fix the ZMQ version check to the ZMQ version of
- the buildroot
-
-The setup.py script tries to compile a test C program and runs it, to
-retrieve a version string for the installed ZMQ library, but if the cross
-compiler links it together, the result cannot be run on the host, due to
-different architectures and libraries.
-
-And if the host compiler would compile/link it, it would not link with
-the library version inside buildroot but with the library from the
-host, possibly returning a wrong version number.
-
-Instead of trying to run the compiled test program to get the version
-dynamically, return the version of the buildroot environment.
-
-Written by Michael Rommel, modified for version 16.0.2 by Lionel
-Flandrin.
-
-Modified for version 18.0.2 by Asaf Kahlon
-
-Modified for version 24.0.1 by James Hilliard
-
-Signed-off-by: Michael Rommel <rommel@layer-7.net>
-Signed-off-by: Lionel Flandrin <lionel@svkt.org>
-Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- buildutils/detect.py | 14 ++++++++------
- 1 file changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/buildutils/detect.py b/buildutils/detect.py
-index 842e3b14..e2eca744 100644
---- a/buildutils/detect.py
-+++ b/buildutils/detect.py
-@@ -120,18 +120,20 @@ def detect_zmq(basedir, compiler, **compiler_attrs):
- 
-     cc = get_compiler(compiler=compiler, **compiler_attrs)
-     efile = test_compilation(cfile, compiler=cc, **compiler_attrs)
--    patch_lib_paths(efile, cc.library_dirs)
-+    #patch_lib_paths(efile, cc.library_dirs)
- 
-     # add library dirs to %PATH% for windows
-     env = os.environ.copy()
-     if sys.platform.startswith("win"):
-         env["PATH"] = os.pathsep.join([env["PATH"]] + cc.library_dirs)
- 
--    rc, so, se = get_output_error([efile], env=env)
--    if rc:
--        msg = f"Error running version detection script:\n{so}\n{se}"
--        logging.error(msg)
--        raise OSError(msg)
-+    #rc, so, se = get_output_error([efile], env=env)
-+    #if rc:
-+    #     msg = f"Error running version detection script:\n{so}\n{se}"
-+    #     logging.error(msg)
-+    #     raise OSError(msg)
-+
-+    so = "vers: ##ZEROMQ_VERSION##"
- 
-     handlers = {'vers': lambda val: tuple(int(v) for v in val.split('.'))}
- 
--- 
-2.34.1
-
diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
index f8ce52f844..bfb64637a7 100644
--- a/package/python-pyzmq/Config.in
+++ b/package/python-pyzmq/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_PYZMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
+	select BR2_PACKAGE_HOST_PYTHON_SCIKIT_BUILD_CORE
 	help
 	  This package contains the python language binding for zeromq.
 
diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index 3c91d25995..9a2e191e10 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,6 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyzmq/json
-md5  280afc0992b0a9f109dafc1e672d2f26  pyzmq-25.1.2.tar.gz
-sha256  93f1aa311e8bb912e34f004cf186407a4e90eec4f0ecc0efd26056bf7eda0226  pyzmq-25.1.2.tar.gz
+md5  62da15532cddb248287fb2ec533ef9ec  pyzmq-27.1.0.tar.gz
+sha256  ac0765e3d44455adb6ddbf4417dcce460fc40a05978c08efdf2948072f6db540  pyzmq-27.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  c0cf5f5c03f8d6772f7a271df1cb671054578bd3d79527c72fc1f28f8cc72a7a  LICENSE.BSD
-sha256  5f1dac83d6c25674004810ec9e54b304ccbb8303ac5961813b09235966abfd48  LICENSE.LESSER
+sha256  c0cf5f5c03f8d6772f7a271df1cb671054578bd3d79527c72fc1f28f8cc72a7a  LICENSE.md
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 48a298b221..029678f595 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,30 +4,27 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 25.1.2
+PYTHON_PYZMQ_VERSION = 27.1.0
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/3a/33/1a3683fc9a4bd64d8ccc0290da75c8f042184a1a49c146d28398414d3341
-PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
-# Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
-PYTHON_PYZMQ_LICENSE_FILES = LICENSE.LESSER LICENSE.BSD
-PYTHON_PYZMQ_SETUP_TYPE = setuptools
-PYTHON_PYZMQ_BUILD_OPTS = -C--build-option=--zmq=$(STAGING_DIR)/usr
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/04/0b/3c9baedbdf613ecaa7aa07027780b8867f57b6293b6ee50de316c9f3222b
+PYTHON_PYZMQ_LICENSE = BSD-3-Clause
+PYTHON_PYZMQ_LICENSE_FILES = LICENSE.md
+PYTHON_PYZMQ_SETUP_TYPE = pep517
 PYTHON_PYZMQ_DEPENDENCIES = \
-	host-python-cython \
-	host-python-packaging \
-	host-python-setuptools-scm \
-	zeromq
+        host-python-cython \
+        host-python-packaging \
+        host-python-scikit-build-core \
+        zeromq
 
-# Due to issues with cross-compiling, hardcode to the zeromq in BR
-define PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
-	$(SED) 's/##ZEROMQ_VERSION##/$(ZEROMQ_VERSION)/' \
-		$(@D)/buildutils/detect.py
-endef
-
-PYTHON_PYZMQ_POST_PATCH_HOOKS += PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
+# We pass CMake defines to scikit-build-core via PEP517 config settings (-C)
+PYTHON_PYZMQ_BUILD_OPTS = \
+        -Ccmake.define.Python_INCLUDE_DIR="$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)" \
+        -Ccmake.define.Python_LIBRARY="$(STAGING_DIR)/usr/lib/libpython$(PYTHON3_VERSION_MAJOR).so" \
+        -Ccmake.define.Python_EXECUTABLE="$(HOST_DIR)/bin/python3" \
+        -Ccmake.define.PYZMQ_LIBZMQ_RPATH=OFF
 
 ifeq ($(BR2_PACKAGE_ZEROMQ_DRAFTS),y)
-PYTHON_PYZMQ_BUILD_OPTS += -C--build-option=--enable-drafts
+PYTHON_PYZMQ_BUILD_OPTS += -Ccmake.define.ZMQ_DRAFT_API=ON
 endif
 
 $(eval $(python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
