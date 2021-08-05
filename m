Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFA9C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:10:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0DCB60EE4
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0DCB60EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 881F2835B1;
	Thu,  5 Aug 2021 20:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGj3Y8LNU2F4; Thu,  5 Aug 2021 20:10:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C80558350A;
	Thu,  5 Aug 2021 20:10:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32DFD1BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2189C400CD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=calian.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIjXfN6IxLXz for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:09:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E52B0401CA
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:09:57 +0000 (UTC)
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 175AO6NB027530; 
 Thu, 5 Aug 2021 16:09:56 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2053.outbound.protection.outlook.com [104.47.60.53])
 by mx0c-0054df01.pphosted.com with ESMTP id 3a8a458aqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 16:09:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBvVjorTEQPFvdo6C7LBP7i6oJsaOcpE1zjwcuUFAn6/+Qr8MuOm+GdZXk1Xabi2iOVmdWVFABtnsJhibRd2qDDaU3p38rtvqSZf0R5M2ARUQSl7YKEzTe12dER1uWBmfOfsYxIuVEzcCCPgSJazKlJAofn68bCY6iKIGg6AJ5ghXJB5hqpB+cYOvVY6tHJAQscP56c1qYOWIY+X/JeIuYaI1rzPTCXLU5ISc6yXldvk7OgRdjbONCONRiR0SoKYr+SXe4ZX4ixGp4zqQRbqZ0LvThlxXSbqSYT6NhHIJeTTEJND5cXps+c6Se9U2fKQfzCFX3a4Leo9TbTKg1X5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Up85BcQGzSSF4QeV6aWgMSMeMbfN8wiIkbv6SPYPpag=;
 b=LFpeuQRxJbKziuW/a2JLC556IaWPGwp3GSIavhXGUpZ9MQPcCsCip/igM/8IhjWK78Xi0/twTxJuMVvWZ/PjSmbspL5qnlRpzA4j5QwAmfbq0OX6jZeVHhmbHBf+5utJP4GAtVxUMhlGP2QT+IUvXYlnNbVgzqQr4HwOF7Ttmd5BaZ3i5MsX+KIrxWk9RGDrbNlTMYUXVZseBBwwY9wa9DvvZsCHeVOMFqzQXS3YNefR3WF04poRbSBxRKFl+pF6Q2LJZ7jveV/udZ4PNttku4vD7Wt5ptKZuZ4qF1pOtxFp888/2ON9xoGNKBtcj56OmKErAu/GrnFKYpH+NnoZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Up85BcQGzSSF4QeV6aWgMSMeMbfN8wiIkbv6SPYPpag=;
 b=yceFCjRH6v3YWOeMJTIKU42UuIhjytcS20Wc0rzNBv3nF17PQUqFmC3pN3wZNxjFlnMUQiCGl+1GHYJa9pJ9YvfqQXRiR//4WauTiGOBy3FvWAoVOoNS9KhQLphYaN3lfn4A6C0L+E5NiUyp6PMP767cScC9RdoQ7H5nKpTep34=
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::23)
 by YQXPR01MB3717.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:49::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.22; Thu, 5 Aug
 2021 20:09:55 +0000
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007]) by YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007%7]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 20:09:55 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Serious time jump bug found in gpsd 3.20+
Thread-Index: AQHXijXbnj0pdbOw/UeRUouuTiGjlw==
Date: Thu, 5 Aug 2021 20:09:55 +0000
Message-ID: <4a27ed904dd80b00498185003c9a7bb26dc9a128.camel@calian.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
authentication-results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none header.from=calian.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 065bb03e-6554-4f9a-cb8f-08d9584cfe1d
x-ms-traffictypediagnostic: YQXPR01MB3717:
x-microsoft-antispam-prvs: <YQXPR01MB3717FDB4EBA521F346330BBBECF29@YQXPR01MB3717.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pwqHpMJDHpIEECnc24CNDDnL8GtNOSciRSZJ8/iawTWeP0wcRg/1UTtFUwRPbjja3/fwmfFD9gE/zzbsv9n8Ra2gqWeeH+r8aXQ1NglSOmR9XbyrJj08ocVIaJ5DoDUfKQUqVLKxtqoQBRT5tl5lm5toI5RWSaUKbz8u2N0MM3CeSY+aVvPIu5tHgg6yvWJwMqHc8UTXK7lhk729DH1/26C0q7IuzDVUXjh1GZ3K4rzbe7cOwyiJbZox/R7I/25uqkuc1KVtcPdk3qwP23D63QJQ7YTmhJ3C8Eb+E7qi63bGTKgym8OKVa3T085HKSd2J+QESbBJ8ptIXu3ZHYNl4UgtV0SXYODNr3ov574TONIJSuHJLtpDKAxfo6GJU7x+6C5z5b2pTWHNbe8l+JQF8CtJ83qTzGp3MPsXUkG1xSQ3iKgkBoApwqUiEhG70sh1xbVcORLkv/goCE98qVxdnIf+wKC5pjSQZsONBSFfcRoaA+Ooks0C4CyOPoU9o1EFsBoo6ckILgSLWjk2siW1UWWfj8ufv6PJC/Oxu6eB5z5mUK4meMgMFdiIzOmBQ/XoThU/HScosTG4zbs/B1eRvvzqDTNTNgzeCAn4shjmUCaNfYuwA3I0aIsVe84lPvkmFJU/raf2ubWFvO8JrnAGRUJDWvI2e9uW+aFPi+Zjo0SMmzRG+XIMXZdMDHwXHYUGig+Z8oPiW3Xpt38bnedapG3//NXDPdK69rpbN0BOYJdQl4UVaDVPyepQMeWfJLRu6OQt8KsNOGSaYN7I/cduvG3VTK43kBKe1CXpGOSpu2INT4CAPvmdaY7B2+8VmDQ8zpm9SUBS4NbUhn7CYsBPyxc+JFUr9VMKwiwyXsVrbB8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39850400004)(396003)(6506007)(6486002)(86362001)(6512007)(186003)(64756008)(66556008)(8936002)(66446008)(8676002)(66476007)(76116006)(26005)(91956017)(44832011)(66946007)(316002)(2616005)(4326008)(71200400001)(38100700002)(5660300002)(6916009)(966005)(15974865002)(2906002)(122000001)(38070700005)(36756003)(83380400001)(478600001)(99106002)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U09NQUd5cVZYSHFxNkg3ZGZCay9GSTNGakZpK1N2YmYzOGxRYjNqcTJyM2dG?=
 =?utf-8?B?QXUwT1VNOFVvUVg5UXhyVTBPR28zOS93U00xamRuaXJScVRzQWkwKzJVRWNV?=
 =?utf-8?B?UFdDMFpEVEM3R3gyVExLbVU0L0VwZEgxM2xhakNMbnhVVjdaaW5NZWhYc2FQ?=
 =?utf-8?B?Q1JDdmtPam1CU2hVRzZ5YnVaNngzSmt5UG0zTGxkV0FoZUNhSDJRWjE5cnZx?=
 =?utf-8?B?VG1LNWFJQWNjZzM0MXZmdlJkaFZzMlE5dHIwaGlhM3VxTGZoZFJOa0Nsb3hO?=
 =?utf-8?B?TkpMcG9xT2JEa2NZQlJjNFBCdHljSjhhcUJWSG03cjhiUEx1SWZnL3VZNjNa?=
 =?utf-8?B?OXRFTFdEL0JXOGp3L0RRWjBESU5NN3luU1pSd3V6R3lGSEhyVVNMRHNPd29T?=
 =?utf-8?B?aDZ4eEk0eWJZRTYxY0RqNVlOYThFVGpYMWIySitMUDl0U1BRMHN0T3BFbGJO?=
 =?utf-8?B?bUN0Vk5MenlVaGZEZ1hYU1g2WWdZcmhuR0VQSTdwd2p1TGlwdGpLWndiWFFy?=
 =?utf-8?B?RWVqbkRWN1BzeVg2bC9FdmtzT042SHlpdUgzNWszWE00WnI4NVl1MGZHa0Uv?=
 =?utf-8?B?WXVPYjEyWGpOaW9IbzBtbDAyVnp2L0JCTitJSkQ3bWgxdVdrMGF3TnVoK2dI?=
 =?utf-8?B?NlNyMlBuenU0enlKajU5a2pRMWw0aHNubndXRUp0cUF4ejV5SS8yaU1BOTBu?=
 =?utf-8?B?TjNDQTR3WGk3a2NYS1VKbTJ1T3RhdjQvZ3hObldnOXB6Y1VVdHdpMkhTaTVl?=
 =?utf-8?B?T1NwL2RTdkFvTUtTQTRva1lxM1JxOUZQdkxvQWIwQitvaUdHZElFQ3A4MnFZ?=
 =?utf-8?B?bVJtNXo2MkN0cFowbnhRTUQ2Wnp2RThWNWs0bDRTbmxmMEZYWVpEZDV1M3g0?=
 =?utf-8?B?SXpEMVJESlBDSzFSTWJycUFzQVJNMmE2Qldub2VkbnlZcStORjFlcjZpb1Bo?=
 =?utf-8?B?T0NnMEVsOFE0WkkzeklvQk5VNVcvd2xpR1Z4VUdYUWZDczdjQ1RTSWdPSGRh?=
 =?utf-8?B?TVp3U0ZQTGgva3dGS1hlZkdLaUpXNGc5VzgycEljVmtwZmJPNEFoSzJwL2k0?=
 =?utf-8?B?QVFtWVQ5R0dtL0J5WkxKQTR1UzlRWitOUUNsSDZzU1dyMUpma1NnN1NWcWRI?=
 =?utf-8?B?dmlrZ09GczZqNHM0NmRhRmdzdjR4NGdQQjNnNDhaSEE4cERQMjFWdHlaaDdO?=
 =?utf-8?B?ZFUySGUxODFSVlhhSjhOekNUUEx3Q1ZxQVRCMVQ2Z2ZwKzJyT2JaMEdtWEtu?=
 =?utf-8?B?K3AxTUlMZG9XeDM1ZEthVGl0MHpmSkp3K1kxckc3UjBKMUdlcHhJRmQ3aWlq?=
 =?utf-8?B?bVRjZTM3Y2NiN0pzcWZDUXdRVFo3NkZWdWVkTytnY2wwU1VwMzdzbm5Ucitn?=
 =?utf-8?B?aDJubTQwNGlWWUhzeExnaFJVU3lNbVlhaVpZaTBLKy9ETDBlY29ic3ZQM2xH?=
 =?utf-8?B?cTJYVVZNc0poUE5xcjRaV0tqZEJYaVY1Tnl0WnBJUFA1dkoxVnpQTytIUmh3?=
 =?utf-8?B?S3JvQmFTQWtzaG9wRkNNenhNWmFNRTViK09oNElHVmZEVU45L3djdXVHSTMy?=
 =?utf-8?B?WGtmNjVyd0JlS2pldHpCNmZLYUE1cENWdDV0TG5lYWRqZTU4aEdBcWdTelc4?=
 =?utf-8?B?MmxkdGU0YWE3NThpSWZKK1MyUGtGM1N1NEt4SGZJdWIxVUZuY3F6bjBOdVcx?=
 =?utf-8?B?a2VHMzVTTVJtcG53MHcwTG1TRndpMFl3QmNYeUVyc1BnQXJzc1J2OTBpTG04?=
 =?utf-8?Q?reKhs4Fn0K+hamoDbj4Jd+uCxj1iC/wVuR35Ywj?=
