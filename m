Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BE2C433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 14:27:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C5D360EB6
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 14:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C5D360EB6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iml.fraunhofer.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37D076100B;
	Fri,  8 Oct 2021 14:27:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9u-P0YI9LQhr; Fri,  8 Oct 2021 14:27:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8769860AD3;
	Fri,  8 Oct 2021 14:27:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 793751BF57C
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 14:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75B5060AD3
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 14:27:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bEitK_p1jb06 for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 14:27:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx-relay89-hz1.antispameurope.com
 (mx-relay89-hz1.antispameurope.com [94.100.132.89])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01F6F608F7
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 14:27:45 +0000 (UTC)
Received: from mail-mtaka26.fraunhofer.de ([153.96.1.26]) by
 mx-relay89-hz1.antispameurope.com; Fri, 08 Oct 2021 16:27:42 +0200
IronPort-SDR: Og9vaMXlMnnfFeTUKChos9/0xZ2pDfnpqJvB/wfYlnFFNgjjjA7RxvmSsub1dqDt0zZvnkjaai
 YG0SlpjTI3tQX5d/AoKj5cnBe+XLZvhvY=
IronPort-PHdr: =?us-ascii?q?A9a23=3AVAWOXBCMMZ6n9zjVbfSGUyQVgBdPi9zP1kY94?=
 =?us-ascii?q?Icmj75UdaO/uZP4Mx+X6fZsiQrPWoPWo7JBhvHNuq/tEWoH/d6asX8EfZANM?=
 =?us-ascii?q?n1NicgfkwE6RsLQD0r9Ia3gci0+EN5FU0Mj+Gu0YgBZHc/kbAjUpXu/pTcZB?=
 =?us-ascii?q?hT4M19zIeL4f+yaj8m+2+2ovZPJZAAdhT+5J71oJQiwrQLfu9NQjYYxQps?=
 =?us-ascii?q?=3D?=
