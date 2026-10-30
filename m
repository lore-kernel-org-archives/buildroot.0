Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62057606A320
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 12:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GBMONoWD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=QDCzeHW6
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E69C60633;
	Fri, 30 Oct 2026 12:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDOoIiObWAXH; Fri, 30 Oct 2026 12:06:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 336486079D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793361963;
	b=r6djLpQuDhFEKmze7S6yXi9g3fuaPJQX9pxWATuhlNTb/QJUTe95GeJ9Cq7L51nUjdtd
	 u7cuHgGvBFUvCTyTc8r/7dHq1EuqIHvW2Hrx/bg+eXgWzSHK5Ou+18DAMfmgFOYX4clWr
	 OqnGK3ap8UJO8fgaGnHtHkyHq6t3jLFjCPndbcR/U0Mv0m4lFoEfT+hRiYqBebgiBtZRM
	 gWbSucuLz1zemjuVxQcNsZIY7ju1MntatR3sFyndLirj/jlrrQKMBirjT96PBONJcnxcR
	 B/qb3+orAm9tyyPOrYGyUBMzaWIHqP+WJsy9LxUj2IdTOo2ZJ3CJ+OBc2P+0wMWkwVQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793361963;
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
	bh=Xr0pB1NEVyszY0Zmzjt4op32f0G5+0fuL5M34hcCs6M=;
	b=NMUjpLJqVt9FI0dQYKv4O21LEsoPCYCprX6HHneG5R5/f8WTNEMAXhd9Nzx6UapdFCJD
	 DmaaqX5qeclJhxHf9/sG4xw3nSDtB8PfLBN+ska4TAAnrNDCa1brhgK4y8RCDL2S8fT1W
	 bn/qTwIH/HHt0lAZ5drrccjoBO589Kzw3Wm0WRvZGZWBLroUEoeWqbB2AYUxJl3ysDVEl
	 Z+QJ7SF8HHiqxncWTzJnyZVbYuBsw6J6QGTbsTAmGaK/aGr5VifInGtoSnkxvT6VAJiRE
	 5QpMsRmQg3KFakeSutU546yKsXEDAQQxr9OUXF3XbOabbBuv7QXD3xZWQY9nz3yyyqQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793361963;
	bh=Xr0pB1NEVyszY0Zmzjt4op32f0G5+0fuL5M34hcCs6M=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GBMONoWDd5B6I2B6nmijiagb5ra0JWlQCvDL4+ruE9wJHqpw5+bsn5wnS1gog7oro
	 Ga3HtpU2376YBjG+lyJyCwAdtvo3Q2jMixfq+FnQl2X2izOWyeRynLlelmIH5HDU7l
	 +G1eercL5q8fgPXB7nxvwCxTnrKJ4xJWD7Hl3zmEru1OAlOvuUpY8Hg4eSZuRo7I+G
	 JXmA5rkuynAr1Y8+Xo0MYJb2/79lfqljd7JkhkCBy7UYUNNhhgPavAP58WTbXxxAmK
	 ZeGMQVWXkCb8IoewJm8WLjH+QNFlmwdWbHsZN/TGkVwFUHdK8FWq0jy2L9VXsN6UcQ
	 Scu35YouzNZbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 336486079D;
	Fri, 30 Oct 2026 12:06:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CD8D4BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12D9740243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1yODWERMnli for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 12:06:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 64A86401EF
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:c::621"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793361961;
 b=hKtkqcvMQN0mVXQU4wJrn/dnLFfUYLj1tcNZe0M423LkRBHwDV2XFqePhaJc9ek754Bh
 qKhwDWa89dryOqankBDONKdD1iNThhaPmlizA/lu9tYwOrdjZ3YpwJcPNi2khdk83MhH1
 OVs+M4JtxIfoxabLIUXULVJLYe4TLxa2jF2xi9t21oHr+kU6rc5H2FJSRAt1c+QauSNyy
 hHXFfh+xa8HxdpmiyZVHgKz/NyaBhrUZULb5btnDXwwsSfHpXlVYwhT6qCBJiz305J4MS
 DyOYGKpQityFISa9poGc8A9G7t9F7h66QMdmGMj2X8xM6yggU470L8Fgw4SH5iMULGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793361961;
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
 bh=zOwcWhNXrcYvSEMIKaY8olA8lXvTLbdaHZixnzcg3io=;
 b=AZR5D3Imi8Oqb0DcXzvYRCuub/7eB01mQl8QgL464t0LOr5h7BFVVFyFLw3PTx+4ofDY
 6QcCt+ajt+4uj/y3x8hlpru9s55UzMhpArutt4b8nfZMMHizoi6ih6emU93SSe0tBzoqy
 MeClgmxuexH6dhoCqDhsniteuRQOaoLou2ntMU8rheQY1FQ5Aag0VZHlSAN7b0/lhq+Gv
 pNWAZD6VfxXVOBxWmpMSmubOIKbARIu1nr+I+d0LgIy0qWLLMBU5/D+DRB1NW4yfLra9I
 ECqTf0vXdATaecJ39Ip49dMy8m8TbLPDVd2Es3T99L/eHVyg6/S9ZTgNwUxownQUCpg==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=QDCzeHW6; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:c::621"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::621;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=QDCzeHW6
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0621.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::621])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64A86401EF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:05:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=cMRiWw538SOloinDBn6000L5QmvK/3I2PMjJZksJbJXZ++Edj3wzebNX8jH+9hNCsTNEIWEnMLsYHCM0CfrDHTJavZkE/molu/IyhQw8Ig1apPLeEMN+5ilFYVlv32aOoI5cIuMGZ2vnmKra9l1Tg9mml0G+cQcnJFWLzqr7w9a6gYXLM/rylkRFYZ0CEUZwXwqOrv/4VyUdc3GqLdw3DPC/720x3lUWjcYlB9ADIBfhi21LCnSPNkOpnWaUA1hTn+/PClshLCfmU20XgWujMFqtQrFeD5dHvxUUrcJwXpQL2o2lyRhvA7I1KU46t00j8USs6e0Te+9SiL7nDEF+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOwcWhNXrcYvSEMIKaY8olA8lXvTLbdaHZixnzcg3io=;
 b=Z22KWsPbzx/yO2TkD07PKe0AeiEOIieJ1KRYQ/ZAwmaDcziCR2B1mEr302Lr7EOOASoPBPL4ypzuGJMeUbMBw607sEjfw/d/hbIsPz2lCiudyzYaiE+l1fePm6E7lbaTU4Xdih2guwHiXqKbQv65iVRBZQWucpcCxloQ4F8U1qWbMcDewidHv4kfT39eUP7Kc638PCFbl0o9m1hBa0a1zSEoVaWKNdR8GBOv/92zR4YGjV6/DEq/Rqr67R1TsybVI33tnBu9OWxwbPqMXn+ngX+twVZopNHKlv6XOGPg3h/f9DbFoBhKipncnEI4ErP48yCYeIp8qMT60VNE/ExvZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOwcWhNXrcYvSEMIKaY8olA8lXvTLbdaHZixnzcg3io=;
 b=QDCzeHW6z7kmWRULA4we0Tnh0xFTgF1Ddwlnf52M0jhVuH9vMKXPC/GLvhy3sCriWdPv77vVX4FPPjoTB7OPLvE4+H3UxgxqEXWAdkmzg22h6I1fFc9tXAL6T10rw5IVzrMD+FVu+sHBDyG8pOB67VV9anZIjBXweUVOx27yT7S6hcap1qtxhRtzNvZV+t0nES8g6ObQxwbbvCOfYyPFUxpX23+heHf4peaa5sIxneaS0iyFl4sMxvEEwr8pTpRfksyXxZXU7N9RC3fkx2U8OHGQBy8f8vsoCR3wKIpdG24yjD1CtC8DA9mcl9ypOToMXUSf03eCcIowfv4C0TbsVw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN8P110MB2483.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:4c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.23; Fri, 30 Oct
 2026 12:05:53 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%4]) with mapi id 15.21.0546.024; Fri, 30 Oct 2026
 12:05:53 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v3 2/2] package/mupdf,python-pymupdf: bump to versions
 1.28.5 and 2.0