x-ms-exchange-transport-forked: True
Content-ID: <8C9ED4DAA84D4D4085AC99E1D432849D@CANPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 065bb03e-6554-4f9a-cb8f-08d9584cfe1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 20:09:55.2993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 30rP//3EUgCY+2EsQlU8Ur90QZ9bkFM19PId3NDN8Qzn1C32kofvM9/zE6JC2wGSrIdgwZnHXwNSeSchKnsqXyJFIa05M+H09MybmasJQ3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB3717
X-Proofpoint-GUID: VAe94pxUnGRwkC3U3b9It5qVLXtX4Wz6
X-Proofpoint-ORIG-GUID: VAe94pxUnGRwkC3U3b9It5qVLXtX4Wz6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-05_10,2021-08-05_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxlogscore=703 clxscore=1011 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050119
Subject: [Buildroot] Serious time jump bug found in gpsd 3.20+
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Robert Hancock via buildroot <buildroot@busybox.net>
Reply-To: Robert Hancock <robert.hancock@calian.com>
Cc: "bernd.kuhls@t-online.de" <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

A heads up to the Buildroot community about a significant bug that has been
found in versions 3.20 and newer of the gpsd package, and which is fixed in
version 3.23 (not yet released, supposed to be shortly):

https://gitlab.com/gpsd/gpsd/-/issues/144

This will cause the calculated GPS time (and NTP time, if synchronizing to it)
to jump from 2021 back to 2002 when GPS week 2180 arrives on October 24, 2021,
with potentially disastrous results for applications depending on accurate time
keeping.

A patch has now been added to the gpsd repository to fix it (note that the
commit message incorrectly refers to 2020 rather than 2021 as pointed out by a
commenter): 
https://gitlab.com/gpsd/gpsd/-/commit/7f30d88d04dc62b8bd6265ad1d09d72d220f97f6

I am not sure if the best solution for Buildroot is to just update the package
when released, or apply the specific patch to fix the issue? Currently
Buildroot master is on 3.21 and the 2021.02.x LTS branch is on 3.20, both of
which are affected.

-- 
Robert Hancock
Senior Hardware Designer, Calian Advanced Technologies
www.calian.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
