Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84C3CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 11:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7BAD704DC;
	Fri, 20 Oct 2023 11:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7BAD704DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kB1wINDmR0V7; Fri, 20 Oct 2023 11:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71B077049C;
	Fri, 20 Oct 2023 11:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71B077049C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A420F1BF3A9
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CF8941467
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CF8941467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id imkOv2NdnrDi for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 11:43:03 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CA00402A7
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 11:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CA00402A7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeIlXNNgr0JiJkfPNOpJafN6aCnjqLSUoF/Gb+0eUTXjiikkOebUfIw/BlDGE2PPzhASFctgILpZUMIFHf+hPTO5AJiYBqPUJmDMq6oSqpM0X8PIhS1CyDAB3/HYg+hUWD7oBMkl2gPkcK5gJ9bRAq/13JGBqa/tIUyy7blsev1nAlUt24l9myDAC25wbwCzigbfyvIC6Lz5SMXrlEOO8BmxKSBUenJ9Jjfhf4BTyGF5m+66p/BflTXk7G9fDsNaJu/Zliv7GNSndFv8XtMLVwKSOBsfdcCQmHLZ0ysmctc0P3HeK+J9Ixb4FkJNsLUyQF5b5B9jBYJKTxzdCbhn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEU0dBJY9RbHdboIiNL/syr6T1Opu4Zofi0Igaib3N4=;
 b=lLuwVCtpC7T7SOH3wucBsHD2j4+W3qNiojzkFkbFBshKTfUBCXiFUOL4r/c+nGWtbDbyDwG9E0EjrRAyMZPdkaGAw/ivEO2/OxtvMZfKFWrTNGh4JJoeTtxrycluPNJ06J3HIwA6zmWB05Y/hWOoJCbthqRF8qNg5tNjpU/HSjpniqedm4fAS+O4LDqVRk3PsIqAEG3VQg5VhzxkqKUnluA9l2k8fyObDnDT4wPjfHuk04GVA+Si8fcX/MvbbQsGBlqvEGx1RoaacH3HSebCSsp6P/DAldsqr03ikS4yTTidaHaLARuktaY08Nfu3jkA7KF8BVlavuBjGBJlfJx8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from SA9PR11CA0030.namprd11.prod.outlook.com (2603:10b6:806:6e::35)
 by DM6PR12MB4386.namprd12.prod.outlook.com (2603:10b6:5:28f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25; Fri, 20 Oct
 2023 11:43:00 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:6e:cafe::e) by SA9PR11CA0030.outlook.office365.com
 (2603:10b6:806:6e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 11:43:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Fri, 20 Oct 2023 11:42:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 06:42:59 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 06:42:58 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 20 Oct 2023 06:42:57 -0500
To: <buildroot@buildroot.org>
Date: Fri, 20 Oct 2023 12:42:28 +0100
Message-ID: <20231020114236.4129636-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020114236.4129636-1-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|DM6PR12MB4386:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f165870-39e0-4178-6b64-08dbd161b5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RaFMF34AEBsya9Fr3CO7QmS2dH977IzRzNqE0LbQNVsSB5e3ARL7tQIlMoEKoGwmEXD65MOsSU8l3CKSSjmFJSq5xC5Gan/+nSNHNuW+34Cp0HWkvVu9MDL1hdKJZIGQwIqhs8eRjRL315Ef9LKXiRoyWysC7c9cZ5J9/gU3M1Q8NJNo5/jiUCUYJ7G9v12KBGbXTqPGVm8BI2tW9zJaw5syS6hSPdp1S9vVKSoY1JXl/CHH8KN08Ufv8AyhLEFA/m8OVLO6MKKcefWXEixGApIZ8/UqCWSVdXjQu8jBxvUGLQBN3/IUUBGHajlQfXb+CTIyKKKREvdwwsLwXkf4881Q/FBv/b8ATRgpGEFWY4nk/c70OrbUazRXqrg7VlqoT1nQ/VNffWVGof3jrqwvWPTjEgyfVwN48klWoywPUDRqbkyMTRG4hOPEwYkQptPzrvfCCJ1UO51Yw5UDTJlvcDdMHtk92sj8mfYhQ4POIxbHtHhg7y/S4uj6b7hmzmpoLvO6KcxlXSto7aIVJ14vVxwA/MNmjWNbiKqSYRriqFbWaGKBnEHl6gtmX2EMgjItC23fcGlROy+BoMzLObHwBzh4oaaT1V+xOMm5r2Nz+OW6KLAlBm9/5odXdb0S0uWQXF7y4ZJ8c3C/5nrd2J8/iAfz92aZs3VLGDl4H/EqXf6GnQV1tctpXHM7WP7cSK0b48lopemCvP+G5LoXGVz70t39v4lv81BBEFpw+FVf6hPy1+bHCwnkuMA20wuIlPFC2DnIPTvjoE92ao9UyrwRtIAARB7tfHrJC4rq2nxBD9w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(86362001)(47076005)(2906002)(4326008)(5660300002)(41300700001)(81166007)(356005)(82740400003)(336012)(26005)(426003)(8676002)(36860700001)(1076003)(2616005)(36756003)(44832011)(8936002)(478600001)(966005)(316002)(70206006)(70586007)(6666004)(6916009)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 11:42:59.3620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f165870-39e0-4178-6b64-08dbd161b5be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4386
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEU0dBJY9RbHdboIiNL/syr6T1Opu4Zofi0Igaib3N4=;
 b=k/WumnVzAPJ38qK4+Nj1ux2yzXz2oPb+0uKJQUckm71llRaz3eBRhFD85SZI0yh4/tjZhclQHrl/F9qKV/GrjNAQlYOBt3Z3YXsDZTLbrmpz5aFPi7YRG7U5ldS0cBGwiYEF23uf+UWsjILuWOwUOmW0EW6rmJQx8Q96Sxhqw0k=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=k/WumnVz
Subject: [Buildroot] [PATCH v6 02/10] package/gcc-bare-metal: new package
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
dG8gdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290Ci0tLQogREVWRUxPUEVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKwogcGFja2FnZS9nY2MtYmFyZS1tZXRhbC8x
My4yLjAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9Db25maWcu
aW4uaG9zdCAgICAgIHwgMTIgKysrKwogcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1t
ZXRhbC5oYXNoIHwgIDkgKysrCiBwYWNrYWdlL2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFs
Lm1rICAgfCA2OCArKysrKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDkyIGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEyMDAwMCBwYWNrYWdlL2djYy1iYXJlLW1ldGFsLzEz
LjIuMAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvQ29uZmlnLmlu
Lmhvc3QKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2djYy1iYXJlLW1ldGFsL2djYy1iYXJl
LW1ldGFsLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2djYy1iYXJlLW1ldGFsL2dj
Yy1iYXJlLW1ldGFsLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5k
ZXggOWMyYjY2NDQyNi4uOTIyYTc0ZTQyNiAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9E
RVZFTE9QRVJTCkBAIC0xMzY4LDYgKzEzNjgsNyBAQCBGOglwYWNrYWdlL3B5dGhvbi1ycGktZ3Bp
by8KIAogTjoJSWJhaSBFcmtpYWdhIDxpYmFpLmVya2lhZ2EtZWxvcnphQGFtZC5jb20+CiBGOglw
YWNrYWdlL2JpbnV0aWxzLWJhcmUtbWV0YWwvCitGOglwYWNrYWdlL2djYy1iYXJlLW1ldGFsLwog
CiBOOglJZ25hY3kgR2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlv
bnMuZnI+CiBGOglwYWNrYWdlL2FuZ3VsYXJqcy8KQEAgLTIyMDIsNiArMjIwMyw3IEBAIEY6CWNv
bmZpZ3MvenlucW1wX3pjdTEwMl9kZWZjb25maWcKIEY6CWNvbmZpZ3MvenlucW1wX3pjdTEwNl9k
ZWZjb25maWcKIEY6CXBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRhbC8KIEY6CXBhY2thZ2UvYm9v
dGdlbi8KK0Y6CXBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvCiBGOglwYWNrYWdlL3ZlcnNhbC1maXJt
d2FyZS8KIAogTjoJTmljb2xhIERpIExpZXRvIDxuaWNvbGEuZGlsaWV0b0BnbWFpbC5jb20+CmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2djYy1iYXJlLW1ldGFsLzEzLjIuMCBiL3BhY2thZ2UvZ2NjLWJh
cmUtbWV0YWwvMTMuMi4wCm5ldyBmaWxlIG1vZGUgMTIwMDAwCmluZGV4IDAwMDAwMDAwMDAuLjlh
ZTk2YThhNDUKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2djYy1iYXJlLW1ldGFsLzEzLjIu
MApAQCAtMCwwICsxIEBACisuLi9nY2MvMTMuMi4wClwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmls
ZQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdCBiL3Bh
Y2thZ2UvZ2NjLWJhcmUtbWV0YWwvQ29uZmlnLmluLmhvc3QKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uY2E3NzM1MzQwYwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uv
Z2NjLWJhcmUtbWV0YWwvQ29uZmlnLmluLmhvc3QKQEAgLTAsMCArMSwxMiBAQAorY29uZmlnIEJS
Ml9QQUNLQUdFX0hPU1RfR0NDX0JBUkVfTUVUQUwKKwlib29sICJob3N0IGdjYy1iYXJlLW1ldGFs
IgorCWhlbHAKKwkgIEJ1aWxkIEdDQyBmb3IgYSBiYXJlLW1ldGFsIHRvb2xjaGFpbgorCitpZiBC
UjJfUEFDS0FHRV9IT1NUX0dDQ19CQVJFX01FVEFMCisKK2NvbmZpZyBCUjJfUEFDS0FHRV9IT1NU
X0dDQ19CQVJFX01FVEFMX1ZFUlNJT04KKwlzdHJpbmcKKwlkZWZhdWx0ICIxMy4yLjAiCisKK2Vu
ZGlmICNCUjJfUEFDS0FHRV9IT1NUX0dDQ19CQVJFX01FVEFMCmRpZmYgLS1naXQgYS9wYWNrYWdl
L2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLmhhc2ggYi9wYWNrYWdlL2djYy1iYXJlLW1l
dGFsL2djYy1iYXJlLW1ldGFsLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uNWM1YzI4ZmE3ZQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZ2NjLWJhcmUtbWV0
YWwvZ2NjLWJhcmUtbWV0YWwuaGFzaApAQCAtMCwwICsxLDkgQEAKKyMgRnJvbSBodHRwczovL2dj
Yy5nbnUub3JnL3B1Yi9nY2MvcmVsZWFzZXMvZ2NjLTEzLjIuMC9zaGE1MTIuc3VtCitzaGE1MTIg
IGQ5OWU0ODI2YTcwZGIwNDUwNDQ2N2UzNDllOWZiYWVkYWE1ODcwNzY2Y2RhN2M1Y2FiNTBjZGVi
ZWRjNGJlNzU1ZWJjYTViNzg5ZTEyMzJhMzRhMjBiZTFhMGI2MDA5N2RlOTI4MGVmZTQ3YmRiNzFj
NzMyNTFlMzBiMDg2MmEyICBnY2MtMTMuMi4wLnRhci54egorCisjIExvY2FsbHkgY2FsY3VsYXRl
ZAorc2hhMjU2ICAyMzFmN2VkY2M3MzUyZDc3MzRhOTZlZWYwYjgwMzBmNzc5ODI2NzhjNTE2ODc2
ZmNiODFlMjViMzJkNjg1NjRjICBDT1BZSU5HCitzaGEyNTYgIDhjZWI0YjllZTVhZGVkZGU0N2Iz
MWU5NzVjMWQ5MGM3M2FkMjdiNmIxNjVhMWRjZDgwYzdjNTQ1ZWI2NWI5MDMgIENPUFlJTkczCitz
aGEyNTYgIGE4NTNjMmZmZWMxNzA1Nzg3MjM0MGVlZTI0MmFlNGQ5NmNiZjJiNTIwYWUyN2Q5MDNl
MWIyZmVmMWE1ZjlkMWMgIENPUFlJTkczLkxJQgorc2hhMjU2ICBhOWJkZGU1NjE2ZWNkZDFlOTgw
YjQ0ZjM2MDYwMGVlODc4M2IxZjk5YjhjYzgzYTJiZWIxNjNhMGEzOTBlODYxICBDT1BZSU5HLkxJ
Qgorc2hhMjU2ICA5ZDZiNDNjZTRkOGRlMGM4NzhiZjE2YjU0ZDhlN2ExMGQ5YmQ0MmI3NTE3ODE1
M2UzYWY2YTgxNWJkYzkwZjc0ICBDT1BZSU5HLlJVTlRJTUUKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
Z2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwubWsgYi9wYWNrYWdlL2djYy1iYXJlLW1ldGFs
L2djYy1iYXJlLW1ldGFsLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LmZlNmY5MzEwMDgKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2djYy1iYXJlLW1ldGFsL2dj
Yy1iYXJlLW1ldGFsLm1rCkBAIC0wLDAgKzEsNjggQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CisjCisjIGdjYy1iYXJlLW1ldGFsCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitIT1NU
X0dDQ19CQVJFX01FVEFMX1ZFUlNJT04gPSBcCisJJChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdF
X0hPU1RfR0NDX0JBUkVfTUVUQUxfVkVSU0lPTikpCitpZmVxICgkKEhPU1RfR0NDX0JBUkVfTUVU
QUxfVkVSU0lPTiksKQorSE9TVF9HQ0NfQkFSRV9NRVRBTF9WRVJTSU9OID0gMTMuMi4wCitlbmRp
ZgorCitIT1NUX0dDQ19CQVJFX01FVEFMX1NJVEUgPSBcCisJaHR0cHM6Ly9mdHAuZ251Lm9yZy9n
bnUvZ2NjL2djYy0kKEhPU1RfR0NDX0JBUkVfTUVUQUxfVkVSU0lPTikKK0hPU1RfR0NDX0JBUkVf
TUVUQUxfU09VUkNFID0gZ2NjLSQoSE9TVF9HQ0NfQkFSRV9NRVRBTF9WRVJTSU9OKS50YXIueHoK
KworSE9TVF9HQ0NfQkFSRV9NRVRBTF9MSUNFTlNFID0gR1BMLTIuMCwgR1BMLTMuMCwgTEdQTC0y
LjEsIExHUEwtMy4wCitIT1NUX0dDQ19CQVJFX01FVEFMX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5H
IENPUFlJTkczIENPUFlJTkcuTElCIENPUFlJTkczLkxJQgorCitIT1NUX0dDQ19CQVJFX01FVEFM
X0RFUEVOREVOQ0lFUyA9IFwKKwlob3N0LWJpbnV0aWxzLWJhcmUtbWV0YWwgXAorCWhvc3QtZ21w
IFwKKwlob3N0LW1wYyBcCisJaG9zdC1tcGZyIFwKKwlob3N0LWlzbAorCisjIGdjYyBkb2Vzbid0
IHN1cHBvcnQgaW4tdHJlZSBidWlsZCwgc28gd2UgY3JlYXRlIGEgJ2J1aWxkJworIyBzdWJkaXJl
Y3RvcnkgaW4gdGhlIGdjYyBzb3VyY2VzLCBhbmQgYnVpbGQgZnJvbSB0aGVyZS4KK2RlZmluZSBH
Q0NfQkFSRV9NRVRBTF9DT05GSUdVUkVfU1lNTElOSworCW1rZGlyIC1wICQoQEQpL2J1aWxkCisJ
bG4gLXNmIC4uL2NvbmZpZ3VyZSAkKEBEKS9idWlsZC9jb25maWd1cmUKK2VuZGVmCisKK0hPU1Rf
R0NDX0JBUkVfTUVUQUxfUFJFX0NPTkZJR1VSRV9IT09LUyArPSBHQ0NfQkFSRV9NRVRBTF9DT05G
SUdVUkVfU1lNTElOSworSE9TVF9HQ0NfQkFSRV9NRVRBTF9TVUJESVIgPSBidWlsZAorCitIT1NU
X0dDQ19CQVJFX01FVEFMX01BS0VfT1BUUyA9IFwKKwkkKEhPU1RfR0NDX0NPTU1PTl9NQUtFX09Q
VFMpIFwKKwlhbGwtZ2NjIFwKKwlhbGwtdGFyZ2V0LWxpYmdjYworCitIT1NUX0dDQ19CQVJFX01F
VEFMX0lOU1RBTExfT1BUUyA9IGluc3RhbGwtZ2NjIGluc3RhbGwtdGFyZ2V0LWxpYmdjYworCitH
Q0NfQkFSRV9NRVRBTF9BUkNIID0gXAorCSQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9IT1NU
X1RPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVF9BUkNIKSkKKworSE9TVF9HQ0NfQkFSRV9N
RVRBTF9DT05GX09QVFMgPSBcCisJLS10YXJnZXQ9JChHQ0NfQkFSRV9NRVRBTF9BUkNIKS1lbGYg
XAorCS0tZGlzYWJsZS1pbml0ZmluaV9hcnJheSBcCisJLS1kaXNhYmxlLV9fY3hhX2F0ZXhpdCBc
CisJLS1kaXNhYmxlLWxpYnN0ZGN4eC1wY2ggXAorCS0td2l0aC1uZXdsaWIgXAorCS0tZGlzYWJs
ZS10aHJlYWRzIFwKKwktLWVuYWJsZS1wbHVnaW5zIFwKKwktLXdpdGgtZ251LWFzIFwKKwktLWRp
c2FibGUtbGliaXRtIFwKKwktLXdpdGhvdXQtbG9uZy1kb3VibGUtMTI4IFwKKwktLXdpdGhvdXQt
aGVhZGVycyBcCisJLS1lbmFibGUtbGFuZ3VhZ2VzPWMgXAorCS0tZGlzYWJsZS1tdWx0aWxpYiBc
CisJLS13aXRoLWdtcD0kKEhPU1RfRElSKSBcCisJLS13aXRoLW1wYz0kKEhPU1RfRElSKSBcCisJ
LS13aXRoLW1wZnI9JChIT1NUX0RJUikgXAorCS0td2l0aC1pc2w9JChIT1NUX0RJUikgXAorCUFS
X0ZPUl9UQVJHRVQ9JChPKS9ob3N0L2Jpbi8kKEdDQ19CQVJFX01FVEFMX0FSQ0gpLWVsZi1hciBc
CisJUkFOTElCX0ZPUl9UQVJHRVQ9JChPKS9ob3N0L2Jpbi8kKEdDQ19CQVJFX01FVEFMX0FSQ0gp
LWVsZi1yYW5saWIKKworJChldmFsICQoaG9zdC1hdXRvdG9vbHMtcGFja2FnZSkpCi0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