Thread-Index: AQHdaGcCtkQhJpyyCEi6QMqhlNihcg==
Date: Fri, 30 Oct 2026 12:05:52 +0000
Message-ID: <PH1P110MB16032EC48D5C75F68C53FAB49F6DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20261005154047.413898-2-raphael.melotte@mind.be>
 <20261028161447.330533-1-raphael.melotte@mind.be>
 <20261028161447.330533-2-raphael.melotte@mind.be>
 <PH1P110MB16036C47623A4C8AC89FA00E9F6EA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <9e53839e-1ff9-42ca-9fba-87484e8f4186@mind.be>
In-Reply-To: <9e53839e-1ff9-42ca-9fba-87484e8f4186@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN8P110MB2483:EE_
x-ms-office365-filtering-correlation-id: 7dd00c10-bcf4-499f-0320-08df367e2556
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|1800799024|366016|23010399003|38070700021|4143699003|56012099006|10067099003|261009223027099003|261021121427099003|261026121527099003|22082099003|55112099003|18002099003|3023799007;
x-microsoft-antispam-message-info: lEKY5PIrcPUS8ov+Sqwp45s9ZHhwgz2z4fbbHGZ12fkpwuKorkztMTItJMKkQG20bOyVofXjodBbfBHmbtZML5J3XkQAVDzOSFPWVY6tGD5T7jAKVVKkO1281peFcQ0UEJ28P+x+w6bSwAOswcjrAubGIxT5r+MKtcbCpN+FmYN1SwcxlFIaFUkNwm0aoT43jI6IRO8GUz+CVf1l87LvabLZUv0Q0fBPY7jACTEU3DsJXyJoD54fgXXBbWvo3jJryikj1w5PuRtXKhMGgN53KvW49Fnh+a95fY675kJnJmK6tDx8ogb+nwVNRMT9e0renKyzPoXi0KzBZCaYKH7UlPWau4+315hUDFk70zm2CnHppjKSjvra/CnOnfdUOz3oSHhVpiGzYKVT+qcaWCzyVowe9mFwvdP6Kv7hUe9Y+66CrtA1VPVkvAO0DpE48o3D/kHpvVp9I7ne0tmovq+ZnRdLNQ+pkUP5YDrHCvJzHhn69sem4KcOmOIYMssXoitxdOM/9Ubd6MnTPGuJqmZHYqCmwbU5Uq2cZmHBZT6Xy7WGMnCuSYHRrV8hpTmu4ANITPpX3dOsdTVCziBrnzFfQv2e7bGj9GZwHuvO/4PtHjs/h7xo+jIay/p52ekYl6LOQAHbA15e5AMqeSC4+UXBhVzGLqrtMDx+HfyNsjtLhJw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(1800799024)(366016)(23010399003)(38070700021)(4143699003)(56012099006)(10067099003)(261009223027099003)(261021121427099003)(261026121527099003)(22082099003)(55112099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWthMnk0bXlJdE5yYzd2a2pXL0hHUmlheGxTelFKaTY4cm93dGgzMjcyTGxl?=
 =?utf-8?B?eUF0S2FlT3U2aE1KaFcrZVQyYlpMSmxFN1ZUTjVxblJPVzFiQURYZ0hRSWZK?=
 =?utf-8?B?akdYSzMrN2FFZnk2ZGhGZ1NXK25HNkw2aUVUL2hrYXlyNndFeE51VDY0SVdm?=
 =?utf-8?B?d1hZbmxNZklQb3phQXczZ2tiekNLTkFtbGVVYms1N2VBZ0p0REdkTGVKNFlM?=
 =?utf-8?B?aS9wMHQ5dkN5b0pVek5zclNEMWxCUnFkSmQ4Y1ErTUR2RlhlYWpGMHlpclpq?=
 =?utf-8?B?VWVrbHdreDhYVTJGNG9BdHRqZGgzcXIrdlBnRitTb2JveTBITkprVTdtZUJQ?=
 =?utf-8?B?RHlPV2pKMHFqL3JFQ1BOVkFWVi9SbDZCRVZtTVA5aVZocGJTRVo4dUVwL2tS?=
 =?utf-8?B?dVNMbHZXRVRKR0dFY0VQTGpIY1k5a1ZDaCtqYmlzQlJ0Rm93bml4WGFEdDMr?=
 =?utf-8?B?cFY1ckhJcmRjSnJZODdWWlFSUkEybi9EWmxXQk1nMmxMUzViVW1XOXk5a1pZ?=
 =?utf-8?B?TVdjK2dGSENPcDVyNXY0aFh0dCtJWlFPTm9NT2xyL0N1NW9tei83NTFVQisx?=
 =?utf-8?B?c1d2VU1lY2w4OXgyS3NseHlPa1JaNjk4SnRlbUg3aWJ6YkYyd3lTVzdQV09I?=
 =?utf-8?B?ci9Kb2srK1VyNG0wQVl6bndIcEExNXNmRU5iaG1nMThUY2ZUQm1MT29WUGRM?=
 =?utf-8?B?L2NCMkR4eUE3dnRNTWdteXkyaDZVbGM1QnZmZ1hZVHlhS2dBUjlkNzh2Rzl2?=
 =?utf-8?B?ckN1eVFWNldWL2FPNnYzR01HeElFaEJSdmJaWWZaVVpvejdNYUpZcHhhS3lm?=
 =?utf-8?B?dEEyOFR5NThxK1YxS2I2cGl4d3hQdFFjZHg2OU1TTlFsNmEwVC9aZkRCMHlR?=
 =?utf-8?B?OSs5YUdFZ2R0ZkFoZndNWnVLcmdvUWpRTU9ZR0pETkI5WGlJUmRpMTd1RFRH?=
 =?utf-8?B?MVBnbkR3VXJmcHJJWnhQcXhoVTFqT3FzQ0pSWHVZdXpyMnUxNmZvUGFkQkwz?=
 =?utf-8?B?T2JZOUNJZGJkY045cVpLcGdkR01ma09aZTBhQkJGOHlyanB3ZVA1cmc5MXcr?=
 =?utf-8?B?UWYvVGNJUnJEZnBORFl4ck1ZT3NWc2krRDFQWGM5aVYwSFdUWkorYmdXTzcx?=
 =?utf-8?B?TktuZG9JbGs2a1NiL1B2a3ZWNU1reDVQRXpPMFFoSDJXMGd6a2tOME1nNHh0?=
 =?utf-8?B?dEMrczhRUEhKcXVYdE5wTktPbEFuNERIM1NFOExtY0UvMkpOLy9kV0FtSVYz?=
 =?utf-8?B?ZUFxNmgrNERpSzh2dnF4dVhHRnRBSW1YNE9sWThTbGg4WDUrdGkyUzE2Yis2?=
 =?utf-8?B?bHA5Nld0YSt6OHhaWjhaWitqTDJya2c1ZUNmVVExQjVqeGlhbUpWWEc3U21G?=
 =?utf-8?B?MUkrTGxPc0I4SjZKN1JNY01ibEU2TUY3Y3M5RFdyZGV6VStFcmpKejU3Ujg1?=
 =?utf-8?B?MFh0ZnVYenpUTHdDVy94ZU9HajB2bjBkRmZTc1NOTEE3RnM5R1VNV1dwZU0y?=
 =?utf-8?B?QnJtaVN6cW1ibEtiKzFBUHFDNm9vT0lvaHhWU1FWSENpQlh3Uldhdy9hdDda?=
 =?utf-8?B?TW1IdzhDK1J5cTBjb3ZxMXNRVm5SRmV3SElMSWtUNFFiczhRMEF5aC9iVDY3?=
 =?utf-8?B?MUhjL3YxRXNhMFNWYlluUjcvdityWk1oRDlzbzRUeFYxVzlDMkM0SE1zS1p4?=
 =?utf-8?B?MGRqdzVZTkkzNXBjV2NxZzl1elNSMHVnQXNsdXgxN29FY3VXeHdOYTlSZTZ6?=
 =?utf-8?B?UWNyL0JtRU9qaldWaXM5UExHWjBDK3gyL21qYlNMcEp0U0xmaVVEZEVQYUFt?=
 =?utf-8?B?cjlTdXdxOWRMclhWWlBpVENIaUw3eitkeUpkaUErbEdIZ2RZUUR1RzY2N0VC?=
 =?utf-8?B?RzdUcU9aRkNGMXFzU2dwZlJoWW9TbHBpQ1NCZGNRNTVQM1hXRDNkOE92aS9j?=
 =?utf-8?B?NmVoRzhIZjlwSkJubGhHUDFoYnc2dERiL2NGeTQ2MmpJdjV0WE1qMFoyQXFB?=
 =?utf-8?B?VytVUHhSZ3NXWG1ReVl4ZEhNdjFSb1RHU2Z0RU9KNDhtai9UVCtvdmxvR1Q0?=
 =?utf-8?B?NDUxa2ZwUnJ3SUd0aURPYlZpc0RtdG9aR3FuZkF6Uy9yZkZ5T0F2NFJqS2NQ?=
 =?utf-8?B?aE9meHU4bVgyTHFSVVJvSHBCQXAwOGVia0NvUFUwWDMvZVkzcHdmMmZVV3Iy?=
 =?utf-8?Q?ArrfoSeM/DDwgtSHFY53aX1cPmMZC8QcOZoAk4p9f4j1?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd00c10-bcf4-499f-0320-08df367e2556
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 12:05:52.9718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8P110MB2483
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSYXBoYcOrbCBNw6ls
b3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVy
IDI5LCAyMDI2IDM6NTMgUE0NCj4gVG86IFZpbmNlbnQgRmF6aW8gPHZmYXppb0B4ZXMtaW5jLmNv
bT47IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnDQo+IENjOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT47IFllZ29yIFllZnJlbW92DQo+IDx5ZWdvcnNsaXN0c0Bnb29n
bGVtYWlsLmNvbT4NCj4gU3ViamVjdDogW0V4dGVybmFsXSAtIFJlOiBbUEFUQ0ggdjMgMi8yXSBw
YWNrYWdlL211cGRmLHB5dGhvbi1weW11cGRmOiBidW1wDQo+IHRvIHZlcnNpb25zIDEuMjguNSBh
bmQgMi4wDQo+IA0KPiBIaSBWaW5jZW50LA0KPiANCj4gT24gMTAvMjkvMjYgMTo0NSBQTSwgVmlu
Y2VudCBGYXppbyB3cm90ZToNCj4gPiBSYXBoYcOrbCwNCj4gPg0KPiA+DQo+ID4NCj4gPiBJJ20g
cHJvYmFibHkgbWlzc2luZyBzb21ldGhpbmcgb2J2aW91cywgYnV0IEkgZG8gbm90IHNlZSB0aGlz
IHBhY2thZ2UgaW4NCj4gbWFzdGVyIGFuZCBJIHJhbiBpbnRvOg0KPiA+DQo+ID4gbWFrZVsxXTog
KioqIE5vIHJ1bGUgdG8gbWFrZSB0YXJnZXQgJ2hvc3QtcHl0aG9uLXBpcGNsJywgbmVlZGVkIGJ5
DQo+ICcvaG9tZS92ZmF6aW8vZGV2ZWxvcG1lbnQvYnVpbGRyb290L291dHB1dC9UZXN0UHl0aG9u
UHkzUHlNdVBERi9idWlsZC9tdQ0KPiBwZGYtMS4yOC41Ly5zdGFtcF9jb25maWd1cmVkJy4gIFN0
b3AuDQo+ID4NCj4gPiBXaGlsZSB0cnlpbmcgdG8gcnVuIHRoZSBweW11cGRmIHVuaXQgdGVzdCB3
aGVuIHRlc3RpbmcgeW91ciBwYXRjaCBvbiB0b3Agb2YNCj4gbXkgMy4xNSBicmFuY2ggd2hpY2gg
aXMgYmFzZWQgb24gbWFzdGVyDQo+IGhvc3QtcHl0aG9uLXBpcGNsIGlzIG5vdCBwYXJ0IG9mIEJ1
aWxkcm9vdCBtYXN0ZXIgeWV0LCBpdCdzIHBhcnQgb2YgdGhlDQo+IHNhbWUgc2VyaWVzIHRoYXQg
dXBkYXRlcyBtdXBkZjoNCj4gaHR0cHM6Ly9wYXRjaHdvcmsuYnVpbGRyb290Lm9yZy9wcm9qZWN0
L2J1aWxkcm9vdC9wYXRjaC8yMDI2MTAyODE2MTQ0Ny4zMzA1DQo+IDMzLTEtcmFwaGFlbC5tZWxv
dHRlQG1pbmQuYmUvDQo+IA0KDQpJIGtuZXcgaXQgd2FzIHNvbWV0aGluZyBvYnZpb3VzLCB3aGVu
IEkgZG93bmxvYWRlZCB0aGUgbWJveCBJIGRpZG4ndCBncmFiIHRoZSBzZXJpZXMgc28gbWlzc2Vk
IHRoaXMgcGF0Y2guDQoNClNvcnJ5IGZvciB0aGUgbm9pc2UuDQoNCi1WaW5jZW50DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
