Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDC0CDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 11:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B03FD607DE;
	Fri, 20 Oct 2023 11:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B03FD607DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxFQPCWwk9nr; Fri, 20 Oct 2023 11:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6FB770504;
	Fri, 20 Oct 2023 11:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6FB770504
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 435041BF3A9
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B23141467
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B23141467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8pZzykHgvQM for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 11:43:11 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::611])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15EA4402A7
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 11:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15EA4402A7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeUp+dk/9zUTiWZ5koZeExvWgFt9rSPfI5K494za/udw3/9pDKkRbc+8RXkIr2B7Sa0N9SARhCeclgidfYN6nE9gENKUmq3ufep4FZOvAeO8Zaf8Ep6attFcgerfoLQaKGe7r0piZmN/cWS4XNp+mpYDVPfnyJNtOcaHZY0tXnfg1WppxWj6oJjzfOeCrcWFNkwOF7azMRz431Rsd6ny4qD6tkhaCXDZp+iubh+wuuv6J+5odQ1UAEF1Grp6hXMZox6+owUiNliF+VeqLeibTYsDjpl2tfI+JAp//hKy+IBix3WNdm6FR6sQ8chTnFZLSAdppB79QK8nHsUa6v2Zbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Br5Q5Xyz5U2mQ1mYb3Qsu9HnFbZq/FPXGRcKeMwDY2E=;
 b=UbIxc+JhdkidPMGrbIKyBHNYbLzOWXBpqNBQ4bDuRbel686zg8+ITPyXlslzic4xGRtuV/MrPjjVzsvtLwa6b4IHlBcKqfznrLtgtaO1ORnl14e4RuNK4H/fSBJvC6PCeet72+zeJP+zTtwmV5MgoWJmUxRgFjNLxnp+qp6Eg8tqVqBRe5BsT1F6iJLjMMFHh72g5hmCwOFZhIVw8/mug/rtjk679m83R/eWWxv+GQGjwSdir4c1u/M42kABOIXkv051+M3AFQs4NXbdJpP/ul5WyW/63ZPh8uRmjw+WOCxpwGNdRM6Q8Q/V/vQC9nFYd9nOg93S1/YGR3xZikC7/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY5P221CA0083.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:9::17) by
 CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Fri, 20 Oct
 2023 11:43:05 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:9:cafe::9b) by CY5P221CA0083.outlook.office365.com
 (2603:10b6:930:9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 11:43:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 20 Oct 2023 11:43:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 06:43:03 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 20 Oct 2023 06:43:02 -0500
To: <buildroot@buildroot.org>
Date: Fri, 20 Oct 2023 12:42:30 +0100
Message-ID: <20231020114236.4129636-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020114236.4129636-1-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5df9de-ac1c-43f9-3082-08dbd161b8ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: biTvbAFWKDIzUDMmGVc9uT9ku07WdC8RU/nPcjsnibrzSAnx8ur2E4moBmCmeonZlSu2uU5QSRFyV72fob7kQ+fDjUT3MnyhuspwkePjKqLo+AP3GrtPsBH9BsFEA/1kUTJMf7Mmhsmnv3Zzaz9J+K8111+6TekHXV7wFf8H1d73HU/zGHCVVIHWl/nSdkYUXbFo3BD6Y1NFuRAeJOqItTeZJ1am9Fg++/7K0o/K31irUPDTgBPWuOmVROBtArgLt/ihsvLdtfE/dCSdUOAlQwkgj/Ln2DcztpnLeKcn2MyVA48wf28MKsS9MacqO+Ml+vJ1JWhbDUF+gY7GRp1/KdQn+1KRiqjmxoWTYfnYFLihGU7wAY4JFEJgworhOR7iXsoMzHyEdvSZPInnbn1i7v9c185Gp5C6CCqJjgXJrwI5aOFDbq1V+e8TyVklWGRlh02Gk55W1Aw9+amDpzri8cDZtP+iqELGJMYA4aU1CSW+62iZNI/+1JrgRHmmTjaat5zvULC0ptOUagYV7GwCg2P+NpzwDgYCr6tLiDqqX6lBvNC0NpG6EC5Lmp8tpcG4oaTwts4FEkz0LgjD16W0p8Blhy6A5wGXm/ujS61r8cWLNAjJim6+6d4HhG1//pzgpzCiq25prashTAnIIgTaeNYbMf+3YciNxF941k2m0wqgDTD2xxaNsXIvCImbv08liw/FYRcQn4rwMQXezeUipAr5oLTFHIhLsmpntfqIWdcQmZ5ISONnjJxKipIEEmQ0xIPSIIJp8WYHD12AP/MFIQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(82310400011)(36840700001)(46966006)(40470700004)(40460700003)(2906002)(1076003)(26005)(426003)(6666004)(8936002)(70586007)(2616005)(336012)(36860700001)(6916009)(4326008)(41300700001)(44832011)(47076005)(478600001)(5660300002)(8676002)(54906003)(82740400003)(356005)(81166007)(316002)(70206006)(86362001)(40480700001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 11:43:04.2288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5df9de-ac1c-43f9-3082-08dbd161b8ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br5Q5Xyz5U2mQ1mYb3Qsu9HnFbZq/FPXGRcKeMwDY2E=;
 b=JkhHb3vyOUcI1pBN2eywSqtNnVZNI55jEnNmUqdy/oQ81V2rjLVj6muykOs+8Z2tmBy8+511dBjBqoCEpPXzsCKPRyyfQooXlRoo0r76aKWFDd0CVIbpRYaUuwD2bwzYkuKawNvkFm1/YKgryEMAtIid4X2Af94Ca6+C5AaGsyE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=JkhHb3vy
Subject: [Buildroot] [PATCH v6 04/10]
 toolchain/toolchain-bare-metal-buildroot: new toolchain
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

VGhpcyBwYXRjaCBhZGRzIGEgbmV3IHZpcnR1YWwgcGFja2FnZSBmb3IgYWRkaW5nIGEgYmFyZS1t
ZXRhbCB0b29sY2hhaW4gdG8KYnVpbGRyb290LiAgQnkgZGVmYXVsdCwgdGhpcyBwYWNrYWdlIHdp
bGwgY29uZmlndXJlIGEgYmFyZS1tZXRhbCB0b29sY2hhaW4KZm9yIHRoZSBYaWxpbnggbWljcm9i
bGF6ZSBsaXR0bGUgZW5kaWFuIGFyY2hpdGVjdHVyZS4gIFdoZW4gY29uZmlndXJlZCBmb3IKdGhl
IFhpbGlueCBtaWNyb2JsYXplIGFyY2hpdGVjdHVyZSwgdGhpcyB0b29sY2hhaW4gY2FuIGJlIHVz
ZWQgdG8gYnVpbGQgdGhlCm1pY3JvYmxhemUgZmlybXdhcmUgYXBwbGljYXRpb25zIGZvciB6eW5x
bXAgYW5kIHZlcnNhbC4KClNpZ25lZC1vZmYtYnk6IEliYWkgRXJraWFnYSA8aWJhaS5lcmtpYWdh
LWVsb3J6YUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBOZWFsIEZyYWdlciA8bmVhbC5mcmFnZXJA
YW1kLmNvbT4KLS0tClYxLT5WMjoKIC0gYWRkcyBzZWxlY3Qgb3B0aW9uIHRvIGJyaW5nIGluIGFs
bCBwYWNrYWdlcyBuZWVkZWQgZm9yIHRvb2xjaGFpbi1iYXJlLW1ldGFsClYyLT5WMzoKIC0gbm8g
Y2hhbmdlcwpWMy0+VjQ6CiAtIG1vdmVkIGZyb20gcGFja2FnZSB0byB0b29sY2hhaW4gZGlyZWN0
b3J5CiAtIGltcHJvdmVkIG1lbnVjb25maWcgaGVscCBjb21tZW50ClY0LT5WNToKIC0gbm8gY2hh
bmdlcwpWNS0+VjY6CiAtIG1pZ3JhdGVkIHRvIHRvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9v
dAotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAy
ICsrCiB0b29sY2hhaW4vQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAr
CiAuLi4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290L0NvbmZpZy5pbiAgfCAyMSArKysr
KysrKysrKysrKysrKysrCiAuLi4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290Lm1rICAg
ICAgICAgfCAgNyArKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB0b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290
L0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1t
ZXRhbC1idWlsZHJvb3QvdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290Lm1rCgpkaWZmIC0t
Z2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggNjc3YjhmMDliZC4uODQ5YTUyNjNi
NSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xMzcwLDYgKzEz
NzAsNyBAQCBOOglJYmFpIEVya2lhZ2EgPGliYWkuZXJraWFnYS1lbG9yemFAYW1kLmNvbT4KIEY6
CXBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRhbC8KIEY6CXBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwv
CiBGOglwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsLworRjoJdG9vbGNoYWluL3Rvb2xjaGFpbi1i
YXJlLW1ldGFsLWJ1aWxkcm9vdC8KIAogTjoJSWduYWN5IEdhd8SZZHpraSA8aWduYWN5Lmdhd2Vk
emtpQGdyZWVuLWNvbW11bmljYXRpb25zLmZyPgogRjoJcGFja2FnZS9hbmd1bGFyanMvCkBAIC0y
MjA3LDYgKzIyMDgsNyBAQCBGOglwYWNrYWdlL2Jvb3RnZW4vCiBGOglwYWNrYWdlL2djYy1iYXJl
LW1ldGFsLwogRjoJcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC8KIEY6CXBhY2thZ2UvdmVyc2Fs
LWZpcm13YXJlLworRjoJdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC8K
IAogTjoJTmljb2xhIERpIExpZXRvIDxuaWNvbGEuZGlsaWV0b0BnbWFpbC5jb20+CiBGOglwYWNr
YWdlL3VhY21lLwpkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL0NvbmZpZy5pbiBiL3Rvb2xjaGFpbi9D
b25maWcuaW4KaW5kZXggZDgwODFmMWI5ZC4uYjEzMzNmOTJmMCAxMDA2NDQKLS0tIGEvdG9vbGNo
YWluL0NvbmZpZy5pbgorKysgYi90b29sY2hhaW4vQ29uZmlnLmluCkBAIC01OSw2ICs1OSw3IEBA
IGNvbmZpZyBCUjJfVE9PTENIQUlOX0VYVEVSTkFMCiAKIGVuZGNob2ljZQogCitzb3VyY2UgInRv
b2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QvQ29uZmlnLmluIgogc291cmNl
ICJ0b29sY2hhaW4vdG9vbGNoYWluLWJ1aWxkcm9vdC9Db25maWcuaW4iCiBzb3VyY2UgInRvb2xj
aGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvQ29uZmlnLmluIgogCmRpZmYgLS1naXQgYS90b29sY2hh
aW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290L0NvbmZpZy5pbiBiL3Rvb2xjaGFpbi90
b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAuLjZlYmYyY2RmODYKLS0tIC9kZXYvbnVsbAorKysgYi90b29s
Y2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290L0NvbmZpZy5pbgpAQCAtMCwwICsx
LDIxIEBACitjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9UT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlM
RFJPT1QKKwlib29sICJob3N0IHRvb2xjaGFpbi1iYXJlLW1ldGFsIgorCXNlbGVjdCBCUjJfUEFD
S0FHRV9IT1NUX0JJTlVUSUxTX0JBUkVfTUVUQUwKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9H
Q0NfQkFSRV9NRVRBTAorCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX05FV0xJQl9CQVJFX01FVEFM
CisJaGVscAorCSAgQnVpbGQgYSBiYXJlLW1ldGFsIHRvb2xjaGFpbiBpbiBhZGRpdGlvbiB0byB0
aGUgbWFpbiBMaW51eCB0b29sY2hhaW4KKworaWYgQlIyX1BBQ0tBR0VfSE9TVF9UT09MQ0hBSU5f
QkFSRV9NRVRBTF9CVUlMRFJPT1QKKworY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfVE9PTENIQUlO
X0JBUkVfTUVUQUxfQlVJTERST09UX0FSQ0gKKwlzdHJpbmcKKwlkZWZhdWx0ICJtaWNyb2JsYXpl
ZWwteGlsaW54IgorCWhlbHAKKwkgIHNlbGVjdCBhcmNoaXRlY3R1cmUgZm9yIGJhcmUtbWV0YWwg
dG9vbGNoYWluCisKK3NvdXJjZSAicGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFsL0NvbmZpZy5p
bi5ob3N0Igorc291cmNlICJwYWNrYWdlL2djYy1iYXJlLW1ldGFsL0NvbmZpZy5pbi5ob3N0Igor
c291cmNlICJwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL0NvbmZpZy5pbi5ob3N0IgorCitlbmRp
ZiAjQlIyX1BBQ0tBR0VfSE9TVF9UT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1QKZGlmZiAt
LWdpdCBhL3Rvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QvdG9vbGNoYWlu
LWJhcmUtbWV0YWwtYnVpbGRyb290Lm1rIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFs
LWJ1aWxkcm9vdC90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QubWsKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMTcwYzczYWEzMQotLS0gL2Rldi9udWxsCisrKyBi
L3Rvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QvdG9vbGNoYWluLWJhcmUt
bWV0YWwtYnVpbGRyb290Lm1rCkBAIC0wLDAgKzEsNyBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKKyMKKyMgdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290CisjCisjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIworCisoZXZhbCAkKGhvc3QtdmlydHVhbC1wYWNrYWdlKSkKLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
