Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7077CD4851
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 10:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61CD482201;
	Tue, 12 May 2026 10:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRdVF_L7Ow7W; Tue, 12 May 2026 10:56:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88A5E82203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778583387;
	bh=GN8pCUn4ogTa1IDdLJOIUvNOfa5sVOo0xNL5Qid+PhU=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ndYNgQpId+9gytbe3WmQ9LuSbEzzRdlEB/w8m9rft3Clp7r17PYpDzaBM7XtgG/WD
	 8K6vzT/GUm7oNG66hPgAHIwgQEGGCZi/kXDNqUhKAcjg+VnW6UGzxG0tuQ49fKaqfw
	 nyaZRW9YpuHuKn21cWMzmN/TV2aXMPIVsLLENlWu0FOUedsnQ3ykk9fdNMRs28JdhW
	 61GuxPfLVgAHvF0L+MfPiLg2klRZaHk6kVVhgaPnNf1otiZttwQ3AOq39LvLWpyJEK
	 yxrWpiZNY7Jsxqb3J/NYqqgXvwZAKmV9zy5TUN5RCP5pmedtrnj1iOc6yj5KcxA8xs
	 lW3IrrzDyax2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88A5E82203;
	Tue, 12 May 2026 10:56:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BDD915F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 10:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 593B660C23
 for <buildroot@buildroot.org>; Tue, 12 May 2026 10:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYOo-O6aq2uf for <buildroot@buildroot.org>;
 Tue, 12 May 2026 10:56:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::6;
 helo=am0pr02cu008.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58D4760C22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58D4760C22
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58D4760C22
 for <buildroot@buildroot.org>; Tue, 12 May 2026 10:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Czrz8OBPj+nDvp5h73nHWBTTLOExlC5W2HSiQNWV8QLzIbge1Bx7B5EuklfXxHrZC8BbCepV7Pmgw8QgbZgR6q408nH2x45DYzg15BBtG3UxwfK32eTykm4LMJlAVWW451/wfTb6IJhT9NllAquR6HS2QqCskIP+RJ58xeGJQQEswngui+CtblrwtnY9k9AGc0T1zD57mRD1t9RINE4EJvCGKwR/6mPj715Q+XjgT2a3hGkikOCFtVLdy0Qo8BIEKZ9nJOM4kwm/ovRYMPw/wa+3M28HsD2dVdKABMSuGIlIxKGRlQRnxO7nL4rSNUAtxw1Bb8vbqt0mbHT0k4H1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkmmk4qjBBkv+j7B/uP22wqQe+QdsLVA+QR7JSijiGc=;
 b=Fhgf0eqWjhC2ctKlKezhick6hQHqgbk63YtIPvI3WfoKIMk4T1l8pCDSTrmWZBYMnIX2TP3k4inN1nH6yIVD7cetY6q6NNQ/H8y6Ai731TTNkt5wKBr+m9Bndq7yJUKFg/RwW7bQ/URFKd5MUrdv70gJVv96C6guRCkaCDkGGpHggt8xZ4luybTl+q2Vxn/ag5rUNFyGPfsLxWUonv8aDl5vbVK8nosogCxsiQcMUUh2u+MXvsbX+7ZuhLwCBjVgYTzkyus/EUEqVNGyHlkjVX/S49exBkHFdiOH5czxUJD0GSlDJikGhMfqGKjWgito9fJf+vJ6W/RJSEPOzGTrCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=buildroot.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
