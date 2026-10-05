Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425B5CA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 15:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F259060718;
	Mon,  5 Oct 2026 15:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pr5hjRIhY9jd; Mon,  5 Oct 2026 15:34:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 51C1F606FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791214490;
	b=sRT2dXSTXrEXUMGmt5BywIF1F4ZXqVKI/ljKh5rVkRzqeT/24W0PprI0DNn/lk0K4xlV
	 Lp2Sc9WDT3MU1xxAuyjvI+xjj90rrAXyjdOLXdtBRq+xl5NaYWGa0jaDenudvBpvFs1B6
	 y4C2lWqqqbHSwY2P5tkfx+H5g3EWF51Sj049nSsFj65afzD+VsfWxShyKFN0THtu23Shb
	 vZxkR6XE9hw8YnNmgeWSrO60nq6IeBILf6zHLbjTwmU2JMVEbyw7BsNanEy5Svmmexsk2
	 E37Nn5J8FgqTZOuRPhzrFKRWs8iCbYt/Hx0tyDI+Jk+KpMdJtQv/0c/YPgDOnSv5xmw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791214490;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Thread-Topic:Thread-Index:
	 Date:Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:drawingcanvaselements:composetype:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3S2zfACMsHK9bJsgX1raueWoUmdmq+NUhuP1O2qNdN4=;
	b=LJbVePwDevKwImBc1zpyKnyoh9RtnbeHDfTeWXlgmteIojTKlQr4g06tyALPJZrCDrXG
	 u6Gp8P+pUqptW5bW5U4NrfyusXOpQPjFvSdbSz7n2TW3GAXuepOH+k4B3FyVw8yeqXXjT
	 MoIcIqiIZU/vm6hocvmk/0165fSxgOEjMLWiicEMfBM+O5sqxFisLrNXCNuHkxdvdI18R
	 05jVsqhS3/Gx3slnXJxQPzbYKnQBdU1emZdReA5ijXpyBR+K7LN57ohZrpCj4L19x+vG2
	 R7OTjONkW4YWRUOSV+/d51V/+njThrPxkn+sPnK5Ju5k9uCU3FEU5zMI5tJU2Tht2sQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791214490;
	bh=3S2zfACMsHK9bJsgX1raueWoUmdmq+NUhuP1O2qNdN4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qfWLM6PTQYFjexMd/5RbC+97usDFbN5kUC4Ifi/re2mjt0jNMxiKNY3HUCYICu6Tj
	 HNdmPaPHx5Usz1RuTQp9vlIOOE2mpUyJR67CWqrAeSOPZBTc3QYSZ+GmMTq0emMm/L
	 SGFmHvcaGISQh8Z5xnAtW5b9lUO7K+v3R2f8QY5ZPw9owhVexz9FQs39fMqFcWvphN
	 QpLDvxgkIfXd1Q5MtZDwM/S2uuitVCNdvAztdECrELCAhEaGmIO9jDvrxUz0jSsAmY
	 R08rqFBHxXCQ5ikltuo855VmEAox/NjxDjuiX3d1Tl9CtZispJ7jEDCW2hN39zyNhG
	 x7LrM91dol38Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C1F606FA;
	Mon,  5 Oct 2026 15:34:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E21122B
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0412980A65
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6T_ohbQ5YWM for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 15:28:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0A57A80A50
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:c201::6"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791214080;
 b=CnKCEFr0aiIeSVyd8UbwP2uOCD+uwEtUIH04du5XmyVcpC5kUoDUS/RbJSQKD0nEffQ+
 A5tWT2ioMw1xAajY5xLywOjYKZe/A9IGnrJyfzloipMWmkh2yvDnoPciMSe/qkimuAq35
 MenxzRNd0U+ZZuxZbAD8gw0qE3fTKVGvqNPTnl7kKqBSgwrtS+O4OR9+2vLM/V6f0n8Jp
 5CrCK76FOxRzyZFMt6IU1n7w7pss+SD7gD8SkIgT2dWkolvh+UYPVMcX4y8ZNVzM9/q6p
 xc37IVCCbxeOnth64z0PH328v8+70mPwjYwAmAujtRAOFzz5/OIUJ+/hovgu2N2nk6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791214080;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
 drawingcanvaselements:composetype:x-ms-publictraffictype:
 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
 x-microsoft-antispam:x-microsoft-antispam-message-info:
 x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata-chunkcount:
 x-ms-exchange-antispam-messagedata-0:
 x-ms-exchange-antispam-messagedata-1:Content-Type:
 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=UXzu2/KouoyKPfzZhw0KpOU0GLdKB5wAAQM6moWElDA=;
 b=s1lfmy9smH3Pvu70KTD/PSmsTQUS/ieeGIejFl/ZU7N/PPSdFUSQZCIupqTG3HAYsJvQ
 v0TJBWackaoS2dlvRhouVKcbGOd6HrHh84E3W2wMHmszgEpZIn1JfhUqjGa3bgdILIOzj
 HWsm9UXtMlsb7899u0xZpx8VRTwNbUKmGlJQU7rPn4AvDak0YhzX1aB3l2pOPb5AIF20/
 wLxFrbyQwN+6fIYZ2+/pvQ4tSgva5FOVKdtfIk0lOr9J5+Ris79Yo3N+/FXm4kKMbLWRM
 fZiLnwwXuddg5XP/QIRoKpkf4ZaR5lZNqDkkdtCdtEWf+DAtkf4O2N6bCsQ6rF080YA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=none header.from=phoenixwings.com; 
 dkim=pass header.d=phoenixwings.com header.i=@phoenixwings.com
 header.a=rsa-sha256 header.s=selector1 header.b="pOja/bCO"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c201::6"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::6;
 helo=am0pr02cu008.outbound.protection.outlook.com;
 envelope-from=michael.ratzel@phoenixwings.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none)
 header.from=phoenixwings.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=phoenixwings.com header.i=@phoenixwings.com
 header.a=rsa-sha256 header.s=selector1 header.b=pOja/bCO
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A57A80A50
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:27:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIup3NIw0RtnJegvYotv5+xosxfifWcdcTWUd1UBPInezWIjsSjwFwJs3ILdnc86oOEKmW+5k8W7yCSTHrBPVptHh9ZQMoLUyvtVToGjtkKhjdb4zMoczlonKJ6shZHR8cypo84Wq2oSOKKis5dA1PDM9q+pSwAjKFHblUDzrdKBIZcZlUVt3GGpyTYw58xra9mTBXigncmU7AloFKsQnEVb203tlTEp2yn8C/eFzPB5ARiVDHQErXo7u5wrikaJ0k2XZDX1xhhQYHFPPPgcMpQ1AxNaZ631veEexDyDzLKOMZ67T+/0iOvwyPfsi9h0nPwnUCSlFzVLqDzvBJ0rJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXzu2/KouoyKPfzZhw0KpOU0GLdKB5wAAQM6moWElDA=;
 b=qhJqKeMQmO2lfEDWn5nugLVa9QXiUBP4HZv6xV1holDH3HNpckzvjfOb9fUkjki9RLYoua1Xxbdyi0M3bx/5QKYFdCuXwx5AhJg1jXVwFzTDb1jEw4IWk19SRNAJ0nIxl7DBxWLJr9/B4mkJZizEWmlLcws8dzcAewQBQ3Z3irVt9v2YyfZzojvrvpWpYo0iPwJM3DPxR2tnISKs/YNvV8+xJ2FbXo05tviD8aTqcEh/oUUvaf9ZZLnAfZj2dk1Ddhsj1FDruQzPa1HAJQbfjbJalf4QHK68fal/di0y58K4imKLT40J7bxSPIHbVCQSXrioofTUcJE0HaBP4/3tAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phoenixwings.com; dmarc=pass action=none
 header.from=phoenixwings.com; dkim=pass header.d=phoenixwings.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenixwings.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXzu2/KouoyKPfzZhw0KpOU0GLdKB5wAAQM6moWElDA=;
 b=pOja/bCOa8gqRsFwJNkuzZWEM0/yPqjpVNo/A7TiZvCpGT+qlFKdZPgEF6tnO3oCg/rezlrPqRMYm+iosdSpg5Rw6A1+LLXNSYIL+wD5Msm1vu8lkNQcH7eKoiaO/ka2iC3PeAwzA50YMoewwUFtgU8qDyOjEZ7Bx7d77lFHCyFVLnQa7mujK/fSl/Yad1D/1JN2ljN42cwGET9sup7onuIyt3cIHucGrxh0uRWHs6Lxg7+PHEPn1H3n5P9PLwogaK5VSZiXbf+UxzY9Eh9GH/H9H6xnoWUXfJXmFVLbzm2IEoxGrwrdeu+Sq72b5pHyooIKlwOow7SEJlVg0gr6IQ==
