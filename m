Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73054C2BB3F
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 14:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D7EF81449;
	Mon, 20 Nov 2023 14:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D7EF81449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gn87YboYghCN; Mon, 20 Nov 2023 14:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E5D08186E;
	Mon, 20 Nov 2023 14:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E5D08186E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 580061BF5B3
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 14:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1F1B4093A
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 14:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1F1B4093A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGEJCfKUN7CE for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 14:09:11 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::614])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF66E4092A
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 14:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF66E4092A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXSoj6ALHPsKLK+FMNUYUxgR7tEAwIo9gcNrN+mBBpmbLh9AYMOmHQL6cTqoXbxN91nYmTUZdEvPQ6d2rmUy8Hc9JxLJ++kuOOtY77Zl0wbf7MxfSJCewU4QN93ERbl5suWquBD3yY3HqtTGxz7MAHloe8Hnq/Ved+dDXhiqoJqR6UhMQ/ji93YrzN9GMt4gQqR438fKYd4PsAR5Exp2IhU5RWaMkM5K+zC384PDefA/3chnBdNxKFefZKn/UN48LsoYlbIyWZzXN7V7NqLCVEB6xFfQQWnRFiBOtZd5qfaPo0ceTzLX9AVltKGdajWrwQhPBd1LlEBV3Kqa37m27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqUsRxBm2qz38i3YwVc9ouhKF2tWbFNJ79FayzPN56I=;
 b=Cve0oL0FbZU0senL5QHwFSmd6D6s07JUiUt4wxzCSkTlh40EAVBRbRpiBh6lb8J8CyIL0I/OSs3x7mzB1hD+f+CM7hInH4/qT3eB3TZr8pZj4ljNpV3dXcYjUv04EZKKJOnnaDlOQT3xyThUBsnk/gFjiaHzz2UwC9MHHplsEvWakztigfVgyzOjqC45u//F3ifo6ec0A9qFCwgAEjsMWie+vE2VPm5q8gyBmL/0Jwn40OCbgF7I+vZTvQKj+cJ2yaD8RC3O5GJyHUbrJLoqmR5Rhagv8cwQ0q+gIV3LNtI/w+Q/ElKIDZnsfeeAxEXqzVONajZIU+RMoGQuE1wZyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR02CA0139.namprd02.prod.outlook.com (2603:10b6:5:332::6) by
 CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.27; Mon, 20 Nov 2023 14:09:07 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::8f) by DM6PR02CA0139.outlook.office365.com
 (2603:10b6:5:332::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26 via Frontend
 Transport; Mon, 20 Nov 2023 14:09:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 14:09:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 08:09:05 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 08:09:05 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 20 Nov 2023 08:09:04 -0600
To: <buildroot@buildroot.org>
Date: Mon, 20 Nov 2023 14:08:21 +0000
Message-ID: <20231120140828.1903865-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120140828.1903865-1-neal.frager@amd.com>
References: <20231120140828.1903865-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|CH2PR12MB4152:EE_
X-MS-Office365-Filtering-Correlation-Id: 716fd9b2-5196-4dbe-253a-08dbe9d24211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eEW1iFOzuVpukddNPuCDA6r8M0/KMJKQr5jyRKxM8K3ksaoKna3cquN7yfV5OMhg1E5E4dr3pvqxDjhP8LcNbiij9zr0b2syhpMyhM7AOHUW0YnuAE6pdg/YRorgvR2EiWjJ8LoMKCI8rjwPasn54v51Q1SgM3CCrdVBoFsZEBL3ZGyYne7S1PaQzP73D7HWu3j4ldGnpgqQsW+SpSLPq9m4lR+5HZvFSbVdXeRQID6PD6tBXmco0J3GCkGmRHrNrSxOjm+Sk9Rl/AHkWsfenj4SXqjU4HeKB9rPwJvow6ZMcA9boXS3CEl7QTdLLI8x7VMHoa4H+zg+xjfk9/EyDLNThpIp/xprEFINhP6lpp/7IFTo4sShKZWbavAXlyciyYOIIZN33uXlU1fbKblOcohkMiEo0g64r7B99dMIZHRny+GPPMGqFTrhmCW8sh/KlfM7kLoJZ4ey6GmXHI7d7R+Hr+Kb+kBVP1eC1YV7AcOAmdn4JjxeYUO0Q/u3q3waNV/VVi6hOtQsz1ijyacz9oGjhJ8fIeGJZxLp/g946S7w21JU7NFJljntCCWnOX74Xp6G5+Exf7uKebjBACrLj18rn8fJG1VVupqgSnnV03qqdgl84Q+K9QQ7dL6tcc+Oh1RMwjRpztSRrgabLK4oq7KZyFLNs4a3RIqDKE/vS9xsNOi4rcR1pw7/tawquSQRjoM22MbahRVOWh8h3RfkJ8PSaEEOlLB8Y+NBJYUeu4WSzMPvUncPLZNjKAL8FZJQ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(82310400011)(46966006)(40470700004)(36840700001)(40460700003)(426003)(336012)(26005)(1076003)(47076005)(36860700001)(41300700001)(4326008)(8676002)(8936002)(2906002)(44832011)(5660300002)(478600001)(6666004)(70586007)(70206006)(6916009)(54906003)(316002)(36756003)(81166007)(86362001)(82740400003)(356005)(2616005)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 14:09:06.2787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 716fd9b2-5196-4dbe-253a-08dbe9d24211
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqUsRxBm2qz38i3YwVc9ouhKF2tWbFNJ79FayzPN56I=;
 b=t/CyJu2QxqmlKcIxYw+1+Zv46cZS8QET5hfXgtArQRnTTt82pMNHvLp1cFDvblTUCvtxKBz4OY0b6vQzOtzmEp6w7vxFrPoNMNqY2nKwEePffHdHwQVg/QZjiyEVfyFaxCcMj/k1ss9jqyyg3wSXbdfHuRggWRHenoK2szJ3tdY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=t/CyJu2Q
Subject: [Buildroot] [PATCH v7 03/10] package/newlib-bare-metal: new package
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

VGhpcyBwYXRjaCBhZGRzIGEgbmV3IHBhY2thZ2UgZm9yIGJ1aWxkaW5nIG5ld2xpYiBmb3IgYSBi
YXJlLW1ldGFsIHRvb2xjaGFpbi4KVGhlIGNwdSBhcmNoaXRlY3R1cmUgaXMgZGVmaW5lZCBieSBh
IHRvb2xjaGFpbi1iYXJlLW1ldGFsIHZpcnR1YWwgcGFja2FnZS4KV2hpbGUgYW55IGNwdSBhcmNo
aXRlY3R1cmUgY291bGQgYmUgdXNlZCwgdGhlIGRlZmF1bHQgY29uZmlndXJhdGlvbiB3aWxsIGJl
IGEKWGlsaW54IG1pY3JvYmxhemUgbGl0dGxlIGVuZGlhbiBhcmNoaXRlY3R1cmUsIHNvIHRoYXQg
YnVpbGRyb290IHdpbGwgYmUgYWJsZQp0byBidWlsZCB0aGUgbWljcm9ibGF6ZSBmaXJtd2FyZSBh
cHBsaWNhdGlvbnMgZm9yIHp5bnFtcCBhbmQgdmVyc2FsLgoKU2lnbmVkLW9mZi1ieTogSWJhaSBF
cmtpYWdhIDxpYmFpLmVya2lhZ2EtZWxvcnphQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE5lYWwg
RnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPgotLS0KVjEtPlYyOgogLSByZW1vdmVkIGRlZmF1
bHQgZW5hYmxlIHRvIGJlIHJlcGxhY2VkIHdpdGggdG9vbGNoYWluIHNlbGVjdCBjb25maWcKVjIt
PlYzOgogLSBubyBjaGFuZ2VzClYzLT5WNDoKIC0gcmVwbGFjZWQgdW5uZWNlc3NhcnkgPT8gd2l0
aCA9IGZvciBhc3NpZ25tZW50cwogLSBpbXByb3ZlZCBtZW51Y29uZmlnIGhlbHAgY29tbWVudApW
NC0+VjU6CiAtIGFkZGVkIGxpY2Vuc2UgZmlsZXMKIC0gcmVkdWNlZCBhbGwgbGluZXMgdG8gPDgw
IGNoYXJzClY1LT5WNjoKIC0gbWlncmF0ZWQgdG8gdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRy
b290ClY2LT5WNzoKIC0gaGFyZC1jb2RlZCB2ZXJzaW9uCiAtIGNvbnZlcnRlZCB0byB0YXJnZXQg
cGFja2FnZSB3aXRoIGdjYy1iYXJlLW1ldGFsIHN5c3Jvb3QgaW5zdGFsbAotLS0KIERFVkVMT1BF
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIHBhY2thZ2UvbmV3
bGliLWJhcmUtbWV0YWwvQ29uZmlnLmluICAgICAgICAgICB8ICAyICsKIC4uLi9uZXdsaWItYmFy
ZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5oYXNoICB8ICA4ICsrKwogLi4uL25ld2xpYi1iYXJl
LW1ldGFsL25ld2xpYi1iYXJlLW1ldGFsLm1rICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKwog
NCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9uZXdsaWItYmFyZS1tZXRhbC9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xpYi1iYXJlLW1ldGFsLmhhc2gKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xpYi1iYXJlLW1ldGFsLm1rCgpk
aWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggZmRmZDMwZmI2Zi4uMTUy
MTE1Y2YzYiAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xMzg0
LDYgKzEzODQsNyBAQCBGOglwYWNrYWdlL3B5dGhvbi1ycGktZ3Bpby8KIE46CUliYWkgRXJraWFn
YSA8aWJhaS5lcmtpYWdhLWVsb3J6YUBhbWQuY29tPgogRjoJcGFja2FnZS9iaW51dGlscy1iYXJl
LW1ldGFsLwogRjoJcGFja2FnZS9nY2MtYmFyZS1tZXRhbC8KK0Y6CXBhY2thZ2UvbmV3bGliLWJh
cmUtbWV0YWwvCiAKIE46CUlnbmFjeSBHYXfEmWR6a2kgPGlnbmFjeS5nYXdlZHpraUBncmVlbi1j
b21tdW5pY2F0aW9ucy5mcj4KIEY6CXBhY2thZ2UvYW5ndWxhcmpzLwpAQCAtMjIyMSw2ICsyMjIy
LDcgQEAgRjoJY29uZmlncy96eW5xbXBfemN1MTA2X2RlZmNvbmZpZwogRjoJcGFja2FnZS9iaW51
dGlscy1iYXJlLW1ldGFsLwogRjoJcGFja2FnZS9ib290Z2VuLwogRjoJcGFja2FnZS9nY2MtYmFy
ZS1tZXRhbC8KK0Y6CXBhY2thZ2UvbmV3bGliLWJhcmUtbWV0YWwvCiBGOglwYWNrYWdlL3ZlcnNh
bC1maXJtd2FyZS8KIAogTjoJTmljb2xhIERpIExpZXRvIDxuaWNvbGEuZGlsaWV0b0BnbWFpbC5j
b20+CmRpZmYgLS1naXQgYS9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL0NvbmZpZy5pbiBiL3Bh
Y2thZ2UvbmV3bGliLWJhcmUtbWV0YWwvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLjFmZjNkNWQ4ZWMKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL25l
d2xpYi1iYXJlLW1ldGFsL0NvbmZpZy5pbgpAQCAtMCwwICsxLDIgQEAKK2NvbmZpZyBCUjJfUEFD
S0FHRV9ORVdMSUJfQkFSRV9NRVRBTAorCWJvb2wKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmV3bGli
LWJhcmUtbWV0YWwvbmV3bGliLWJhcmUtbWV0YWwuaGFzaCBiL3BhY2thZ2UvbmV3bGliLWJhcmUt
bWV0YWwvbmV3bGliLWJhcmUtbWV0YWwuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi40MmM3ZDgxYTlmCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9uZXdsaWIt
YmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5oYXNoCkBAIC0wLDAgKzEsOCBAQAorIyBMb2Nh
bGx5IGNhbGN1bGF0ZWQKK3NoYTI1NiAgODNhNjJhOTlhZjU5ZTM4ZWI5YjBjNThlZDA5MmVlMjRk
NzAwZmZmNDNhMjJjMDNlNDMzOTU1MTEzZWYzNTE1MCAgbmV3bGliLTQuMy4wLjIwMjMwMTIwLnRh
ci5negorCisjIEhhc2hlcyBmb3IgbGljZW5zZSBmaWxlcyBsb2NhbGx5IGNhbGN1bGF0ZWQKK3No
YTI1NiAgMjMxZjdlZGNjNzM1MmQ3NzM0YTk2ZWVmMGI4MDMwZjc3OTgyNjc4YzUxNjg3NmZjYjgx
ZTI1YjMyZDY4NTY0YyAgQ09QWUlORworc2hhMjU2ICBhOWJkZGU1NjE2ZWNkZDFlOTgwYjQ0ZjM2
MDYwMGVlODc4M2IxZjk5YjhjYzgzYTJiZWIxNjNhMGEzOTBlODYxICBDT1BZSU5HLkxJQgorc2hh
MjU2ICBmM2I3ZjNlNDQyNmIxZmE2ZjYwMTk4ZGFlN2FkZmVkZDk0Yjc3YjI4ZGIyZDEwOGFkYzAy
NTM1NzUwMTFlMGZmICBDT1BZSU5HLkxJQkdMT1NTCitzaGEyNTYgIDQyMmFhNDAyOTMwOTNmYjU0
ZmM2NmU2OTJhMGQ2OGZkMGIyNGVkNTYwMmU1ZDFkMzNhZDA1YmEzOTA5MDU3ZTkgIENPUFlJTkcu
TkVXTElCCmRpZmYgLS1naXQgYS9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xpYi1iYXJl
LW1ldGFsLm1rIGIvcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5t
awpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5kZGRiYTBjNDU5Ci0tLSAv
ZGV2L251bGwKKysrIGIvcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRh
bC5tawpAQCAtMCwwICsxLDUxIEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBuZXds
aWItYmFyZS1tZXRhbAorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworTkVXTElCX0JBUkVf
TUVUQUxfVkVSU0lPTiA9IDQuMy4wCisKK05FV0xJQl9CQVJFX01FVEFMX1NJVEUgPSBmdHA6Ly9z
b3VyY2V3YXJlLm9yZy9wdWIvbmV3bGliCitORVdMSUJfQkFSRV9NRVRBTF9TT1VSQ0UgPSBuZXds
aWItJChORVdMSUJfQkFSRV9NRVRBTF9WRVJTSU9OKS4yMDIzMDEyMC50YXIuZ3oKK05FV0xJQl9C
QVJFX01FVEFMX0RFUEVOREVOQ0lFUyA9IGhvc3QtZ2NjLWJhcmUtbWV0YWwKKworTkVXTElCX0JB
UkVfTUVUQUxfTElDRU5TRSA9IEdQTC0yLjAsIEdQTC0zLjAsIExHUEwtMi4xLCBMR1BMLTMuMAor
TkVXTElCX0JBUkVfTUVUQUxfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgXAorCUNPUFlJTkcuTElC
IFwKKwlDT1BZSU5HLkxJQkdMT1NTIFwKKwlDT1BZSU5HLk5FV0xJQgorCitORVdMSUJfQkFSRV9N
RVRBTF9BUkNIID0gXAorCSQoY2FsbCBxc3RyaXAsJChCUjJfVE9PTENIQUlOX0JBUkVfTUVUQUxf
QlVJTERST09UX0FSQ0gpKQorCitORVdMSUJfQkFSRV9NRVRBTF9DT05GX09QVFMgPSBcCisJLS10
YXJnZXQ9JChORVdMSUJfQkFSRV9NRVRBTF9BUkNIKSBcCisJQ0NfRk9SX1RBUkdFVD0kKEhPU1Rf
RElSKS9iaW4vJChORVdMSUJfQkFSRV9NRVRBTF9BUkNIKS1nY2MgXAorCUFSX0ZPUl9UQVJHRVQ9
JChIT1NUX0RJUikvYmluLyQoTkVXTElCX0JBUkVfTUVUQUxfQVJDSCktYXIgXAorCVJBTkxJQl9G
T1JfVEFSR0VUPSQoSE9TVF9ESVIpL2Jpbi8kKE5FV0xJQl9CQVJFX01FVEFMX0FSQ0gpLXJhbmxp
YiBcCisJLS1lbmFibGUtbmV3bGliLWlvLWM5OS1mb3JtYXRzIFwKKwktLWVuYWJsZS1uZXdsaWIt
aW8tbG9uZy1sb25nIFwKKwktLWVuYWJsZS1uZXdsaWItaW8tZmxvYXQgXAorCS0tZW5hYmxlLW5l
d2xpYi1pby1sb25nLWRvdWJsZSBcCisJLS1kaXNhYmxlLW11bHRpbGliCisKK05FV0xJQl9CQVJF
X01FVEFMX01BS0UgPSAkKE1BS0UxKQorCitORVdMSUJfQkFSRV9NRVRBTF9JTlNUQUxMX1NUQUdJ
TkcgPSBZRVMKK05FV0xJQl9CQVJFX01FVEFMX0lOU1RBTExfVEFSR0VUID0gTk8KKworTkVXTElC
X0JBUkVfTUVUQUxfSU5TVEFMTF9TVEFHSU5HX09QVFMgPSBcCisJREVTVERJUj0kKEhPU1RfR0ND
X0JBUkVfTUVUQUxfU1lTUk9PVCkgXAorCWluc3RhbGwKKworZGVmaW5lIE5FV0xJQl9CQVJFX01F
VEFMX0ZJWFVQCittdiAkKEhPU1RfR0NDX0JBUkVfTUVUQUxfU1lTUk9PVCkvdXNyLyQoTkVXTElC
X0JBUkVfTUVUQUxfQVJDSCkvaW5jbHVkZSBcCisJJChIT1NUX0dDQ19CQVJFX01FVEFMX1NZU1JP
T1QpL3Vzci9pbmNsdWRlCittdiAkKEhPU1RfR0NDX0JBUkVfTUVUQUxfU1lTUk9PVCkvdXNyLyQo
TkVXTElCX0JBUkVfTUVUQUxfQVJDSCkvbGliIFwKKwkkKEhPU1RfR0NDX0JBUkVfTUVUQUxfU1lT
Uk9PVCkvdXNyL2xpYgorZW5kZWYKKworTkVXTElCX0JBUkVfTUVUQUxfUE9TVF9JTlNUQUxMX1NU
QUdJTkdfSE9PS1MgKz0gTkVXTElCX0JBUkVfTUVUQUxfRklYVVAKKworJChldmFsICQoYXV0b3Rv
b2xzLXBhY2thZ2UpKQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