IronPort-Data: =?us-ascii?q?A9a23=3A6r1wP6qZiG3+zD1vc8ZaYb2UXiZeBmLiZBIvg?=
 =?us-ascii?q?KrLsJaIsI4StFCztgarIBmOPP2La2ujc48gPNzi9hgG7JbRyIRiGVZs/iA2F?=
 =?us-ascii?q?nlDouPIVI+TRqvS04x+DSFjoHqKZKzyU/GYRCztZnOD9BqrLJb7qnxwifOBS?=
 =?us-ascii?q?rbmUbGWOyV1AwF+QToniRVtlvR/joMx2Yq1BAaEuNXTpczDOQb5imAubT9Os?=
 =?us-ascii?q?/qO+EF1ofD/mDIEpVhiN/pFi1nTyisOB5UFKKDtcnb1HttUE+q9S7qRxb215?=
 =?us-ascii?q?DmErRIqANKhn/D2YkYKBLDINBWIin1YVrLkjhUb/n4+1aMyNfw9b0ZLimzVz?=
 =?us-ascii?q?o4rl4gX7cS9GVUzI6nBuOUBSB0EQStwCqtLpe3cKn+lvM3PkkDLLyn2z/N1A?=
 =?us-ascii?q?B1kNIEU4L0tUzgTrrlJd3VUMU7G2bjw3rf9Qa9inM0+KsnsMo4F/H1tlGmLA?=
 =?us-ascii?q?fEjSJHFYqPL+d4BgGZu3J8TR66GappLcydrYTTBfwZLZgUdBqU4kbr6nXL4a?=
 =?us-ascii?q?TBZ9A+YqKdfD7I/F+BK+OWrYIe9luCiH50Pxx/A/jKepgwVPzlDXDCh4Wrdm?=
 =?us-ascii?q?p6TrrKX9c/LcNp6+IyQrpaGsnXKroAgIEV+uW+AnBWMohXWt+Szi6Aj0nFGQ?=
 =?us-ascii?q?aAarCRHRzRmNvGyiCbsUhU0A7K8HwCmgTxhxJY44y7BboQFZjtGYt0iuYk7V?=
 =?us-ascii?q?TcqkFGTls7vBTthvafTRX/1GrW89G7pf3lKazZdO2laF2Pp4PG7yG03pgnTQ?=
 =?us-ascii?q?9hqFuiqh9npFCvYwjWO6iYkjqgVjckF2r/98V2vbzeE/8GYE1Flvm07WUr/t?=
 =?us-ascii?q?1ggP970D2Cy0nDR8PdEIJyeSUWptmUFn8SE6+cSS5aXm0SlWP5LBryx4OyZG?=
 =?us-ascii?q?DLZkRhpEoVJytgH0xZPZqgJvWo7dRgsa5laPGGzJlHW/wgX6oVaIX2qaqF6e?=
 =?us-ascii?q?cS9BqwXIWHbPYyNfpjpghBmOPCdrDO6wRw=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AaQKRP6E+P/zXCm1TpLqFRJHXdLJyesId70?=
 =?us-ascii?q?hD6qkvc3Nom52j+/xGws536fatskdtZJkh8erwXZVoMkmsiaKdhrNhc4tKPT?=
 =?us-ascii?q?OW91dASbsN0WKM+UyYJ8STzJ8/6U4kSdkFNDSSNyk6sS+Z2njBLz9I+rDum8?=
 =?us-ascii?q?rI5ds2jU0dNj2CA5sQtDuRYTzrdnGeMTM2Y6bRY6DsgfavyQDQG0g/X4CePD?=
 =?us-ascii?q?0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtUTVmQ3w4a?=
 =?us-ascii?q?uu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0i?=
 =?us-ascii?q?dsrDAKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7mvZKqm72GeNt9MbsauW?=
 =?us-ascii?q?sRSGqp12Mw+N57y65FxGSfqt5eCg7Bhj3045zSWwhtjVfcmwtorQc/tQ0XbW?=
 =?us-ascii?q?IlUs4YkWXfxjIhLL4QWCbhrIw3GuhnC8/RoP5QbFOBdnjc+m1i2salUHg/Fg?=
 =?us-ascii?q?qPBhFqgL3Z7xFG2HRii0cIzs0WmXkNsJo7Vplf/uzBdqBljqtHQMMaZb90QO?=
 =?us-ascii?q?0BXcy0AGrQRg+kChPZHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I/MVVtJ3F?=
 =?us-ascii?q?RCDX4Gyff+q6Gj1yq9DFlVcQ6duf221qIJzoEUHoCbQRFrYGpe4fednw=3D?=
 =?us-ascii?q?=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CECgC+VGBh/z6wYZlaHgEBCxIMQAm?=
 =?us-ascii?q?DIVEHTCtYASZDiA4DhTmFZYInOAGaM4JTA1QLAQMBAQEBAQgBBDMHAQIEAQG?=
 =?us-ascii?q?EfgKCRwImOBMBAgQBAQESAQEFAQEBAgEGBIERE4VoAQyGQwEBAQIBEigGAQE?=
 =?us-ascii?q?UIwEECwIBPhAyBx4BAQQOBQgaglCCVQMOIAIOoGABgToCixeBM4EBgggBAQY?=
 =?us-ascii?q?EBIUKGII1AwYJAYEwgwGHCYIcgWOCDUOBFUODJYEFgRxCBBiBSINNgi6MWDY?=
 =?us-ascii?q?ggSUIvQyCHgMEA4IEgSyKRpRBFJVmkTCWJYxNmHgCBAIEBQIOAQEGgXgkgVl?=
 =?us-ascii?q?xgzhRGQ+OIAwWg1CEWYEnhF5CATECCS0CBgsBAQMJhUcBAY8oAQE?=
X-IronPort-AV: E=Sophos;i="5.85,357,1624312800"; 
   d="scan'208";a="1195780"
Received: from 153-97-176-62.vm.c.fraunhofer.de (HELO
 mobile.exch.fraunhofer.de) ([153.97.176.62])
 by mail-mtaKA26.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 16:27:36 +0200