Received: from VI1P193MB0782.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:147::11)
 by AM0P193MB0628.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:149::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 15:27:54 +0000
Received: from VI1P193MB0782.EURP193.PROD.OUTLOOK.COM
 ([fe80::6a20:8e2c:64d4:c8c8]) by VI1P193MB0782.EURP193.PROD.OUTLOOK.COM
 ([fe80::6a20:8e2c:64d4:c8c8%3]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 15:27:54 +0000
From: Michael Ratzel <michael.ratzel@phoenixwings.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Build host-cmake with OpenSSL?
Thread-Index: AQHdVMilbCtAgmoYEEOfuoZxE/UlYw==
Date: Mon, 5 Oct 2026 15:27:54 +0000
Message-ID: <VI1P193MB07827A8170CCBBF9ACFD6BE6E1962@VI1P193MB0782.EURP193.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
drawingcanvaselements: []
composetype: newMail
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phoenixwings.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P193MB0782:EE_|AM0P193MB0628:EE_
x-ms-office365-filtering-correlation-id: 6f35389e-abcd-40c6-b5bf-08df22f539f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|23010399003|38070700021|56012099006|10067099003|18002099003|6133799003;
x-microsoft-antispam-message-info: RfF3RIGE0tENS6bRkHRS4iKpIvGwCOU0P9udm1Co6UGlb3lXe2Ql3BwYHKK37kMqempr04Xp633AKxIaUdW0+VuDpbllAZdsmdsoWZtwrQ7yh9Ib5zaOhP6Gw9AAf/LxvdzHIpAWG9rWZBmhsZcdIFAgZOBF8ASr2jD5aUvlEtNjDWHRzCuH1NvVSmvlyqUzYR4vvYdXx80kOU9/KJCCeCbdabA8RB6E9CEC0yLrUSJZOlL5Hed10yaS9VHgn7z74QfMZvFd8/5Mvv8JJ8k4D2bonwvu08QHlK+wAHPxDiBxNCjYvgetudqRfEI1Jh590ndvRnu/P47Y5plnJg4wbTZjKSNprngu4nOK870DhLpHPD1CJjpaJD4lV72z1s0Rh1KNWQAuDdnULgeJLKEsfsq7pMA0t68jU+7uSvqsIonQzNotqqHQAgxPKRqeh5pQ207r3vVzWnfOkagOL1Mgu4OyXQiEmo3giVgsHesTpgN9agp+0aqL/1xAaFazeGHfUiE+nEnIzkc+UbN/vhSwjMFIRvM2w+mMCpdjPvc7NWYSiGNT2l689FF5eBnCbhsCzR/9eXRtPAp4rF4wOzQFuvWYvjs/Pkb0AgrFDAdVvb51CgJPRIOefKPB/ZsBjI+DsRCgmROBYZ3o5sXnj3X0lH2zwfqOUiiQLtuekEWhjmw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P193MB0782.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(23010399003)(38070700021)(56012099006)(10067099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SfPqAUYC4FIhkRz/tpbSUeB4Yv53RPvGhNNvBDG6jKdPSrI+77ZOVw+TYR?=
 =?iso-8859-1?Q?E1EUBOW9Ga4oBAy/HSGsBgOzDkC4jlScodViLxEDv0X/rcDu2uDa/bsL/V?=
 =?iso-8859-1?Q?7zN9yKxdQzt6R++2mvXMigQ/+KuyESA+hgozJ1gDNxIU1HPABB4B8ISaz1?=
 =?iso-8859-1?Q?iHdDsfFc7p4pjhz4fMk6zgOQGhXjn7tZzxfz0fXSt+08AtZK1hfX2VFdXT?=
 =?iso-8859-1?Q?MrEuPBQodEozZFsY8wKtrBT21nlv/WQ6s9OFhkzh/3QsDvQdcyuFUZazOT?=
 =?iso-8859-1?Q?dk5PadEm1v+vCmC+DGB4c/DCbRuMKu2J7BkqVLCNJ3+paNDR3NO+ic+IRY?=
 =?iso-8859-1?Q?+pWmzL8Kjj6Cax8l7w6QNrZ3LYF/+bUZIv1irf0N0AX5VsGcWps5HhlWG0?=
 =?iso-8859-1?Q?IbZC7CT7pLwawDlbjPlrGBVMWy3tnV97EANOmd42yK/0912FhUfSurq2H3?=
 =?iso-8859-1?Q?puXQRb5qP2h6/r9scK9Zyk/CPzZ3gr+JdMbtx9nMQewWl6xKjyFHJVL/D5?=
 =?iso-8859-1?Q?MCA0mImXLR4V+S+DqEAeRQWB7JKhoO/qdhOCtCD6jruV46+PHisC8xb97j?=
 =?iso-8859-1?Q?25vj/ZYJJwUJ8Y7aMEyiZ56t5erR1nni5pepou8KcdBXCQnsuNJpEMLcEi?=
 =?iso-8859-1?Q?JiEJ+ULKCl4/l/QKexg/gjFd1pV6N4UVuKwpnbBrceUjrv9yeH+DaRXM5R?=
 =?iso-8859-1?Q?Nu0+ogFIuc0QR6XWP7UoMPcq6heeUqsOUxC1m+6lOCi5T6XijALXycrEQA?=
 =?iso-8859-1?Q?hdDkp22mlzImHXAmKZzmhYvaQY5ZFLTbMSDEi8u5JkdgspdjzXUAPevhpz?=
 =?iso-8859-1?Q?IWuqwc0A9h4v0jEiEQ3klYRQzVk8k+cpk9MP0Rnn0k60LEMQ9mXh7d982g?=
 =?iso-8859-1?Q?GYs3z6TYH1FW88PLe9oNq06Dc8uouzbMW5GwTIoV0sNtPIpf/afEvwI3bM?=
 =?iso-8859-1?Q?27FfOBh5CDUiXcoh3xzXAXlLhWuEvgw/dMBg+eoDlzXIIhO5GN8Kdvji6W?=
 =?iso-8859-1?Q?7W1XpCzuQNU7c8ttq98kUzn23iTGc/SOgm8+ZBvAHiWIlVUBpDxdqw4/PB?=
 =?iso-8859-1?Q?7pEAgwEST520iMt/Mejrui+Rq2Xzmk268poO8gDhUsJQ1HcTTb9bqxxGXi?=
 =?iso-8859-1?Q?U4fQ7sGdJCt+mCD7Ffx4APhZ1x2l8n/xQMZ9tHapXXUwWBHxHQroHAt19Q?=
 =?iso-8859-1?Q?2xlFV/cUQhwK+pnlxg9uJ8SpLw2coiiVDbPrCAL2T3n2nGOngSnjxAk2Hk?=
 =?iso-8859-1?Q?9569EBzROk+uAUe7GApR8W5qL1sD+TZHCarE0qFjyQynp9kbjpR6K9YN4I?=
 =?iso-8859-1?Q?5U+Z7a66ZMIioqn/QdSZl4A9Kw+z0xmTrtlVrfj5ENSBg/DdIecr1+R4b4?=
 =?iso-8859-1?Q?cwVmOPMTKB+NFlS2MjmKzYGkKUhgTnZyg8yTfr5omoFqoV9TvZn34hP/td?=
 =?iso-8859-1?Q?CnknESMIRXt4c4wV7TWGJ4Ohasp8ij0SC7UKRz3CFLkZOZfo332+g+fSxm?=
 =?iso-8859-1?Q?ElredhCiWBYqWtZXT6cwyI0Tf9/WXH4jBEl9+2RDA72fNJOS08lEuo0ehX?=
 =?iso-8859-1?Q?+NyoTBVsYKIW02kV+Sdr1EG27EcdqcNZfykmVpOGWdUSBUSkZVfwcbUwuO?=
 =?iso-8859-1?Q?TDaHDNjmYELEyeQaUr0JWesU+K1L55vN+z35xiZxTpj7hs27J4l+xdMGnc?=
 =?iso-8859-1?Q?JgF4an+OCX3FcQj/ycz234kaHwv+a9ef0NyLuAyaWeaMJWmGEpAHiX4/0+?=
 =?iso-8859-1?Q?76n8J8qiTBm8xD52oH/58Nx8PBd3HlSW/6QOaQ/vgNXKqnzkMmlIEGzgzL?=
 =?iso-8859-1?Q?PZfr2DnjSgxhlibByHZf9lAu/8xraItQ5a2cOOoaMDtJgGDjZj7poAnh5+?=
 =?iso-8859-1?Q?Mx?=
x-ms-exchange-antispam-messagedata-1: dOClvKjRB11ba8se+B1lGbfOn5DfZCeOWzM=
MIME-Version: 1.0
X-OriginatorOrg: PhoenixWings.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0782.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f35389e-abcd-40c6-b5bf-08df22f539f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 15:27:54.4515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c228d877-6c44-4e7e-ba27-01bd5540bddb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UWn1q4HN/kcRFyWK5D1JX1yU4QQtzkuzzY1VS1abPpbGnOTs4rIrl+LsKSFx4Bi1oHAylMGL88YUxF+k6rcxNWo5iegW1lYGB86kz2gI25s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0628
Subject: [Buildroot] Build host-cmake with OpenSSL?
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

I recently ran into an issue where I wanted to build a 3rd party library as=
 a target-package with buildroot 2026.08. The libraries build system uses t=
he file(DOWNLOAD ...) CMake command with a https URL. But the host-cmake is=
 built with OpenSSL support explicitly deactivated since 2017 (commit f8713=
8339b17bc2b1d84c59ea176abb941413550). Therefore, the downloading fails. Fun=
 fact: with buildroot 2025.02 and its older CMake version, the download sti=
ll works.

Now I am not quite sure how to proceed.
- My first approach was to plainly revert the 2017 commit. This solves my d=
ownload problem, but I do not think this is a good way, as there was a vali=
d reason OpenSSL was deactivated in the first place.
- Patching the build system of the library. Afaik this is not a simple patc=
h and has to be redone for every package. Simple and hacky things, like try=
ing to tell CMake to ignore the encryption, by passing TLS_VERIFY OFF to th=
e file() call, or by altering the download URL from https to https, did not=
 work for me. Me next step in this direction would be to replace the file(D=
OWNLOAD ...) with a script, that downloads and decompresses the files with =
tools like wget and xz.
- Adding some sort of configuration option to let the user decide if they w=
ant to build host-cmake with or without OpenSSL. I looked for a few hours o=
n how to do that properly. I add a patch with a suggestion to this mail, bu=
t I do not think this will be the final solution. Maybe it would be even be=
tter to add some sort of host-openssl as a dependency of host-cmake?

I personally believe it will be beneficial to allow host-cmake to download =
from https sources in some way. What do you think is the correct way forwar=
d? I am willing to invest time into implementing a solution for this, but I=
 will require some guidance, or even better an example of a similar solutio=
n, to be able to help efficiently.

Best regards

Michael Ratzel

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index b8221a7d22..b2900ee6e3 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -10,6 +10,14 @@ config BR2_PACKAGE_HOST_CMAKE
=A0
=A0 =A0 =A0 =A0 =A0 http://www.cmake.org/
=A0
+if BR2_PACKAGE_HOST_CMAKE
+config BR2_PACKAGE_HOST_CMAKE_USE_OPENSSL
+ =A0 =A0 =A0 bool "use openssl
+ =A0 =A0 =A0 help
+ =A0 =A0 =A0 =A0 Host CMake will be build with OpenSSL support active. To =
allow downloading from https sources.
+
+endif
+
=A0# The minimum system cmake version we expect if 3.18 as provided by
=A0# Debian bullseye, that we use in our reference build docker image.
=A0config BR2_HOST_CMAKE_AT_LEAST_3_19
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 007a1efa0b..3f769782c4 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -50,6 +50,12 @@ HOST_CMAKE_CONFIGURE_OPTS =3D \
=A0 =A0 =A0 =A0 GCC=3D"$(HOSTCC_NOCCACHE)" \
=A0 =A0 =A0 =A0 CXX=3D"$(HOSTCXX_NOCCACHE)"
=A0
+ifeq ($(BR2_PACKAGE_HOST_CMAKE_USE_OPENSSL),y)
+HOST_CMAKE_USE_OPENSSL =3D ON
+else
+HOST_CMAKE_USE_OPENSSL =3D OFF
+endif
+
=A0define HOST_CMAKE_CONFIGURE_CMDS
=A0 =A0 =A0 =A0 (cd $(@D); \
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(HOST_CMAKE_CONFIGURE_OPTS) \
@@ -59,7 +65,7 @@ define HOST_CMAKE_CONFIGURE_CMDS
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -DCMAKE_C_FLAGS=3D"$(HOST_C=
MAKE_CFLAGS)" \
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -DCMAKE_CXX_FLAGS=3D"$(HOST=
_CMAKE_CXXFLAGS)" \
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -DCMAKE_EXE_LINKER_FLAGS=3D=
"$(HOST_LDFLAGS)" \
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -DCMAKE_USE_OPENSSL:BOOL=3DOF=
F \
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -DCMAKE_USE_OPENSSL:BOOL=3D$(=
HOST_CMAKE_USE_OPENSSL) \
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -DBUILD_CursesDialog=3DOFF \
=A0 =A0 =A0 =A0 )
=A0endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
