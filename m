Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8840CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 15:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65F2F4061C;
	Sun, 24 Sep 2023 15:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65F2F4061C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AEtt5yPvKTIG; Sun, 24 Sep 2023 15:12:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FA3F40BFB;
	Sun, 24 Sep 2023 15:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FA3F40BFB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6753B1BF3E8
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E2A2417BC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E2A2417BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IoWsQw46Uz6R for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 15:12:52 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::623])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8432B417B5
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 15:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8432B417B5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNCxVTBTHOPC4eoUGP+iPUNSMx2W5rO97P7qCoTLOsEQZslXFBcerKFUsmqbpbMxnfoarmxtXrnRUnCZUhf7ELTtAzW2BbSHDalLdqO2ZlmQjLMg711HX0ZuKEh0k9yQ0anEiBsOdqGDMri9BRTeSNpUsqzFXV4kD9LiuGTLgSgTwuzRwWTfQQstSmUYvcR79BBb/uRvh4XpB2E9Gw02Z8Q0bLbcuswjNsR8mfo2Zf9LowZmoQ/T4ta/WMWwjovy8T2PJtHtMeJCPm1cy8/uBzzP02WYxWY7RFgM3RcUhp7eNd110R6uY/nOnXYZqLUwLEkOotX8tEtlBF5n8S+V5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgOgWcnfpr6DZAbuJ8h//Pi98NUjZ9grM33zFvT7BgU=;
 b=BCcd1ZCICOLifn6gBh6ylZPg4lEw/nytC+Fv15l4dD+fIDw0lQuISTdCKDMiPeEyfXnUyk2OmpIEAX6mDO4HlwQJsDp1czvabHr2H8sQ1hhk7o7sevPcrXgO9s+MiM5/D84bQcqgPROjf7EEJgk/J6d7rD3T5R5z6Pj1Ij8DBApiueStBpX1QVmX/1EPxFojaMYfBuRSRvqVC2R4910rFLTas1vb1Y/d/WuZYGRslfTr8nzy2uCYTqqcyayw4nGbme8Agqy4ouGP079wgm7bwdI7HIz2VxB9jKlPMRUo2LzRTawUOf2LuYskvCtsM56K9QJOC+xqu2e5eXPGKJL4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CH0PR07CA0008.namprd07.prod.outlook.com (2603:10b6:610:32::13)
 by MW4PR12MB7143.namprd12.prod.outlook.com (2603:10b6:303:222::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Sun, 24 Sep
 2023 15:12:47 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::48) by CH0PR07CA0008.outlook.office365.com
 (2603:10b6:610:32::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Sun, 24 Sep 2023 15:12:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sun, 24 Sep 2023 15:12:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 10:12:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 10:12:44 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sun, 24 Sep 2023 10:12:43 -0500
To: <buildroot@buildroot.org>
Date: Sun, 24 Sep 2023 16:11:57 +0100
Message-ID: <20230924151205.2099293-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230924151205.2099293-1-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|MW4PR12MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: af7bc2fc-312a-4f57-bc1c-08dbbd10b4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1GEZs8ZThGYIAwCXj6uX3M/zHLLU4FKSHh22sYfXhyrsdbPCxSP/wZDstseSdc9Cj2R3sys9JNyYwncf7lYxf0xiWhoPENrwA0+sHZikYjba+dFmm4e6ai9q8jufU+4mZ65MYkGzlKHIFuWjcgLUvUZkeB8b+lKfIqlnnmxQUwGztaUL0yRrk/pe8bEYltcDw6PEMc39HJzPYfsWnOLAfNRhaPcgWVqszUC3eITdKBwspcf7bT3Xyhv+/CxHQYrL0K9en5Zk6/5lUwANRDD0Ytj4cfhfif22h9cM+fJb7/+2z1rBDaoEkzagDkae1mJNbLJoRk/rni/r19zSqdxDPXrl5WGDq5FJI+yk2EbKl7LLkdKTdiw7Alh72n35LSfovqhbeEqBho23i1cGGAXvS1jaz6Nrda9QE6c3eMnSqGoZC/RRW/IZRnSw6GiPWLwyfLJFNfgybM2/MJCu0qcSQ+FmthPjxHmQAxJBMaYYY5HYAHhSzDSEAlyNjZ5Tg9VXBHpuN+h7M20y/hRvNZkhX/IS2bLwf4HFkfzwusKXZXBwq0NmL5BlDB+lQAqSCJ4g646wIhBohqBfUteNJEm6zKGhkrty93k99+HV9jWS73QvbCDVqzBTM67I5eqCgjgFcsInpMSAVQMGF0HFLjt3ZMysCuL3iQkglyNQ7/+M5wt1vEuzIlJ5UrzHl9+gehVQ8C4Jx2U+AfT5xIHe3FpuhlNL+VnD2Y8TMy5Xj4nBMHHAON/Zvfpy4LbOftYdvGZZ3YnF1QbrWWvjYj8ckPMNTw8ImDDWpT2IpthU+iffc7o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(82310400011)(186009)(451199024)(1800799009)(40470700004)(46966006)(36840700001)(8676002)(82740400003)(478600001)(66574015)(4326008)(1076003)(2616005)(426003)(83380400001)(26005)(8936002)(70586007)(966005)(336012)(2906002)(316002)(6916009)(41300700001)(70206006)(5660300002)(54906003)(44832011)(40480700001)(6666004)(36860700001)(36756003)(47076005)(40460700003)(356005)(81166007)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2023 15:12:45.4462 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af7bc2fc-312a-4f57-bc1c-08dbbd10b4e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgOgWcnfpr6DZAbuJ8h//Pi98NUjZ9grM33zFvT7BgU=;
 b=3yvaT7d/o7W/C09kW4htTC3BcYp5+NVwnXrTk6GI1G8Uuqz5MM0Rj9MZjPX9yBvdYUlsxhxdrWKeFRLVNpICxlxLkytBazdu364HQUDBJGnkwqoAXfKe+taPbvkYSAsagJD0wdOuBvMlPC0M9Dnj03lBh0L7CrafY6gWf5JBVKg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3yvaT7d/
Subject: [Buildroot] [PATCH v4 02/10] package/gcc-bare-metal: new package
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
aWNhdGlvbnMgZm9yIHp5bnFtcCBhbmQgdmVyc2FsLgoKV2hlbiBjb25maWd1cmVkIGZvciB0aGUg
WGlsaW54IG1pY3JvYmxhemUgYXJjaGl0ZWN0dXJlLCBhbGwgb2YgdGhlIGdjYwpwYXRjaGVzIHRo
YXQgYXJlIGFwcGxpZWQgdG8gdGhlIFhpbGlueCBkaXN0cmlidXRlZCB0b29sY2hhaW4gd2lsbCBi
ZSBhcHBsaWVkCmluIG9yZGVyIHRvIGdlbmVyYXRlIGEgdG9vbGNoYWluIHRoYXQgaXMgZXF1aXZh
bGVudCB0byB3aGF0IFhpbGlueCBkaXN0cmlidXRlcy4KClNpZ25lZC1vZmYtYnk6IEliYWkgRXJr
aWFnYS1FbG9yemEgPGliYWkuZXJraWFnYS1lbG9yemFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
TmVhbCBGcmFnZXIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+Ci0tLQpWMS0+VjI6CiAtIHJlbW92ZWQg
ZGVmYXVsdCBlbmFibGUgdG8gYmUgcmVwbGFjZWQgd2l0aCB0b29sY2hhaW4gc2VsZWN0IGNvbmZp
ZwpWMi0+VjM6CiAtIG5vIGNoYW5nZXMKVjMtPlY0OgogLSBzcGxpdCB0YXIgaW5zdHJ1Y3Rpb24g
aW50byBtdWx0aXBsZSBsaW5lcwogLSByZXBsYWNlZCB1bm5lY2Vzc2FyeSA9PyB3aXRoID0gZm9y
IGFzc2lnbm1lbnRzCiAtIGNoYW5nZWQgeGxueC1yZWwtdjIwMjMuMS50YXIuZ3ogaGFzaCB0byBz
aGEyNTYKIC0gaW1wcm92ZWQgbWVudWNvbmZpZyBoZWxwIGNvbW1lbnQKLS0tCiBERVZFTE9QRVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArCiBwYWNrYWdlL2djYy1iYXJl
LW1ldGFsL0NvbmZpZy5pbi5ob3N0ICAgICAgfCAxMiArKysrCiBwYWNrYWdlL2djYy1iYXJlLW1l
dGFsL2djYy1iYXJlLW1ldGFsLmhhc2ggfCAgNSArKwogcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9n
Y2MtYmFyZS1tZXRhbC5tayAgIHwgNzAgKysrKysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBj
aGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nY2Mt
YmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ2Nj
LWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9Q
RVJTIGIvREVWRUxPUEVSUwppbmRleCAwNDZmOGY3ODc0Li4yODRhMjMxZjdmIDEwMDY0NAotLS0g
YS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTEzNTIsNiArMTM1Miw3IEBAIEY6CXBh
Y2thZ2UvcHl0aG9uLXJwaS1ncGlvLwogCiBOOglJYmFpIEVya2lhZ2EtRWxvcnphIDxpYmFpLmVy
a2lhZ2EtZWxvcnphQGFtZC5jb20+CiBGOglwYWNrYWdlL2JpbnV0aWxzLWJhcmUtbWV0YWwvCitG
OglwYWNrYWdlL2djYy1iYXJlLW1ldGFsLwogCiBOOglJZ25hY3kgR2F3xJlkemtpIDxpZ25hY3ku
Z2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+CiBGOglwYWNrYWdlL2FuZ3VsYXJqcy8K
QEAgLTIxODMsNiArMjE4NCw3IEBAIEY6CWNvbmZpZ3MvenlucW1wX3pjdTEwMl9kZWZjb25maWcK
IEY6CWNvbmZpZ3MvenlucW1wX3pjdTEwNl9kZWZjb25maWcKIEY6CXBhY2thZ2UvYmludXRpbHMt
YmFyZS1tZXRhbC8KIEY6CXBhY2thZ2UvYm9vdGdlbi8KK0Y6CXBhY2thZ2UvZ2NjLWJhcmUtbWV0
YWwvCiBGOglwYWNrYWdlL3ZlcnNhbC1maXJtd2FyZS8KIAogTjoJTmljb2xhIERpIExpZXRvIDxu
aWNvbGEuZGlsaWV0b0BnbWFpbC5jb20+CmRpZmYgLS1naXQgYS9wYWNrYWdlL2djYy1iYXJlLW1l
dGFsL0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9Db25maWcuaW4uaG9z
dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi43ZmRmNDQzNTExCi0tLSAv
ZGV2L251bGwKKysrIGIvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdApAQCAt
MCwwICsxLDEyIEBACitjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9HQ0NfQkFSRV9NRVRBTAorCWJv
b2wgImhvc3QgZ2NjLWJhcmUtbWV0YWwiCisJaGVscAorCSAgQnVpbGQgR0NDIGZvciBhIGJhcmUt
bWV0YWwgdG9vbGNoYWluCisKK2lmIEJSMl9QQUNLQUdFX0hPU1RfR0NDX0JBUkVfTUVUQUwKKwor
Y29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfR0NDX0JBUkVfTUVUQUxfVkVSU0lPTgorCXN0cmluZwor
CWRlZmF1bHQgIjEyLjIuMCIKKworZW5kaWYgI0JSMl9QQUNLQUdFX0hPU1RfR0NDX0JBUkVfTUVU
QUwKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwuaGFz
aCBiL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwuaGFzaApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi41NmFjODQ1ZTI4Ci0tLSAvZGV2L251bGwKKysr
IGIvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRhbC5oYXNoCkBAIC0wLDAgKzEs
NSBAQAorIyBGcm9tIGh0dHBzOi8vZ2NjLmdudS5vcmcvcHViL2djYy9yZWxlYXNlcy9nY2MtMTIu
Mi4wL3NoYTUxMi5zdW0KK3NoYTUxMiAgZTllODU3YmQ4MWJmN2EzNzAzMDdkNjg0OGM4MWIyZjU0
MDNkYjhjN2I1MjA3ZjU0YmNlM2YzZmFhYzNiZGU2MzQ0NTY4NDA5MmMyYmMxYTI0MjdjZGRiNmY3
NzQ2NDk2ZDlmYmJlZjA1ZmJiZDc3ZjI4MTBiMjk5OGYxZjkxNzMgIGdjYy0xMi4yLjAudGFyLnh6
CisKKyMgbG9jYWxseSBjYWxjdWxhdGVkCitzaGEyNTYgIDU5OTJjZTY4NjU0Njg1MzdiODQzNzI0
ODBmNzU5MzEyNWRiNzU0ZjY3M2RjY2FlMWVjZjZkNmE3Yzc0ZWQ4OGUgIHhsbngtcmVsLXYyMDIz
LjEudGFyLmd6CmRpZmYgLS1naXQgYS9wYWNrYWdlL2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1l
dGFsLm1rIGIvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRhbC5tawpuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi45M2MxN2Q2NTIwCi0tLSAvZGV2L251bGwK
KysrIGIvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRhbC5tawpAQCAtMCwwICsx
LDcwIEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBnY2MtYmFyZS1tZXRhbAorIwor
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworSE9TVF9HQ0NfQkFSRV9NRVRBTF9WRVJTSU9OID0g
JChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX0hPU1RfR0NDX0JBUkVfTUVUQUxfVkVSU0lPTikp
CitpZmVxICgkKEhPU1RfR0NDX0JBUkVfTUVUQUxfVkVSU0lPTiksKQorSE9TVF9HQ0NfQkFSRV9N
RVRBTF9WRVJTSU9OID0gMTIuMi4wCitlbmRpZgorCitIT1NUX0dDQ19CQVJFX01FVEFMX1NJVEUg
PSBodHRwczovL2Z0cC5nbnUub3JnL2dudS9nY2MvZ2NjLSQoSE9TVF9HQ0NfQkFSRV9NRVRBTF9W
RVJTSU9OKQorSE9TVF9HQ0NfQkFSRV9NRVRBTF9TT1VSQ0UgPSBnY2MtJChIT1NUX0dDQ19CQVJF
X01FVEFMX1ZFUlNJT04pLnRhci54egorCitIT1NUX0dDQ19CQVJFX01FVEFMX0RFUEVOREVOQ0lF
UyA9IGhvc3QtYmludXRpbHMtYmFyZS1tZXRhbCBob3N0LWdtcCBob3N0LW1wYyBob3N0LW1wZnIg
aG9zdC1pc2wKKworIyBpZiB0b29sY2hhaW4gaXMgZm9yIG1pY3JvYmxhemVlbC14aWxpbngsIGFw
cGx5IFhpbGlueCBwYXRjaCBzZXQKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfSE9TVF9UT09MQ0hBSU5f
QkFSRV9NRVRBTF9BUkNIKSwibWljcm9ibGF6ZWVsLXhpbGlueCIpCitIT1NUX0dDQ19CQVJFX01F
VEFMX0VYVFJBX0RPV05MT0FEUyA9IGh0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngvbWV0YS14aWxp
bngvYXJjaGl2ZS9yZWZzL3RhZ3MveGxueC1yZWwtdjIwMjMuMS50YXIuZ3oKKworZGVmaW5lIEhP
U1RfR0NDX0JBUkVfTUVUQUxfRVhUUkFDVF9QQVRDSEVTCisgIG1rZGlyIC1wICQoQEQpL3BhdGNo
ZXMKKyAgdGFyIC14ZiAkKEhPU1RfR0NDX0JBUkVfTUVUQUxfRExfRElSKS94bG54LXJlbC12MjAy
My4xLnRhci5neiBcCisgICAgICAtLXN0cmlwLWNvbXBvbmVudHM9NSBcCisgICAgICAtQyAkKEBE
KS9wYXRjaGVzIFwKKyAgICAgIG1ldGEteGlsaW54LXhsbngtcmVsLXYyMDIzLjEvbWV0YS1taWNy
b2JsYXplL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMgorZW5kZWYKK0hPU1RfR0NDX0JBUkVf
TUVUQUxfUE9TVF9FWFRSQUNUX0hPT0tTICs9IEhPU1RfR0NDX0JBUkVfTUVUQUxfRVhUUkFDVF9Q
QVRDSEVTCisKK2RlZmluZSBIT1NUX0dDQ19CQVJFX01FVEFMX0FQUExZX0xPQ0FMX1BBVENIRVMK
KyAgICAgICAgJChBUFBMWV9QQVRDSEVTKSAkKEBEKSAkKEBEKS9wYXRjaGVzICoucGF0Y2g7Citl
bmRlZgorSE9TVF9HQ0NfQkFSRV9NRVRBTF9QT1NUX1BBVENIX0hPT0tTICs9IEhPU1RfR0NDX0JB
UkVfTUVUQUxfQVBQTFlfTE9DQUxfUEFUQ0hFUworZW5kaWYgI2lmZXEgKCQoQlIyX1BBQ0tBR0Vf
SE9TVF9UT09MQ0hBSU5fQkFSRV9NRVRBTF9BUkNIKSwibWljcm9ibGF6ZWVsLXhpbGlueCIpCisK
KyMgZ2NjIGRvZXNuJ3Qgc3VwcG9ydCBpbi10cmVlIGJ1aWxkLCBzbyB3ZSBjcmVhdGUgYSAnYnVp
bGQnCisjIHN1YmRpcmVjdG9yeSBpbiB0aGUgZ2NjIHNvdXJjZXMsIGFuZCBidWlsZCBmcm9tIHRo
ZXJlLgorZGVmaW5lIEdDQ19CQVJFX01FVEFMX0NPTkZJR1VSRV9TWU1MSU5LCisJbWtkaXIgLXAg
JChARCkvYnVpbGQKKwlsbiAtc2YgLi4vY29uZmlndXJlICQoQEQpL2J1aWxkL2NvbmZpZ3VyZQor
ZW5kZWYKKworSE9TVF9HQ0NfQkFSRV9NRVRBTF9QUkVfQ09ORklHVVJFX0hPT0tTICs9IEdDQ19C
QVJFX01FVEFMX0NPTkZJR1VSRV9TWU1MSU5LCitIT1NUX0dDQ19CQVJFX01FVEFMX1NVQkRJUiA9
IGJ1aWxkCisKK0hPU1RfR0NDX0JBUkVfTUVUQUxfTUFLRV9PUFRTID0gJChIT1NUX0dDQ19DT01N
T05fTUFLRV9PUFRTKSBhbGwtZ2NjIGFsbC10YXJnZXQtbGliZ2NjCitIT1NUX0dDQ19CQVJFX01F
VEFMX0lOU1RBTExfT1BUUyA9IGluc3RhbGwtZ2NjIGluc3RhbGwtdGFyZ2V0LWxpYmdjYworCitI
T1NUX0dDQ19CQVJFX01FVEFMX0NPTkZfT1BUUyA9IFwKKwktLXRhcmdldD0kKEJSMl9QQUNLQUdF
X0hPU1RfVE9PTENIQUlOX0JBUkVfTUVUQUxfQVJDSCktZWxmIFwKKwktLWRpc2FibGUtaW5pdGZp
bmlfYXJyYXkgXAorCS0tZGlzYWJsZS1fX2N4YV9hdGV4aXQgXAorCS0tZGlzYWJsZS1saWJzdGRj
eHgtcGNoIFwKKwktLXdpdGgtbmV3bGliIFwKKwktLWRpc2FibGUtdGhyZWFkcyBcCisJLS1lbmFi
bGUtcGx1Z2lucyBcCisJLS13aXRoLWdudS1hcyBcCisJLS1kaXNhYmxlLWxpYml0bSBcCisJLS13
aXRob3V0LWxvbmctZG91YmxlLTEyOCBcCisJLS13aXRob3V0LWhlYWRlcnMgXAorCS0tZW5hYmxl
LWxhbmd1YWdlcz1jIFwKKwktLWRpc2FibGUtbXVsdGlsaWIgXAorCS0td2l0aC1nbXA9JChIT1NU
X0RJUikgXAorCS0td2l0aC1tcGM9JChIT1NUX0RJUikgXAorCS0td2l0aC1tcGZyPSQoSE9TVF9E
SVIpIFwKKwktLXdpdGgtaXNsPSQoSE9TVF9ESVIpIFwKKwlBUl9GT1JfVEFSR0VUPSQoTykvaG9z
dC9iaW4vJChCUjJfUEFDS0FHRV9IT1NUX1RPT0xDSEFJTl9CQVJFX01FVEFMX0FSQ0gpLWVsZi1h
ciBcCisJUkFOTElCX0ZPUl9UQVJHRVQ9JChPKS9ob3N0L2Jpbi8kKEJSMl9QQUNLQUdFX0hPU1Rf
VE9PTENIQUlOX0JBUkVfTUVUQUxfQVJDSCktZWxmLXJhbmxpYgorCiskKGV2YWwgJChob3N0LWF1
dG90b29scy1wYWNrYWdlKSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
