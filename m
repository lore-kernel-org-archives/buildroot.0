Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0661CC6B1A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 16:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3279540755;
	Wed, 14 Oct 2026 16:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eaXq7b9qF_6; Wed, 14 Oct 2026 16:00:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 69D9A4074E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791993612;
	b=mCMt0Pf5aOCAmB0GE5LQXbPDJpsi8F0JrxMJd369rV6t4CXH6jeI+rlQwzSQR/FgSR2p
	 SFaVGmNPDpMImzA/tadiMdyl3duLHCmxkMWUew9Ud0kUErENqfsVgT2yUELjVspIRhETG
	 UizpWlB5ZC0qsPhocF9VF4Fp84Sk4kilx7YK/bAx8zM594hKrDb25Z91etlT1I2utOgoJ
	 y0CJdkdiion8Uj3RyXkEmx2aDlQatNvmuoVTPLtl5lLthTgjs3xa9zEP4+tplO9XNsp4P
	 /Ow6Jr7bqsx9yNXcDU6mkiEhYVFOR+mIjEg8sqYjIZnVd3uPt/07aMqOOqVchQ5c8Sw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791993612;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 drawingcanvaselements:composetype:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=JLLwrTECYsxwU+9k2dPfrxDscAGse4vwcBw3bY+VOL4=;
	b=GhKl7O0hXXMmkjJkTYNHIRCTGUgvF85Gr5AhnA8QIjnqsWA7AI9pSGQUwIJqFrqPljip
	 TR7foZGfRqp0f7/oElZWAVpnXpH5fcE4jn1StiCX05Yfsv2F74WkKuvt70C/0j8jG7xmu
	 IHeOp+YvCCO3JSLABCASnTYZFxfxGpppzuTX8fMg1129kDzYe8sV/6TK4+Gd97oNRPJW0
	 iAJ6ogMBY2PW7YmKQuDuY1J35gdNJ9LrlDnwz1AoPi2cTOpZNowvVtylsXESJR+ioSW3b
	 hwTSzhsu7oXRF0K8kWCsRKhajIDr9tMngru9T0hnCs3DvTP1HZikll9F8wg25x6+X8Q==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791993612;
	bh=JLLwrTECYsxwU+9k2dPfrxDscAGse4vwcBw3bY+VOL4=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bFK/CruZKi10zBPuZj5XfeGn3+UyXP+qT+jtUo9FLNZy7tJQ0KLzO44MnS2qv0fjh
	 m7tsOXu2QXE0n20HVKpsRC27r63u3yVElxCzcaZj0/eWD8OWfHW3+8ahjdLes6sSFS
	 TPF7bjhVe3s/M1K4WS5yuylSoxZ2t9crsgttfTnb7DWRlK3McWutlxy6ptccDXjhAv
	 vngGezMxuUOg6WAZt1dAX4cWe0Byww2LrwAMHzg5l5w3kXmOO8/FqB0/g0aWzT3DIJ
	 FKtEirqLOkbk1wkeGz6PNUwP0TirfUJJocwfr9JBB0LMLKI1RdHvmOHd6pVFh6vD5z
	 fGH0YjSHu62+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69D9A4074E;
	Wed, 14 Oct 2026 16:00:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA4634DD
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFEE480E45
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v40FbLOq3P_J for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 16:00:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1259580E43
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:c201::1"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791993609;
 b=sRR6DAwOMLZRz6smarj1nRHTTXyouvuuPHx03GoY3u3/gBFDJoOXli2QxtHJs0xAtpE+
 EEUXbkFIfh5kgQcwK2/K0l37I85W0gkccpIolri3uT4Qw8nqbcy0pauonku0amGhWKrCi
 IXbQK5Hs5G9ZNvgh3C6e1dtU3eyau8bV0I2D1cWOoefWCtvQyo0A3tAI+kBYMlUVp0lPV
 cty7i6J4VD0mdjzhlyRqY7zv1vfGfIpf+sfBdPge3qt1HJZbIEeDxvez2zoXi4AvSfto+
 L0fpVsSVWY3ywLje5L6qHaxN3tcC2jgmagvyp+Ra+PvvN3XeKtpVJCkFYZ4YPDScEUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791993609;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 msip_labels:drawingcanvaselements:composetype:x-ms-publictraffictype:
 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
 x-microsoft-antispam:x-microsoft-antispam-message-info:
 x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata-chunkcount:
 x-ms-exchange-antispam-messagedata-0:
 x-ms-exchange-antispam-messagedata-1:Content-Type:MIME-Version:
 X-OriginatorOrg:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=IdYkCmxRqlxX9j80TG71Hlgp1JcgaevqFUPoPKSW/MQ=;
 b=Sd2rza8QVaH7rbUy+1mrlb1sPMWm82jVFpB1Of3aWllMzvnDW2NphQVVyUREoa2D1cv9
 8UWLVgpon3nfSv14Ab+xIxOo/PcMrDfvqkq3GYAYx0FmqQuBQFf2sikSUIrPS519sMC9Q
 Fw6c2Utc1hNxH0/dT2a7N8Z+NuNpztPyrfp3nQQ1CFS941/+FupDHZfQV5i/bmzK++eqe
 69C8EV/EOfSoKt8BQcBy46Hs9iGQZ5teagIDKbvEIRicFuNVl1s3C7EjC58VHHItcEjvl
 gb4ND9gZcCYtOIb1onZZfjn87C3+bca+RrkWdKpbqOp40ND1QNP1uUfVgP7iHgcYizg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=none header.from=phoenixwings.com;
 dkim=pass header.d=phoenixwings.com header.i=@phoenixwings.com
 header.a=rsa-sha256 header.s=selector1 header.b=zPgIdhOa; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c201::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::1;
 helo=am0pr83cu005.outbound.protection.outlook.com;
 envelope-from=michael.ratzel@phoenixwings.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none)
 header.from=phoenixwings.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=phoenixwings.com header.i=@phoenixwings.com
 header.a=rsa-sha256 header.s=selector1 header.b=zPgIdhOa
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1259580E43
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 16:00:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5brSixuemOJmUIO72d3P+74WS8/wCRuFByfV6WvTk7niOau5AKtYqd3paovoyhwKyit2hQAKMghocVlL/1MlL4tV+BOv1z4xVHlvWcFih3eY7A5ipODPrt493kJxphqKdywaLdyWSyyT5uMTMGj3vTSxaxXbY9HwAF/r6Ij2XH2e1x9gk6n/kvTt3R9sUkmwq3bpw2bYjM8LepcRVlKTIk8r0BCEPqalpMO3xftQ/iFRMaYJNybJUYWcqFanpua4iYoDf4klYkfAZXMALxuI4q5LHDdqFjEmS/d/oAsebfH+3akO/kHYiynnwgo04BDAvaOxw9puyOZNQzQCWKDvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdYkCmxRqlxX9j80TG71Hlgp1JcgaevqFUPoPKSW/MQ=;
 b=c3URfG9du9hE53HlLihF1W8eXkrEybYQhuAjwAeyKbCh6V1daPnP7qR5pRKqET8aD//oAgi7gTnQlC9l/kdEghGOqx5Jx22db1Ci11kyXvbZKkq01XxGyXNq8YfI4zQ7thIydgYdr4u6zNjRyB8bE278lfkarXkHBpkSpwgLNti5E8+762wtcD6PX2oZ9FRnAFaIBN7xeTUHgPhXGHK6PackJUM+WK3pYPokjgtSqcLqR+Olbqe8gy8PBSHqSUEGAviKH6nxd/QrF/NWotXvyWIvAR8Z4AxheIBvkmYx26JRVb4s8EYzyOBpPB+0es+4i1KGdXjylNm9g8FmEMKLZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phoenixwings.com; dmarc=pass action=none
 header.from=phoenixwings.com; dkim=pass header.d=phoenixwings.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenixwings.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdYkCmxRqlxX9j80TG71Hlgp1JcgaevqFUPoPKSW/MQ=;
 b=zPgIdhOamdWfrsIX6pf7FLfcjKxYpp/hNvMnlWk3BySlPXiULI2D+6cnPoVyZJC9QxAlFOmhvcMCcZAlM+1ZtuwhRc9LqYOJCMni2BDTEQEWFfUn4Tb9IKOX1qkDcjGy/VJwSSknYJbKhtzTCUV+a5n6qGAGECtEVMQBtsAJbYIxYCv6AI8RBDyw1sE9OVqprmiXigsKF803Ht3KY3XRgq+kae/0xGU27GVJSy2Tnj9N8aIOoYlYAKx6bQC87eKzVBB7mIP1+spQdCcYplwxpEithav7KLuKil/1qCu/72Z7Pz2I10WJJRTkzPh6e731LlJe+ECzYcokgHezLQHIEg==
