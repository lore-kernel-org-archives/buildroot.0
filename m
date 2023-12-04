Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF322C10DC3
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 07:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C21780BFA;
	Mon,  4 Dec 2023 07:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C21780BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x2ua01o0kTdQ; Mon,  4 Dec 2023 07:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9207280EA2;
	Mon,  4 Dec 2023 07:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9207280EA2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65CE71BF969
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E59860A6B
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E59860A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BBwilNiQyc3K for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 07:35:11 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0658B60AEE
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 07:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0658B60AEE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrOgPFmmC6PWm4d6vTsH+Zx7y5uEdQxWOmIHH1wYs1TAS0DK+OYjJAz2CvoJp1Pb0n9H4ySwaZHvenBLUaagYu9v195NgmrDlSm2TWmsuHHCMV7fw+XmlZyn8FBDKk8aIxyFUqYDlKapJ5kFldvroI5LWya2dhnKrKDHaG6/J6zSPTV3fU/i3xNgqnREMCKv76WxwyaEjsa8caRuRXDthfUkvJAx+yhYdC3JKYpLgvLR0K3nN8kYeJkkvotawlppiBdxwDwOB4DTdl7bXklQTJ+N/DlRUskg2DBMbKLc4swfCH2dYXkxln542pY4T/7kjBXrv8S01sdt2xu777nZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFq5+SH1MXXWR5XBFh4fMQpX8OMww7GwyILDdcCwGiU=;
 b=PXBy0WuspoSq00auLV5EhLRXtudn9coqe1e8ZY49R8km+B3pMcWs3m4X/MKQomWGt9uHXf+H+e8zAV0mdU7Hjibmmc0T/gCQcxYwHFueOf+308PEWhc2mGAhp+WhSShBEmM9GYq8+2mZzA8Nb1dRIZi6RQsEpIFIRmD6i9oqxU2jO6BDrV1FhpsOvY2/da7J+BOY6/kcSyfsHcuFLqMdZokK/6zmjFTdTOBGw7UOJtvQMUakKtPMR1E+YfU4JTMX2ZhV3Vtm60hmJ4p/3u545iG5/jonoB+h/WixTcxZvfelwkNGKwP/q71mYLDfDcDUXMGZG5yvrgoWkIgiBqFSrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR19CA0024.namprd19.prod.outlook.com (2603:10b6:610:4d::34)
 by DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:389::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 07:35:07 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:610:4d:cafe::3d) by CH2PR19CA0024.outlook.office365.com
 (2603:10b6:610:4d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Mon, 4 Dec 2023 07:35:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 07:35:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 01:35:02 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 01:34:51 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 01:34:50 -0600
To: <buildroot@buildroot.org>
Date: Mon, 4 Dec 2023 07:34:34 +0000
Message-ID: <20231204073443.1543587-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204073443.1543587-1-neal.frager@amd.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|DM4PR12MB5390:EE_
X-MS-Office365-Filtering-Correlation-Id: 968554cd-c72e-4591-b756-08dbf49b89f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lrl4BnU5RlRfpA9A9lRCfcbyryyqk9jeYlpSg/ofZrZm4p8C7f6ADd5xUE8YZX33y7v/ysVyWKgbVXyezNdvcQwZGCczX0vPgXMqFOhzrIz6i/LWj5RUx7xWjLc11PVAgat5DCbCAznxhRflc9aAij+DSVriAZ2xBbuum+4Cs3f4EIdMxGBJx/Lr3flcnod4ayid2vl9qs0qvzJ8MoRztync1XDBKZstMcX1ZtRxeQLqpgu977XL3yLuGMPGjFEkytajBfoUWYfwG763ryF5jI8dmO+KqLk2o+hMqyJIROw6E/ZMuV4yKpZ2vu2+thYwXUKppfrT6ijtT2oF06JfT0cVqyXe62i4oArn0ZO9dhPPxZeyV6SnZKtdCed0QzMi5/VT6pPxZeKWHgM5hnAJefky/EoxAlxgV4kBjc6JP6wY40SY1y7e+oQHIBGQ9TIaZutM7UKC21mc7zJ+M03pY/lHKwn91jqs0yQJMVWF9a4b2o3yby8PCkgR/SyzXdPdXw6XMGGSDVQFrTbrx03wgA0Nbjt8NVTk8dzPwOfrLnkEi9BzuqaOkgyrze/AnvxxpULzoMG5/XAcPed4DtokcDcpY+0XCEVwEZUiXs3Mpspmw5yv8HzV1G9DslVtUJdF86kidIfLl9tRVeekS66uHtZXRy3az5wi5Kb0fk1Ta09QKXUVAD0+/U/D6qVRyNAT42SByjituJfM5qBLkqjOponJGOGqbcfBKxCunk6zOISMlGBpXCjsq/HK/W+8NAEz
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(82310400011)(40470700004)(46966006)(36840700001)(86362001)(36756003)(44832011)(40460700003)(2906002)(5660300002)(41300700001)(2616005)(40480700001)(1076003)(82740400003)(426003)(26005)(336012)(478600001)(6666004)(966005)(47076005)(356005)(81166007)(36860700001)(8936002)(70586007)(54906003)(6916009)(70206006)(316002)(8676002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 07:35:07.3915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 968554cd-c72e-4591-b756-08dbf49b89f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5390
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFq5+SH1MXXWR5XBFh4fMQpX8OMww7GwyILDdcCwGiU=;
 b=nwkrMGmymTon9ktFBAzrQvPH0kJ5gzWRhWTSpUvHgkl+aRrgIYTd1VIMJewKpIWw3b1S/8soMgObM576fT6zlKVTtASpUK5u6xq5kdPggxWdYrCj1a0aegf3m/7nwqCfAxRFwd7wii4YriTpHUWL7CUSj3oQtDMAC6/56BtN3P8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nwkrMGmy
Subject: [Buildroot] [PATCH v8 02/10] package/gcc-bare-metal: new package
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
IHRvIDw4MCBjaGFycwogLSBhZGRlZCBsaWNlbnNlIGZpbGVzClY1LT5WNjoKIC0gbWlncmF0ZWQg
dG8gdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290ClY2LT5WNzoKIC0gcmVtb3ZlZCBDb25m
aWcuaW4gYW5kIGhhcmQtY29kZWQgdmVyc2lvbgogLSBhZGRlZCBzeXNyb290IGZvciBuZXdsaWIg
aW5zdGFsbApWNy0+Vjg6CiAtIG5vIGNoYW5nZXMKLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArCiBwYWNrYWdlL2djYy1iYXJlLW1ldGFsLzEzLjIu
MCAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1l
dGFsLmhhc2ggfCAgMSArCiBwYWNrYWdlL2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLm1r
ICAgfCA2NyArKysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDcxIGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEyMDAwMCBwYWNrYWdlL2djYy1iYXJlLW1ldGFsLzEzLjIu
MAogY3JlYXRlIG1vZGUgMTIwMDAwIHBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0
YWwuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJh
cmUtbWV0YWwubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBk
MDZiMjgwNTAwLi5mZGZkMzBmYjZmIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVM
T1BFUlMKQEAgLTEzODMsNiArMTM4Myw3IEBAIEY6CXBhY2thZ2UvcHl0aG9uLXJwaS1ncGlvLwog
CiBOOglJYmFpIEVya2lhZ2EgPGliYWkuZXJraWFnYS1lbG9yemFAYW1kLmNvbT4KIEY6CXBhY2th
Z2UvYmludXRpbHMtYmFyZS1tZXRhbC8KK0Y6CXBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvCiAKIE46
CUlnbmFjeSBHYXfEmWR6a2kgPGlnbmFjeS5nYXdlZHpraUBncmVlbi1jb21tdW5pY2F0aW9ucy5m
cj4KIEY6CXBhY2thZ2UvYW5ndWxhcmpzLwpAQCAtMjIxOSw2ICsyMjIwLDcgQEAgRjoJY29uZmln
cy96eW5xbXBfemN1MTAyX2RlZmNvbmZpZwogRjoJY29uZmlncy96eW5xbXBfemN1MTA2X2RlZmNv
bmZpZwogRjoJcGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFsLwogRjoJcGFja2FnZS9ib290Z2Vu
LworRjoJcGFja2FnZS9nY2MtYmFyZS1tZXRhbC8KIEY6CXBhY2thZ2UvdmVyc2FsLWZpcm13YXJl
LwogCiBOOglOaWNvbGEgRGkgTGlldG8gPG5pY29sYS5kaWxpZXRvQGdtYWlsLmNvbT4KZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvMTMuMi4wIGIvcGFja2FnZS9nY2MtYmFyZS1t
ZXRhbC8xMy4yLjAKbmV3IGZpbGUgbW9kZSAxMjAwMDAKaW5kZXggMDAwMDAwMDAwMC4uYjdhNzVk
YzdkZAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvMTMuMi4wCkBA
IC0wLDAgKzEgQEAKKy4uL2djYy8xMy4yLjAvClwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRhbC5oYXNoIGIv
cGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRhbC5oYXNoCm5ldyBmaWxlIG1vZGUg
MTIwMDAwCmluZGV4IDAwMDAwMDAwMDAuLmQ0MTdiMGRjNzcKLS0tIC9kZXYvbnVsbAorKysgYi9w
YWNrYWdlL2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLmhhc2gKQEAgLTAsMCArMSBAQAor
Li4vZ2NjL2djYy5oYXNoClwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRhbC5tayBiL3BhY2thZ2UvZ2NjLWJh
cmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uMjhiYWFjZGFhYQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZ2NjLWJhcmUt
bWV0YWwvZ2NjLWJhcmUtbWV0YWwubWsKQEAgLTAsMCArMSw2NyBAQAorIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKKyMKKyMgZ2NjLWJhcmUtbWV0YWwKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CisKK0hPU1RfR0NDX0JBUkVfTUVUQUxfVkVSU0lPTiA9IDEzLjIuMAorCitIT1NUX0dDQ19CQVJF
X01FVEFMX1NJVEUgPSBcCisJaHR0cHM6Ly9mdHAuZ251Lm9yZy9nbnUvZ2NjL2djYy0kKEhPU1Rf
R0NDX0JBUkVfTUVUQUxfVkVSU0lPTikKK0hPU1RfR0NDX0JBUkVfTUVUQUxfU09VUkNFID0gZ2Nj
LSQoSE9TVF9HQ0NfQkFSRV9NRVRBTF9WRVJTSU9OKS50YXIueHoKKworSE9TVF9HQ0NfQkFSRV9N
RVRBTF9MSUNFTlNFID0gR1BMLTIuMCwgR1BMLTMuMCwgTEdQTC0yLjEsIExHUEwtMy4wCitIT1NU
X0dDQ19CQVJFX01FVEFMX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HIENPUFlJTkczIENPUFlJTkcu
TElCIENPUFlJTkczLkxJQgorCitIT1NUX0dDQ19CQVJFX01FVEFMX0RFUEVOREVOQ0lFUyA9IFwK
Kwlob3N0LWJpbnV0aWxzLWJhcmUtbWV0YWwgXAorCWhvc3QtZ21wIFwKKwlob3N0LW1wYyBcCisJ
aG9zdC1tcGZyIFwKKwlob3N0LWlzbAorCisjIGdjYyBkb2Vzbid0IHN1cHBvcnQgaW4tdHJlZSBi
dWlsZCwgc28gd2UgY3JlYXRlIGEgJ2J1aWxkJworIyBzdWJkaXJlY3RvcnkgaW4gdGhlIGdjYyBz
b3VyY2VzLCBhbmQgYnVpbGQgZnJvbSB0aGVyZS4KK2RlZmluZSBHQ0NfQkFSRV9NRVRBTF9DT05G
SUdVUkVfU1lNTElOSworCW1rZGlyIC1wICQoQEQpL2J1aWxkCisJbG4gLXNmIC4uL2NvbmZpZ3Vy
ZSAkKEBEKS9idWlsZC9jb25maWd1cmUKK2VuZGVmCisKK0hPU1RfR0NDX0JBUkVfTUVUQUxfUFJF
X0NPTkZJR1VSRV9IT09LUyArPSBHQ0NfQkFSRV9NRVRBTF9DT05GSUdVUkVfU1lNTElOSworSE9T
VF9HQ0NfQkFSRV9NRVRBTF9TVUJESVIgPSBidWlsZAorCitIT1NUX0dDQ19CQVJFX01FVEFMX01B
S0VfT1BUUyA9IFwKKwkkKEhPU1RfR0NDX0NPTU1PTl9NQUtFX09QVFMpIFwKKwlhbGwtZ2NjIFwK
KwlhbGwtdGFyZ2V0LWxpYmdjYworCitIT1NUX0dDQ19CQVJFX01FVEFMX0lOU1RBTExfT1BUUyA9
IGluc3RhbGwtZ2NjIGluc3RhbGwtdGFyZ2V0LWxpYmdjYworCitIT1NUX0dDQ19CQVJFX01FVEFM
X0FSQ0ggPSBcCisJJChjYWxsIHFzdHJpcCwkKEJSMl9UT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlM
RFJPT1RfQVJDSCkpCisKK0hPU1RfR0NDX0JBUkVfTUVUQUxfU1lTUk9PVCA9ICQoSE9TVF9ESVIp
LyQoSE9TVF9HQ0NfQkFSRV9NRVRBTF9BUkNIKS9zeXNyb290CisKK0hPU1RfR0NDX0JBUkVfTUVU
QUxfQ09ORl9PUFRTID0gXAorCS0tdGFyZ2V0PSQoSE9TVF9HQ0NfQkFSRV9NRVRBTF9BUkNIKSBc
CisJLS1kaXNhYmxlLWluaXRmaW5pX2FycmF5IFwKKwktLWRpc2FibGUtX19jeGFfYXRleGl0IFwK
KwktLWRpc2FibGUtbGlic3RkY3h4LXBjaCBcCisJLS13aXRoLW5ld2xpYiBcCisJLS1kaXNhYmxl
LXRocmVhZHMgXAorCS0tZW5hYmxlLXBsdWdpbnMgXAorCS0td2l0aC1nbnUtYXMgXAorCS0tZGlz
YWJsZS1saWJpdG0gXAorCS0td2l0aG91dC1sb25nLWRvdWJsZS0xMjggXAorCS0td2l0aG91dC1o
ZWFkZXJzIFwKKwktLWVuYWJsZS1sYW5ndWFnZXM9YyBcCisJLS1kaXNhYmxlLW11bHRpbGliIFwK
KwktLXdpdGgtZ21wPSQoSE9TVF9ESVIpIFwKKwktLXdpdGgtbXBjPSQoSE9TVF9ESVIpIFwKKwkt
LXdpdGgtbXBmcj0kKEhPU1RfRElSKSBcCisJLS13aXRoLWlzbD0kKEhPU1RfRElSKSBcCisJLS13
aXRoLXN5c3Jvb3Q9JChIT1NUX0dDQ19CQVJFX01FVEFMX1NZU1JPT1QpIFwKKwlBUl9GT1JfVEFS
R0VUPSQoSE9TVF9ESVIpL2Jpbi8kKEhPU1RfR0NDX0JBUkVfTUVUQUxfQVJDSCktYXIgXAorCVJB
TkxJQl9GT1JfVEFSR0VUPSQoSE9TVF9ESVIpL2Jpbi8kKEhPU1RfR0NDX0JBUkVfTUVUQUxfQVJD
SCktcmFubGliCisKKyQoZXZhbCAkKGhvc3QtYXV0b3Rvb2xzLXBhY2thZ2UpKQotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
