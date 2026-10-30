Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87DF606A324
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 13:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q5MafFyI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=xZMcQTOJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E2EA607B6;
	Fri, 30 Oct 2026 13:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjZnznAMnXi4; Fri, 30 Oct 2026 13:47:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 45C4460808
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793368040;
	b=eSaitjhUBdLglmJQhFh9gUdIbCFr805/UdILDPDpCuVDXOKieGmQSnnfbsJuXvR+3V2t
	 hO7vvZNTAglxxO3VasRJDPNdJkrEV7qw/Tpa4oPVpTsj/rU8C5qFN/5S700SzwXg8g5qd
	 SdCuZYDusOEKNtux7ZNSPGxF+Pvf4LtTVlsqpXEzHkdsniO1QbOV3tTFeX82QislGtw3v
	 RaxOfWuRPXRGjlQ35Jde5EH+oQWCwx/5JXPz7cSjRO82++u6A+37pwgmqRWDGd0Gf2W5s
	 b52TC7PYZ726GqJJYcjp5zmypxVqToTrTWRORY0aKWi72Tgjt/luzeXW7QMEacbqMAg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793368040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gC8qI5PPcG5Q1cYB0aAtDU0Mqw1f/PKQn2x7LzcJZRc=;
	b=N634yasiGiyiidaWDeYzOWw3yXrhGPLYzfP48pjN4Vwzsh4UeGmzmRy/RpEG8dYYy+JE
	 rchTxWhnvyPlxOhYE7p0GwKOkyY2IrDGFg/usaeYqp3Rb/KpwniLzYqMNgfqfw1iwcMxp
	 MqEMAC/kI/85kK7gpL1kOV3AIgtN6fHs4ekl+IBBbvKN/lCCyBpZ6J/6i85tQ4cymKMLR
	 /C+EolMovXneQZ+KyiAE6fFLw2BbkwRKn95aD0P/emwa0SbXeTjbWTaSFxqZX1FWhBrAU
	 oOReRBj9/PyZMjgd+3NYKUG85s9U6/xRS4KhWtjnIp/SWs16uu3RCrzydOr38KFLIcQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793368040;
	bh=gC8qI5PPcG5Q1cYB0aAtDU0Mqw1f/PKQn2x7LzcJZRc=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Q5MafFyIcmBBO+tDqDT9cu0KJYBVmmNQxk+HmmCsDRIJ0GV/nMe7EIbfr+de70ix/
	 6N3yOJotepr2c/DS8rh/6O3HrhYqpILdzUafbZRsnwBSXyDZL7Rc0fFv3U62xRMpYn
	 xHoEEXS1BM/w4mzU5SIniAHFbB3z7s9wAWVvhDWbnxUPzB3P0ySTDlf73notongvTz
	 XZhDKHU0mK4qjv+3c+UQtQRnfBlZweTmmEKPw4/updUhtA5nbfebn/bM8Foz9wVHyj
	 Grbyw1C/Oqg7OYQ6J8uYUgAyE/Lny/dy8ZlGaaJORhiw+cr1EmxaM8nvixDHpXmojW
	 29/P6qseutlww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45C4460808;
	Fri, 30 Oct 2026 13:47:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CD11529
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4285581136
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hh1VqBY2kEN for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 13:47:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9A56981108
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:c::623"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793368037;
 b=YKRtZoEQYV9dbLs3S9JQWxe1S1ZUksaygbT4i5WPotQ5O1saZqiIBJco5woZD13cWX8s
 /5K6FoBtDWfr+qD52rgOTLG9skbLyyLMhQ/EntBdmaWkRj92aUjZLvvN45JuI2S9czSAg
 coVl4VTpvAYjZb44+ChPVBTL7uU22JRpzY5VWrgjDB+3Lu3R06IbPlcDOTS7/k8jf1jcP
 TytcdGDKDRWixChTgueF6yhzV8nJCC0dQ4a7zAmQSVWzEl1wTak1NiAKOAWdciZzbx/jO
 1R2fXcIXxEa6dvFKouF2WoBe1qofqJNhBVivm7+Rc6qv2mYfTq9nG+jwF8rF29NzPAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793368037;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 x-ms-publictraffictype:x-ms-traffictypediagnostic:
 x-ms-office365-filtering-correlation-id:
 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
 x-microsoft-antispam:x-microsoft-antispam-message-info:
 x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata-chunkcount:
 x-ms-exchange-antispam-messagedata-0:Content-Type:
 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=sxyit+JP6K/YODUqHKQpruYcycQVG17VB7Eds5ErKSk=;
 b=MmlY7PBdEmvQ76aW3nMyDSqOKZ3id4d+Ec8axNZqQq3xIlENHQAkjB7MSNY/GPPiWw6z
 XHSmxBmn2tDEuM0/TlZr61/6Fm0798m/fVx7xQAesbEwYZ62fiVHu+mN0t+gX+aSftbBt
 dz8kPzvTkWybEglkncBy2OCxms4PE5zK7bjrjTwwJEuJ3X3pOEct6ruWw0JVn3e96hvOT
 AITCBS1DeHQEwgJUw46ZWE9skmCTpDrTsb3go2+fiDOlqFFOL0NdK+ND7treuOVMy1xFX
 aUenii0KNInTLykG3XX+QyOnhlsLCelVjcSXsq4MacrpIzUulWpT8D92J49rmFWXKhQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=xZMcQTOJ; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:c::623"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::623;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=xZMcQTOJ
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0623.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::623])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A56981108
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 13:47:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=yXCupMM1vsN7AFQ5YYyqKEbHvR03NSW1Hlc/9EYN+9cXi5cSY9w+ol9P0G4EbjEUnSK2QJOo+Cp06BwKH+zg85JVX0L52VWx5eOdwVaox+PNWQYqH4aMcN4JMo0HHgLhjYGCJNOAOF0Fvsyu/ZJAiqjW7pKQBB0T032/oeqMX2QbARqHh64YsD/UlOSSRz4xw+0APUCZRe/PfaMO73ogwz5kJmxniWhR1FHYNMbMTn+oLb8RLTQKXlaqqo9tmC46qUR8safTe1yuMsIHx8adtghBSsFKu56t6yb5kSk4y9g8HvfE9BsX2wNJUsvvUxOXbT2mqD8LwEw3UrHOGETe3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxyit+JP6K/YODUqHKQpruYcycQVG17VB7Eds5ErKSk=;
 b=y+x2EloXE7lXKFp1S5vgBEoiS8HTdznLpTfpEFyQUM+GdwKf4rV3crCElppBturdfNwThETFVa/FYNEr+T0ujvakwProd69OdwcxiY4q+Gxgs8aeiINcBDq4HQt7M/bW9JlWntqtajs/BgORKGADZWhzMCKB4TGhKkwiKSug6nqpZSqmmSsA+2uCXrDnzlpKbCxgJgn89A6EFpyNxIedZNi8r59jISR7edcTfNIeghFzFFRdxFvwXsUZ9G78JHFXI7qFyE8MA1gOQfy5BHcw0kBmnFz7Qxh0lTY7zZGaksLCacrzdcPUukXhxb9lc2q0PUwBkkTW8P4QDrTFIR8XUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxyit+JP6K/YODUqHKQpruYcycQVG17VB7Eds5ErKSk=;
 b=xZMcQTOJFstWlX+aMVjKuIIupcPX39EkfNW0JFHMc/jEBDLxG5QgCC97UdiMEonTVZvsGAqfvtIDklZ7ZSXH3jj13buJ9vn8TAsmNXiCtOQssKN3U9ARxzG19XGpc8Eouo8b6lUj0x6y1ZZvB6rWXSIzN+Pvb1uy1riuJWUMNGwITCzXmMvPQ4KKAhGKUz21uIZ0ZQOHo7RQu22MdJOGXdjjOii3k466FRNMOJydFc9LBK+tONy4uqGj67DFHU7jkou7s47yTqWXNhaCkgQR0xAJENtTMazhuBWHJlAun2Dp9d91AY9lbZtwb8+HfSFyuSADQYGrTc9cUqzvZ2XNvw==
