Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D94CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 15:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24341414FF;
	Sun, 24 Sep 2023 15:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24341414FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOgK4kepuXcV; Sun, 24 Sep 2023 15:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECF0D40BFB;
	Sun, 24 Sep 2023 15:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECF0D40BFB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F0E71BF3E8
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 158AE60A93
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 158AE60A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XH_k7DoPr7Ay for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 15:13:01 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::626])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6D0260595
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 15:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6D0260595
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mH5Ctoo/Kal+pJGSTHKZz15UsZ17NiNye9odQy8iGyKL5zQQyb4dbANu7V5JwDPFHFMvCxk5Twgytl7kNLeNWiRCktknBbMwrKuDJekiLl5JAjznUl4zJOLPg2v6I3Dr5S3se/fWyOOTgnHuUr6dxc+oPPRWWiVCWjsrS4hawjP5Plb9BAYOYENkzH+Hd5j0CXyg+A1zjQj0MqBre+ulOLcEjyzWNKNjN0hher+GtTDaiNb20y3F0DftWoOUVrnhkUK4vMUuA72NQV1MWps/DXBYlAK6hd9lUjXJlykYiyLHQbsW3jb7eIrgIM23yKIIXWY2zpdH/XDsRG5cGB27Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmtugRwuYrjFpefgdKIHVRlDaDdpZJJp16JQSYExzfQ=;
 b=esgaG8QeJDklb1ttcnwOYaWNN7WlOqVyOXizVRmR7QyPL4rHzBhYBJRBWtGFpoHa9L/MwJVoZVTPl8TE0i2I0iIq1OQH8e5R4sb9wl5enFkiMVC/YqUvQpfvAluF8B3VAdnSyqsJFIlewCkFzeyRnQZKe22osUVQoqvuEFl6Mr2/QB9mBuOH2joa2jmvRescnfNhhvxi7dyryqB9r1jH2Msrqf4SxHvwuUs5kWp3iy6CvTNobt9h5nIe015v9cV4HUrtFY9PX/bV0Gu9LaZulsN99XhB2xZse1kB097DRd48oAQvIX1pqi5BpsvXtUOHeOpbw58x5bBSVx4IYh1MfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DM6PR02CA0059.namprd02.prod.outlook.com (2603:10b6:5:177::36)
 by CH0PR12MB5329.namprd12.prod.outlook.com (2603:10b6:610:d4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Sun, 24 Sep
 2023 15:12:55 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::28) by DM6PR02CA0059.outlook.office365.com
 (2603:10b6:5:177::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Sun, 24 Sep 2023 15:12:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sun, 24 Sep 2023 15:12:53 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 10:12:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 08:12:53 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sun, 24 Sep 2023 10:12:52 -0500
To: <buildroot@buildroot.org>
Date: Sun, 24 Sep 2023 16:11:58 +0100
Message-ID: <20230924151205.2099293-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230924151205.2099293-1-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|CH0PR12MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: 7054b393-bb7c-48d8-1b06-08dbbd10b9f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /dmEcEKyvCHJjwYD3+eDM5gjLNynA91nfKxTYoK2JXOKUX8Y/Rrk0PVjH2qOUpS2dsPFD2Lo5slLu2tF2n/AB2831o5p8BZvDGBiISrAqz3VYbboAo2g36zd095fheLrTDXL2h86j3QlGZFzIDtgTPlJipEWpnEJ2tVUS1udVRXoznaGKnSIxxzwsOVA8xNkSDpyus9+5UqquCSRo6fxLj9WudKtoAne5u7G0b1XHK6TrSg5Nle2x5rirPdGj3mnkk7fMkPwuw9MbX60uFC56nCqTgodsmSFJb+rBJDNuurQqwcaNsrpLpI4a21b1wrGmQbsrO5rYewtQ7+GcN/5zrImUGYwPOf6fAVd9VbHAw/tvLkdRtP3UlJlsYR/9qZZQTH7uY7jQuhtS6Fv9ppOADtgN/GPsUslgeMbe0tVsZ0mk/MqVNbUgfQctsFrgoqbuJqvv7SVOX9DA0iPv086gVcfzt+5qWRe1y8/qRA7rjcM58t/BtAyFJFzPAjB2davt3vrvrcR6LVvYzbOOUPKFnYX4NznM9dXLDTMPyfl+EhFTZfWDas4gBcQc81ONUxpJP23D+KT0FM/S21hSb8Y9W7yJ/zzrt/PKyv9f5MggT6gaLZ147Tra0DLLBlfRyvKJJeG6bCrFX2utgHjZ/LTAHoVGEv3sanKKqnKk9/NnqvTmLihFiiaJd8h2dWdmlokywXicB7VS9egu72H5NWsVRG+eqsjftbL/lnEaPVvlllpOz1LiXnbOGWfOMSyJKBk
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(1800799009)(82310400011)(186009)(451199024)(46966006)(40470700004)(36840700001)(40460700003)(82740400003)(356005)(2906002)(5660300002)(6916009)(44832011)(316002)(8676002)(36756003)(41300700001)(54906003)(8936002)(4326008)(336012)(26005)(47076005)(478600001)(426003)(81166007)(40480700001)(70206006)(86362001)(36860700001)(2616005)(70586007)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2023 15:12:53.9290 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7054b393-bb7c-48d8-1b06-08dbbd10b9f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5329
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmtugRwuYrjFpefgdKIHVRlDaDdpZJJp16JQSYExzfQ=;
 b=tNIt6HKNRLSjxYDu+nFW48lglyZDSMiMXcCXfIPIHUfNcOJkW7qzc9Rze4xaSor4aQ+ApMjD596kF0xNzJjxRPDYpZ2r2UCohet92L66/6wRrkfcV0po+iSawrs5Zp2tSpignvnEUrO9IQH79heQAoucB5FFRu/jru3jJfhwpPM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tNIt6HKN
Subject: [Buildroot] [PATCH v4 03/10] package/newlib-bare-metal: new package
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
cmtpYWdhLUVsb3J6YSA8aWJhaS5lcmtpYWdhLWVsb3J6YUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBOZWFsIEZyYWdlciA8bmVhbC5mcmFnZXJAYW1kLmNvbT4KLS0tClYxLT5WMjoKIC0gcmVtb3Zl
ZCBkZWZhdWx0IGVuYWJsZSB0byBiZSByZXBsYWNlZCB3aXRoIHRvb2xjaGFpbiBzZWxlY3QgY29u
ZmlnClYyLT5WMzoKIC0gbm8gY2hhbmdlcwpWMy0+VjQ6CiAtIHJlcGxhY2VkIHVubmVjZXNzYXJ5
ID0/IHdpdGggPSBmb3IgYXNzaWdubWVudHMKIC0gaW1wcm92ZWQgbWVudWNvbmZpZyBoZWxwIGNv
bW1lbnQKLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMiArKwogcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdCAgICAgIHwg
MTIgKysrKysrKysrCiAuLi4vbmV3bGliLWJhcmUtbWV0YWwvbmV3bGliLWJhcmUtbWV0YWwuaGFz
aCAgfCAgOCArKysrKysKIC4uLi9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5t
ayAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0
aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbmV3bGliLWJhcmUtbWV0YWwvQ29u
ZmlnLmluLmhvc3QKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFs
L25ld2xpYi1iYXJlLW1ldGFsLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL25ld2xp
Yi1iYXJlLW1ldGFsL25ld2xpYi1iYXJlLW1ldGFsLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVS
UyBiL0RFVkVMT1BFUlMKaW5kZXggMjg0YTIzMWY3Zi4uNWM1ZjRmMWUyMSAxMDA2NDQKLS0tIGEv
REVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xMzUzLDYgKzEzNTMsNyBAQCBGOglwYWNr
YWdlL3B5dGhvbi1ycGktZ3Bpby8KIE46CUliYWkgRXJraWFnYS1FbG9yemEgPGliYWkuZXJraWFn
YS1lbG9yemFAYW1kLmNvbT4KIEY6CXBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRhbC8KIEY6CXBh
Y2thZ2UvZ2NjLWJhcmUtbWV0YWwvCitGOglwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsLwogCiBO
OglJZ25hY3kgR2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMu
ZnI+CiBGOglwYWNrYWdlL2FuZ3VsYXJqcy8KQEAgLTIxODUsNiArMjE4Niw3IEBAIEY6CWNvbmZp
Z3MvenlucW1wX3pjdTEwNl9kZWZjb25maWcKIEY6CXBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRh
bC8KIEY6CXBhY2thZ2UvYm9vdGdlbi8KIEY6CXBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvCitGOglw
YWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsLwogRjoJcGFja2FnZS92ZXJzYWwtZmlybXdhcmUvCiAK
IE46CU5pY29sYSBEaSBMaWV0byA8bmljb2xhLmRpbGlldG9AZ21haWwuY29tPgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvbmV3
bGliLWJhcmUtbWV0YWwvQ29uZmlnLmluLmhvc3QKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uYmU5MmExZDZhNgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbmV3bGli
LWJhcmUtbWV0YWwvQ29uZmlnLmluLmhvc3QKQEAgLTAsMCArMSwxMiBAQAorY29uZmlnIEJSMl9Q
QUNLQUdFX0hPU1RfTkVXTElCX0JBUkVfTUVUQUwKKwlib29sICJob3N0IG5ld2xpYi1iYXJlLW1l
dGFsIgorCWhlbHAKKwkgIEJ1aWxkIHRoZSBuZXdsaWIgQyBsaWJyYXJ5IGZvciBhIGJhcmUtbWV0
YWwgdG9vbGNoYWluCisKK2lmIEJSMl9QQUNLQUdFX0hPU1RfTkVXTElCX0JBUkVfTUVUQUwKKwor
Y29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfTkVXTElCX0JBUkVfTUVUQUxfVkVSU0lPTgorCXN0cmlu
ZworCWRlZmF1bHQgIjQuMS4wIgorCitlbmRpZiAjQlIyX1BBQ0tBR0VfSE9TVF9ORVdMSUJfQkFS
RV9NRVRBTApkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFy
ZS1tZXRhbC5oYXNoIGIvcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRh
bC5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjFhNjgxZWNmNzcK
LS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xpYi1iYXJl
LW1ldGFsLmhhc2gKQEAgLTAsMCArMSw4IEBACisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2
ICBmMjk2ZTM3MmY1MTMyNDIyNGQzODdjYzExNmRjMzdhNmJkMzk3MTk4NzU2NzQ2ZjkzYTJiMDJl
OWE1ZDQwMTU0ICBuZXdsaWItNC4xLjAudGFyLmd6CisKKyMgSGFzaGVzIGZvciBsaWNlbnNlIGZp
bGVzIGxvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICAyMzFmN2VkY2M3MzUyZDc3MzRhOTZlZWYw
YjgwMzBmNzc5ODI2NzhjNTE2ODc2ZmNiODFlMjViMzJkNjg1NjRjICBDT1BZSU5HCitzaGEyNTYg
IGE5YmRkZTU2MTZlY2RkMWU5ODBiNDRmMzYwNjAwZWU4NzgzYjFmOTliOGNjODNhMmJlYjE2M2Ew
YTM5MGU4NjEgIENPUFlJTkcuTElCCitzaGEyNTYgIGYzYjdmM2U0NDI2YjFmYTZmNjAxOThkYWU3
YWRmZWRkOTRiNzdiMjhkYjJkMTA4YWRjMDI1MzU3NTAxMWUwZmYgIENPUFlJTkcuTElCR0xPU1MK
K3NoYTI1NiAgNDIyYWE0MDI5MzA5M2ZiNTRmYzY2ZTY5MmEwZDY4ZmQwYjI0ZWQ1NjAyZTVkMWQz
M2FkMDViYTM5MDkwNTdlOSAgQ09QWUlORy5ORVdMSUIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmV3
bGliLWJhcmUtbWV0YWwvbmV3bGliLWJhcmUtbWV0YWwubWsgYi9wYWNrYWdlL25ld2xpYi1iYXJl
LW1ldGFsL25ld2xpYi1iYXJlLW1ldGFsLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAuLjE0OWY3YjE3NjgKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL25ld2xpYi1i
YXJlLW1ldGFsL25ld2xpYi1iYXJlLW1ldGFsLm1rCkBAIC0wLDAgKzEsMjcgQEAKKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCisjCisjIG5ld2xpYi1iYXJlLW1ldGFsCisjCisjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIworCitIT1NUX05FV0xJQl9CQVJFX01FVEFMX1ZFUlNJT04gPSAkKGNhbGwgcXN0
cmlwLCQoQlIyX1BBQ0tBR0VfSE9TVF9ORVdMSUJfQkFSRV9NRVRBTF9WRVJTSU9OKSkKK2lmZXEg
KCQoSE9TVF9ORVdMSUJfQkFSRV9NRVRBTF9WRVJTSU9OKSwpCitIT1NUX05FV0xJQl9CQVJFX01F
VEFMX1ZFUlNJT04gPSA0LjEuMAorZW5kaWYKKworSE9TVF9ORVdMSUJfQkFSRV9NRVRBTF9TSVRF
ID0gZnRwOi8vc291cmNld2FyZS5vcmcvcHViL25ld2xpYgorSE9TVF9ORVdMSUJfQkFSRV9NRVRB
TF9TT1VSQ0UgPSBuZXdsaWItJChIT1NUX05FV0xJQl9CQVJFX01FVEFMX1ZFUlNJT04pLnRhci5n
egorSE9TVF9ORVdMSUJfQkFSRV9NRVRBTF9ERVBFTkRFTkNJRVMgPSBob3N0LWdjYy1iYXJlLW1l
dGFsCisKK0hPU1RfTkVXTElCX0JBUkVfTUVUQUxfQ09ORl9PUFRTID0gXAorCS0tdGFyZ2V0PSQo
QlIyX1BBQ0tBR0VfSE9TVF9UT09MQ0hBSU5fQkFSRV9NRVRBTF9BUkNIKS1lbGYgXAorCUNDX0ZP
Ul9UQVJHRVQ9JChIT1NUX0RJUikvYmluLyQoQlIyX1BBQ0tBR0VfSE9TVF9UT09MQ0hBSU5fQkFS
RV9NRVRBTF9BUkNIKS1lbGYtZ2NjIFwKKwlBUl9GT1JfVEFSR0VUPSQoSE9TVF9ESVIpL2Jpbi8k
KEJSMl9QQUNLQUdFX0hPU1RfVE9PTENIQUlOX0JBUkVfTUVUQUxfQVJDSCktZWxmLWFyIFwKKwlS
QU5MSUJfRk9SX1RBUkdFVD0kKEhPU1RfRElSKS9iaW4vJChCUjJfUEFDS0FHRV9IT1NUX1RPT0xD
SEFJTl9CQVJFX01FVEFMX0FSQ0gpLWVsZi1yYW5saWIgXAorCS0tZW5hYmxlLW5ld2xpYi1pby1j
OTktZm9ybWF0cyBcCisJLS1lbmFibGUtbmV3bGliLWlvLWxvbmctbG9uZyBcCisJLS1lbmFibGUt
bmV3bGliLWlvLWZsb2F0IFwKKwktLWVuYWJsZS1uZXdsaWItaW8tbG9uZy1kb3VibGUgXAorCS0t
ZGlzYWJsZS1tdWx0aWxpYgorCiskKGV2YWwgJChob3N0LWF1dG90b29scy1wYWNrYWdlKSkKLS0g
CjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
