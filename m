Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9386CC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 07:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B62281E89;
	Mon,  4 Dec 2023 07:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B62281E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85NHnNCRWFrL; Mon,  4 Dec 2023 07:35:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49FFA81E86;
	Mon,  4 Dec 2023 07:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49FFA81E86
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAA071BF33C
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C32B94148B
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C32B94148B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gapXTRy0Y-ZP for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 07:35:14 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C602E413D3
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 07:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C602E413D3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHcZmtEkkqtAXGm/w2xpRrdT4VImx4eqwV+VlweVZn6RnK0++pmUsZOlLUy/z6llNV1w6Yo9TwQOFgQQ6Ngcs7vxCkh2fi9t6HVxbqxa2r4M4FML3B6EyeSkwgMdXGJ+578YcVDKJfWvsi9h63hbbtGVl2x6PyIpPFH0GhivYLwTUO1b/mcsxmOvbeTtXlzAjzs6T5W6GCCKolAo2C3MunMkSVL2VmZYObbVGjU6ZBYml+WS1Gek9qa5sgYyeoznW7drf+dt9LvZwxJ521T7Rcaj6HOF4uipcX+vngiDCbPKKacLYy/0fLQFKdL2wXzEiGqLcFaxzQcXAeUFizMNBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53DSmXkZ5bl/4IxrzdBWWdSeWf3A4Ay0LH45a3amzus=;
 b=eaB3sLbI78y8fvH0Xv9ekuAE6QyCzHKlME4DBhd2iseH4N0tm+LA6V2vnq5KEl3PoSM1+qmUwBuGadhf3I4eV8tNK6Xlm9cMGe2ma9bsJ6TonEDSYdB9vtQ0aAjkrVIIUzZWtujdtMf5gKPnEvfvMUjSiseMxtqdQulqR/MPBRIHaZyrxIcoYEMSatIl+IqfyuvfpwBcHbzl8wPhwa0bhVMBHcmjpZR3m52ml1TvxoQ4yqUKym0PaViUp04m+ij6/+pIvKs4M4qO3yAaImWIJ2Hmdk0VRae9geyn1ZuIkKKpMhyCm8Ihjg8d4fgXpZdm3mNR2/W/0W23EoQjPjn92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7PR03CA0323.namprd03.prod.outlook.com (2603:10b6:8:2b::12) by
 CH3PR12MB9430.namprd12.prod.outlook.com (2603:10b6:610:1cd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 07:35:08 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::f4) by DS7PR03CA0323.outlook.office365.com
 (2603:10b6:8:2b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.32 via Frontend
 Transport; Mon, 4 Dec 2023 07:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 07:35:08 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 01:35:03 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 01:34:53 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 01:34:52 -0600
To: <buildroot@buildroot.org>
Date: Mon, 4 Dec 2023 07:34:35 +0000
Message-ID: <20231204073443.1543587-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204073443.1543587-1-neal.frager@amd.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|CH3PR12MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: 0148dad3-e1d6-42d7-dd69-08dbf49b8aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+gNhMXS4k2UiTQs/npD4u0JGKd86x2xkXPbGdEavfM5YXMSY2OoQGcrbjkIDetrH60auLY0A1jLHYR2kKZ1g85gHUEvGxBgrc7uMshY7CQB9Jy45w8Kv6kEv497I4SABioD4yTrDwZwgz6v6bQs13U7TysTSWu/TcKAXpzt5TroQc6l709avbNcumULod05kPU+aqpe3LM7bPleNbWKvca7JoqZHzatbJuvaZf9rGQBuJ19zpJweShq34vWFztVg/p0qn/At/fTfgiAtyo66eDgW0cY5sRRp1WZte5xlfISdtpJOJAMLYN5IgI907LxSrvkdUnocRsAJ6YuN5BLO0C14R42MqF7n/K25oxophLW1yt3S/FCvd+mghQ7q93LQzYr6Z2GeOPw5lO1jAUtqrxj/WXlNc3WHQ4XuUhDt3dd2VOlwp3EZdxsnnGoATr3ZognC1K6uCccNrRYAtJaZ/QsyL3MmES/D7NSBvG7rC0//KIZopWLZnLK6Jnwmhh4oyFr8A/HLDNaFk/MGZ17eU+Owf7vnch/SDgBZYw/MVVpdvWiQlTmc1kQcUD70YigSSqo905Nhp1cWBoGrIBXnJ/VPlyJv8GufpBU3vlCH+ISJeRaDeGB+9Z7RptGGrVXLcZZEEb2DUOXwbBAeKB30E9gdDSgJ85euNMM7X2LBuQyiIkWOVPP8w979MepwMIUAr5cgdUSE7yMnNd6f4vS+MXSWPSpVPZ9sbcpqvg04Y8SILRPGiLJvpJbPvvvI9jV
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(186009)(64100799003)(451199024)(82310400011)(1800799012)(36840700001)(40470700004)(46966006)(5660300002)(40460700003)(44832011)(86362001)(4326008)(8676002)(8936002)(2906002)(41300700001)(36756003)(2616005)(40480700001)(1076003)(356005)(81166007)(82740400003)(426003)(336012)(478600001)(26005)(6666004)(47076005)(36860700001)(316002)(54906003)(6916009)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 07:35:08.5197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0148dad3-e1d6-42d7-dd69-08dbf49b8aa5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9430
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53DSmXkZ5bl/4IxrzdBWWdSeWf3A4Ay0LH45a3amzus=;
 b=skiBXqNaAlWIy5oKXOsKzj+esGjTRYe3w/cOT65roLYGkOP6sX2sYDxgijY1h6D4XvAfKnsS06FzkozpfTdK2tiqM9Q/vWrYHA2g0w4T/uAAdg3Qnu+Y2LWLuyE+AT4sx0OEGQm29jGxEdAEUxw2GMIbBKOE18jc3w8zjXK8JYQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=skiBXqNa
Subject: [Buildroot] [PATCH v8 03/10] package/newlib-bare-metal: new package
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
cGFja2FnZSB3aXRoIGdjYy1iYXJlLW1ldGFsIHN5c3Jvb3QgaW5zdGFsbApWNy0+Vjg6CiAtIG5v
IGNoYW5nZXMKLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArCiBwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL0NvbmZpZy5pbiAgICAgICAgICAg
fCAgMiArCiAuLi4vbmV3bGliLWJhcmUtbWV0YWwvbmV3bGliLWJhcmUtbWV0YWwuaGFzaCAgfCAg
OCArKysKIC4uLi9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5tayAgICB8IDUx
ICsrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbmV3bGliLWJhcmUtbWV0YWwvQ29uZmlnLmluCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1t
ZXRhbC5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9u
ZXdsaWItYmFyZS1tZXRhbC5tawoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJT
CmluZGV4IGZkZmQzMGZiNmYuLjE1MjExNWNmM2IgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysr
IGIvREVWRUxPUEVSUwpAQCAtMTM4NCw2ICsxMzg0LDcgQEAgRjoJcGFja2FnZS9weXRob24tcnBp
LWdwaW8vCiBOOglJYmFpIEVya2lhZ2EgPGliYWkuZXJraWFnYS1lbG9yemFAYW1kLmNvbT4KIEY6
CXBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRhbC8KIEY6CXBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwv
CitGOglwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsLwogCiBOOglJZ25hY3kgR2F3xJlkemtpIDxp
Z25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+CiBGOglwYWNrYWdlL2FuZ3Vs
YXJqcy8KQEAgLTIyMjEsNiArMjIyMiw3IEBAIEY6CWNvbmZpZ3MvenlucW1wX3pjdTEwNl9kZWZj
b25maWcKIEY6CXBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRhbC8KIEY6CXBhY2thZ2UvYm9vdGdl
bi8KIEY6CXBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvCitGOglwYWNrYWdlL25ld2xpYi1iYXJlLW1l
dGFsLwogRjoJcGFja2FnZS92ZXJzYWwtZmlybXdhcmUvCiAKIE46CU5pY29sYSBEaSBMaWV0byA8
bmljb2xhLmRpbGlldG9AZ21haWwuY29tPgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZXdsaWItYmFy
ZS1tZXRhbC9Db25maWcuaW4gYi9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL0NvbmZpZy5pbgpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4xZmYzZDVkOGVjCi0tLSAvZGV2
L251bGwKKysrIGIvcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9Db25maWcuaW4KQEAgLTAsMCAr
MSwyIEBACitjb25maWcgQlIyX1BBQ0tBR0VfTkVXTElCX0JBUkVfTUVUQUwKKwlib29sCmRpZmYg
LS1naXQgYS9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xpYi1iYXJlLW1ldGFsLmhhc2gg
Yi9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xpYi1iYXJlLW1ldGFsLmhhc2gKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNDJjN2Q4MWE5ZgotLS0gL2Rldi9udWxs
CisrKyBiL3BhY2thZ2UvbmV3bGliLWJhcmUtbWV0YWwvbmV3bGliLWJhcmUtbWV0YWwuaGFzaApA
QCAtMCwwICsxLDggQEAKKyMgTG9jYWxseSBjYWxjdWxhdGVkCitzaGEyNTYgIDgzYTYyYTk5YWY1
OWUzOGViOWIwYzU4ZWQwOTJlZTI0ZDcwMGZmZjQzYTIyYzAzZTQzMzk1NTExM2VmMzUxNTAgIG5l
d2xpYi00LjMuMC4yMDIzMDEyMC50YXIuZ3oKKworIyBIYXNoZXMgZm9yIGxpY2Vuc2UgZmlsZXMg
bG9jYWxseSBjYWxjdWxhdGVkCitzaGEyNTYgIDIzMWY3ZWRjYzczNTJkNzczNGE5NmVlZjBiODAz
MGY3Nzk4MjY3OGM1MTY4NzZmY2I4MWUyNWIzMmQ2ODU2NGMgIENPUFlJTkcKK3NoYTI1NiAgYTli
ZGRlNTYxNmVjZGQxZTk4MGI0NGYzNjA2MDBlZTg3ODNiMWY5OWI4Y2M4M2EyYmViMTYzYTBhMzkw
ZTg2MSAgQ09QWUlORy5MSUIKK3NoYTI1NiAgZjNiN2YzZTQ0MjZiMWZhNmY2MDE5OGRhZTdhZGZl
ZGQ5NGI3N2IyOGRiMmQxMDhhZGMwMjUzNTc1MDExZTBmZiAgQ09QWUlORy5MSUJHTE9TUworc2hh
MjU2ICA0MjJhYTQwMjkzMDkzZmI1NGZjNjZlNjkyYTBkNjhmZDBiMjRlZDU2MDJlNWQxZDMzYWQw
NWJhMzkwOTA1N2U5ICBDT1BZSU5HLk5FV0xJQgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZXdsaWIt
YmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5tayBiL3BhY2thZ2UvbmV3bGliLWJhcmUtbWV0
YWwvbmV3bGliLWJhcmUtbWV0YWwubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uZGRkYmEwYzQ1OQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbmV3bGliLWJhcmUt
bWV0YWwvbmV3bGliLWJhcmUtbWV0YWwubWsKQEAgLTAsMCArMSw1MSBAQAorIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKKyMKKyMgbmV3bGliLWJhcmUtbWV0YWwKKyMKKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCisKK05FV0xJQl9CQVJFX01FVEFMX1ZFUlNJT04gPSA0LjMuMAorCitORVdMSUJfQkFS
RV9NRVRBTF9TSVRFID0gZnRwOi8vc291cmNld2FyZS5vcmcvcHViL25ld2xpYgorTkVXTElCX0JB
UkVfTUVUQUxfU09VUkNFID0gbmV3bGliLSQoTkVXTElCX0JBUkVfTUVUQUxfVkVSU0lPTikuMjAy
MzAxMjAudGFyLmd6CitORVdMSUJfQkFSRV9NRVRBTF9ERVBFTkRFTkNJRVMgPSBob3N0LWdjYy1i
YXJlLW1ldGFsCisKK05FV0xJQl9CQVJFX01FVEFMX0xJQ0VOU0UgPSBHUEwtMi4wLCBHUEwtMy4w
LCBMR1BMLTIuMSwgTEdQTC0zLjAKK05FV0xJQl9CQVJFX01FVEFMX0xJQ0VOU0VfRklMRVMgPSBD
T1BZSU5HIFwKKwlDT1BZSU5HLkxJQiBcCisJQ09QWUlORy5MSUJHTE9TUyBcCisJQ09QWUlORy5O
RVdMSUIKKworTkVXTElCX0JBUkVfTUVUQUxfQVJDSCA9IFwKKwkkKGNhbGwgcXN0cmlwLCQoQlIy
X1RPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVF9BUkNIKSkKKworTkVXTElCX0JBUkVfTUVU
QUxfQ09ORl9PUFRTID0gXAorCS0tdGFyZ2V0PSQoTkVXTElCX0JBUkVfTUVUQUxfQVJDSCkgXAor
CUNDX0ZPUl9UQVJHRVQ9JChIT1NUX0RJUikvYmluLyQoTkVXTElCX0JBUkVfTUVUQUxfQVJDSCkt
Z2NjIFwKKwlBUl9GT1JfVEFSR0VUPSQoSE9TVF9ESVIpL2Jpbi8kKE5FV0xJQl9CQVJFX01FVEFM
X0FSQ0gpLWFyIFwKKwlSQU5MSUJfRk9SX1RBUkdFVD0kKEhPU1RfRElSKS9iaW4vJChORVdMSUJf
QkFSRV9NRVRBTF9BUkNIKS1yYW5saWIgXAorCS0tZW5hYmxlLW5ld2xpYi1pby1jOTktZm9ybWF0
cyBcCisJLS1lbmFibGUtbmV3bGliLWlvLWxvbmctbG9uZyBcCisJLS1lbmFibGUtbmV3bGliLWlv
LWZsb2F0IFwKKwktLWVuYWJsZS1uZXdsaWItaW8tbG9uZy1kb3VibGUgXAorCS0tZGlzYWJsZS1t
dWx0aWxpYgorCitORVdMSUJfQkFSRV9NRVRBTF9NQUtFID0gJChNQUtFMSkKKworTkVXTElCX0JB
UkVfTUVUQUxfSU5TVEFMTF9TVEFHSU5HID0gWUVTCitORVdMSUJfQkFSRV9NRVRBTF9JTlNUQUxM
X1RBUkdFVCA9IE5PCisKK05FV0xJQl9CQVJFX01FVEFMX0lOU1RBTExfU1RBR0lOR19PUFRTID0g
XAorCURFU1RESVI9JChIT1NUX0dDQ19CQVJFX01FVEFMX1NZU1JPT1QpIFwKKwlpbnN0YWxsCisK
K2RlZmluZSBORVdMSUJfQkFSRV9NRVRBTF9GSVhVUAorbXYgJChIT1NUX0dDQ19CQVJFX01FVEFM
X1NZU1JPT1QpL3Vzci8kKE5FV0xJQl9CQVJFX01FVEFMX0FSQ0gpL2luY2x1ZGUgXAorCSQoSE9T
VF9HQ0NfQkFSRV9NRVRBTF9TWVNST09UKS91c3IvaW5jbHVkZQorbXYgJChIT1NUX0dDQ19CQVJF
X01FVEFMX1NZU1JPT1QpL3Vzci8kKE5FV0xJQl9CQVJFX01FVEFMX0FSQ0gpL2xpYiBcCisJJChI
T1NUX0dDQ19CQVJFX01FVEFMX1NZU1JPT1QpL3Vzci9saWIKK2VuZGVmCisKK05FV0xJQl9CQVJF
X01FVEFMX1BPU1RfSU5TVEFMTF9TVEFHSU5HX0hPT0tTICs9IE5FV0xJQl9CQVJFX01FVEFMX0ZJ
WFVQCisKKyQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkKLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