Received: from BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::10)
 by SA1P110MB1439.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:197::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.25; Fri, 30 Oct
 2026 13:47:10 +0000
Received: from BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e21b:e9b3:34e9:8da5]) by BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e21b:e9b3:34e9:8da5%3]) with mapi id 15.21.0546.022; Fri, 30 Oct 2026
 13:47:10 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: =?iso-8859-1?Q?Rapha=EBl_M=E9lotte?= <raphael.melotte@mind.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v3 2/2] package/mupdf,python-pymupdf: bump to versions
 1.28.5 and 2.0
Thread-Index: AQHdaHUoFA4d+d0KCkmNaURpj1ynQw==
Date: Fri, 30 Oct 2026 13:47:09 +0000
Message-ID: <BN0P110MB1609B62896FCDB1B0B31BDD99F6DA@BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM>
References: <20261005154047.413898-2-raphael.melotte@mind.be>
 <20261028161447.330533-1-raphael.melotte@mind.be>
 <20261028161447.330533-2-raphael.melotte@mind.be>
In-Reply-To: <20261028161447.330533-2-raphael.melotte@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1609:EE_|SA1P110MB1439:EE_
x-ms-office365-filtering-correlation-id: 12ddeed9-a081-4e74-db04-08df368c4b68
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|23010399003|1800799024|366016|10067099003|55112099003|18002099003|22082099003|56012099006|4143699003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261021135927099003|38070700021;
x-microsoft-antispam-message-info: VEumagEciZpOcN0ZUN4tIuPKLlKE95h35mOUw0oViPpqVOOFPpv5VTc2KSv910305TXtZpHKAC54/rd347WHAxDFaya3uzP0NCrS+l2ApdyXWcHdvx4amXJd7L4zpMi4xVMLCmEMGpwnDDX6mM9xU5V2v0XuByn4SOaTZPs+t/Q4Mz1Jb+/RWnKUEPr8NlUL+7kl4Jai0kao/260wbMf+atJcCkEam4NNAatg2HGpph6/mPmUTcpt75HYDSpu026EsWgUiKY/xE5bDOt1fBAkwLyToowqv+7wjXxuo+JDGdymBNPo1wCTADYhkqGD2gT8zzb9+PTxED2TzZ/PI4u8VUsd1jGtlShM9C9GjHogCiphtLsd4Xk8XMmyeWg366u61UHjTVELrxf/3NwRCLaB1KxO01q0dS0W+q2K49hDDSGfeZnK7WQc6yCKrZN3EenVnHG3TjIjDuOA2o2NGD1a30FIYIMT31tg+BDuvTycr6dTZsZmvon7D2ItGQKcxoRxEWHXrGCM/3TE8xhPV86BLkCg8YKPwJdMVtfxK4XoV4+OXCrFN/MCjY6Iw7o4A5ETm5Oc0TYeUM+W/3We+Oxpa0Lv6JvqzqEUN8Id8icmme23aQWIdmkKS0n6x3CrdURpfNk0u3UsA0iAnkWQw1snf9kBPbuRO8E6D2Y+DGore8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(23010399003)(1800799024)(366016)(10067099003)(55112099003)(18002099003)(22082099003)(56012099006)(4143699003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261021135927099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0qgNbxDApWkWJhcId3hOINuon2dEGpMzX1warFjlPQFRR+lFpJO1ipsN3z?=
 =?iso-8859-1?Q?AfMP4LyzCd4l19GNSjqEw8QCLDjUi26bF+7T0Q3yLEHxUNnwl4/EsaLzDm?=
 =?iso-8859-1?Q?hNefNXL9zN9jdBant538zUX8peI4TG0DzTfcS07TnDvzuYll1Nogyf8YNs?=
 =?iso-8859-1?Q?pqPBIxkVyVN/VnZpSuGyKc6NePGal2zzHrAKSaFlLKA+SyHLkoiHINkySm?=
 =?iso-8859-1?Q?wyqHgUWCg3EHcK2k78gN8fUEGY97W8DZvlWmW4XG5hSGHVDxl7ug8nD6Ai?=
 =?iso-8859-1?Q?gmY46Hg6ClfYmCTNB94jlFzBSaSVlAG+SMLX6Ytu1gJ4c4cDfX/GQTJQxi?=
 =?iso-8859-1?Q?7OQ1jKO1Wv9c7YEz1VlzeD7wxrUGG+Q94livRqC5EVdD87uN4/ZOj1mqkH?=
 =?iso-8859-1?Q?A2L81PFY9RoUPz4SQpzJVuBbhGhK/CGDfBpMPQy+9u+yB2mZo/9f7CLiKI?=
 =?iso-8859-1?Q?Hdaoi8ks8Z2H/EZvyhDVf/dljnVKmY99eNrEFvP7a/SleKsbDwaLt/zGXU?=
 =?iso-8859-1?Q?p0soHa11Iz2+HN49RHGPthl4n3DfEr9GcUMHjDQqy9hr2dCJEvKEMsWr0p?=
 =?iso-8859-1?Q?9dqXhQxJz5YRk000sscctUchWTNTyMSfHk3DOUtyIppgjddeSw/UHltVmx?=
 =?iso-8859-1?Q?bQ/EZ6NPtk0OXQoWom7wd5FaEBCFwAl1ZCJzXCfBj/Ft+Avf6a8zviNdVS?=
 =?iso-8859-1?Q?bDspdVxPuUupTObuFNQWrNQIOVAYj8BLsedRyD0xVv85XqnAS19u1zStkH?=
 =?iso-8859-1?Q?xh87AfdZK9YOpzXP6XANP2rnKqpuEl01zh6tVlDrPKb0YkbB98shGoPIMa?=
 =?iso-8859-1?Q?C9SbbQFCGtKn+3j+bxMHpRvfSf0JHSnruWuuGCX4ABWBV0IQwCp7Pu45mC?=
 =?iso-8859-1?Q?ck4piE1zDV21r6EhfsrMMTcKDzAugTr3PPtr8fHZ43r1AaQ0ghnwbOwYit?=
 =?iso-8859-1?Q?g7AqC3ohCOPo52PGUKVQK7CR8awgSQykV4L7CGgtlSJaLdvPhc1vdoKMdn?=
 =?iso-8859-1?Q?ESdLiUpItjXVjoRX3mUEu2IxfiSmZ8SN1+fBnKpr0qP6RSMdo93+fRvCCG?=
 =?iso-8859-1?Q?XzSS0sCwDp5MxPw9zxncI9T5iqxxBXIxjS8sNy5a1jX5QcuCK0ZnxkLLGg?=
 =?iso-8859-1?Q?4ag6IywejItoao3COmT3D8jVwjXh9Biv+djNXla9hXs/3hOVV98pVQDOcY?=
 =?iso-8859-1?Q?ix8rTKruTlfAq+hkfZ1yfp2I5r3QqTK9Y071Csv6GbhzcfRTislj/KxT/l?=
 =?iso-8859-1?Q?34tIJHo0kl5Y63KGSQ8jGfsmht+mMUTD9U0QK41rU7FEr0VK/xnbDP/dfO?=
 =?iso-8859-1?Q?PfXkSSo8aX3MJQ/Jj7e1XlSLGB02I+q3vyc5aC6a5p/D5ytt+EkIMgRRfX?=
 =?iso-8859-1?Q?no4U7ul4RDwaN0p5KxKLS79o7Xyxa4oxWMiq+51em6SYGAKJCoF0ZRl1sw?=
 =?iso-8859-1?Q?Kkc6n7adpI8AFOcXWp63HMl53wUHkrvR8JPyyHCHOG9FR6zI6xzqUUN7yA?=
 =?iso-8859-1?Q?tURK7odTNShww/8OXldSkr0dd7/wQ9NSb7s9nyX3UqR2e34vwt1ZDIu/Fz?=
 =?iso-8859-1?Q?nz3wI3wQQAvSfl2RWw86Iu1S83EsYVjUOWyheJ87mOvnOxVD0L+N35y1Bh?=
 =?iso-8859-1?Q?u/gj3q9HtPA8Ml0/B7c3/eXkT8CjnCrbbxJQRqPO5Ugl/DcdUzIbSlETwj?=
 =?iso-8859-1?Q?GUjLHdOr3MchJOYbZeG268HUoXKMp/DohC6BmcRT?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1609.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ddeed9-a081-4e74-db04-08df368c4b68
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 13:47:09.8109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1439
Subject: Re: [Buildroot] [PATCH v3 2/2] package/mupdf,
 python-pymupdf: bump to versions 1.28.5 and 2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FORGED_SPF_HELO,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,T_SPF_PERMERROR
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1




> -----Original Message-----
> From: Rapha=EBl M=E9lotte <raphael.melotte@mind.be>
> Sent: Wednesday, October 28, 2026 11:15 AM
> To: buildroot@buildroot.org
> Cc: Vincent Fazio <vfazio@xes-inc.com>; Rapha=EBl M=E9lotte
> <raphael.melotte@mind.be>; James Hilliard <james.hilliard1@gmail.com>;
> Yegor Yefremov <yegorslists@googlemail.com>
> Subject: [External] - [PATCH v3 2/2] package/mupdf,python-pymupdf: bump to
> versions 1.28.5 and 2.0
> =

> Release notes:
> https://mupdf.com/releases
> https://pymupdf.readthedocs.io/en/latest/changes.html
> =

> Note that this bump fixes multiple security vulnerabilities, and at
> least the following ones:
> - CVE-2025-46206
> - CVE-2025-71382
> - CVE-2026-7233
> - CVE-2026-40505
> =

> With this new python-pymupdf (and mupdf) version, we can no longer
> build the old implementation (the 'a' implementation).  We now need to
> build mupdf's python binding, which require host-clang (and its python
> bindings) to be built.
> =