Received: from XCH-HYBRID-01.ads.fraunhofer.de (10.225.8.57) by
 XCH-HYBRID-01.ads.fraunhofer.de (10.225.8.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Fri, 8 Oct 2021 16:27:36 +0200
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (10.225.8.37) by
 XCH-HYBRID-01.ads.fraunhofer.de (10.225.8.57) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.15
 via Frontend Transport; Fri, 8 Oct 2021 16:27:36 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgkJXCZvqinJYuP4zvQPuXL6L4TqYNMpJs+bVIgFneFe6n3svGT+7KFr7OdagxjcQVHnj0QIzaY/WRXtZxkQ+FRa9SFMUlxMHKbhue9mxE0fEfgaHSe+YiWE3rETfjjTSEiBqjIxZTtffC0RyPZT5V7Wtwd6aJf4a4RDOAiqwfqUGdQ1U/PYbaT5x+oFhYckf5m1uYkvdI9N2IeVOiLwFT8A67cyo79xDWC74tSZPdSZDyCCLPyAVm7YZ6LQp2XnAllW7sqJg8Fks+OVIBQUBGMCb1qlEKYt2wlTyk3BV3NFYIzvy64IpiYQsB5HyEc5xKlJgH9dIxBchSXTAMQB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ag0jg/eoLW9OC4FIVm+cFQqGcnxgbCJhwY2vRfuQ2wE=;
 b=gLNOsV4msp0nzTE2SHPdh1Xy1euYnixF6Tf1c8haRbyEpjmfcWSB2b/b9Wda6sTyfNwy3ctZkQWa5dko0apnZQjTFZagO631oIirhHyxqA1uJqViCMyqWj+3k5cp9fDoRCV1VEaVbire4zD455JqhQLSk5aBH+PF7YKnuB3hrC+W+E06cBu0cctS0oyigKzSkdnkWnS4N7K8Si4LsF67w+jZ7bY7/9Igy+jfaWk6/gbtP+KE+kkZR3vUDCtcl8iGjOhkZlvkC9RNV49eryK6Hh4nd7s9XEnofNqnDV9i9qhpiVKuDPlGXmQPsqetwlVNAN7sdM1ifD7mBmrTgLGOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iml.fraunhofer.de; dmarc=pass action=none
 header.from=iml.fraunhofer.de; dkim=pass header.d=iml.fraunhofer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag0jg/eoLW9OC4FIVm+cFQqGcnxgbCJhwY2vRfuQ2wE=;
 b=kLCy9izbYPqQX46Jji6O/Q09emJTk/n1HKaJm0XRvCwoIFLpmVNtnAz4GTzjnGIJ9SzVPwy4qv1IYU6eZUjjKTJi6XBtaiYgMU2PwrhFSz7vsPL4v9HvcR+BQwf6BtUS8z93zD0b7ZnSxtD22GaowbRzJRDET+9oB1tjaA6tr9M=
Received: from DB6P194MB0022.EURP194.PROD.OUTLOOK.COM (2603:10a6:4:c5::16) by
 DB8P194MB0791.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:160::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.19; Fri, 8 Oct 2021 14:27:35 +0000
Received: from DB6P194MB0022.EURP194.PROD.OUTLOOK.COM
 ([fe80::45a:cb7c:a65c:838a]) by DB6P194MB0022.EURP194.PROD.OUTLOOK.COM
 ([fe80::45a:cb7c:a65c:838a%3]) with mapi id 15.20.4566.023; Fri, 8 Oct 2021
 14:27:35 +0000
From: "Walter, Stefan" <stefan.walter@iml.fraunhofer.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
Thread-Index: Ade7uZXHP7nGx63eQL+BAdw+WW1TNQAC7xCAACJQTnA=
Date: Fri, 8 Oct 2021 14:27:35 +0000
Message-ID: <DB6P194MB0022286BBE77E2174FE40B87B7B29@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
References: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211007235019.51751a53@gmx.net>
In-Reply-To: <20211007235019.51751a53@gmx.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none
 header.from=iml.fraunhofer.de;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81dc79f8-6cad-4063-db18-08d98a67c5a1
x-ms-traffictypediagnostic: DB8P194MB0791:
x-microsoft-antispam-prvs: <DB8P194MB07915C99A659B84044035240B7B29@DB8P194MB0791.EURP194.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 07o8+SNsasyFy6OSMBUu+tPgWfeURTmoVF67jIlyKerRE/AMW/hf3Rf3a2VTxjhiytpR5B3tD9peTp4OnYrtGtt97gH2pP43rBLSg0RnyfUfyz294RxZjtkocZmfydnqHa6Wf5MIlKeW5kpi99/i8b+zZFr0e+ju8AU0zF+P9bXO7hfUh2OrLdRWdZINc7iUVYEWEv/4t/jLG65dtTFEhxNs7BvtBaiKbCoJMRIcp3J7dVwlCLeAl4eVUL8TfMpunPIoq47B2f+428bBh7pBPLPfiLzczO2RYAF1bZ2Krxd0H8yebtw1LwnBxTDBNVdQGnh0pKpyonXgYgIDfjypOl3NNhYgVq2qHR1yQuFYtwWRoDjSBr9vwAhca0txcCrWgxYKvXkvs50UwQWlPXR+PZXb4w36D7Ckwik9XhMXRHHl0L4V2si/GCgyYekMJI1xez/rJqTO3030rz/4IUCTBJnfbQ4UYJ4ALZRkFru8cjdpH4E4s7YRkUXnExSiK7PPRZWjBvqqohWZV7n0t2FF5vJpjzGGb1fbysVzyWn5OT8GurlaJhU7ZeKZ/u9x9hJ96SS7aYxTJu/lEYo/tKtbg7KjeD3FsIqp/98yuDdwMkHlqs7G7zo8dUjNrORdPokqMLCEv6S/EJdomUw+J7I2ZhzCLEysr1hSHwCZ7w97rpDosCTJ9e0QWJn1x5f3VeN7wNL1Vog/1TuN+Hme+1rqjKOgBC/wXF7Z6fwad2o/ctzoubxgOOxzs+cfBjBgIZHXY6gSM4/zDFi4HtXCRR8zu9AdIL4MV3pSLM5M8lim5jY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P194MB0022.EURP194.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(186003)(8676002)(6506007)(9686003)(55016002)(26005)(8936002)(83380400001)(38070700005)(316002)(7696005)(38100700002)(2906002)(966005)(508600001)(4326008)(66446008)(66556008)(66476007)(5660300002)(76116006)(64756008)(66946007)(6916009)(122000001)(4744005)(86362001)(71200400001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7A8VYPFeM49LwjwKUM0aG9MxLEEh3gfUtF8FrVSuTNOijlOsNYC5vtesGPyJ?=
 =?us-ascii?Q?0W40aNCO+WAquOZf0flWk10Lsk4HMqDUeAbkvyFEHCTgYwlhhLNrhYBuUjPr?=
 =?us-ascii?Q?5Dmt1JcimRk/gLghBVMrdh6xbxYNw8P92J0WcPTT6c9h+uMGsgW5y6XRZC8m?=
 =?us-ascii?Q?X7gCoDk5xQJ6mxZbG8qZFIw6vM7VzQfQC63OhW9RtSwt5mCKJ9TkQMSMwm5E?=
 =?us-ascii?Q?EIb31xJ49h+P/I9SW3l7ww73SY8tDXBNltuPoDBpnvSUuQ9Ywx6S5OpUz68m?=
 =?us-ascii?Q?jRpv/rHXNmO2jtVQlXJ0iotxZkwiTPPZh18mNm3+7fPDyk4WFIODj2Sb5KiS?=
 =?us-ascii?Q?MXSbn41mgDhWooBlLU/gaDqaKPOJUKSpijZyoZJhQqFFlJqLMakTNRZF+oHn?=
 =?us-ascii?Q?uwjkSg/3Z0g4Vz7j0T6xN1xliGYaio31VI4KbtOMdIm7qyh5EjpkiWdM6MQh?=
 =?us-ascii?Q?hsDzIlcrvaOgHR3H4iX28yynjDE6o05eFQic0nh2pwzwD8sgcgu2FbIYS6d1?=
 =?us-ascii?Q?t8qeiWNw1It4ogxVQ0hP+qotjCjP8UbxwFcerMXOQpGdiQV4N6bkjzpyPK8d?=
 =?us-ascii?Q?/95fZoQ7eCcFy3vcqpXXfsGC2MzOSq9NJZAndgS1So3hMQT15YBLhtZNVmoX?=
 =?us-ascii?Q?c5hxQ2OlPtiLYnPg9aogFtXH96TEPAkr8lFq+eFwMe1sZ3lgPaxFtIRI6ZWG?=
 =?us-ascii?Q?YMkNE9ciKSnP0pbWw5vLEi7cvE/AkPwJz3r/juhB3Sv/ynwv+Ha0+L5q3roN?=
 =?us-ascii?Q?vl5v6FcoVhbpWayjsRT4lI9iRQQ8t30DJF7SCP3lWrORDkuqhinifaWeai16?=
 =?us-ascii?Q?aBnvxfvpkrp3OAAgvU64L3cyv6LwWqw4nYnz80t4RuSIXq96+jtI4ecGR3cr?=
 =?us-ascii?Q?p8vwPo0mI16PVRhNvLF2la2hjZeTssdXCbJdZNTISyIj+RbTZRPH8AeZf7uV?=
 =?us-ascii?Q?RXFb1m5SAuSBrOoZFth8Iy/J3XwmFaUpRbvB1GHkLQmmOF4JgGJPWu2A0se7?=
 =?us-ascii?Q?TK3ZlqDILdKOPGd7pvrWzbtie91tYfhFPt62hDfvXPH7JnMi8gLnDtRU4SeA?=
 =?us-ascii?Q?Z0jnQySzXF/1wVen1D5iiAAmsROPGKtChc4JieyrfYuieShxOlLAwvzcFRJX?=
 =?us-ascii?Q?5UwKaVNGDyXXRpvgV4IpTATzk8+em7FaCHxqvJdf/Y5cS4AU3u3mxcIJUbIJ?=
 =?us-ascii?Q?z3a7tXKUa30vKcXa5/F6mYv4/wTjbO/y4jWGcUnvctnHswlCdqhQazGINBhL?=
 =?us-ascii?Q?crDohDMxZ5fpmbc56Yd6SvcKgSDQ+sx7+s/kWKdX6mAouynQpLgA6mLquOHI?=
 =?us-ascii?Q?WP4=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P194MB0022.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 81dc79f8-6cad-4063-db18-08d98a67c5a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 14:27:35.0209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wttpu+z6HBufuTf3RgipNw4svaJ0j2k8s6xOYUN2yi85MRo/RUv3/+ty/aqQupdt6Sjg9CSisknqYDCpimmW8efcpnAJyOCm1gbMmopF32Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P194MB0791
X-OriginatorOrg: iml.fraunhofer.de
X-cloud-security-sender: stefan.walter@iml.fraunhofer.de
X-cloud-security-recipient: buildroot@buildroot.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay89-hz1.antispameurope.com with CD6C11241913
X-cloud-security-connect: mail-mtaka26.fraunhofer.de[153.96.1.26], TLS=1,
 IP=153.96.1.26
X-cloud-security-Digest: 85cd68064cc45c0b42d1766698da54ce
X-cloud-security: scantime:1.736
Subject: Re: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
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
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> Von: Peter Seiderer <ps.report@gmx.net>
> Betreff: Re: [Buildroot] Boot process stuck at "GRUB loading.." since 2021.02.1
> 
> > Does anyone have any idea what's going wrong here since 2021.02.1?
> 
> Only known issue was 'Bug 13586 - grub failure with BR2_OPTIMIZE_3' (see
> [1]), but should be fixed by commit 'boot/grub2: workaround breakage with -O2,
> -O3 build' (see [2])
> [1] https://bugs.busybox.net/show_bug.cgi?id=13586
> [2] https://git.buildroot.net/buildroot/commit/?id=7cb51d4843caaa9144270d92f86e60d8b5a2a1ec

I was aware of this issue, and I had hoped that it would fix the problem. Unfortunately, it did not. I even explicitly built all of Buildroot with "-Os" instead of "-O2" once, but that didn't help, either.

Is anyone able to boot (an i386 machine) with a setup like the one I have described?

Best regards,
Stefan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