Received: from CWLP123CA0196.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::9)
 by GV4PR02MB11191.eurprd02.prod.outlook.com (2603:10a6:150:28f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 10:56:14 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:400:19c:cafe::e2) by CWLP123CA0196.outlook.office365.com
 (2603:10a6:400:19c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:56:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 10:56:12 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 12 May
 2026 12:56:11 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 12 May 2026 12:56:11 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail02x.se.axis.com (Postfix) with ESMTP id 686861B01;
 Tue, 12 May 2026 12:56:11 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id 5F7FC305CE15; Tue, 12 May 2026 12:56:11 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: <buildroot@buildroot.org>
CC: Kanak Shilledar <kanak.shilledar@axis.com>, Petr Vorel
 <petr.vorel@gmail.com>
Date: Tue, 12 May 2026 12:56:01 +0200
Message-ID: <20260512105602.83368-2-kanak.shilledar@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512105602.83368-1-kanak.shilledar@axis.com>
References: <20260512105602.83368-1-kanak.shilledar@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|GV4PR02MB11191:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bee396d-057a-43db-fcad-08deb01514ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|82310400026|22082099003|18002099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: 2TASr+QA5sJMVS47JM5N2fQzg/d1iupPZHlnHNguZWrgjltWunsNM9X6BAEt6KHJrZCMEFA/ifI5/lPNZEBOu4T+3sLe0Q3CP+4pbDg38tneaP7WbQuujkk3FrD4bWdGK5EinQHg5XqNrpHJgaRbH0FGfdpLSNL3HZ8x4btcbvH2owPt3IGyRbOl/9SJbIlMGfod00rLHsiTuGbUGRrjA+aiqC8J39Da9ORCsxWVCeHzOeqeSOQiYlh77m+P5RY2zKba4vnQjvIF0GFW9uAeoZ64IW79qdHsEjgnFeoSn2/cl8XHeCht8amL3MLDN4ns/oJDl0G2gpQSsGjPuxS33joY+brR5FfHLwir9ER4LF7yeiY4yRNNcVQCIp/SKg+VXa7KLg7MPQdsdxXX6eZIQ+i2/uVtYp1QT2b3vEwuuY7d/NdK/p+rr/dw0EZsQn+3wqNqe4pU5xHH2OdoGcRRX8EpkfOBSQLKeXW1PiaMw4cBGjDfwNPOEJ1DbvVzjghdyZHk01P0tW/pamPlhsufD/c285poxuMAS7iMcIBpKxxVOm3Yq8V2wPjh00PJGJaMiJC0nFmEHpPhuOiAifuHVCgYf6u9V4RbIiKQoOk7LHS0neTOvGKNb+7CFSQpZ4H1YwPuvj7bQxrjk3hoZkVrkXha8OYvu94OTKZuNLkVyod0g3hyUptQYyItLBhXVgz3VVtR37xt5ZNHkcCiLEdLNsY9rb3QCssjL8vLKYuXP9E=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(56012099003)(3023799003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KOsC5tVfu1DqPfThCpgCaSGDX6ITY7HLUPf1HjKcWwcYhhcWSDNN4fG70DitBy50DOARVeK8FUHBf38zuDiAQy0hB4edAPzSz0Hj0wY3INh1tfoiIfQthM/fkgHZV4ZGlJ+uua+HAB99vbyqUUByXpNHe2mge6PD9ves8c99+5UVhxOoqiKDVzVQMof99duLzAVmk6ibRNY9z0vp6FWlIphyXRbrySj/q1iaL3qmAw291kT6/m6TZDytBzVLXboYleR6/pl0mNyXxC4LMrEF7QW3sD/qp/0NY5Rt8X1Gk7OxBGf7GbcGqZERGUoc6tJBTMsoogyQhNN75nPe/xGqeqrIh6WIUNnA3hTZp2kcq7mzJECAXc6v6TyE3J/vUVMA/4jZPiZnQrVHX1OI60C1z37NfKA9+QMZmazqzZFwCm9+NPPORGUwRrnyWdiob2lF
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:56:12.2729 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bee396d-057a-43db-fcad-08deb01514ce
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR02MB11191
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkmmk4qjBBkv+j7B/uP22wqQe+QdsLVA+QR7JSijiGc=;
 b=mfjCUKkld5iWgM46hGb1WbuYYjYgrkAXdM4jan4AniVbusNx1OFHZJcT6W5+P9xNLIgOTVswRM3PVP4DsqYOztcDWNoWi4mV0kw9gP1Cdryq5exrGmZsxf2NQVWoZ1L8yDWsYQadL/DDWZSXOju1lFX3kLGEXMLyO7iMFPOPVSQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=axis.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=mfjCUKkl
Subject: [Buildroot] [RESEND v3 1/1] support: kconfig: Fix compiler warnings
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgbmV3IHBhdGNoIHRvIGZpeCB0aGUgY29tcGlsZXIgd2FybmluZyBnaXZlbiBvbiBVYnVu
dHUgMjQuMDQuNCBpbgpgdXRpbC5jYCB3YXJuaW5nIG9mIGAtV2Zvcm1hdC1vdmVyZmxvdz1gLgoK
YGBgCi4vdXRpbC5jOiBJbiBmdW5jdGlvbiDigJhmaWxlX3dyaXRlX2RlcOKAmToKLi91dGlsLmM6
ODY6MjY6IHdhcm5pbmc6IOKAmCVz4oCZIGRpcmVjdGl2ZSB3cml0aW5nIDEwIG9yIG1vcmUgYnl0
ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXplIGJldHdlZW4gMSBhbmQgNDA5NyBbLVdmb3JtYXQtb3Zl
cmZsb3c9XQogICA4NiB8ICAgICAgICAgc3ByaW50ZihidWYyLCAiJXMlcyIsIGRpciwgbmFtZSk7
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgIF5+Ci4vdXRpbC5jOjg2Ojk6IG5vdGU6
IOKAmHNwcmludGbigJkgb3V0cHV0IDExIG9yIG1vcmUgYnl0ZXMgKGFzc3VtaW5nIDQxMDcpIGlu
dG8gYSBkZXN0aW5hdGlvbiBvZiBzaXplIDQwOTcKICAgODYgfCAgICAgICAgIHNwcmludGYoYnVm
MiwgIiVzJXMiLCBkaXIsIG5hbWUpOwogICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KYGBgCgpVcGRhdGUgYGJ1ZjJgIHRvIGBQQVRIX01BWCsyMGAgc2ltaWxh
ciB0byBgYnVmYCwgdGh1cyBnaXZpbmcgZW5vdWdoCmhlYWRyb29tIGZvciB0aGUgZmlsZW5hbWUg
c3VmZml4LgoKLS0KQ2hhbmdlcyBpbiB2MzoKKiBVcGRhdGVkIHRoZSBjb21taXQgbWVzc2FnZQoq
IEdlbmVyYXRlZCB0aGUgcGF0Y2ggdXNpbmcgYGdpdCBmb3JtYXQtcGF0Y2hgLCBhbmQgYWRkZWQg
dG8gdGhlCiAgYHNlcmllc2AuCgotLQpDaGFuZ2VzIGluIHYyOgoqIENoYW5nZWQgZnJvbSBkaXJl
Y3QgZmlsZSBmaXggdG8gcGF0Y2ggYmFzZWQgZml4LgoKU2lnbmVkLW9mZi1ieTogS2FuYWsgU2hp
bGxlZGFyIDxrYW5hay5zaGlsbGVkYXJAYXhpcy5jb20+Ci0tLQogLi4udXBwb3J0LWtjb25maWct
Rml4LWNvbXBpbGVyLXdhcm5pbmdzLnBhdGNoIHwgNDUgKysrKysrKysrKysrKysrKysrKwogc3Vw
cG9ydC9rY29uZmlnL3BhdGNoZXMvc2VyaWVzICAgICAgICAgICAgICAgIHwgIDEgKwogMiBmaWxl
cyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC9r
Y29uZmlnL3BhdGNoZXMvMjQtc3VwcG9ydC1rY29uZmlnLUZpeC1jb21waWxlci13YXJuaW5ncy5w
YXRjaAoKZGlmZiAtLWdpdCBhL3N1cHBvcnQva2NvbmZpZy9wYXRjaGVzLzI0LXN1cHBvcnQta2Nv
bmZpZy1GaXgtY29tcGlsZXItd2FybmluZ3MucGF0Y2ggYi9zdXBwb3J0L2tjb25maWcvcGF0Y2hl
cy8yNC1zdXBwb3J0LWtjb25maWctRml4LWNvbXBpbGVyLXdhcm5pbmdzLnBhdGNoCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjRjNzYyNzQxMjMKLS0tIC9kZXYvbnVsbAor
KysgYi9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy8yNC1zdXBwb3J0LWtjb25maWctRml4LWNvbXBp
bGVyLXdhcm5pbmdzLnBhdGNoCkBAIC0wLDAgKzEsNDUgQEAKK0Zyb20gMzkyNjI0NzQzZTcxNjZh
MDU2NDc0Y2Q4M2IxODc0MzQwOWQyNTU2YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206
IEthbmFrIFNoaWxsZWRhciA8a2FuYWsuc2hpbGxlZGFyQGF4aXMuY29tPgorRGF0ZTogRnJpLCAy
NCBBcHIgMjAyNiAxMzozMjozNiArMDIwMAorU3ViamVjdDogW1BBVENIXSBzdXBwb3J0OiBrY29u
ZmlnOiBGaXggY29tcGlsZXIgd2FybmluZ3MKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKKworT24gVWJ1bnR1IDI0LjA0LjQsIHRoZSBjb21waWxlciBnaXZlcyB0aGUgd2Fybmlu
ZyBvZgorYC1XZm9ybWF0LW92ZXJmbG93PWAuCisKK2BgYAorLi91dGlsLmM6IEluIGZ1bmN0aW9u
IOKAmGZpbGVfd3JpdGVfZGVw4oCZOgorLi91dGlsLmM6ODY6MjY6IHdhcm5pbmc6IOKAmCVz4oCZ
IGRpcmVjdGl2ZSB3cml0aW5nIDEwIG9yIG1vcmUgYnl0ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXpl
IGJldHdlZW4gMSBhbmQgNDA5NyBbLVdmb3JtYXQtb3ZlcmZsb3c9XQorICAgODYgfCAgICAgICAg
IHNwcmludGYoYnVmMiwgIiVzJXMiLCBkaXIsIG5hbWUpOworICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn4KKy4vdXRpbC5jOjg2Ojk6IG5vdGU6IOKAmHNwcmludGbigJkgb3V0cHV0
IDExIG9yIG1vcmUgYnl0ZXMgKGFzc3VtaW5nIDQxMDcpIGludG8gYSBkZXN0aW5hdGlvbiBvZiBz
aXplIDQwOTcKKyAgIDg2IHwgICAgICAgICBzcHJpbnRmKGJ1ZjIsICIlcyVzIiwgZGlyLCBuYW1l
KTsKKyAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgorYGBg
CisKK1VwZGF0ZSBgYnVmMmAgdG8gYFBBVEhfTUFYKzIwYCBzaW1pbGFyIHRvIGBidWZgLCB0aHVz
IGdpdmluZyBlbm91Z2gKK2hlYWRyb29tIGZvciB0aGUgZmlsZW5hbWUgc3VmZml4LgorCitTaWdu
ZWQtb2ZmLWJ5OiBLYW5hayBTaGlsbGVkYXIgPGthbmFrLnNoaWxsZWRhckBheGlzLmNvbT4KKy0t
LQorIHN1cHBvcnQva2NvbmZpZy91dGlsLmMgfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9zdXBwb3J0L2tjb25maWcv
dXRpbC5jIGIvc3VwcG9ydC9rY29uZmlnL3V0aWwuYworaW5kZXggODY2NWY1YmI4OS4uYzJlNzk3
OWFjMSAxMDA2NDQKKy0tLSBhL3N1cHBvcnQva2NvbmZpZy91dGlsLmMKKysrKyBiL3N1cHBvcnQv
a2NvbmZpZy91dGlsLmMKK0BAIC0zNSw3ICszNSw3IEBAIHN0cnVjdCBmaWxlICpmaWxlX2xvb2t1
cChjb25zdCBjaGFyICpuYW1lKQorIGludCBmaWxlX3dyaXRlX2RlcChjb25zdCBjaGFyICpuYW1l
KQorIHsKKyAJY2hhciAqc3RyOworLQljaGFyIGJ1ZltQQVRIX01BWCsyMF0sIGJ1ZjJbUEFUSF9N
QVgrMV0sIGRpcltQQVRIX01BWCsxXTsKKysJY2hhciBidWZbUEFUSF9NQVgrMjBdLCBidWYyW1BB
VEhfTUFYKzIwXSwgZGlyW1BBVEhfTUFYKzFdOworIAlzdHJ1Y3Qgc3ltYm9sICpzeW0sICplbnZf
c3ltOworIAlzdHJ1Y3QgZXhwciAqZTsKKyAJc3RydWN0IGZpbGUgKmZpbGU7CistLSAKKzIuNDMu
MAorCmRpZmYgLS1naXQgYS9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcy9zZXJpZXMgYi9zdXBwb3J0
L2tjb25maWcvcGF0Y2hlcy9zZXJpZXMKaW5kZXggY2MxNzYwMzViZS4uY2EyMTkzZTczNCAxMDA2
NDQKLS0tIGEvc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvc2VyaWVzCisrKyBiL3N1cHBvcnQva2Nv
bmZpZy9wYXRjaGVzL3NlcmllcwpAQCAtMTIsMyArMTIsNCBAQAogMjEtQXZvaWQtZmFsc2UtcG9z
aXRpdmUtbWF0Y2hlcy1mcm9tLWNvbW1lbnQtbGluZXMucGF0Y2gKIDIyLWtjb25maWctbHhkaWFs
b2ctZml4LWNoZWNrLXdpdGgtR0NDMTQucGF0Y2gKIDIzLWtjb25maWctbW4tY29uZi1oYW5kbGUt
YmFja3NwYWNlLUgta2V5LnBhdGNoCisyNC1zdXBwb3J0LWtjb25maWctRml4LWNvbXBpbGVyLXdh
cm5pbmdzLnBhdGNoCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