> Also note that python-mupdf's version still needs to stay close to
> mupdf's version, they can only be updated together.
> =

> A number of mupdf patches were needed:
> - To allow changing the build-time log level from an environment
> variable.
> - To be able to provide the libclang include directories. This is
> needed because our default libclang include directories are not
> properly set.
> - To be able to link against mupdf with no versioning number.
> - To fix build errors when generating the python bindings for
> python-pymupdf with clang 22.
> - To fix build errors with uClibc.
> - To make it possible to build without a venv.
> =

> In mupdf, setting JLIB_log_levels is not strictly necessary, but it
> greatly helps debugging build issues. It also only has an impact at
> build time anyway. To make it easier to debug potential future CI
> build failures, we enable it unconditionally.
> brotli is also added as a new optional dependency, supported since
> mupdf v1.26.0.
> Starting from version 1.28.1 pipcl is no longer bundled and needs to
> be installed separately, so add host-python-pipcl when we build the
> python bindings.
> Starting from version 1.28.2, mupdf added the unconditional use of a
> venv, so disable it with MUPDF_NO_AUTOVENV.
> =

> In python-pymupdf, !BR2_STATIC_LIBS is now required by mupdf anyway,
> so update the comment accordingly.
> pipcl (required to build python-pymupdf) used to be bundled in
> python-pymupdf but is now available as a separate package, so use
> it. This also allows us to use 'pep517' as the setup type.
> The test is also updated to use the new implementation.
> =

> For both packages, the patches that are now upstream are also removed.
> =

> The tarball filename for python-pymupdf has changed upstream so it is
> also updated accordingly.
> =

> These new versions no longer fit in the 120M rootfs configured for the
> runtime test, so double its size.
> =

> The mupdf builds are quite finicky on at least swig and libclang
> versions, so applying these changes on the Buildroot LTS branches
> should only be done with careful consideration (and making sure that
> it builds and passes the runtime test).
> =

> Signed-off-by: Rapha=EBl M=E9lotte <raphael.melotte@mind.be>

I ran the build and PyMuPDF unit test on master and on top of Bernd's Pytho=
n 3.15.2 patch and can confirm they both pass.

Tested-by: Vincent Fazio <vfazio@xes-inc.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
