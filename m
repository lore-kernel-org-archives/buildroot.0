Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F56CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 15:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC20681DBF;
	Wed, 18 Oct 2023 15:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC20681DBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eAn_COrftjmI; Wed, 18 Oct 2023 15:10:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8496181E7E;
	Wed, 18 Oct 2023 15:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8496181E7E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 554941BF342
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E4BC61064
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E4BC61064
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1s8Mj5W8JP8 for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 15:09:53 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::623])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B756860AC0
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 15:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B756860AC0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJPYtIE+votFLQXrwXV1YLa+8OjkzEJD0IxOlxCz7Oz4teayYVf7XXTixsed6X4UXUiCOQJPSXJibOnbtpYhbN7yFpiAt9h4RiEq9b+vxiie4mvw4lNSVJaG3Q9UcTOORU5YbAUS+0JR/Dz5hbYHA3Eh0zAqhkqnkAHN/w1+0lPBfZpx2wf8IQWe52iZCwkEmBveUIIfxKEM4SwOoipnRxcb9FWbS6378sYxTd5w9lj+WJKrWvhv7bG8PNF0Y5A0HOA6mLbTsaKxDgZPlbd+a5dkatG8n8og8a71Ec4mryOuJhgF6XFkcBDq6Jls+mpSpFvgho+fFl4YM50xID78Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54QHdquSfywJV+OGqkgE8xs8i4xsGtS6bnF+EZVX8SI=;
 b=N4GQCVwEh2CkdTWgkulYtEFMRz+ojs4lS1nc7i+uAFj8gYAXDWnJjY7EOSNEdnpUqLuUeKmMZvLWf4T+5XHqVGKclRGtyp/KrwwJzXlu5nHbFFt4qDjXXQlDjYPiwZTde51JkvcFi1EsYggGAQtYJUSh+dhZNqbTFyvYgKESmNwp42e6PB5mL+aZ2hsXq3woG8zBSKoIAKQ52Q8yg/KW6OSKcih9WI+ywV1ngPBG5HE/RVaFxAd1+j0xn9k/zh5S+8VWCL9rTUZoibrlYvoUZt2NuxWS/CkhEV0SnWHA27hDw5OEtGXWuITYGayLXDPQ5sK9TEVUSWDFWsTCZ71Hew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0356.namprd03.prod.outlook.com (2603:10b6:8:55::22) by
 LV8PR12MB9452.namprd12.prod.outlook.com (2603:10b6:408:200::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.23; Wed, 18 Oct 2023 15:09:49 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:8:55:cafe::64) by DS7PR03CA0356.outlook.office365.com
 (2603:10b6:8:55::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Wed, 18 Oct 2023 15:09:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 18 Oct 2023 15:09:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 10:09:47 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 10:09:46 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 16:09:24 +0100
Message-ID: <20231018150932.3961564-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018150932.3961564-1-neal.frager@amd.com>
References: <20231018150932.3961564-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|LV8PR12MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d9c809-f43e-431c-a74c-08dbcfec458e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JTJ5Uwgg6ULpNrspp8bdS1U5XNfHa0LFc9coVbsbBiFVWh/hrZo5puUqEZFpRa0zPmRliJhDXGu/yRMSxkRnJ2L5KPhQCjCT3MBt242nPNra1YTZ7/tmXKBL0JdHpxUN6282eCwi/msndpHCx+TY8XAaqaLDWOW1BdukPHXQs9p/BZMCDQd+qC71PunxtkBxlB6h+mfGIK7O75JEuaFLpHzj+e5+3nlnNVBoBJw7rByjw6B73h+UR2Aw2krgADAFwx66niJbfKEEQ8TWGvUqEjrsJbn6cacaR1yBfqeWoviqid3nBOaneIrYHWYiuBE1chqmNsfF4iST2m72tY1UuIQIGa4nEyl9rbnZHa7VNDPyUSz0NZ1gw4i5gFsMjuuEH02Q/U6Ytd1qi35MWnpuOBDRtQp299pDxVB2phmt2iMkBiCo0E54BFqgd/pO5REQQki3v8q3lIO6Km2RKVfYmIRlLtZqxg4+3O67DuXHnLtk2OjvjxWOdh5aS+GqYP9GD99cdT03DBq3c6xrGJr2/gMXypMX8skR1XTraUarZg4qn3RR8y9NS2PSgxao5QacK/k6ezU1U9VokOuHCS4A5jPN3KK8S0zfFQP5hfkX18wxgFBtL5Y/v+HYUdq17DVkxrQyijYGkm4CjYzGEEv6rG3iKPMYH1eo3Qmq+VqvQqvXKgk+rWZs+I0kNyZq4DuMZrVuXYae4nzAL6hYz+EAzE4y5MS/Qd+3794+sZ7FJFAm7DJ6OnTN4u7BivqP5bRBL/3L+cMSQCmJLv4OmeB9UzI/I4egKgC1pa9DgwPTdAw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(36860700001)(5660300002)(41300700001)(40460700003)(40480700001)(2906002)(44832011)(86362001)(6666004)(336012)(8676002)(8936002)(966005)(1076003)(2616005)(81166007)(54906003)(36756003)(426003)(6916009)(316002)(356005)(26005)(82740400003)(4326008)(70586007)(70206006)(47076005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:09:48.8171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d9c809-f43e-431c-a74c-08dbcfec458e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9452
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54QHdquSfywJV+OGqkgE8xs8i4xsGtS6bnF+EZVX8SI=;
 b=SQhYAEXZQ8KkDokSqQpwVKYZlKYErpflwZFfZUPGyvfallxxZS3OFfL4BuNNb7WmMUfxLbV2Fqofevh2jdPPc/1tX9bkwIGubcoV0xUNTAQsVPM3Ffjqq7S6tVx5wLxqcN5FMQl+QeZD8Xg8kksOIgfpdJ8msYHAHILvKCR95nc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SQhYAEXZ
Subject: [Buildroot] [PATCH v5 02/10] package/gcc-bare-metal: new package
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaCBhZGRzIGEgbmV3IHBhY2thZ2UgZm9yIGJ1aWxkaW5nIGdjYyBmb3IgYSBiYXJl
LW1ldGFsIHRvb2xjaGFpbi4KVGhlIGNwdSBhcmNoaXRlY3R1cmUgaXMgZGVmaW5lZCBieSBhIHRv
b2xjaGFpbi1iYXJlLW1ldGFsIHZpcnR1YWwgcGFja2FnZS4KV2hpbGUgYW55IGNwdSBhcmNoaXRl
Y3R1cmUgY291bGQgYmUgdXNlZCwgdGhlIGRlZmF1bHQgY29uZmlndXJhdGlvbiB3aWxsIGJlIGEK
WGlsaW54IG1pY3JvYmxhemUgbGl0dGxlIGVuZGlhbiBhcmNoaXRlY3R1cmUsIHNvIHRoYXQgYnVp
bGRyb290IHdpbGwgYmUgYWJsZQp0byBidWlsZCB0aGUgbWljcm9ibGF6ZSBmaXJtd2FyZSBhcHBs
aWNhdGlvbnMgZm9yIHp5bnFtcCBhbmQgdmVyc2FsLgoKU2lnbmVkLW9mZi1ieTogSWJhaSBFcmtp
YWdhIDxpYmFpLmVya2lhZ2EtZWxvcnphQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE5lYWwgRnJh
Z2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPgotLS0KVjEtPlYyOgogLSByZW1vdmVkIGRlZmF1bHQg
ZW5hYmxlIHRvIGJlIHJlcGxhY2VkIHdpdGggdG9vbGNoYWluIHNlbGVjdCBjb25maWcKVjItPlYz
OgogLSBubyBjaGFuZ2VzClYzLT5WNDoKIC0gc3BsaXQgdGFyIGluc3RydWN0aW9uIGludG8gbXVs
dGlwbGUgbGluZXMKIC0gcmVwbGFjZWQgdW5uZWNlc3NhcnkgPT8gd2l0aCA9IGZvciBhc3NpZ25t
ZW50cwogLSBjaGFuZ2VkIHhsbngtcmVsLXYyMDIzLjEudGFyLmd6IGhhc2ggdG8gc2hhMjU2CiAt
IGltcHJvdmVkIG1lbnVjb25maWcgaGVscCBjb21tZW50ClY0LT5WNToKIC0gbW92ZWQgdG8gdXBz
dHJlYW0gZ2NjIHdpdGhvdXQgYW55IHhpbGlueCBwYXRjaGVzCiAtIHJlZHVjZWQgYWxsIGxpbmVz
IHRvIDw4MCBjaGFycwogLSBhZGRlZCBsaWNlbnNlIGZpbGVzCi0tLQogREVWRUxPUEVSUyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKwogLi4ubGUtc3BsaXQtc3RhY2st
Zm9yLW5vbi10aHJlYWQtYnVpbGRzLnBhdGNoIHwgIDEgKwogLi4uSVNDLVYtZml4LWJ1aWxkLWlz
c3VlLXdpdGgtZ2NjLTQuOS54LnBhdGNoIHwgIDEgKwogcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9D
b25maWcuaW4uaG9zdCAgICAgICAgIHwgMTIgKysrKwogcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9n
Y2MtYmFyZS1tZXRhbC5oYXNoICAgIHwgIDkgKysrCiBwYWNrYWdlL2djYy1iYXJlLW1ldGFsL2dj
Yy1iYXJlLW1ldGFsLm1rICAgICAgfCA2OCArKysrKysrKysrKysrKysrKysrCiA2IGZpbGVzIGNo
YW5nZWQsIDkzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEyMDAwMCBwYWNrYWdlL2djYy1i
YXJlLW1ldGFsLzEzLjIuMC8wMDAxLWRpc2FibGUtc3BsaXQtc3RhY2stZm9yLW5vbi10aHJlYWQt
YnVpbGRzLnBhdGNoCiBjcmVhdGUgbW9kZSAxMjAwMDAgcGFja2FnZS9nY2MtYmFyZS1tZXRhbC8x
My4yLjAvMDAwMi1SSVNDLVYtZml4LWJ1aWxkLWlzc3VlLXdpdGgtZ2NjLTQuOS54LnBhdGNoCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwu
aGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUt
bWV0YWwubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCA5YzJi
NjY0NDI2Li45MjJhNzRlNDI2IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BF
UlMKQEAgLTEzNjgsNiArMTM2OCw3IEBAIEY6CXBhY2thZ2UvcHl0aG9uLXJwaS1ncGlvLwogCiBO
OglJYmFpIEVya2lhZ2EgPGliYWkuZXJraWFnYS1lbG9yemFAYW1kLmNvbT4KIEY6CXBhY2thZ2Uv
YmludXRpbHMtYmFyZS1tZXRhbC8KK0Y6CXBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvCiAKIE46CUln
bmFjeSBHYXfEmWR6a2kgPGlnbmFjeS5nYXdlZHpraUBncmVlbi1jb21tdW5pY2F0aW9ucy5mcj4K
IEY6CXBhY2thZ2UvYW5ndWxhcmpzLwpAQCAtMjIwMiw2ICsyMjAzLDcgQEAgRjoJY29uZmlncy96
eW5xbXBfemN1MTAyX2RlZmNvbmZpZwogRjoJY29uZmlncy96eW5xbXBfemN1MTA2X2RlZmNvbmZp
ZwogRjoJcGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFsLwogRjoJcGFja2FnZS9ib290Z2VuLwor
RjoJcGFja2FnZS9nY2MtYmFyZS1tZXRhbC8KIEY6CXBhY2thZ2UvdmVyc2FsLWZpcm13YXJlLwog
CiBOOglOaWNvbGEgRGkgTGlldG8gPG5pY29sYS5kaWxpZXRvQGdtYWlsLmNvbT4KZGlmZiAtLWdp
dCBhL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvMTMuMi4wLzAwMDEtZGlzYWJsZS1zcGxpdC1zdGFj
ay1mb3Itbm9uLXRocmVhZC1idWlsZHMucGF0Y2ggYi9wYWNrYWdlL2djYy1iYXJlLW1ldGFsLzEz
LjIuMC8wMDAxLWRpc2FibGUtc3BsaXQtc3RhY2stZm9yLW5vbi10aHJlYWQtYnVpbGRzLnBhdGNo
Cm5ldyBmaWxlIG1vZGUgMTIwMDAwCmluZGV4IDAwMDAwMDAwMDAuLmIxZWFkZmI4MjEKLS0tIC9k
ZXYvbnVsbAorKysgYi9wYWNrYWdlL2djYy1iYXJlLW1ldGFsLzEzLjIuMC8wMDAxLWRpc2FibGUt
c3BsaXQtc3RhY2stZm9yLW5vbi10aHJlYWQtYnVpbGRzLnBhdGNoCkBAIC0wLDAgKzEgQEAKKy4u
Ly4uL2djYy8xMy4yLjAvMDAwMS1kaXNhYmxlLXNwbGl0LXN0YWNrLWZvci1ub24tdGhyZWFkLWJ1
aWxkcy5wYXRjaApcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvZ2NjLWJhcmUtbWV0YWwvMTMuMi4wLzAwMDItUklTQy1WLWZpeC1idWlsZC1pc3N1ZS13aXRo
LWdjYy00LjkueC5wYXRjaCBiL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvMTMuMi4wLzAwMDItUklT
Qy1WLWZpeC1idWlsZC1pc3N1ZS13aXRoLWdjYy00LjkueC5wYXRjaApuZXcgZmlsZSBtb2RlIDEy
MDAwMAppbmRleCAwMDAwMDAwMDAwLi4zMGUzYjE2ZTE2Ci0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS9nY2MtYmFyZS1tZXRhbC8xMy4yLjAvMDAwMi1SSVNDLVYtZml4LWJ1aWxkLWlzc3VlLXdp
dGgtZ2NjLTQuOS54LnBhdGNoCkBAIC0wLDAgKzEgQEAKKy4uLy4uL2djYy8xMy4yLjAvMDAwMi1S
SVNDLVYtZml4LWJ1aWxkLWlzc3VlLXdpdGgtZ2NjLTQuOS54LnBhdGNoClwgTm8gbmV3bGluZSBh
dCBlbmQgb2YgZmlsZQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9Db25maWcu
aW4uaG9zdCBiL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvQ29uZmlnLmluLmhvc3QKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uY2E3NzM1MzQwYwotLS0gL2Rldi9udWxsCisr
KyBiL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvQ29uZmlnLmluLmhvc3QKQEAgLTAsMCArMSwxMiBA
QAorY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfR0NDX0JBUkVfTUVUQUwKKwlib29sICJob3N0IGdj
Yy1iYXJlLW1ldGFsIgorCWhlbHAKKwkgIEJ1aWxkIEdDQyBmb3IgYSBiYXJlLW1ldGFsIHRvb2xj
aGFpbgorCitpZiBCUjJfUEFDS0FHRV9IT1NUX0dDQ19CQVJFX01FVEFMCisKK2NvbmZpZyBCUjJf
UEFDS0FHRV9IT1NUX0dDQ19CQVJFX01FVEFMX1ZFUlNJT04KKwlzdHJpbmcKKwlkZWZhdWx0ICIx
My4yLjAiCisKK2VuZGlmICNCUjJfUEFDS0FHRV9IT1NUX0dDQ19CQVJFX01FVEFMCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLmhhc2ggYi9wYWNrYWdl
L2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uNWM1YzI4ZmE3ZQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uv
Z2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwuaGFzaApAQCAtMCwwICsxLDkgQEAKKyMgRnJv
bSBodHRwczovL2djYy5nbnUub3JnL3B1Yi9nY2MvcmVsZWFzZXMvZ2NjLTEzLjIuMC9zaGE1MTIu
c3VtCitzaGE1MTIgIGQ5OWU0ODI2YTcwZGIwNDUwNDQ2N2UzNDllOWZiYWVkYWE1ODcwNzY2Y2Rh
N2M1Y2FiNTBjZGViZWRjNGJlNzU1ZWJjYTViNzg5ZTEyMzJhMzRhMjBiZTFhMGI2MDA5N2RlOTI4
MGVmZTQ3YmRiNzFjNzMyNTFlMzBiMDg2MmEyICBnY2MtMTMuMi4wLnRhci54egorCisjIExvY2Fs
bHkgY2FsY3VsYXRlZAorc2hhMjU2ICAyMzFmN2VkY2M3MzUyZDc3MzRhOTZlZWYwYjgwMzBmNzc5
ODI2NzhjNTE2ODc2ZmNiODFlMjViMzJkNjg1NjRjICBDT1BZSU5HCitzaGEyNTYgIDhjZWI0Yjll
ZTVhZGVkZGU0N2IzMWU5NzVjMWQ5MGM3M2FkMjdiNmIxNjVhMWRjZDgwYzdjNTQ1ZWI2NWI5MDMg
IENPUFlJTkczCitzaGEyNTYgIGE4NTNjMmZmZWMxNzA1Nzg3MjM0MGVlZTI0MmFlNGQ5NmNiZjJi
NTIwYWUyN2Q5MDNlMWIyZmVmMWE1ZjlkMWMgIENPUFlJTkczLkxJQgorc2hhMjU2ICBhOWJkZGU1
NjE2ZWNkZDFlOTgwYjQ0ZjM2MDYwMGVlODc4M2IxZjk5YjhjYzgzYTJiZWIxNjNhMGEzOTBlODYx
ICBDT1BZSU5HLkxJQgorc2hhMjU2ICA5ZDZiNDNjZTRkOGRlMGM4NzhiZjE2YjU0ZDhlN2ExMGQ5
YmQ0MmI3NTE3ODE1M2UzYWY2YTgxNWJkYzkwZjc0ICBDT1BZSU5HLlJVTlRJTUUKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwubWsgYi9wYWNrYWdlL2dj
Yy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLjZjNzgzMzI3Y2QKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2djYy1i
YXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLm1rCkBAIC0wLDAgKzEsNjggQEAKKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCisjCisjIGdjYy1iYXJlLW1ldGFsCisjCisjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIworCitIT1NUX0dDQ19CQVJFX01FVEFMX1ZFUlNJT04gPSBcCisJJChjYWxsIHFzdHJpcCwk
KEJSMl9QQUNLQUdFX0hPU1RfR0NDX0JBUkVfTUVUQUxfVkVSU0lPTikpCitpZmVxICgkKEhPU1Rf
R0NDX0JBUkVfTUVUQUxfVkVSU0lPTiksKQorSE9TVF9HQ0NfQkFSRV9NRVRBTF9WRVJTSU9OID0g
MTMuMi4wCitlbmRpZgorCitIT1NUX0dDQ19CQVJFX01FVEFMX1NJVEUgPSBcCisJaHR0cHM6Ly9m
dHAuZ251Lm9yZy9nbnUvZ2NjL2djYy0kKEhPU1RfR0NDX0JBUkVfTUVUQUxfVkVSU0lPTikKK0hP
U1RfR0NDX0JBUkVfTUVUQUxfU09VUkNFID0gZ2NjLSQoSE9TVF9HQ0NfQkFSRV9NRVRBTF9WRVJT
SU9OKS50YXIueHoKKworSE9TVF9HQ0NfQkFSRV9NRVRBTF9MSUNFTlNFID0gR1BMLTIuMCwgR1BM
LTMuMCwgTEdQTC0yLjEsIExHUEwtMy4wCitIT1NUX0dDQ19CQVJFX01FVEFMX0xJQ0VOU0VfRklM
RVMgPSBDT1BZSU5HIENPUFlJTkczIENPUFlJTkcuTElCIENPUFlJTkczLkxJQgorCitIT1NUX0dD
Q19CQVJFX01FVEFMX0RFUEVOREVOQ0lFUyA9IFwKKwlob3N0LWJpbnV0aWxzLWJhcmUtbWV0YWwg
XAorCWhvc3QtZ21wIFwKKwlob3N0LW1wYyBcCisJaG9zdC1tcGZyIFwKKwlob3N0LWlzbAorCisj
IGdjYyBkb2Vzbid0IHN1cHBvcnQgaW4tdHJlZSBidWlsZCwgc28gd2UgY3JlYXRlIGEgJ2J1aWxk
JworIyBzdWJkaXJlY3RvcnkgaW4gdGhlIGdjYyBzb3VyY2VzLCBhbmQgYnVpbGQgZnJvbSB0aGVy
ZS4KK2RlZmluZSBHQ0NfQkFSRV9NRVRBTF9DT05GSUdVUkVfU1lNTElOSworCW1rZGlyIC1wICQo
QEQpL2J1aWxkCisJbG4gLXNmIC4uL2NvbmZpZ3VyZSAkKEBEKS9idWlsZC9jb25maWd1cmUKK2Vu
ZGVmCisKK0hPU1RfR0NDX0JBUkVfTUVUQUxfUFJFX0NPTkZJR1VSRV9IT09LUyArPSBHQ0NfQkFS
RV9NRVRBTF9DT05GSUdVUkVfU1lNTElOSworSE9TVF9HQ0NfQkFSRV9NRVRBTF9TVUJESVIgPSBi
dWlsZAorCitIT1NUX0dDQ19CQVJFX01FVEFMX01BS0VfT1BUUyA9IFwKKwkkKEhPU1RfR0NDX0NP
TU1PTl9NQUtFX09QVFMpIFwKKwlhbGwtZ2NjIFwKKwlhbGwtdGFyZ2V0LWxpYmdjYworCitIT1NU
X0dDQ19CQVJFX01FVEFMX0lOU1RBTExfT1BUUyA9IGluc3RhbGwtZ2NjIGluc3RhbGwtdGFyZ2V0
LWxpYmdjYworCitHQ0NfQkFSRV9NRVRBTF9BUkNIID0gXAorCSQoY2FsbCBxc3RyaXAsJChCUjJf
UEFDS0FHRV9IT1NUX1RPT0xDSEFJTl9CQVJFX01FVEFMX0FSQ0gpKQorCitIT1NUX0dDQ19CQVJF
X01FVEFMX0NPTkZfT1BUUyA9IFwKKwktLXRhcmdldD0kKEdDQ19CQVJFX01FVEFMX0FSQ0gpLWVs
ZiBcCisJLS1kaXNhYmxlLWluaXRmaW5pX2FycmF5IFwKKwktLWRpc2FibGUtX19jeGFfYXRleGl0
IFwKKwktLWRpc2FibGUtbGlic3RkY3h4LXBjaCBcCisJLS13aXRoLW5ld2xpYiBcCisJLS1kaXNh
YmxlLXRocmVhZHMgXAorCS0tZW5hYmxlLXBsdWdpbnMgXAorCS0td2l0aC1nbnUtYXMgXAorCS0t
ZGlzYWJsZS1saWJpdG0gXAorCS0td2l0aG91dC1sb25nLWRvdWJsZS0xMjggXAorCS0td2l0aG91
dC1oZWFkZXJzIFwKKwktLWVuYWJsZS1sYW5ndWFnZXM9YyBcCisJLS1kaXNhYmxlLW11bHRpbGli
IFwKKwktLXdpdGgtZ21wPSQoSE9TVF9ESVIpIFwKKwktLXdpdGgtbXBjPSQoSE9TVF9ESVIpIFwK
KwktLXdpdGgtbXBmcj0kKEhPU1RfRElSKSBcCisJLS13aXRoLWlzbD0kKEhPU1RfRElSKSBcCisJ
QVJfRk9SX1RBUkdFVD0kKE8pL2hvc3QvYmluLyQoR0NDX0JBUkVfTUVUQUxfQVJDSCktZWxmLWFy
IFwKKwlSQU5MSUJfRk9SX1RBUkdFVD0kKE8pL2hvc3QvYmluLyQoR0NDX0JBUkVfTUVUQUxfQVJD
SCktZWxmLXJhbmxpYgorCiskKGV2YWwgJChob3N0LWF1dG90b29scy1wYWNrYWdlKSkKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