Received: from VI1P193MB0782.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:147::11)
 by DBAP193MB0794.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:1c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 16:00:01 +0000
Received: from VI1P193MB0782.EURP193.PROD.OUTLOOK.COM
 ([fe80::6a20:8e2c:64d4:c8c8]) by VI1P193MB0782.EURP193.PROD.OUTLOOK.COM
 ([fe80::6a20:8e2c:64d4:c8c8%3]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 16:00:01 +0000
From: Michael Ratzel <michael.ratzel@phoenixwings.com>
To: Thomas Perale <thomas.perale@mind.be>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] Build host-cmake with OpenSSL?
Thread-Index: AQHdVMilbCtAgmoYEEOfuoZxE/UlY7b8AfGAgADG0ps=
Date: Wed, 14 Oct 2026 16:00:01 +0000
Message-ID: <VI1P193MB078242F22E0CBCD5CB6CCB50E19D2@VI1P193MB0782.EURP193.PROD.OUTLOOK.COM>
References: <VI1P193MB07827A8170CCBBF9ACFD6BE6E1962@VI1P193MB0782.EURP193.PROD.OUTLOOK.COM>
 <20261013205937.17171-1-thomas.perale@mind.be>
In-Reply-To: <20261013205937.17171-1-thomas.perale@mind.be>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
drawingcanvaselements: []
composetype: reply
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phoenixwings.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P193MB0782:EE_|DBAP193MB0794:EE_
x-ms-office365-filtering-correlation-id: e1fdc310-bbf8-4dff-f8f5-08df2a0c3428
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|10070799003|1800799024|366016|376014|6133799003|22082099003|18002099003|13003099007|8096899003|10067099003|38070700021|261009223027099003|56012099006|4143699003;
x-microsoft-antispam-message-info: 8SElveUvOrua0MKr/LmQQt+xqK3GEW53P3D7MHcPWAbs3rVRC2ebsc/Hq4AAsAQuDakIwk1G6kxYCEAmXuJuG/Cs+xvcKCrPIzUduVlWqlRuTZXva5VureWphnmtMU8HTwMQsuSZP6lT3ED5+dJ2yzHr7JXPSUDe8keO7MAokAyTIheT02Mpkpvp7iP2EGV4knGIrGWELEFyIKZnn3hSa2m1Tq/LDgtjtO4G1JZRzz/Yq7G9UYQMv+dzmspGKy9maRmxd2BOapCNSHsj5hAWzURyIriGh+88eKQ7D/kazDDwyf/Kt6dsm/kemlEqBZU5sAlpCNUTXuKKekCbN6HlDBNivOI+jYa9ne4jQuRrs3PLtT9yLgZzJaa4Z9ZYFQJ2oLTVWapWkTOSiouDo+AhcPQv8/KTWeKbT3jQO/nO/YYytcI8+Si6u8HN+rx833kR/t4bqPNN9QIcA6FzZy7RDtTJVtEaO00UWWQ7ziuXY1mTOLlko2Ff1dT4jilHNxCinP5btbno1J2WBWSDTRdHXJWloakZqRJMvBKMyCBQ7luixUZwuQS3P5rhdCcF/HFFWs6W461i9+xjHX3Iyb72SXZPF08UgsQWE6Nrb8dyfIL9201QoyqCtc5ioo9HooErXNSAfKyqpQkDIfdgbctkrU4M9XhssuhqWyCmz7DVsf0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P193MB0782.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(6133799003)(22082099003)(18002099003)(13003099007)(8096899003)(10067099003)(38070700021)(261009223027099003)(56012099006)(4143699003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Pr+k1c3+e8FIOSfTQ+46KhocP3jfraI2aDauH8QymrlpdVD4uXncs0Vd1K?=
 =?iso-8859-1?Q?AXGV7hTaFvUvGGDQTnqvRnWulzS9q6+2c486zXXGFncZCZ/8c8vBLWbAxm?=
 =?iso-8859-1?Q?YOcXINrlcGqYm4DLEUKT6UeQ5IeSk7DODEihsSzn6GTWXb3T0i5kZugGbn?=
 =?iso-8859-1?Q?jL9nTPnTvLVRalabhUFy80KLDU6FWj6IsVmRnNdbzvFVYHnQHiq8vJxzYz?=
 =?iso-8859-1?Q?q9fmWjgGBY9mWbb0z4lJbJfX2ivPenuy93T5ykjj0W+PcOlnzVORMyKvuq?=
 =?iso-8859-1?Q?QoQvkYt4ZIWgaKoBVtvfNVLIXXyUGcrJR8IvIIfJc+IdT42neqjtuWjmld?=
 =?iso-8859-1?Q?kLjR9y8HVZg0HW9XOsdqr0hsq9SYhtQ+XLY5Hni+ShvOwcwOdJk84GM9+2?=
 =?iso-8859-1?Q?qiCyfwO1heZHnWujPlWxCTksGTYi+45LXY6TGaVk1wUNXSLFaGUDuvQ4ps?=
 =?iso-8859-1?Q?F2wU40NEUVN4VaA+eUdp8lpCoZ+ypucMLSCXBZQTaWEPYSEQpXhL4zcnp1?=
 =?iso-8859-1?Q?Zhn+cwV7ec8VDGAHBNc2eocgVCg4AdouEgfA51b12DTV/flE4FflzHBRjk?=
 =?iso-8859-1?Q?z+IksHIR4N9ObY5XFe3HyPK9PEX2Xse45QjmrfcwUmbLmrfXhjaRZXd5LV?=
 =?iso-8859-1?Q?zYvDs6PiXYZPin6/eVP3ZSzeqtg6DFJji348pRQoItGxcuU14CD9xJQ89b?=
 =?iso-8859-1?Q?K15w+pvSy5FPuNZkelciVwG3gaWyIf6Z/SQ/zHvNfK7keXgTB0fEowsIqd?=
 =?iso-8859-1?Q?C5ltTQH6cyY82BjCT5ahwmJ1G5eRd25Y0GG5XOAyQl4DS+tgf98GvfjRNk?=
 =?iso-8859-1?Q?Z6pAk4UwqFzt98fzvQsyJiJEjBh9LCvsaCY8vLVUXsJyOHMcI4ctS04zi4?=
 =?iso-8859-1?Q?MNVrc4czQvp4wrFVDfAu6mlRQpHz/9F7g10ELYcpdN0FS9tgw83jVHcejl?=
 =?iso-8859-1?Q?F8UV8hcU/rfBmnXq5B+8Y+Jp1JEyyggz3ZRd1kofxFPoryu5tsRG5qX2+K?=
 =?iso-8859-1?Q?dWsPcrzW5n/uERd8bu7d2oAN7eDtesJY0wHTcLcac9b6G11NI6I2mSP109?=
 =?iso-8859-1?Q?J4Va+qbTlC0sQIkCkU5XB1kLLCQIIYI55tJ2TPJd2zFERJb7dpbBeKrQx9?=
 =?iso-8859-1?Q?233kgpieG6RyzE5ltG7q3gnvtIO7dRbF6z+jI0uQd9U0dIlz2U2+aTjJxg?=
 =?iso-8859-1?Q?zbR7F+d65g55VRDKTw6c7nHYBXIaprspyeKhPEDuSgHkNSRlKfqVaPVtSf?=
 =?iso-8859-1?Q?G13k9CtOWv85fdg6FhXssrFYqPMi2IakTd7kFqAEirCqydrBI4IQ7QvD1q?=
 =?iso-8859-1?Q?Vrt2CiUMr1URs/aVzObYWNuSazWAfz4U/kTffjuN9BjNhSAy4fXJdlSusy?=
 =?iso-8859-1?Q?kvsKQKDILXKeTvKS9vgVLIr6xDjo2AeCjeLgIUF3GowIm+SZoVaIrq9J+5?=
 =?iso-8859-1?Q?jSM2wdPzviVjEFGm4ZmJjgSmSW+gFu0dzE7kExWAoZsOb/bg7mkSusqqS3?=
 =?iso-8859-1?Q?tc2hYN2DC3TOgG3MTIZjgskPduiLa+mw+3U29estAvJbGvyXa5AwF39zC/?=
 =?iso-8859-1?Q?6EefFVAVnJ2Q+NuxZaLKgrdowV7dTqhHKzKL6RcluPS3feUB19HGX5nTvc?=
 =?iso-8859-1?Q?P2w9RyByh/fv9jGaNleHTu5ntK4nTjreamQRrhKtXojeeKEJeEsk9pX1Mo?=
 =?iso-8859-1?Q?NNa6RAUv4EH5ncyNbC4ystVsvDLmGP0YQpyWaERPXCXR2O0B9f9ntIehCl?=
 =?iso-8859-1?Q?xNVZZPqDpC75OOEPTgwIyC+w60RkYFguCzbsSM4r5QAFaA8XnZnKgrLxbU?=
 =?iso-8859-1?Q?JuI9qaDRUS+U8/xhQ05OUR+gIulP9WJMLvJpCEuim8fPPp1KCFXz9rcJiO?=
 =?iso-8859-1?Q?HY?=
x-ms-exchange-antispam-messagedata-1: buGRIboKj7cIUVyFSZKPTh3lR0dI5BlTaSc=
MIME-Version: 1.0
X-OriginatorOrg: PhoenixWings.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0782.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fdc310-bbf8-4dff-f8f5-08df2a0c3428
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 16:00:01.2348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c228d877-6c44-4e7e-ba27-01bd5540bddb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: scuP9Ufo62GShs0kCfwlBzJ5atWSzXKRiwZiCT6YEK6PJ7+EighEGu6F52LO5yIFqKTK8JY+Rc3YIsHaZT7en7Fdw2g+MXr1b+9cQB+VVMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP193MB0794
Subject: Re: [Buildroot] Build host-cmake with OpenSSL?
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
Content-Type: multipart/mixed; boundary="===============5319220087686774211=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5319220087686774211==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_VI1P193MB078242F22E0CBCD5CB6CCB50E19D2VI1P193MB0782EURP_"

--_000_VI1P193MB078242F22E0CBCD5CB6CCB50E19D2VI1P193MB0782EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Thomas and Thomas,

Thanks a lot for your responses. Not the answers I hoped for, but I underst=
and your reasoning and I have to admit you are right.
I'm going to spend the extra time to patch the libraries build system.

Thanks a lot

Michael
________________________________
Von: Thomas Perale <thomas.perale@mind.be>
Gesendet: Dienstag, 13. Oktober 2026 22:59
An: Michael Ratzel <michael.ratzel@phoenixwings.com>
Cc: Thomas Perale <thomas.perale@mind.be>; buildroot@buildroot.org <buildro=
ot@buildroot.org>
Betreff: Re: [Buildroot] Build host-cmake with OpenSSL?

Hi Michael,

In reply of:
> Hi everyone,
>
> I recently ran into an issue where I wanted to build a 3rd party library =
as a
> target-package with buildroot 2026.08. The libraries build system uses th=
e
> file(DOWNLOAD ...) CMake command with a https URL. But the host-cmake is
> built with OpenSSL support explicitly deactivated since 2017 (commit
> f87138339b17bc2b1d84c59ea176abb941413550). Therefore, the downloading fai=
ls.
> Fun fact: with buildroot 2025.02 and its older CMake version, the downloa=
d
> still works.

If you want to download additional file that are required by your build you=
 can
use the `<pkg>_EXTRA_DOWNLOADS` variable [1] and a pre-build hook to place =
them
at the correct location required in the build step.

I don't know if CMake `file(DOWNLOAD ...)` will not run if the file is alre=
ady
present. If it still tries to download something unless there is an option =
to
pass to CMake to skip them you probably have to remove those CMake lines in=
 a
patch for you Buildroot package.

[1] https://buildroot.org/downloads/manual/manual.html#generic-package-refe=
rence

>
> Now I am not quite sure how to proceed.
> - My first approach was to plainly revert the 2017 commit. This solves my
> download problem, but I do not think this is a good way, as there was a v=
alid
> reason OpenSSL was deactivated in the first place.
> - Patching the build system of the library. Afaik this is not a simple pa=
tch
> and has to be redone for every package. Simple and hacky things, like try=
ing
> to tell CMake to ignore the encryption, by passing TLS_VERIFY OFF to the
> file() call, or by altering the download URL from https to https, did not
> work for me. Me next step in this direction would be to replace the
> file(DOWNLOAD ...) with a script, that downloads and decompresses the fil=
es
> with tools like wget and xz.

The `EXTRA_DOWNLOADS` variable kinda perform what you are describing here.
If the address of the assets you need to download is fixed then it will
probably work for your case.
It also makes sure it's ran during the "download" step which is important.

> - Adding some sort of configuration option to let the user decide if they
> want to build host-cmake with or without OpenSSL. I looked for a few hour=
s on
> how to do that properly. I add a patch with a suggestion to this mail, bu=
t I
> do not think this will be the final solution. Maybe it would be even bett=
er
> to add some sort of host-openssl as a dependency of host-cmake?
>
> I personally believe it will be beneficial to allow host-cmake to downloa=
d
> from https sources in some way. What do you think is the correct way forw=
ard?
> I am willing to invest time into implementing a solution for this, but I =
will
> require some guidance, or even better an example of a similar solution, t=
o be
> able to help efficiently.

I think it's best to avoid having anything downloaded during the 'build' st=
ep.
In air-gapped env all the sources needs to be cached to proceed to build th=
e
packages and such a mechanisms that tries to download something during the
download would break this.

I hope this will help you with your issue,
Best regards,
PERALE Thomas

--_000_VI1P193MB078242F22E0CBCD5CB6CCB50E19D2VI1P193MB0782EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
Hello Thomas and Thomas,</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
Thanks a lot for your responses. Not the answers I hoped for, but I underst=
and your reasoning and I have to admit you are right.&nbsp;</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
I'm going to spend the extra time to patch the libraries build system.</div=
>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
Thanks a lot</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
Michael</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>Von:</b> Thomas Perale &lt;thomas.perale@mind.be&gt;<br>
<b>Gesendet:</b> Dienstag, 13. Oktober 2026 22:59<br>
<b>An:</b> Michael Ratzel &lt;michael.ratzel@phoenixwings.com&gt;<br>
<b>Cc:</b> Thomas Perale &lt;thomas.perale@mind.be&gt;; buildroot@buildroot=
.org &lt;buildroot@buildroot.org&gt;<br>
<b>Betreff:</b> Re: [Buildroot] Build host-cmake with OpenSSL?</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">Hi Michael,<br>
<br>
In reply of:<br>
&gt; Hi everyone,<br>
&gt;<br>
&gt; I recently ran into an issue where I wanted to build a 3rd party libra=
ry as a<br>
&gt; target-package with buildroot 2026.08. The libraries build system uses=
 the<br>
&gt; file(DOWNLOAD ...) CMake command with a https URL. But the host-cmake =
is<br>
&gt; built with OpenSSL support explicitly deactivated since 2017 (commit<b=
r>
&gt; f87138339b17bc2b1d84c59ea176abb941413550). Therefore, the downloading =
fails.<br>
&gt; Fun fact: with buildroot 2025.02 and its older CMake version, the down=
load<br>
&gt; still works.<br>
<br>
If you want to download additional file that are required by your build you=
 can<br>
use the `&lt;pkg&gt;_EXTRA_DOWNLOADS` variable [1] and a pre-build hook to =
place them<br>
at the correct location required in the build step.<br>
<br>
I don't know if CMake `file(DOWNLOAD ...)` will not run if the file is alre=
ady<br>
present. If it still tries to download something unless there is an option =
to<br>
pass to CMake to skip them you probably have to remove those CMake lines in=
 a<br>
patch for you Buildroot package.<br>
<br>
[1] <a href=3D"https://buildroot.org/downloads/manual/manual.html#generic-p=
ackage-reference" id=3D"OWAb70377f3-c5b3-8691-10f8-0f1803cb3a1a" class=3D"O=
WAAutoLink" data-auth=3D"NotApplicable">
https://buildroot.org/downloads/manual/manual.html#generic-package-referenc=
e</a><br>
<br>
&gt;<br>
&gt; Now I am not quite sure how to proceed.<br>
&gt; - My first approach was to plainly revert the 2017 commit. This solves=
 my<br>
&gt; download problem, but I do not think this is a good way, as there was =
a valid<br>
&gt; reason OpenSSL was deactivated in the first place.<br>
&gt; - Patching the build system of the library. Afaik this is not a simple=
 patch<br>
&gt; and has to be redone for every package. Simple and hacky things, like =
trying<br>
&gt; to tell CMake to ignore the encryption, by passing TLS_VERIFY OFF to t=
he<br>
&gt; file() call, or by altering the download URL from https to https, did =
not<br>
&gt; work for me. Me next step in this direction would be to replace the<br=
>
&gt; file(DOWNLOAD ...) with a script, that downloads and decompresses the =
files<br>
&gt; with tools like wget and xz.<br>
<br>
The `EXTRA_DOWNLOADS` variable kinda perform what you are describing here.<=
br>
If the address of the assets you need to download is fixed then it will<br>
probably work for your case.<br>
It also makes sure it's ran during the &quot;download&quot; step which is i=
mportant.<br>
<br>
&gt; - Adding some sort of configuration option to let the user decide if t=
hey<br>
&gt; want to build host-cmake with or without OpenSSL. I looked for a few h=
ours on<br>
&gt; how to do that properly. I add a patch with a suggestion to this mail,=
 but I<br>
&gt; do not think this will be the final solution. Maybe it would be even b=
etter<br>
&gt; to add some sort of host-openssl as a dependency of host-cmake?<br>
&gt;<br>
&gt; I personally believe it will be beneficial to allow host-cmake to down=
load<br>
&gt; from https sources in some way. What do you think is the correct way f=
orward?<br>
&gt; I am willing to invest time into implementing a solution for this, but=
 I will<br>
&gt; require some guidance, or even better an example of a similar solution=
, to be<br>
&gt; able to help efficiently.<br>
<br>
I think it's best to avoid having anything downloaded during the 'build' st=
ep.<br>
In air-gapped env all the sources needs to be cached to proceed to build th=
e<br>
packages and such a mechanisms that tries to download something during the<=
br>
download would break this.<br>
<br>
I hope this will help you with your issue,<br>
Best regards,<br>
PERALE Thomas</div>
</body>
</html>

--_000_VI1P193MB078242F22E0CBCD5CB6CCB50E19D2VI1P193MB0782EURP_--

--===============5319220087686774211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5319220087686774211==--
