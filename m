Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D93E92FE9
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 06:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC17340377;
	Fri,  6 Oct 2023 06:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC17340377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJyojNB6qfer; Fri,  6 Oct 2023 06:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADAAF40471;
	Fri,  6 Oct 2023 06:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADAAF40471
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED5211BF3D4
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 06:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF0DB8350D
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 06:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF0DB8350D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzflIPiCA_I0 for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 06:26:39 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 06 Oct 2023 06:26:39 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BF73834F7
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BF73834F7
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 06:26:39 +0000 (UTC)
X-CSE-ConnectionGUID: wm7VeWc2QSmvXj1Jtv6YbQ==
X-CSE-MsgGUID: hFf+HrigR0uKeImlLTUCQw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="8369832"
X-Amp-Result: SKIPPED(no attachment in message)
X-URL-LookUp-ScanningError: 1
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2023 23:19:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 5 Oct 2023 23:19:06 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 5 Oct 2023 23:19:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBSv1t4OoqJu5G/Vt/Hgn0TEMU1WTRPRlKO6sRJmFPpZq6g9zUMTXa+JGNzk47Qk/clSlh1qFBbWDPJrj+Lubt2+0D4rtnmLr02d6/9D33t+BAlqFNP5kJ3ADqXmSyS/fJlHVhr3R2RD8sCg26tvrsyBlyGbQ6IjCAm3fqr1XpVkdLJtyWOXk4+86YDuoVS18jn0tAfDdIzNIFlt+RViAmwHEq/9L2vKiKqaBKVmwyP/HVq4EBiverIyghsce9+EtYcBFYitby1+hUFNIZ0+KIx/+omjf0ubwViTijKcfTFCGHftpAxUpvW9tZYdfY7tlsB7BTcH54o6NODuBKtMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBQHySFImaInIaseNyhtqG83mGMp/+b0k/1cPUu/yJA=;
 b=DQXBnHsBku/86Bzn+paxJmIsTHJ9TdON4xhCMHUq+ivkHOwTh+uScdxXcinKi12PYNHfAQhaIGBXjayS8zKDfSvmOmdfXpIur75QBMLbIjtboRPYPtNUl3A14oJBbEyzIhEhAMBZIxogGwAQxiWPeFM6XrDcRIilVMMoiT8qq4ghnMtF0l2NQQoxT1GSPYVrPN6nqzl6KPGBI3mz8lNvEiH1aRqa9RLkitQrjHS/QmNshSJczYyuhGO0YklKRRHbGbdzBrMtVxRCyfkgJOzNLXd3CfFgdawEZxbztOprRbbxewyZXM1Gtkv+AIKC5W9kQgAq2iu7npG4EOylOH3ABg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from BL0PR11MB3026.namprd11.prod.outlook.com (2603:10b6:208:75::15)
 by CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 06:18:56 +0000
Received: from BL0PR11MB3026.namprd11.prod.outlook.com
 ([fe80::3f0f:734e:ad5f:fb75]) by BL0PR11MB3026.namprd11.prod.outlook.com
 ([fe80::3f0f:734e:ad5f:fb75%6]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 06:18:56 +0000
To: <buildroot@buildroot.org>
Thread-Topic: buildroot Digest, Vol 207, Issue 55
Thread-Index: AQHZ8ML7whuUqgbytU+TwYzWab5ZsrA8WHiA
Date: Fri, 6 Oct 2023 06:18:56 +0000
Message-ID: <e9c5a11a-17c8-c9af-c921-f081346ee47d@microchip.com>
References: <mailman.15875.1695764740.218224.buildroot@buildroot.org>
In-Reply-To: <mailman.15875.1695764740.218224.buildroot@buildroot.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3026:EE_|CO1PR11MB4865:EE_
x-ms-office365-filtering-correlation-id: 384ab15d-2dff-4202-aa7e-08dbc6341ed8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R2vbdu3Koj/ybCEfEHM6ECJSVwtbLg/tf3BqivYdj79A89Y1qvP+wyA5Y5oxavpqgKEJHGxeGwyiGlUc4dW+F646HX+KjiKpb+xLEtJaX+ns8vmunoj9XIK7cTC+kuKf0JS5A1hD64DlcqaPnJepH5BLmt+Df0oruBlLkuTa022q8zHbEayAJaKbzD6ozZuI5MS6R74Uthzt/xZeco69m6i6/LuXCjdNRilzwizA6e+tVpq8yW24Xt4zylJfkabDL19c3UTxw4dEZNLe5uRi7JQvmopFd822XPjpcOsYecMPmcJN1jaYjsehQOBhpiUj6vaEyZ9JQC7C0GbdYB1pb/FZASw6J/zG1oJd8L2B6fcbrfA+8OM5GCZ7tQKDyO2Nugyet79B99I8kv7MF3tb9lMz1JG28mQq0dwHq65kbKqLYK2U+JXL2QMDAeQ4Gd/c4SqyBwIbhyifTrTF8H5mFVoklx/gzj92+6RqFGoWne1NBOw0YuY7ezbL5AUleDV6Azj3h+PPIBhjE3bSkzHqcbqh5p9xIqNF4mXmihYkDSFtjTIfi0GLdHDXzB/9wZP1vUVlLAkYLapT/AprVx2yx8K0VcDjm423Xm3NWpNybN3+6g2LxuolbJYo9Ipw+5xCb0qRwlI8u5j/TADHCwbBWRLZWugG0QXabEE+DXAmDMAMwtra+HqVmbpW5h9jIi5X1TF+LiekeKmfnEJtrVPuY+PRuGjGgFDk8xDNnrALn2JLz/2sXGmgU+s2QtW7Lmzs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3026.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(53546011)(6512007)(2616005)(6506007)(6486002)(478600001)(966005)(71200400001)(83380400001)(66574015)(2906002)(30864003)(66476007)(5660300002)(6916009)(64756008)(66946007)(66556008)(76116006)(26005)(66446008)(19627235002)(8936002)(8676002)(316002)(41300700001)(91956017)(36756003)(38070700005)(38100700002)(122000001)(31696002)(86362001)(84970400001)(31686004)(66899024)(11965001)(15866825006)(45980500001)(559001)(579004)(473944003)(357404004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akhxaVg4QUMrcWkyODhzeGQwSzRZdjh3NnNYcmc5bk0zSnJreVBhUlg2Tk5O?=
 =?utf-8?B?cm1zYmR5Rkxob0Q4K29qRkMyeGx4N2E0VERQdEs1V0xSYmlkU1hTV1JRbHFQ?=
 =?utf-8?B?VGJmWk9tdEQrWVRTVTBwMEkrYmRqcXNEMTF2ZlZSVDFzZXZnaHNpKzdwRnht?=
 =?utf-8?B?MGNoWDhJbVcrbzRRSEhpUDAxL0d1VWdNOC8xOE9td3hwQWpWQXpFSWdFUlZr?=
 =?utf-8?B?QlVzNHJKa2p2RFh6TlUvbnRDeFpBbGJLQkJ0SG83d3dWdy8rZjBTS3lqdHUx?=
 =?utf-8?B?bk5NQU8wRjg5L0RXaXFpWXRKemdTNU9pTEkxVVRMcWxFeEFESFJNaldtWnpm?=
 =?utf-8?B?YkN1aEFmOWUyVXpvTUcrcnVtS25uN2lUdkJjMGNwMG54SHZEaG12ZHVHN2Z3?=
 =?utf-8?B?dk9QOUhFRWZqWHpzOFluS2YwWkZKc29XQW5Db0lQRG9LMEp6dnUwdmZLZG9k?=
 =?utf-8?B?WktOQ0tBZ0NSb3U5aWZoMUZCeVdMZFU1MnVTNGFSQlF0ZHVTb25CekZPY0xU?=
 =?utf-8?B?Z2NPem5VV25RSDVkeHUydndFY3NXV3ZURmVyTTZ2Y0pHRnplcnJuM3dGY1FG?=
 =?utf-8?B?R3dsN3NqSGgzc0ZCdUxoaS9RTm1aaTF4a1NGZS81ZG1icEZmeWxDY2dONk96?=
 =?utf-8?B?OTN5aEhKSEZOanEvL251SmtCZER4T1kwUmlDSFFWWWJWVzZnc2dBMzBIMjFO?=
 =?utf-8?B?dk9Mek45bERXQy8zbVVRck9LclM3dExYM3drZUpkRG5uWGpXcnhNNTVvWEd0?=
 =?utf-8?B?RjhHVHhacy9kcVQ4MTBncXNGd1V5UCs2LzR0b25VWXdwZjRQdEh5dXVpWXhh?=
 =?utf-8?B?M2xkNWdaVElUUm0zWEZ1YlB4ZGVDemVOZHRhWHc0V2F1QURPZmdNeGY4anEx?=
 =?utf-8?B?eW5XTTY5VEZNQVUzTWNscVFzYzl3OG02eEJwQVJQbXRvQmxxWHhFYXpDaFh5?=
 =?utf-8?B?Wm00RkN5Z3ExNUJOZXFOaTZTVjh6SDMvd2tOcEhFSUVQQ0QvR2JONTNtcWxX?=
 =?utf-8?B?NGhHejgyS2t0Y21GYmZTcEphRTVvcFdrdUE3cHBzaTR6YjB4UTJYVElpa3F0?=
 =?utf-8?B?K1JEVnpOZ0pDbjA0cFNNSFhkU3hOTVNLeXBRcTU1OXROdUM1bEtUakh6b3Ew?=
 =?utf-8?B?aUx0NTVPRDJ5eG1JZXI3QUF1cHlNVks3MEdNRnBnMnVBZUh4Y3BabU10RjVE?=
 =?utf-8?B?eUtUSU5YTVhrUUNnVk5wU0tJcTduMUIrMXhoOG5YdzFhRkJxQ21IaE1vdXla?=
 =?utf-8?B?QWNMRHNEWWY5Nnpmd09ZMU55ZlhJL1hWUGpwMVladTdickZ5Z2ZQVy9ianpj?=
 =?utf-8?B?NnR1dEduamxKWGhaYkxGajdIMG9EdWlZRzEyRjV0ZGN4VWlMTVRjd2owK2pS?=
 =?utf-8?B?QTFBd0FVQkE0NXZzMGRobHFrWlNhcTRTbitoQ2JhejViYjZjQkRiRHJzK0t0?=
 =?utf-8?B?eXE1RElLWGN0aWpUdS9kdWY0L21JVjFQZTJJblI3WWtYcjF3OCt3K0xGQTZE?=
 =?utf-8?B?eE83R0JTbERJOVFEZno5QlN2U1YrNVREZ0M1OWlXUS9uOE5IUWViUXQ4b2pM?=
 =?utf-8?B?dUkzdXRtblViZ3dsTGx0K2hUSXZIcEhseEhSTUJuSUQxQnNZdU05WmxEWHRm?=
 =?utf-8?B?eG0xMkZZMnhGMEFWMmJjY29PQmRMQnYzMHd3SjROQnE4RHlMdmorcEVUWTBi?=
 =?utf-8?B?Z0hWUEVlK1I3SEhYSUhoVWJNakZiRFEvekJxWSs0Ym5kc1dub20xTXllTUJU?=
 =?utf-8?B?MkpiRXZwRnJPL09yYjB0K1FHcjEyVFpDTWJXaFJzSDM2Wmw1U3IxVU9oZ0Yy?=
 =?utf-8?B?RkxKbXoxUXM2TUJZcGxpaml3QjN6UkQ3YzJQTHpZUkdtYmJ5RGp0bmhpN2hT?=
 =?utf-8?B?R3kzNVFMem4rYjMxRzlpWWN2QjVkLytkVGhMZEJLeWVJZkZIV056cnk5N2ZR?=
 =?utf-8?B?N0tEWk5heEtoL0lLa25ETnNhNXpmckd3ZTBOZi9ZMEdzUHg3SUVMa0VQM1Vy?=
 =?utf-8?B?ZEx3aVdZN2JnUGQ2WEVLQlZacDdVYzRxMkZHMTE0ZU40QURDcmgrak9UQUdN?=
 =?utf-8?B?VnUycG0wWUorNVc5a1FpaDFYSTM0eEhYRWhZbVhNUWhaZ1d3NFpHNElhaEtR?=
 =?utf-8?B?c3VyWGpHYVlCa1NOWk1FU3YwbkpmaWVZVXdHSE9PZDlrODIwOTF2NXByNlE2?=
 =?utf-8?B?bnc9PQ==?=
Content-ID: <7D5790BB27DB4948BBB4BB310F655092@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3026.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384ab15d-2dff-4202-aa7e-08dbc6341ed8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 06:18:56.0966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5cDoyjtHViSB42Lg3ph7HvMph+gx08zqYp8Xc//oepq7FvQbi7HbZbOTwWso2r4AEsBkpwz3QtjwT0TBDywYjiJUYNaeWjyu44wpqpBKQjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4865
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1696573599; x=1728109599;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=pBQHySFImaInIaseNyhtqG83mGMp/+b0k/1cPUu/yJA=;
 b=vZPFYyw5MmFN01qp9uQ4Ybs9sin87n8zkEouwrSwKya8QrKfMvHWlQYt
 Hr4yMtwlzGxul9BxgKca/SKrjiorc7UEKjvCfp04+KRtYKOAvnJ56SZMY
 tZbzi5fsxy87EtBew3w6xmq4BAgvi3pXJwGzrY5JkRi70nQroOIErFse4
 zMxMGtB21Uv5+2tfZHtAypHnRfd3dqwqVoPN/wrdZMi8WTotLT8pE1ZNt
 shHTjMo6Qbi7ygA7io2ccK+agbchqz8Bzxt04vY7Lcdu2nx6bD9JT6sUj
 NhAXiJz+1frRrnnef2iiJrNrR71CqllJsQbaujiUqI8JVPyDEWavcVw8k
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBQHySFImaInIaseNyhtqG83mGMp/+b0k/1cPUu/yJA=;
 b=O3z98cgVImIdfUA7GVSL1oOSZPu7DhnsKQAtzbL+z0iEqymHBOmOl0vK06p3XykuY/jObEdhJjPWMnudydDI95QWNgZtNTr2tpbLwHx61LB+rJbnugqk6RmSwULUzcBuKDC2ecQe42sKiqAID6ESq+1pI1QBZ0LkYp/i3XkhKxA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=vZPFYyw5; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=O3z98cgV
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] buildroot Digest, Vol 207, Issue 55
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayabbasha.Sayed@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 27/09/23 03:15, buildroot-request@buildroot.org wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> Send buildroot mailing list submissions to
>          buildroot@buildroot.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>          https://lists.buildroot.org/mailman/listinfo/buildroot
> or, via email, send a message with subject or body 'help' to
>          buildroot-request@buildroot.org
>
> You can reach the person managing the list at
>          buildroot-owner@buildroot.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of buildroot digest..."
>
>
> Today's Topics:
>
>     1. [git commit branch/2023.08.x] package/libcoap: ignore
>        CVE-2023-35862 (Peter Korsgaard)
>     2. [git commit branch/2023.08.x] package/webkitgtk: security
>        bump to version 2.40.5 (Peter Korsgaard)
>     3. [git commit branch/2023.08.x] package/libssh: ignore
>        CVE-2023-3603 (Peter Korsgaard)
>     4. [git commit branch/2023.05.x] package/webkitgtk: security
>        bump to version 2.40.5 (Peter Korsgaard)
>     5. [autobuild.buildroot.net] Daily results for 2023-09-25
>        (Thomas Petazzoni)
>     6. [PATCH] package/mmc-utils: fix build failure due to potential
>        overflow (Giulio Benetti)
>     7. Re: [PATCH 1/1] docs/manual: add section to explain how to
>        give credits to a sponsor (Peter Korsgaard)
>     8. Re: [PATCH v2] package/nut: package/nut: specify
>        --with-user/group when building NUT (Peter Korsgaard)
>     9. Re: [PATCH] package/libpjsip: security bump to version 2.13.1
>        (Peter Korsgaard)
>    10. [git commit branch/2023.05.x] package/libpjsip: security bump
>        to version 2.13.1 (Peter Korsgaard)
>    11. [git commit branch/2023.05.x] package/nut: package/nut:
>        specify --with-user/group when building NUT (Peter Korsgaard)
>    12. [git commit branch/2023.05.x] docs/manual: add section to
>        explain how to give credits to a sponsor (Peter Korsgaard)
>    13. [git commit branch/2023.08.x] package/nut: package/nut:
>        specify --with-user/group when building NUT (Peter Korsgaard)
>    14. [git commit branch/2023.08.x] docs/manual: add section to
>        explain how to give credits to a sponsor (Peter Korsgaard)
>    15. [git commit branch/2023.08.x] package/libpjsip: security bump
>        to version 2.13.1 (Peter Korsgaard)
>    16. Re: [PATCH v2] package/nodejs: fix parallel build
>        (Peter Korsgaard)
>    17. [git commit branch/2023.05.x] package/nodejs: fix parallel
>        build (Peter Korsgaard)
>    18. [git commit branch/2023.08.x] package/nodejs: fix parallel
>        build (Peter Korsgaard)
>    19. [git commit branch/2023.02.x] package/nodejs: fix parallel
>        build (Peter Korsgaard)
>    20. [git commit branch/2023.02.x] package/nut: package/nut:
>        specify --with-user/group when building NUT (Peter Korsgaard)
>    21. [git commit branch/2023.02.x] package/libpjsip: security bump
>        to version 2.13.1 (Peter Korsgaard)
>    22. [git commit branch/2023.02.x] docs/manual: add section to
>        explain how to give credits to a sponsor (Peter Korsgaard)
>    23. [PATCH v2 3/4] package/linux-tools: add rtla (Giulio Benetti)
>    24. [PATCH v2 4/4] package/trace-cmd: bump to 3.1.7 (Giulio Benetti)
>    25. [PATCH v2 1/4] package/libtraceevent: new package (Giulio Benetti)
>    26. [PATCH v2 2/4] package/libtracefs: new package (Giulio Benetti)
>    27. [git commit branch/2023.08.x] package/libopenssl: bump to
>        version 3.0.11 (Peter Korsgaard)
>    28. [PATCH] support/runtime-test: fix weston test (Yann E. MORIN)
>    29. Re: [PATCH v2] board: add Orangepi Zero3 support (Sergey Kuzminov)
>    30. Re: [PATCH v9 7/7]
>        support/testing/tests/package/test_flutter.py: new runtime test
>        (Yann E. MORIN)
>    31. [git commit branch/2023.05.x] Update for 2023.05.3
>        (Peter Korsgaard)
>    32. [git commit branch/2023.05.x] Revert "package/docker-cli:
>        backport fix for host header check" (Peter Korsgaard)
>    33. [git commit branch/2023.05.x] Revert "package/docker-engine:
>        backport fix for host header check" (Peter Korsgaard)
>    34. [git commit branch/2023.02.x] Revert "package/docker-cli:
>        backport fix for host header check" (Peter Korsgaard)
>    35. [git commit branch/2023.02.x] Revert "package/docker-engine:
>        backport fix for host header check" (Peter Korsgaard)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue, 26 Sep 2023 08:09:22 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.08.x] package/libcoap:
>          ignore CVE-2023-35862
> Message-ID: <20230926061220.C1A7387816@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=335dbb595ab027b3a46a4fd764e93c1dc9d31e56
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x
>
> According to a collaborator [0] the affected code isn't in 4.3.1
>
> [0]: https://github.com/obgm/libcoap/issues/1117
>
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> (cherry picked from commit 20c023a3b1363f914a18652a79f83648af2cf1e6)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/libcoap/libcoap.mk | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
> index 3773ad293c..94bfc59702 100644
> --- a/package/libcoap/libcoap.mk
> +++ b/package/libcoap/libcoap.mk
> @@ -16,6 +16,8 @@ LIBCOAP_CONF_OPTS = \
>   LIBCOAP_AUTORECONF = YES
>   # 0001-Backport-fix-for-CVE-2023-30362.patch
>   LIBCOAP_IGNORE_CVES += CVE-2023-30362
> +# Doesn't affect 4.3.1, see https://github.com/obgm/libcoap/issues/1117
> +LIBCOAP_IGNORE_CVES += CVE-2023-35862
>
>   ifeq ($(BR2_PACKAGE_GNUTLS),y)
>   LIBCOAP_DEPENDENCIES += gnutls
>
>
> ------------------------------
>
> Message: 2
> Date: Tue, 26 Sep 2023 08:04:07 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.08.x] package/webkitgtk:
>          security bump to version 2.40.5
> Message-ID: <20230926061220.A3EBC87813@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=f35f7c3eabc4225fda225f1e27a6d84e7596fbcb
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x
>
> Bugfix release with many security fixes, including (but not limited to)
> patches for CVE-2023-37450, CVE-2023-38133, CVE-2023-38572, CVE-2023-38592,
> CVE-2023-38594, CVE-2023-38595, CVE-2023-38597, CVE-2023-38599,
> CVE-2023-38600, and CVE-2023-38611.
>
> Release notes:
>
>    https://webkitgtk.org/2023/07/21/webkitgtk2.40.4-released.html
>    https://webkitgtk.org/2023/08/01/webkitgtk2.40.5-released.html
>
> Accompanying security advisory:
>
>    https://webkitgtk.org/security/WSA-2023-0006.html
>    https://webkitgtk.org/security/WSA-2023-0007.html
>
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit 3ba27e682a861e304138fa2a460c10db2c83abe4)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   ...ailure-when-gstreamer-support-is-disabled.patch | 36 ++++++++++++++++++++++
>   package/webkitgtk/webkitgtk.hash                   |  6 ++--
>   package/webkitgtk/webkitgtk.mk                     |  2 +-
>   3 files changed, 40 insertions(+), 4 deletions(-)
>
> diff --git a/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch b/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
> new file mode 100644
> index 0000000000..3fa23b215b
> --- /dev/null
> +++ b/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
> @@ -0,0 +1,36 @@
> +From 9b31965cdf362768e86f7e592e59e68fb3351261 Mon Sep 17 00:00:00 2001
> +From: Matt Turner <mattst88@gmail.com>
> +Date: Tue, 8 Aug 2023 16:51:25 -0700
> +Subject: [PATCH] Fix build failure when gstreamer support is disabled
> + https://bugs.webkit.org/show_bug.cgi?id=259931 https://bugs.gentoo.org/911663
> +
> +Reviewed by Carlos Alberto Lopez Perez.
> +
> +* Source/WebCore/loader/MixedContentChecker.cpp:
> +
> +Canonical link: https://commits.webkit.org/260527.429@fix-build
> +
> +(cherry picked from commit f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732)
> +
> +Upstream: https://github.com/WebKit/WebKit/commit/f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732
> +Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> +---
> + Source/WebCore/loader/MixedContentChecker.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Source/WebCore/loader/MixedContentChecker.cpp b/Source/WebCore/loader/MixedContentChecker.cpp
> +index 9b4c7fe62020..ac4733bc08bc 100644
> +--- a/Source/WebCore/loader/MixedContentChecker.cpp
> ++++ b/Source/WebCore/loader/MixedContentChecker.cpp
> +@@ -33,6 +33,8 @@
> + #include "ContentSecurityPolicy.h"
> + #include "Document.h"
> + #include "Frame.h"
> ++#include "FrameLoader.h"
> ++#include "FrameLoaderClient.h"
> + #include "SecurityOrigin.h"
> +
> + namespace WebCore {
> +--
> +2.42.0
> +
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 756ac13ec2..7f50f1aa7b 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,6 +1,6 @@
> -# From https://www.webkitgtk.org/releases/webkitgtk-2.40.3.tar.xz.sums
> -sha1  74ee7241f2add46897019e22bd4f8e19e09027bb  webkitgtk-2.40.3.tar.xz
> -sha256  cc0aa83f40dbc64c1c6ae42ec6b85af4be2a9dbf524cfcb95f89a367fb5098dd  webkitgtk-2.40.3.tar.xz
> +# From https://www.webkitgtk.org/releases/webkitgtk-2.40.5.tar.xz.sums
> +sha1  2f4d06b021115eb4106177f7d5f534f45b5d3b2e  webkitgtk-2.40.5.tar.xz
> +sha256  7de051a263668621d91a61a5eb1c3771d1a7cec900043d4afef06c326c16037f  webkitgtk-2.40.5.tar.xz
>
>   # Hashes for license files:
>   sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 56277a0a0a..d5e983e403 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -WEBKITGTK_VERSION = 2.40.3
> +WEBKITGTK_VERSION = 2.40.5
>   WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>   WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>   WEBKITGTK_INSTALL_STAGING = YES
>
>
> ------------------------------
>
> Message: 3
> Date: Tue, 26 Sep 2023 08:07:52 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.08.x] package/libssh:
>          ignore CVE-2023-3603
> Message-ID: <20230926061220.AD43C87814@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=e69fb4864062f145366815a092779b857c244407
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x
>
> The affected code isn't present in any release, see [0].
>
> [0]: https://www.libssh.org/2023/07/14/cve-2023-3603-potential-null-dereference-in-libsshs-sftp-server/
>
> The CPE entry for this CVE is
>    cpe:2.3:a:libssh:libssh:-:*:*:*:*:*:*:*
> We interpret the "-" as matching any version. It actually means
> "unspecified version", which is the cop-out in case there is nothing
> useful to match. We can't really make our infrastructure ignore "-"
> entirely, because for all we know our version is an unreleased commit
> sha which _is_ vulnerable. Thus, the only way out is an exclusion which
> we'll never be able to remove.
>
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> (cherry picked from commit a34a370f4ea27981be43df817f49320a59088e68)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/libssh/libssh.mk | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
> index e770d2b924..ff4cddaf91 100644
> --- a/package/libssh/libssh.mk
> +++ b/package/libssh/libssh.mk
> @@ -17,6 +17,10 @@ LIBSSH_CONF_OPTS = \
>          -DWITH_STACK_PROTECTOR=OFF \
>          -DWITH_EXAMPLES=OFF
>
> +# Not part of any release
> +# https://www.libssh.org/2023/07/14/cve-2023-3603-potential-null-dereference-in-libsshs-sftp-server/
> +LIBSSH_IGNORE_CVES += CVE-2023-3603
> +
>   ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
>   LIBSSH_CONF_OPTS += -DWITH_STACK_CLASH_PROTECTION=OFF
>   endif
>
>
> ------------------------------
>
> Message: 4
> Date: Tue, 26 Sep 2023 08:04:50 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.05.x] package/webkitgtk:
>          security bump to version 2.40.5
> Message-ID: <20230926061219.E197B87813@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=bd5eaa7df8025a3d5afa94c495c1c4b34ad53bee
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x
>
> Bugfix release with many security fixes, including (but not limited to)
> patches for CVE-2023-37450, CVE-2023-38133, CVE-2023-38572, CVE-2023-38592,
> CVE-2023-38594, CVE-2023-38595, CVE-2023-38597, CVE-2023-38599,
> CVE-2023-38600, and CVE-2023-38611.
>
> Release notes:
>
>    https://webkitgtk.org/2023/07/21/webkitgtk2.40.4-released.html
>    https://webkitgtk.org/2023/08/01/webkitgtk2.40.5-released.html
>
> Accompanying security advisory:
>
>    https://webkitgtk.org/security/WSA-2023-0006.html
>    https://webkitgtk.org/security/WSA-2023-0007.html
>
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit 3ba27e682a861e304138fa2a460c10db2c83abe4)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   ...ailure-when-gstreamer-support-is-disabled.patch | 36 ++++++++++++++++++++++
>   package/webkitgtk/webkitgtk.hash                   |  6 ++--
>   package/webkitgtk/webkitgtk.mk                     |  2 +-
>   3 files changed, 40 insertions(+), 4 deletions(-)
>
> diff --git a/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch b/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
> new file mode 100644
> index 0000000000..3fa23b215b
> --- /dev/null
> +++ b/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
> @@ -0,0 +1,36 @@
> +From 9b31965cdf362768e86f7e592e59e68fb3351261 Mon Sep 17 00:00:00 2001
> +From: Matt Turner <mattst88@gmail.com>
> +Date: Tue, 8 Aug 2023 16:51:25 -0700
> +Subject: [PATCH] Fix build failure when gstreamer support is disabled
> + https://bugs.webkit.org/show_bug.cgi?id=259931 https://bugs.gentoo.org/911663
> +
> +Reviewed by Carlos Alberto Lopez Perez.
> +
> +* Source/WebCore/loader/MixedContentChecker.cpp:
> +
> +Canonical link: https://commits.webkit.org/260527.429@fix-build
> +
> +(cherry picked from commit f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732)
> +
> +Upstream: https://github.com/WebKit/WebKit/commit/f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732
> +Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> +---
> + Source/WebCore/loader/MixedContentChecker.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Source/WebCore/loader/MixedContentChecker.cpp b/Source/WebCore/loader/MixedContentChecker.cpp
> +index 9b4c7fe62020..ac4733bc08bc 100644
> +--- a/Source/WebCore/loader/MixedContentChecker.cpp
> ++++ b/Source/WebCore/loader/MixedContentChecker.cpp
> +@@ -33,6 +33,8 @@
> + #include "ContentSecurityPolicy.h"
> + #include "Document.h"
> + #include "Frame.h"
> ++#include "FrameLoader.h"
> ++#include "FrameLoaderClient.h"
> + #include "SecurityOrigin.h"
> +
> + namespace WebCore {
> +--
> +2.42.0
> +
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 756ac13ec2..7f50f1aa7b 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,6 +1,6 @@
> -# From https://www.webkitgtk.org/releases/webkitgtk-2.40.3.tar.xz.sums
> -sha1  74ee7241f2add46897019e22bd4f8e19e09027bb  webkitgtk-2.40.3.tar.xz
> -sha256  cc0aa83f40dbc64c1c6ae42ec6b85af4be2a9dbf524cfcb95f89a367fb5098dd  webkitgtk-2.40.3.tar.xz
> +# From https://www.webkitgtk.org/releases/webkitgtk-2.40.5.tar.xz.sums
> +sha1  2f4d06b021115eb4106177f7d5f534f45b5d3b2e  webkitgtk-2.40.5.tar.xz
> +sha256  7de051a263668621d91a61a5eb1c3771d1a7cec900043d4afef06c326c16037f  webkitgtk-2.40.5.tar.xz
>
>   # Hashes for license files:
>   sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 56277a0a0a..d5e983e403 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -WEBKITGTK_VERSION = 2.40.3
> +WEBKITGTK_VERSION = 2.40.5
>   WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>   WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>   WEBKITGTK_INSTALL_STAGING = YES
>
>
> ------------------------------
>
> Message: 5
> Date: Tue, 26 Sep 2023 06:50:40 -0000
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
>          2023-09-25
> Message-ID: <20230926065047.EA45941E61@smtp4.osuosl.org>
> Content-Type: text/plain; charset="us-ascii"
>
> Hello,
>
> Autobuild statistics for 2023-09-25
> ===================================
>
>        branch |  OK | NOK | TIM | TOT |
>    2023.02.x  |  6  | 10  |  0  | 16  |
>    2023.05.x  | 10  |  6  |  0  | 16  |
>    2023.08.x  | 11  |  7  |  0  | 18  |
>      master   | 78  | 76  |  0  | 154 |
>
> Classification of failures by reason for master
> -----------------------------------------------
>
>                 alsa-lib-1.2.10 | 10
>                         unknown | 6
>                  host-go-1.21.1 | 5
>               alsa-utils-1.2.10 | 4
>                     bird-2.0.12 | 4
> glibc-2.37-2-g9f8513dc64119... | 4
>               stress-ng-0.15.07 | 4
>                  elfutils-0.189 | 3
>                host-rust-1.71.1 | 3
>                libarchive-3.7.2 | 3
>                 mariadb-10.11.4 | 3
>                      proj-8.1.1 | 3
>                      brltty-6.5 | 2
>    gobject-introspection-1.76.1 | 2
>                    linux-6.4.14 | 2
>                  xenomai-3.0.10 | 2
> check-11970a7e112dfe243a2e6... | 1
>                    conmon-2.1.8 | 1
> fs/romfs/romfs.mk:32: /home... | 1
>              host-erlang-26.0.2 | 1
>           host-gcc-final-12.3.0 | 1
>                 lightning-2.2.2 | 1
>            lttng-modules-2.13.7 | 1
> mmc-utils-613495ecaca97a19f... | 1
>                      olsr-0.9.8 | 1
>                      php-8.2.10 | 1
>                      qemu-8.1.0 | 1
>                       squid-6.2 | 1
>                     systemd-254 | 1
>                 tcf-agent-1.7.0 | 1
>                 valgrind-3.21.0 | 1
>                   wolfssl-5.6.3 | 1
>
>
> Detail of failures for master
> -----------------------------
>
>      arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     armeb     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/3ceec32f42947ce6807c83abaea54dadc8679198 |
>    aarch64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/b148d1cd0bdb6cecff56d2f1407b53fde49e285e |
>     x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/6e3f23d6d774c332b7c797c046d1fd5480221ba1 |
>      or1k     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/640fef2accaf666b9ddf6acd7f64937f8d0961b4 |
> microblazeel |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/f94a864a05146f2c5cb4c04bb66460cde48f4309 |
>      m68k     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/d56e5afc96152ac9b3d08acaf85219637745f6f8 |
>      arm      |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/7359e18a3dd50b1e18cad260a50567018ec70f16 |
>      sh4a     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/bc09306a5f05b8939bad912fa02da0ed9a769aa6 |
>   microblaze  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/228d8be8b2437003df882eb672ef5bc73d8ff471 |
>   aarch64_be  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/b1d7a5d9fd8ed6bd8bbf707c98638153c7b8a7f8 |
>     s390x     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/09faa170c4ab44c39de3450985c88b049f492ed2 |
>     x86_64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/94f72c01f462273d69138d629479055f0ddb443f |
>      arc      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/f85e9c502de1647c19fb00502703e1aa55386c4e |
>     mipsel    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/42ab6e4003cce672c3ed88cd090301f44d0c2e85 |
>     s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/eea3097ed8652f6c6597fc4ef9d9536cbb4df23a |
>      sh4      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/db3a45acd435bee5c44109db66e87ebf930f5e2e |
>     mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b8edde854848bf5050733d591b5ac653d652b157 |
>      arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/54a984f41fd5c58fc14c5a722526ebf56c4fedd7 |
>   aarch64_be  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/964d3e46f79f7ae0d204dabed395b3759fab42ba |
>     mips64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/62383191117b33141cd516dce7b87bdb3517b40c |
>      arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/36de1229d6f2ad57fffcdc70e4c4883c10f28141 | ORPH
>     mips64    |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/2a4035bbf3139a3e50aeecb69a6068533cddfac2 |
>   microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0e5255437a9fe10ff42fdad7284ff8b923c7ed49 | ORPH
>   microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3f3c024c0e7a487d31792dcdb1dc5764a9a384c8 | ORPH
> microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3579a51bfc73fb12347112fd0d53a4cebdf7717f | ORPH
>    sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/9d328fa4ec604ce80cdb6a80c8a0609ae692f4a4 |
> powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/f9ad33c33a0d35f21dabe062792460b710b9ac5f |
>   powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/19207b530fd3106a07f6fb3d1964c07094c5918b |
> powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/681291969190a3cfc08d409d916bec78b1499ddb |
> powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/50fc667015f0a0c0f199cf9de92ac6bd2a8465fb |
>     nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7027ffb259239827592d1adbeb7e09fb0ddb2bd3 | ORPH
>    sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ae1bdde15333b5dbc59bd3564b836e4a96483ccb | ORPH
>      i686     |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/0e7ff49faf127491819d34a1c825b47d61794cd1 |
> microblazeel |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/99439a74049df0ca417b74a7ad9bc4b9df1cab2f |
> powerpc64le  |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/ec1a401349b1275657aadec3fd39fb62b33b5bfa |
>    mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/2162ce22c7f91b587bb04ae2d81f4331333a74da |
>     mips64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/69e40e223f5ae215da9bb73aa0e805c3aefe1833 |
>    sparc64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/212dcc59e2b91dbc286e551b63277bf2fa09cd97 |
>     mips64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/a931bc4814682b5bbcc9cc0c9998909f2e28dc5a |
> powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/2de8422fd79ccb3813c4df16cab183253bc3f335 |
>     x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/e9dbd56ad6a5aa6204219d8ccf897117bd2d7103 |
>     mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/ca5dbdeebdfd63844665b7d9d43b7e8debb2851f |
>      arm      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/167f1ac03cf48f008531e722ae008b10ce70399c |
>     mipsel    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/a2b3243c0328977140c300d4fd9aea6ac57e05a1 |
>      mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/1cc40c078b6667e9e19ac11bf57a1909338f5cb7 |
>    mips64el   |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/105f3900c5aafa255d47177e6cfcf7d2426e8d62 |
>      mips     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/33fe90580a8e5a36b6918075775d34cb15cebd0e | ORPH
>     arceb     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/d4ad93a6072bc719ebe9c963fdb75848d59e71bf | ORPH
>   powerpc64   |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/72f59d2ae40f8de8780b8e81ab45ecb1d314f4f4 |
> microblazeel |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/900bcae312f1df0059a94fefacca8904739fc9b2 | ORPH
>      or1k     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/c6573324d4fbbb8ac4f7f3d4e8c3cbb6a0e3e180 | ORPH
>      mips     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/349a18666b9366adeb8555918a64a70890c434aa | ORPH
>     mipsel    | mmc-utils-613495ecaca97a19f... | NOK | http://autobuild.buildroot.net/results/a53922c5db3e605a5e81e53c034f45017ebb7db7 |
>     mips64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d80264776d3aea1b01034447b5a1c124531f1f00 | ORPH
>      m68k     |           php-8.2.10           | NOK | http://autobuild.buildroot.net/results/ebe7fcc6e3962028d07d0b14e79d422ea847d6e2 |
>     s390x     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/06760e59b408645586664a1d11615818b1e20f41 |
>   microblaze  |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/e91f4bd62149b89ad3047320ea1d05efcc1c1d7d |
>      m68k     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/46b4651157762edd4615ef4508b85ca334bfc816 |
>      mips     |           qemu-8.1.0           | NOK | http://autobuild.buildroot.net/results/339ea98fe7ecbac8141649ae9736f0ae6c55ce49 |
>    aarch64    |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/efcd624169b07b9071ef3f696d2b44e87deea2a7 | ORPH
>     mipsel    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/50704286cb67b9819131b82bcebdfeb5cd86cf88 |
>   powerpc64   |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/8223b862f25a3d0259f6780d09deac8ccce34666 |
>    aarch64    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/248b83f2c584a6dc0218c1aefee85bb15b1fbed2 |
> microblazeel |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/69e9b186202dcc56262a71351df2660029019ebb |
>     mipsel    |          systemd-254           | NOK | http://autobuild.buildroot.net/results/6db08456e4769511b2482fae9abdf4d04109858f |
>   microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/b6878b92132113e27633f30ed687ac62fb9bde24 |
> powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/49d8e8aed43786a5814b2574574655ac6a255543 |
>      i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/d3b48062f88afc327e4d81244fc874406964b6a3 |
>     armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/04ecf6318e82517566272d89029711056b7aedfb |
>     x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7966430f401b6d40b87d3bb1d941fff3946d0420 |
> powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/d121267e4b375cbe4f461a6f8921deeb76c6bc12 |
>    powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a237709eff56a2137f0e8b170a7417c999dfdcc4 |
>     mips64    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/50b74189262cea892cc2ff055347b97442c80876 | ORPH
>    mips64el   |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/ff2941823edf72532ff87d6319fdcdf4d701e459 |
>      mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/cc42a69cf49fa53ef7af355d8acdd7664b4d043a |
>     x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/fbddd2377f909b1bf66bfa2ba5a03144b42f33fb |
>
>
> Classification of failures by reason for 2023.02.x
> --------------------------------------------------
>
>                     bird-2.0.12 | 3
>                erlang-22.3.4.22 | 1
>    gobject-introspection-1.72.0 | 1
>                host-rust-1.67.1 | 1
>       linux-5.10.162-cip24-rt10 | 1
>                      olsr-0.9.8 | 1
> ti-sgx-km-cf7f48cb30abfd5df... | 1
>                         unknown | 1
>
>
> Detail of failures for 2023.02.x
> --------------------------------
>
>      arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>    sparc64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/8ea3bb6e1f98d8896739223860b9f15277e5941f |
>      arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9ef04fa3709f234e59755ff4c8aff2f71218653f |
>      i686     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/052108fa2620b67d300938c1760f28111048e7e2 |
>    powerpc    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/145622f978f8719ec5c577495282920745edea81 |
> microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/273bca0f419fec75a0b91a038599bf28db9e01a6 | ORPH
>     mipsel    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/cfef05f7652dabddd355ec96557d7207981f9a29 |
>     mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/0cb4e9cd7cbe368ba19e0f761c769d65cb453ebd | ORPH
>     mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c98874e513891ec1f24121acf807e6ac1e492706 | ORPH
>      arm      | ti-sgx-km-cf7f48cb30abfd5df... | NOK | http://autobuild.buildroot.net/results/a5e4ff88303b3f7f03e5be89a667dec17b18458e |
>    aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/13bdb92814bdead58fe76c8828bc04e705707bc4 |
>
>
> Classification of failures by reason for 2023.05.x
> --------------------------------------------------
>
>                     bird-2.0.12 | 2
>    gobject-introspection-1.74.0 | 1
>              host-binutils-2.37 | 1
>                      ola-0.10.9 | 1
>               stress-ng-0.15.07 | 1
>
>
> Detail of failures for 2023.05.x
> --------------------------------
>
>      arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     sh4eb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/6a94ad7abd1040a189fd8dd1c71896006a83932a |
>     x86_64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/a723d543809207dadab172205e9513145c7bd91e |
>      or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/d9b197679085a2399508c0e5dce9d4d4dde20e36 | ORPH
>    riscv32    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/04eb1c37fe5f60d3cb70181fb2308948e9f599ee |
>     sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/97e2da4b6c89aaaef9dd2bc7152a8b48b3a9d1c2 |
>    aarch64    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/375f92dff8efb9cc6da60f39e517d75b114ad206 |
>
>
> Classification of failures by reason for 2023.08.x
> --------------------------------------------------
>
> glibc-2.37-2-g9f8513dc64119... | 1
>                    libsepol-3.5 | 1
>       linux-5.10.162-cip24-rt10 | 1
>                    linux-6.4.14 | 1
>          ltp-testsuite-20230127 | 1
> ulog-0389d243352255f6182326... | 1
>             xtables-addons-3.22 | 1
>
>
> Detail of failures for 2023.08.x
> --------------------------------
>
>      arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>   powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/add81369008b0a4192d9a3f097455cf72afe4027 |
>     armeb     |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/277202f78bc1a126f51997ac55aaa1e02bb0977f |
>    mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/5e5b0416a1dc288b7e49db417a09f2d83573167b | ORPH
>     armeb     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/e2110fe35b83fdd302b93ceea1c2f79d0968ff62 | ORPH
>     x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/57e919ed5e7d3df5cb6a7c2f6d7b0fd09aab6c1c |
>     x86_64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/78fed4877833c9ae083ee24ec9187cddf81e9b08 |
>     arceb     |      xtables-addons-3.22       | NOK | http://autobuild.buildroot.net/results/d6f605cbdf37c200a078d3bec19db3c2f9f2ffea | ORPH
>
>
> Gitlab CI results for 2023-09-25
> ================================
>
> Detail of runtime-test failures for master
> ------------------------------------------
>
>               runtime-test |                        link to the job                        | orph?
> --------------------------+---------------------------------------------------------------+------
>             TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841047  | ORPH
>            TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841246  | ORPH
>             TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841320  | ORPH
>         TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841253  | ORPH
>          TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841325  | ORPH
>                   TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841618  | ORPH
>            TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/5157777865  | ORPH
>           TestNodeJSModule | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841719  | ORPH
>                    TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5157777775  | ORPH
>                   TestPigz | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841963  | ORPH
>            TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841975  | ORPH
>          TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154841980  | ORPH
>         TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842410  | ORPH
>     TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842194  | ORPH
>    TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842234  | ORPH
>      TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842258  | ORPH
>          TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842316  | ORPH
>       TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842416  | ORPH
>        TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842456  | ORPH
>         TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842477  | ORPH
>        TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842497  | ORPH
>           TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842522  | ORPH
>        TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842575  | ORPH
>               TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842732  | ORPH
>                 TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842839  | ORPH
>               TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842957  | ORPH
>                TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842969  | ORPH
>              TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5154842979  | ORPH
>
>
>
> --
> http://autobuild.buildroot.net
>
>
> ------------------------------
>
> Message: 6
> Date: Tue, 26 Sep 2023 09:22:34 +0200
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> To: buildroot@buildroot.org
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, S?bastien
>          Szymanski <sebastien.szymanski@armadeus.com>
> Subject: [Buildroot] [PATCH] package/mmc-utils: fix build failure due
>          to potential overflow
> Message-ID:
>          <20230926072234.3639106-1-giulio.benetti@benettiengineering.com>
> Content-Type: text/plain; charset=UTF-8
>
> Add local patch pending upstream to fix potential overflow on read().
> This build failure is catched by fortify.
>
> Fixes:
> http://autobuild.buildroot.net/results/a53922c5db3e605a5e81e53c034f45017ebb7db7
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   ...001-mmc-utils-fix-potential-overflow.patch | 49 +++++++++++++++++++
>   1 file changed, 49 insertions(+)
>   create mode 100644 package/mmc-utils/0001-mmc-utils-fix-potential-overflow.patch
>
> diff --git a/package/mmc-utils/0001-mmc-utils-fix-potential-overflow.patch b/package/mmc-utils/0001-mmc-utils-fix-potential-overflow.patch
> new file mode 100644
> index 0000000000..d27df91fb0
> --- /dev/null
> +++ b/package/mmc-utils/0001-mmc-utils-fix-potential-overflow.patch
> @@ -0,0 +1,49 @@
> +From e8a84c704583083cc8487ba41d1488faf1210aec Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Tue, 26 Sep 2023 09:12:23 +0200
> +Subject: [PATCH] mmc-utils: fix potential overflow
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +With fortify enabled gcc throws following error:
> +                 from mmc_cmds.c:20:
> +In function ?read?,
> +    inlined from ?do_rpmb_write_key? at mmc_cmds.c:2233:8:
> +/home/giuliobenetti/br_reproduce/a53922c5db3e605a5e81e53c034f45017ebb7db7/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/bits/unistd.h:38:10: error: ?__read_alias? writing 228 or more bytes into a region of size 32 overflows the destination [-Werror=stringop-overflow=]
> +   38 |   return __glibc_fortify (read, __nbytes, sizeof (char),
> +      |          ^~~~~~~~~~~~~~~
> +mmc_cmds.c: In function ?do_rpmb_write_key?:
> +mmc_cmds.c:2087:19: note: destination object ?key_mac? of size 32
> + 2087 |         u_int8_t  key_mac[32];
> +      |                   ^~~~~~~
> +/home/giuliobenetti/br_reproduce/a53922c5db3e605a5e81e53c034f45017ebb7db7/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/bits/unistd.h:26:16: note: in a call to function ?__read_alias? declared with attribute ?access (write_only, 2, 3)?
> +   26 | extern ssize_t __REDIRECT (__read_alias, (int __fd, void *__buf,
> +      |                ^~~~~~~~~~
> +
> +read() could potentially return more than nbyte so let's check for
> +ret < nbyte.
> +
> +Upstream: https://patchwork.kernel.org/project/linux-mmc/patch/20230926071524.3638706-1-giulio.benetti@benettiengineering.com/
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + mmc_cmds.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mmc_cmds.c b/mmc_cmds.c
> +index 10d063d..ae7b876 100644
> +--- a/mmc_cmds.c
> ++++ b/mmc_cmds.c
> +@@ -2065,7 +2065,7 @@ int do_sanitize(int nargs, char **argv)
> +                       }                                                                               \
> +                       else if (r > 0)                                                 \
> +                               ret += r;                                                       \
> +-              } while (r != 0 && (size_t)ret != nbyte);       \
> ++              } while (r != 0 && (size_t)ret < nbyte);        \
> +                                                                                                       \
> +               ret;                                                                            \
> +       })
> +--
> +2.34.1
> +
> --
> 2.34.1
>
>
>
> ------------------------------
>
> Message: 7
> Date: Tue, 26 Sep 2023 10:00:03 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: buildroot@buildroot.org,  Thomas De Schampheleire
>          <thomas.de_schampheleire@nokia.com>
> Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: add section to
>          explain how to give credits to a sponsor
> Message-ID: <8734z1weik.fsf@48ers.dk>
> Content-Type: text/plain
>
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
>   > Sometimes it happens that a Company or a Physical Person sponsors the
>   > creation and/or the upstreaming process of a patch, but at the moment
>   > there is no way to give credits to it. In Linux they prepend '+sponsor'
>   > to the e-mail of the contributor in both authorship and commit log tag as
>   > discussed here[0]. So let's describe in the manual how to do that as a
>   > standard.
>
>   > [0]:
>   > https://lore.kernel.org/linux-doc/20230817220957.41582-1-giulio.benetti@benettiengineering.com/
>
>   > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 8
> Date: Tue, 26 Sep 2023 10:02:46 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Jens Maus via buildroot <buildroot@buildroot.org>
> Cc: Jens Maus <mail@jens-maus.de>,  Bernd Kuhls <bernd@kuhls.net>,
>          "Yann E . MORIN" <yann.morin.1998@free.fr>
> Subject: Re: [Buildroot] [PATCH v2] package/nut: package/nut: specify
>          --with-user/group when building NUT
> Message-ID: <87y1gtuztl.fsf@48ers.dk>
> Content-Type: text/plain
>
>>>>>> "Jens" == Jens Maus via buildroot <buildroot@buildroot.org> writes:
>   > This commit fixes a problem where the NUT package couldn't be
>   > used as a NUT server due to the fact that the default group for
>   > nobody is "nogroup" and not "nobody" like the internal default
>   > of NUT. Thus, when starting a NUT server daemon the daemon starts
>   > with incorrect group permissions. This commit fixes this
>   > shortcoming by introducing a dedicated 'nut' user and 'nut' group
>   > to drop priviledges to it.
>
>   > Signed-off-by: Jens Maus <mail@jens-maus.de>
>
>   > ---
>   > Changes v1 -> v2:
>   >   - added NUT_USERS with nut/nut user and group (Yann)
>
>   > Signed-off-by: Jens Maus <mail@jens-maus.de>
>
> Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 9
> Date: Tue, 26 Sep 2023 10:03:09 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
>          buildroot@buildroot.org
> Subject: Re: [Buildroot] [PATCH] package/libpjsip: security bump to
>          version 2.13.1
> Message-ID: <87r0mluzsy.fsf@48ers.dk>
> Content-Type: text/plain
>
>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>   >> Peter, All,
>   >> On 2023-09-23 11:24 +0200, Peter Korsgaard spake thusly:
>   >>> Fixes the following security vulnerability:
>   >>>
>   >>> - CVE-2023-27585: Heap buffer overflow when parsing DNS packet
>   >>> https://github.com/pjsip/pjproject/security/advisories/GHSA-q9cp-8wcq-7pfr
>   >>>
>   >>> Drop now upstreamed security fixes for CVE-2022-23537 and CVE-2022-23547.
>   >>>
>   >>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>   >>> ---
>   >>> ...ull-request-from-GHSA-9pfh-r8x4-w26w.patch | 99 -------------------
>   >>> ...ull-request-from-GHSA-cxwq-5g9x-x7fr.patch | 54 ----------
>
>   >> $ make check-package
>   >> .checkpackageignore:743: ignored file
>   >> package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
>   >> is missing
>   >> .checkpackageignore:744: ignored file
>   >> package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
>   >> is missing
>
>   >> Applied to master with the above fixed, thanks.
>
>   > Argh, thanks!
>
> Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 10
> Date: Tue, 26 Sep 2023 10:01:37 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.05.x] package/libpjsip:
>          security bump to version 2.13.1
> Message-ID: <20230926080416.D94E287824@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=33f7d66c90c9c80683804f3cba61f9d863d82868
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x
>
> Fixes the following security vulnerability:
>
> - CVE-2023-27585: Heap buffer overflow when parsing DNS packet
>    https://github.com/pjsip/pjproject/security/advisories/GHSA-q9cp-8wcq-7pfr
>
> Drop now upstreamed security fixes for CVE-2022-23537 and CVE-2022-23547.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit 7447700f057a4bf8b2ee84c22a2319ab05f9aeea)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   .checkpackageignore                                |  2 -
>   ...rge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch | 99 ----------------------
>   ...rge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch | 54 ------------
>   package/libpjsip/libpjsip.hash                     |  2 +-
>   package/libpjsip/libpjsip.mk                       |  8 +-
>   5 files changed, 2 insertions(+), 163 deletions(-)
>
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 6adc54891d..81fb9c2d8a 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -812,8 +812,6 @@ package/liboping/0004-Fix-compile-error-on-GCC-7.patch Upstream
>   package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch Upstream
>   package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch Upstream
>   package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch Upstream
> -package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch Upstream
> -package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch Upstream
>   package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch Upstream
>   package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch Upstream
>   package/libpthsem/0001-fix-build-on-linux-3.x-host.patch Upstream
> diff --git a/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch b/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
> deleted file mode 100644
> index 01e1878189..0000000000
> --- a/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -From d8440f4d711a654b511f50f79c0445b26f9dd1e1 Mon Sep 17 00:00:00 2001
> -From: Nanang Izzuddin <nanang@teluu.com>
> -Date: Tue, 20 Dec 2022 11:39:12 +0700
> -Subject: [PATCH] Merge pull request from GHSA-9pfh-r8x4-w26w
> -
> -* Fix buffer overread in STUN message decoder
> -
> -* Updates based on comments
> -
> -[Retrieved from:
> -https://github.com/pjsip/pjproject/commit/d8440f4d711a654b511f50f79c0445b26f9dd1e1]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - pjnath/include/pjnath/stun_msg.h |  4 ++++
> - pjnath/src/pjnath/stun_msg.c     | 14 +++++++++++---
> - 2 files changed, 15 insertions(+), 3 deletions(-)
> -
> -diff --git a/pjnath/include/pjnath/stun_msg.h b/pjnath/include/pjnath/stun_msg.h
> -index b52f95c586..e49f096f3a 100644
> ---- a/pjnath/include/pjnath/stun_msg.h
> -+++ b/pjnath/include/pjnath/stun_msg.h
> -@@ -442,6 +442,7 @@ typedef enum pj_stun_status
> -
> -    \endverbatim
> -  */
> -+#pragma pack(1)
> - typedef struct pj_stun_msg_hdr
> - {
> -     /**
> -@@ -473,6 +474,7 @@ typedef struct pj_stun_msg_hdr
> -     pj_uint8_t          tsx_id[12];
> -
> - } pj_stun_msg_hdr;
> -+#pragma pack()
> -
> -
> - /**
> -@@ -490,6 +492,7 @@ typedef struct pj_stun_msg_hdr
> -
> -    \endverbatim
> -  */
> -+#pragma pack(1)
> - typedef struct pj_stun_attr_hdr
> - {
> -     /**
> -@@ -506,6 +509,7 @@ typedef struct pj_stun_attr_hdr
> -     pj_uint16_t         length;
> -
> - } pj_stun_attr_hdr;
> -+#pragma pack()
> -
> -
> - /**
> -diff --git a/pjnath/src/pjnath/stun_msg.c b/pjnath/src/pjnath/stun_msg.c
> -index 3def6b3eac..e904a0ba47 100644
> ---- a/pjnath/src/pjnath/stun_msg.c
> -+++ b/pjnath/src/pjnath/stun_msg.c
> -@@ -746,7 +746,7 @@ PJ_DEF(int) pj_stun_set_padding_char(int chr)
> -
> - #define INIT_ATTR(a,t,l)    (a)->hdr.type=(pj_uint16_t)(t), \
> -                             (a)->hdr.length=(pj_uint16_t)(l)
> --#define ATTR_HDR_LEN        4
> -+#define ATTR_HDR_LEN        sizeof(pj_stun_attr_hdr)
> -
> - static pj_uint16_t GETVAL16H(const pj_uint8_t *buf, unsigned pos)
> - {
> -@@ -2327,6 +2327,14 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
> -         status = pj_stun_msg_check(pdu, pdu_len, options);
> -         if (status != PJ_SUCCESS)
> -             return status;
> -+    } else {
> -+        /* For safety, verify packet length at least */
> -+        pj_uint32_t msg_len = GETVAL16H(pdu, 2) + 20;
> -+        if (msg_len > pdu_len ||
> -+            ((options & PJ_STUN_IS_DATAGRAM) && msg_len != pdu_len))
> -+        {
> -+            return PJNATH_EINSTUNMSGLEN;
> -+        }
> -     }
> -
> -     /* Create the message, copy the header, and convert to host byte order */
> -@@ -2345,7 +2353,7 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
> -         p_response = NULL;
> -
> -     /* Parse attributes */
> --    while (pdu_len >= 4) {
> -+    while (pdu_len >= ATTR_HDR_LEN) {
> -         unsigned attr_type, attr_val_len;
> -         const struct attr_desc *adesc;
> -
> -@@ -2357,7 +2365,7 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
> -         attr_val_len = (attr_val_len + 3) & (~3);
> -
> -         /* Check length */
> --        if (pdu_len < attr_val_len) {
> -+        if (pdu_len < attr_val_len + ATTR_HDR_LEN) {
> -             pj_str_t err_msg;
> -             char err_msg_buf[80];
> -
> diff --git a/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch b/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
> deleted file mode 100644
> index 82249a2076..0000000000
> --- a/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From bc4812d31a67d5e2f973fbfaf950d6118226cf36 Mon Sep 17 00:00:00 2001
> -From: sauwming <ming@teluu.com>
> -Date: Fri, 23 Dec 2022 15:05:28 +0800
> -Subject: [PATCH] Merge pull request from GHSA-cxwq-5g9x-x7fr
> -
> -* Fixed heap buffer overflow when parsing STUN errcode attribute
> -
> -* Also fixed uint parsing
> -
> -[Retrieved from:
> -https://github.com/pjsip/pjproject/commit/bc4812d31a67d5e2f973fbfaf950d6118226cf36]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - pjnath/src/pjnath/stun_msg.c | 11 ++++++-----
> - 1 file changed, 6 insertions(+), 5 deletions(-)
> -
> -diff --git a/pjnath/src/pjnath/stun_msg.c b/pjnath/src/pjnath/stun_msg.c
> -index c6b0bdd284..b55d29849a 100644
> ---- a/pjnath/src/pjnath/stun_msg.c
> -+++ b/pjnath/src/pjnath/stun_msg.c
> -@@ -1438,12 +1438,12 @@ static pj_status_t decode_uint_attr(pj_pool_t *pool,
> -     attr = PJ_POOL_ZALLOC_T(pool, pj_stun_uint_attr);
> -     GETATTRHDR(buf, &attr->hdr);
> -
> --    attr->value = GETVAL32H(buf, 4);
> --
> -     /* Check that the attribute length is valid */
> -     if (attr->hdr.length != 4)
> -         return PJNATH_ESTUNINATTRLEN;
> -
> -+    attr->value = GETVAL32H(buf, 4);
> -+
> -     /* Done */
> -     *p_attr = attr;
> -
> -@@ -1757,14 +1757,15 @@ static pj_status_t decode_errcode_attr(pj_pool_t *pool,
> -     attr = PJ_POOL_ZALLOC_T(pool, pj_stun_errcode_attr);
> -     GETATTRHDR(buf, &attr->hdr);
> -
> -+    /* Check that the attribute length is valid */
> -+    if (attr->hdr.length < 4)
> -+        return PJNATH_ESTUNINATTRLEN;
> -+
> -     attr->err_code = buf[6] * 100 + buf[7];
> -
> -     /* Get pointer to the string in the message */
> -     value.ptr = ((char*)buf + ATTR_HDR_LEN + 4);
> -     value.slen = attr->hdr.length - 4;
> --    /* Make sure the length is never negative */
> --    if (value.slen < 0)
> --        value.slen = 0;
> -
> -     /* Copy the string to the attribute */
> -     pj_strdup(pool, &attr->reason, &value);
> diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
> index 9935575567..2edd97bed4 100644
> --- a/package/libpjsip/libpjsip.hash
> +++ b/package/libpjsip/libpjsip.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  4178bb9f586299111463fc16ea04e461adca4a73e646f8ddef61ea53dafa92d9  pjproject-2.13.tar.gz
> +sha256  32a5ab5bfbb9752cb6a46627e4c410e61939c8dbbd833ac858473cfbd9fb9d7d  pjproject-2.13.1.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 24db641446..f97d547fd7 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -LIBPJSIP_VERSION = 2.13
> +LIBPJSIP_VERSION = 2.13.1
>   LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
>   LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
>
> @@ -15,12 +15,6 @@ LIBPJSIP_CPE_ID_PRODUCT = pjsip
>   LIBPJSIP_INSTALL_STAGING = YES
>   LIBPJSIP_MAKE = $(MAKE1)
>
> -# 0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
> -LIBPJSIP_IGNORE_CVES += CVE-2022-23537
> -
> -# 0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
> -LIBPJSIP_IGNORE_CVES += CVE-2022-23547
> -
>   LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
>
>   # relocation truncated to fit: R_68K_GOT16O
>
>
> ------------------------------
>
> Message: 11
> Date: Tue, 26 Sep 2023 10:01:15 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.05.x] package/nut:
>          package/nut: specify --with-user/group when building NUT
> Message-ID: <20230926080416.CE0BA87822@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=c99a559d986a72891f3abe5fb5bba9899e12d0c4
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x
>
> This commit fixes a problem where the NUT package couldn't be
> used as a NUT server due to the fact that the default group for
> nobody is "nogroup" and not "nobody" like the internal default
> of NUT. Thus, when starting a NUT server daemon the daemon starts
> with incorrect group permissions. This commit fixes this
> shortcoming by introducing a dedicated 'nut' user and 'nut' group
> to drop priviledges to it.
>
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit cd46e1b1439e854dc9e4c016795d6e5276e4c573)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/nut/nut.mk | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/package/nut/nut.mk b/package/nut/nut.mk
> index fb98ba04f0..4c322aeb85 100644
> --- a/package/nut/nut.mk
> +++ b/package/nut/nut.mk
> @@ -24,7 +24,9 @@ NUT_POST_PATCH_HOOKS += NUT_FIX_CONFIGURE
>   NUT_CONF_OPTS = \
>          --with-altpidpath=/var/run/upsd \
>          --with-dev \
> -       --without-doc
> +       --without-doc \
> +       --with-user=nut \
> +       --with-group=nut
>
>   NUT_CONF_ENV = \
>          ax_cv_check_cflags__Werror__Wno_unknown_warning_option=no \
> @@ -34,6 +36,10 @@ NUT_CONF_ENV = \
>          ac_cv_func_strncasecmp=yes \
>          ax_cv__printf_string_null=yes
>
> +define NUT_USERS
> +       nut -1 nut -1 * - - - NUT user
> +endef
> +
>   ifeq ($(call qstrip,$(BR2_PACKAGE_NUT_DRIVERS)),)
>   NUT_CONF_OPTS += --with-drivers=auto
>   else
>
>
> ------------------------------
>
> Message: 12
> Date: Tue, 26 Sep 2023 09:55:25 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.05.x] docs/manual: add
>          section to explain how to give credits to a sponsor
> Message-ID: <20230926080416.C4BB487821@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=abedb15b530a188ae1f5f514dde7dc98ffd3e76c
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x
>
> Sometimes it happens that a Company or a Physical Person sponsors the
> creation and/or the upstreaming process of a patch, but at the moment
> there is no way to give credits to it. In Linux they prepend '+sponsor'
> to the e-mail of the contributor in both authorship and commit log tag as
> discussed here[0]. So let's describe in the manual how to do that as a
> standard.
>
> [0]: https://lore.kernel.org/linux-doc/20230817220957.41582-1-giulio.benetti@benettiengineering.com/
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [yann.morin.1998@free.fr:
>    - reword to reference sub-addressing and the RFC
>    - move to the "submitting patches" section, that already deals with
>      SoB tags
>    - differentiate between Your/Their names
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit de349df08c653a822166f94dbe01295a5a3cfa6e)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   docs/manual/contribute.txt | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 94f1c64496..15fe36aef0 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -247,6 +247,23 @@ which have the upstream license), and that you are allowed to do so.
>   See http://developercertificate.org/[the Developer Certificate of
>   Origin] for details.
>
> +To give credits to who sponsored the creation of a patch or the process of
> +upstreaming it, you may use
> +https://datatracker.ietf.org/doc/html/rfc5233[email subaddressing] for
> +your git identity (i.e. what is used as commit author and email +From:+
> +field, as well as your Signed-off-by tag); add suffix to the local part,
> +separated from it by a plus `+` sign. E.g.:
> +
> +* for a company which sponsored the submitted work, use the company name
> +  as the detail (suffix) part:
> ++
> +`Your-Name Your-Surname <your-name.your-surname+companyname@mail.com>`
> +
> +* for an individual who sponsored who sponsored the submitted work, use
> +  their name and surname:
> ++
> +`Your-Name Your-Surname <your-name.your-surname+their-name.their-surname@mail.com>`
> +
>   When adding new packages, you should submit every package in a
>   separate patch. This patch should have the update to
>   +package/Config.in+, the package +Config.in+ file, the +.mk+ file, the
>
>
> ------------------------------
>
> Message: 13
> Date: Tue, 26 Sep 2023 10:01:19 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.08.x] package/nut:
>          package/nut: specify --with-user/group when building NUT
> Message-ID: <20230926080604.4ECB187844@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=cb7613ffb7c1253ae05ef9b5cf6fb77bd421893f
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x
>
> This commit fixes a problem where the NUT package couldn't be
> used as a NUT server due to the fact that the default group for
> nobody is "nogroup" and not "nobody" like the internal default
> of NUT. Thus, when starting a NUT server daemon the daemon starts
> with incorrect group permissions. This commit fixes this
> shortcoming by introducing a dedicated 'nut' user and 'nut' group
> to drop priviledges to it.
>
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit cd46e1b1439e854dc9e4c016795d6e5276e4c573)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/nut/nut.mk | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/package/nut/nut.mk b/package/nut/nut.mk
> index fb98ba04f0..4c322aeb85 100644
> --- a/package/nut/nut.mk
> +++ b/package/nut/nut.mk
> @@ -24,7 +24,9 @@ NUT_POST_PATCH_HOOKS += NUT_FIX_CONFIGURE
>   NUT_CONF_OPTS = \
>          --with-altpidpath=/var/run/upsd \
>          --with-dev \
> -       --without-doc
> +       --without-doc \
> +       --with-user=nut \
> +       --with-group=nut
>
>   NUT_CONF_ENV = \
>          ax_cv_check_cflags__Werror__Wno_unknown_warning_option=no \
> @@ -34,6 +36,10 @@ NUT_CONF_ENV = \
>          ac_cv_func_strncasecmp=yes \
>          ax_cv__printf_string_null=yes
>
> +define NUT_USERS
> +       nut -1 nut -1 * - - - NUT user
> +endef
> +
>   ifeq ($(call qstrip,$(BR2_PACKAGE_NUT_DRIVERS)),)
>   NUT_CONF_OPTS += --with-drivers=auto
>   else
>
>
> ------------------------------
>
> Message: 14
> Date: Tue, 26 Sep 2023 09:55:16 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.08.x] docs/manual: add
>          section to explain how to give credits to a sponsor
> Message-ID: <20230926080604.42D8387842@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=175260e1e7ba60d4a427d3bf52a0fb342011d530
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x
>
> Sometimes it happens that a Company or a Physical Person sponsors the
> creation and/or the upstreaming process of a patch, but at the moment
> there is no way to give credits to it. In Linux they prepend '+sponsor'
> to the e-mail of the contributor in both authorship and commit log tag as
> discussed here[0]. So let's describe in the manual how to do that as a
> standard.
>
> [0]: https://lore.kernel.org/linux-doc/20230817220957.41582-1-giulio.benetti@benettiengineering.com/
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [yann.morin.1998@free.fr:
>    - reword to reference sub-addressing and the RFC
>    - move to the "submitting patches" section, that already deals with
>      SoB tags
>    - differentiate between Your/Their names
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit de349df08c653a822166f94dbe01295a5a3cfa6e)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   docs/manual/contribute.txt | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 94f1c64496..15fe36aef0 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -247,6 +247,23 @@ which have the upstream license), and that you are allowed to do so.
>   See http://developercertificate.org/[the Developer Certificate of
>   Origin] for details.
>
> +To give credits to who sponsored the creation of a patch or the process of
> +upstreaming it, you may use
> +https://datatracker.ietf.org/doc/html/rfc5233[email subaddressing] for
> +your git identity (i.e. what is used as commit author and email +From:+
> +field, as well as your Signed-off-by tag); add suffix to the local part,
> +separated from it by a plus `+` sign. E.g.:
> +
> +* for a company which sponsored the submitted work, use the company name
> +  as the detail (suffix) part:
> ++
> +`Your-Name Your-Surname <your-name.your-surname+companyname@mail.com>`
> +
> +* for an individual who sponsored who sponsored the submitted work, use
> +  their name and surname:
> ++
> +`Your-Name Your-Surname <your-name.your-surname+their-name.their-surname@mail.com>`
> +
>   When adding new packages, you should submit every package in a
>   separate patch. This patch should have the update to
>   +package/Config.in+, the package +Config.in+ file, the +.mk+ file, the
>
>
> ------------------------------
>
> Message: 15
> Date: Tue, 26 Sep 2023 10:01:28 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.08.x] package/libpjsip:
>          security bump to version 2.13.1
> Message-ID: <20230926080604.5C7CE87845@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=7efe2b30fe58b021dd09672ca4b7f1ea4e1666a9
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x
>
> Fixes the following security vulnerability:
>
> - CVE-2023-27585: Heap buffer overflow when parsing DNS packet
>    https://github.com/pjsip/pjproject/security/advisories/GHSA-q9cp-8wcq-7pfr
>
> Drop now upstreamed security fixes for CVE-2022-23537 and CVE-2022-23547.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit 7447700f057a4bf8b2ee84c22a2319ab05f9aeea)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   .checkpackageignore                                |  2 -
>   ...rge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch | 99 ----------------------
>   ...rge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch | 54 ------------
>   package/libpjsip/libpjsip.hash                     |  2 +-
>   package/libpjsip/libpjsip.mk                       |  8 +-
>   5 files changed, 2 insertions(+), 163 deletions(-)
>
> diff --git a/.checkpackageignore b/.checkpackageignore
> index b6b9ba8bf1..428ff03233 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -754,8 +754,6 @@ package/liboping/0004-Fix-compile-error-on-GCC-7.patch Upstream
>   package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch Upstream
>   package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch Upstream
>   package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch Upstream
> -package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch Upstream
> -package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch Upstream
>   package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch Upstream
>   package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch Upstream
>   package/libpthsem/0001-fix-build-on-linux-3.x-host.patch Upstream
> diff --git a/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch b/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
> deleted file mode 100644
> index 01e1878189..0000000000
> --- a/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -From d8440f4d711a654b511f50f79c0445b26f9dd1e1 Mon Sep 17 00:00:00 2001
> -From: Nanang Izzuddin <nanang@teluu.com>
> -Date: Tue, 20 Dec 2022 11:39:12 +0700
> -Subject: [PATCH] Merge pull request from GHSA-9pfh-r8x4-w26w
> -
> -* Fix buffer overread in STUN message decoder
> -
> -* Updates based on comments
> -
> -[Retrieved from:
> -https://github.com/pjsip/pjproject/commit/d8440f4d711a654b511f50f79c0445b26f9dd1e1]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - pjnath/include/pjnath/stun_msg.h |  4 ++++
> - pjnath/src/pjnath/stun_msg.c     | 14 +++++++++++---
> - 2 files changed, 15 insertions(+), 3 deletions(-)
> -
> -diff --git a/pjnath/include/pjnath/stun_msg.h b/pjnath/include/pjnath/stun_msg.h
> -index b52f95c586..e49f096f3a 100644
> ---- a/pjnath/include/pjnath/stun_msg.h
> -+++ b/pjnath/include/pjnath/stun_msg.h
> -@@ -442,6 +442,7 @@ typedef enum pj_stun_status
> -
> -    \endverbatim
> -  */
> -+#pragma pack(1)
> - typedef struct pj_stun_msg_hdr
> - {
> -     /**
> -@@ -473,6 +474,7 @@ typedef struct pj_stun_msg_hdr
> -     pj_uint8_t          tsx_id[12];
> -
> - } pj_stun_msg_hdr;
> -+#pragma pack()
> -
> -
> - /**
> -@@ -490,6 +492,7 @@ typedef struct pj_stun_msg_hdr
> -
> -    \endverbatim
> -  */
> -+#pragma pack(1)
> - typedef struct pj_stun_attr_hdr
> - {
> -     /**
> -@@ -506,6 +509,7 @@ typedef struct pj_stun_attr_hdr
> -     pj_uint16_t         length;
> -
> - } pj_stun_attr_hdr;
> -+#pragma pack()
> -
> -
> - /**
> -diff --git a/pjnath/src/pjnath/stun_msg.c b/pjnath/src/pjnath/stun_msg.c
> -index 3def6b3eac..e904a0ba47 100644
> ---- a/pjnath/src/pjnath/stun_msg.c
> -+++ b/pjnath/src/pjnath/stun_msg.c
> -@@ -746,7 +746,7 @@ PJ_DEF(int) pj_stun_set_padding_char(int chr)
> -
> - #define INIT_ATTR(a,t,l)    (a)->hdr.type=(pj_uint16_t)(t), \
> -                             (a)->hdr.length=(pj_uint16_t)(l)
> --#define ATTR_HDR_LEN        4
> -+#define ATTR_HDR_LEN        sizeof(pj_stun_attr_hdr)
> -
> - static pj_uint16_t GETVAL16H(const pj_uint8_t *buf, unsigned pos)
> - {
> -@@ -2327,6 +2327,14 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
> -         status = pj_stun_msg_check(pdu, pdu_len, options);
> -         if (status != PJ_SUCCESS)
> -             return status;
> -+    } else {
> -+        /* For safety, verify packet length at least */
> -+        pj_uint32_t msg_len = GETVAL16H(pdu, 2) + 20;
> -+        if (msg_len > pdu_len ||
> -+            ((options & PJ_STUN_IS_DATAGRAM) && msg_len != pdu_len))
> -+        {
> -+            return PJNATH_EINSTUNMSGLEN;
> -+        }
> -     }
> -
> -     /* Create the message, copy the header, and convert to host byte order */
> -@@ -2345,7 +2353,7 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
> -         p_response = NULL;
> -
> -     /* Parse attributes */
> --    while (pdu_len >= 4) {
> -+    while (pdu_len >= ATTR_HDR_LEN) {
> -         unsigned attr_type, attr_val_len;
> -         const struct attr_desc *adesc;
> -
> -@@ -2357,7 +2365,7 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
> -         attr_val_len = (attr_val_len + 3) & (~3);
> -
> -         /* Check length */
> --        if (pdu_len < attr_val_len) {
> -+        if (pdu_len < attr_val_len + ATTR_HDR_LEN) {
> -             pj_str_t err_msg;
> -             char err_msg_buf[80];
> -
> diff --git a/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch b/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
> deleted file mode 100644
> index 82249a2076..0000000000
> --- a/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From bc4812d31a67d5e2f973fbfaf950d6118226cf36 Mon Sep 17 00:00:00 2001
> -From: sauwming <ming@teluu.com>
> -Date: Fri, 23 Dec 2022 15:05:28 +0800
> -Subject: [PATCH] Merge pull request from GHSA-cxwq-5g9x-x7fr
> -
> -* Fixed heap buffer overflow when parsing STUN errcode attribute
> -
> -* Also fixed uint parsing
> -
> -[Retrieved from:
> -https://github.com/pjsip/pjproject/commit/bc4812d31a67d5e2f973fbfaf950d6118226cf36]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - pjnath/src/pjnath/stun_msg.c | 11 ++++++-----
> - 1 file changed, 6 insertions(+), 5 deletions(-)
> -
> -diff --git a/pjnath/src/pjnath/stun_msg.c b/pjnath/src/pjnath/stun_msg.c
> -index c6b0bdd284..b55d29849a 100644
> ---- a/pjnath/src/pjnath/stun_msg.c
> -+++ b/pjnath/src/pjnath/stun_msg.c
> -@@ -1438,12 +1438,12 @@ static pj_status_t decode_uint_attr(pj_pool_t *pool,
> -     attr = PJ_POOL_ZALLOC_T(pool, pj_stun_uint_attr);
> -     GETATTRHDR(buf, &attr->hdr);
> -
> --    attr->value = GETVAL32H(buf, 4);
> --
> -     /* Check that the attribute length is valid */
> -     if (attr->hdr.length != 4)
> -         return PJNATH_ESTUNINATTRLEN;
> -
> -+    attr->value = GETVAL32H(buf, 4);
> -+
> -     /* Done */
> -     *p_attr = attr;
> -
> -@@ -1757,14 +1757,15 @@ static pj_status_t decode_errcode_attr(pj_pool_t *pool,
> -     attr = PJ_POOL_ZALLOC_T(pool, pj_stun_errcode_attr);
> -     GETATTRHDR(buf, &attr->hdr);
> -
> -+    /* Check that the attribute length is valid */
> -+    if (attr->hdr.length < 4)
> -+        return PJNATH_ESTUNINATTRLEN;
> -+
> -     attr->err_code = buf[6] * 100 + buf[7];
> -
> -     /* Get pointer to the string in the message */
> -     value.ptr = ((char*)buf + ATTR_HDR_LEN + 4);
> -     value.slen = attr->hdr.length - 4;
> --    /* Make sure the length is never negative */
> --    if (value.slen < 0)
> --        value.slen = 0;
> -
> -     /* Copy the string to the attribute */
> -     pj_strdup(pool, &attr->reason, &value);
> diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
> index 9935575567..2edd97bed4 100644
> --- a/package/libpjsip/libpjsip.hash
> +++ b/package/libpjsip/libpjsip.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  4178bb9f586299111463fc16ea04e461adca4a73e646f8ddef61ea53dafa92d9  pjproject-2.13.tar.gz
> +sha256  32a5ab5bfbb9752cb6a46627e4c410e61939c8dbbd833ac858473cfbd9fb9d7d  pjproject-2.13.1.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 24db641446..f97d547fd7 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -LIBPJSIP_VERSION = 2.13
> +LIBPJSIP_VERSION = 2.13.1
>   LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
>   LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
>
> @@ -15,12 +15,6 @@ LIBPJSIP_CPE_ID_PRODUCT = pjsip
>   LIBPJSIP_INSTALL_STAGING = YES
>   LIBPJSIP_MAKE = $(MAKE1)
>
> -# 0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
> -LIBPJSIP_IGNORE_CVES += CVE-2022-23537
> -
> -# 0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
> -LIBPJSIP_IGNORE_CVES += CVE-2022-23547
> -
>   LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
>
>   # relocation truncated to fit: R_68K_GOT16O
>
>
> ------------------------------
>
> Message: 16
> Date: Tue, 26 Sep 2023 10:53:16 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Jens Maus <mail@jens-maus.de>,  Daniel Price
>          <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
>          buildroot@buildroot.org
> Subject: Re: [Buildroot] [PATCH v2] package/nodejs: fix parallel build
> Message-ID: <87msx9uxhf.fsf@48ers.dk>
> Content-Type: text/plain
>
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>   > Jens, All,
>   > On 2023-09-23 18:04 +0200, Jens Maus via buildroot spake thusly:
>   >> In ninja-based nodejs builds performing parallel builds using "make -jX"
>   >> is not working during buildroot initiated builds because the JOBS
>   >> variable is not set in the MAKE_OPTS variables in nodejs.mk. This commit
>   >> remedies the issue by setting JOBS to BR2_JLEVEL.
>
>   > I was very confused that nodejs would not build in parallel; that would
>   > have made for very, very,very long builds. And indeed, it does build in
>   > parallel, in fact.
>
>   > However, what it does, is use as many CPUs as are available, without
>   > accounting for the value set by the user in BR2_JLEVEL, thus
>   > overshooting the limits set by the user.

If the BR2_JLEVEL value is not explicitly mentioned, the JOBS value for 
nodejs will still remain at 0 even when using make -jN. Tested with the 
tag 2023.02.5 btw. Without the BR2_JLEVEL value, my system ran into 
memory issue while compiling nodejs with the following dmesg log

    |Out of memory: Kill process 23747 (cc1plus) score 15 or sacrifice
    child Killed process 23747, UID 2243, (cc1plus) total-vm:214456kB,
    anon-rss:178936kB, file-rss:5908kB|

>
>   > So, I reworded the whoe commit log to explain that.
>
>   > Applied to master, thanks.
>
> Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 17
> Date: Tue, 26 Sep 2023 10:51:09 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.05.x] package/nodejs: fix
>          parallel build
> Message-ID: <20230926090112.255BA806AE@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=bc6771657fcb8f7042450567360333f18d980b99
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x
>
> Unless told otherwise, ninja will spawn as many jobs as there are CPU
> (plus 2). Nodejs is built with ninja, but it is a generic package, so
> there is no variable (like with cmake-package) that passes the proper
> number of parallel jobs as configured by the user.
>
> As a consequence, the nodejs build will use as many CPU as are
> available, possibly overcommitting the rsources the user expected to be
> used.
>
> Set the JOBS variableto limit that number.
>
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> [yann.morin.1998@free.fr: reword commit log]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit 84c24ab1b5a7d38b481b37a759480ff2273b499d)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/nodejs/nodejs.mk | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index fe629ada21..4e70bd71a3 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -46,14 +46,16 @@ HOST_NODEJS_MAKE_OPTS = \
>          CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
>          LDFLAGS.host="$(HOST_LDFLAGS)" \
>          NO_LOAD=cctest.target.mk \
> -       PATH=$(@D)/bin:$(BR_PATH)
> +       PATH=$(@D)/bin:$(BR_PATH) \
> +       JOBS=$(BR2_JLEVEL)
>
>   NODEJS_MAKE_OPTS = \
>          $(TARGET_CONFIGURE_OPTS) \
>          NO_LOAD=cctest.target.mk \
>          PATH=$(@D)/bin:$(BR_PATH) \
>          LDFLAGS="$(NODEJS_LDFLAGS)" \
> -       LD="$(TARGET_CXX)"
> +       LD="$(TARGET_CXX)" \
> +       JOBS=$(BR2_JLEVEL)
>
>   # nodejs's build system uses python which can be a symlink to an unsupported
>   # python version (e.g. python 3.10 with nodejs 14.18.1). We work around this by
>
>
> ------------------------------
>
> Message: 18
> Date: Tue, 26 Sep 2023 10:50:22 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.08.x] package/nodejs: fix
>          parallel build
> Message-ID: <20230926090112.7CD23806AE@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=9c4ef96fe8f213e713afee84dc6e642b1987e9fe
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x
>
> Unless told otherwise, ninja will spawn as many jobs as there are CPU
> (plus 2). Nodejs is built with ninja, but it is a generic package, so
> there is no variable (like with cmake-package) that passes the proper
> number of parallel jobs as configured by the user.
>
> As a consequence, the nodejs build will use as many CPU as are
> available, possibly overcommitting the rsources the user expected to be
> used.
>
> Set the JOBS variableto limit that number.
>
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> [yann.morin.1998@free.fr: reword commit log]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit 84c24ab1b5a7d38b481b37a759480ff2273b499d)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/nodejs/nodejs.mk | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index fe629ada21..4e70bd71a3 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -46,14 +46,16 @@ HOST_NODEJS_MAKE_OPTS = \
>          CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
>          LDFLAGS.host="$(HOST_LDFLAGS)" \
>          NO_LOAD=cctest.target.mk \
> -       PATH=$(@D)/bin:$(BR_PATH)
> +       PATH=$(@D)/bin:$(BR_PATH) \
> +       JOBS=$(BR2_JLEVEL)
>
>   NODEJS_MAKE_OPTS = \
>          $(TARGET_CONFIGURE_OPTS) \
>          NO_LOAD=cctest.target.mk \
>          PATH=$(@D)/bin:$(BR_PATH) \
>          LDFLAGS="$(NODEJS_LDFLAGS)" \
> -       LD="$(TARGET_CXX)"
> +       LD="$(TARGET_CXX)" \
> +       JOBS=$(BR2_JLEVEL)
>
>   # nodejs's build system uses python which can be a symlink to an unsupported
>   # python version (e.g. python 3.10 with nodejs 14.18.1). We work around this by
>
>
> ------------------------------
>
> Message: 19
> Date: Tue, 26 Sep 2023 10:51:16 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.02.x] package/nodejs: fix
>          parallel build
> Message-ID: <20230926090230.69E1D80DC9@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=c132c520872ca3435e7c4218da498358fe0e3053
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x
>
> Unless told otherwise, ninja will spawn as many jobs as there are CPU
> (plus 2). Nodejs is built with ninja, but it is a generic package, so
> there is no variable (like with cmake-package) that passes the proper
> number of parallel jobs as configured by the user.
>
> As a consequence, the nodejs build will use as many CPU as are
> available, possibly overcommitting the rsources the user expected to be
> used.
>
> Set the JOBS variableto limit that number.
>
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> [yann.morin.1998@free.fr: reword commit log]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit 84c24ab1b5a7d38b481b37a759480ff2273b499d)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/nodejs/nodejs.mk | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 225b371786..ff32ae6c13 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -46,14 +46,16 @@ HOST_NODEJS_MAKE_OPTS = \
>          CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
>          LDFLAGS.host="$(HOST_LDFLAGS)" \
>          NO_LOAD=cctest.target.mk \
> -       PATH=$(@D)/bin:$(BR_PATH)
> +       PATH=$(@D)/bin:$(BR_PATH) \
> +       JOBS=$(BR2_JLEVEL)
>
>   NODEJS_MAKE_OPTS = \
>          $(TARGET_CONFIGURE_OPTS) \
>          NO_LOAD=cctest.target.mk \
>          PATH=$(@D)/bin:$(BR_PATH) \
>          LDFLAGS="$(NODEJS_LDFLAGS)" \
> -       LD="$(TARGET_CXX)"
> +       LD="$(TARGET_CXX)" \
> +       JOBS=$(BR2_JLEVEL)
>
>   # nodejs's build system uses python which can be a symlink to an unsupported
>   # python version (e.g. python 3.10 with nodejs 14.18.1). We work around this by
>
>
> ------------------------------
>
> Message: 20
> Date: Tue, 26 Sep 2023 10:01:09 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.02.x] package/nut:
>          package/nut: specify --with-user/group when building NUT
> Message-ID: <20230926090230.58DDD80DA8@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=939ff67d15b7db28d67473b1503d1870578a83ca
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x
>
> This commit fixes a problem where the NUT package couldn't be
> used as a NUT server due to the fact that the default group for
> nobody is "nogroup" and not "nobody" like the internal default
> of NUT. Thus, when starting a NUT server daemon the daemon starts
> with incorrect group permissions. This commit fixes this
> shortcoming by introducing a dedicated 'nut' user and 'nut' group
> to drop priviledges to it.
>
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit cd46e1b1439e854dc9e4c016795d6e5276e4c573)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/nut/nut.mk | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/package/nut/nut.mk b/package/nut/nut.mk
> index fb98ba04f0..4c322aeb85 100644
> --- a/package/nut/nut.mk
> +++ b/package/nut/nut.mk
> @@ -24,7 +24,9 @@ NUT_POST_PATCH_HOOKS += NUT_FIX_CONFIGURE
>   NUT_CONF_OPTS = \
>          --with-altpidpath=/var/run/upsd \
>          --with-dev \
> -       --without-doc
> +       --without-doc \
> +       --with-user=nut \
> +       --with-group=nut
>
>   NUT_CONF_ENV = \
>          ax_cv_check_cflags__Werror__Wno_unknown_warning_option=no \
> @@ -34,6 +36,10 @@ NUT_CONF_ENV = \
>          ac_cv_func_strncasecmp=yes \
>          ax_cv__printf_string_null=yes
>
> +define NUT_USERS
> +       nut -1 nut -1 * - - - NUT user
> +endef
> +
>   ifeq ($(call qstrip,$(BR2_PACKAGE_NUT_DRIVERS)),)
>   NUT_CONF_OPTS += --with-drivers=auto
>   else
>
>
> ------------------------------
>
> Message: 21
> Date: Tue, 26 Sep 2023 10:02:05 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.02.x] package/libpjsip:
>          security bump to version 2.13.1
> Message-ID: <20230926090230.6169880DB3@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=243ea6eb2927bdb689efbd3e61a1076e887944f3
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x
>
> Fixes the following security vulnerability:
>
> - CVE-2023-27585: Heap buffer overflow when parsing DNS packet
>    https://github.com/pjsip/pjproject/security/advisories/GHSA-q9cp-8wcq-7pfr
>
> Drop now upstreamed security fixes for CVE-2022-23537 and CVE-2022-23547.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit 7447700f057a4bf8b2ee84c22a2319ab05f9aeea)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   ...rge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch | 99 ----------------------
>   ...rge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch | 54 ------------
>   package/libpjsip/libpjsip.hash                     |  2 +-
>   package/libpjsip/libpjsip.mk                       |  8 +-
>   4 files changed, 2 insertions(+), 161 deletions(-)
>
> diff --git a/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch b/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
> deleted file mode 100644
> index 01e1878189..0000000000
> --- a/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -From d8440f4d711a654b511f50f79c0445b26f9dd1e1 Mon Sep 17 00:00:00 2001
> -From: Nanang Izzuddin <nanang@teluu.com>
> -Date: Tue, 20 Dec 2022 11:39:12 +0700
> -Subject: [PATCH] Merge pull request from GHSA-9pfh-r8x4-w26w
> -
> -* Fix buffer overread in STUN message decoder
> -
> -* Updates based on comments
> -
> -[Retrieved from:
> -https://github.com/pjsip/pjproject/commit/d8440f4d711a654b511f50f79c0445b26f9dd1e1]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - pjnath/include/pjnath/stun_msg.h |  4 ++++
> - pjnath/src/pjnath/stun_msg.c     | 14 +++++++++++---
> - 2 files changed, 15 insertions(+), 3 deletions(-)
> -
> -diff --git a/pjnath/include/pjnath/stun_msg.h b/pjnath/include/pjnath/stun_msg.h
> -index b52f95c586..e49f096f3a 100644
> ---- a/pjnath/include/pjnath/stun_msg.h
> -+++ b/pjnath/include/pjnath/stun_msg.h
> -@@ -442,6 +442,7 @@ typedef enum pj_stun_status
> -
> -    \endverbatim
> -  */
> -+#pragma pack(1)
> - typedef struct pj_stun_msg_hdr
> - {
> -     /**
> -@@ -473,6 +474,7 @@ typedef struct pj_stun_msg_hdr
> -     pj_uint8_t          tsx_id[12];
> -
> - } pj_stun_msg_hdr;
> -+#pragma pack()
> -
> -
> - /**
> -@@ -490,6 +492,7 @@ typedef struct pj_stun_msg_hdr
> -
> -    \endverbatim
> -  */
> -+#pragma pack(1)
> - typedef struct pj_stun_attr_hdr
> - {
> -     /**
> -@@ -506,6 +509,7 @@ typedef struct pj_stun_attr_hdr
> -     pj_uint16_t         length;
> -
> - } pj_stun_attr_hdr;
> -+#pragma pack()
> -
> -
> - /**
> -diff --git a/pjnath/src/pjnath/stun_msg.c b/pjnath/src/pjnath/stun_msg.c
> -index 3def6b3eac..e904a0ba47 100644
> ---- a/pjnath/src/pjnath/stun_msg.c
> -+++ b/pjnath/src/pjnath/stun_msg.c
> -@@ -746,7 +746,7 @@ PJ_DEF(int) pj_stun_set_padding_char(int chr)
> -
> - #define INIT_ATTR(a,t,l)    (a)->hdr.type=(pj_uint16_t)(t), \
> -                             (a)->hdr.length=(pj_uint16_t)(l)
> --#define ATTR_HDR_LEN        4
> -+#define ATTR_HDR_LEN        sizeof(pj_stun_attr_hdr)
> -
> - static pj_uint16_t GETVAL16H(const pj_uint8_t *buf, unsigned pos)
> - {
> -@@ -2327,6 +2327,14 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
> -         status = pj_stun_msg_check(pdu, pdu_len, options);
> -         if (status != PJ_SUCCESS)
> -             return status;
> -+    } else {
> -+        /* For safety, verify packet length at least */
> -+        pj_uint32_t msg_len = GETVAL16H(pdu, 2) + 20;
> -+        if (msg_len > pdu_len ||
> -+            ((options & PJ_STUN_IS_DATAGRAM) && msg_len != pdu_len))
> -+        {
> -+            return PJNATH_EINSTUNMSGLEN;
> -+        }
> -     }
> -
> -     /* Create the message, copy the header, and convert to host byte order */
> -@@ -2345,7 +2353,7 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
> -         p_response = NULL;
> -
> -     /* Parse attributes */
> --    while (pdu_len >= 4) {
> -+    while (pdu_len >= ATTR_HDR_LEN) {
> -         unsigned attr_type, attr_val_len;
> -         const struct attr_desc *adesc;
> -
> -@@ -2357,7 +2365,7 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
> -         attr_val_len = (attr_val_len + 3) & (~3);
> -
> -         /* Check length */
> --        if (pdu_len < attr_val_len) {
> -+        if (pdu_len < attr_val_len + ATTR_HDR_LEN) {
> -             pj_str_t err_msg;
> -             char err_msg_buf[80];
> -
> diff --git a/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch b/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
> deleted file mode 100644
> index 82249a2076..0000000000
> --- a/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From bc4812d31a67d5e2f973fbfaf950d6118226cf36 Mon Sep 17 00:00:00 2001
> -From: sauwming <ming@teluu.com>
> -Date: Fri, 23 Dec 2022 15:05:28 +0800
> -Subject: [PATCH] Merge pull request from GHSA-cxwq-5g9x-x7fr
> -
> -* Fixed heap buffer overflow when parsing STUN errcode attribute
> -
> -* Also fixed uint parsing
> -
> -[Retrieved from:
> -https://github.com/pjsip/pjproject/commit/bc4812d31a67d5e2f973fbfaf950d6118226cf36]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - pjnath/src/pjnath/stun_msg.c | 11 ++++++-----
> - 1 file changed, 6 insertions(+), 5 deletions(-)
> -
> -diff --git a/pjnath/src/pjnath/stun_msg.c b/pjnath/src/pjnath/stun_msg.c
> -index c6b0bdd284..b55d29849a 100644
> ---- a/pjnath/src/pjnath/stun_msg.c
> -+++ b/pjnath/src/pjnath/stun_msg.c
> -@@ -1438,12 +1438,12 @@ static pj_status_t decode_uint_attr(pj_pool_t *pool,
> -     attr = PJ_POOL_ZALLOC_T(pool, pj_stun_uint_attr);
> -     GETATTRHDR(buf, &attr->hdr);
> -
> --    attr->value = GETVAL32H(buf, 4);
> --
> -     /* Check that the attribute length is valid */
> -     if (attr->hdr.length != 4)
> -         return PJNATH_ESTUNINATTRLEN;
> -
> -+    attr->value = GETVAL32H(buf, 4);
> -+
> -     /* Done */
> -     *p_attr = attr;
> -
> -@@ -1757,14 +1757,15 @@ static pj_status_t decode_errcode_attr(pj_pool_t *pool,
> -     attr = PJ_POOL_ZALLOC_T(pool, pj_stun_errcode_attr);
> -     GETATTRHDR(buf, &attr->hdr);
> -
> -+    /* Check that the attribute length is valid */
> -+    if (attr->hdr.length < 4)
> -+        return PJNATH_ESTUNINATTRLEN;
> -+
> -     attr->err_code = buf[6] * 100 + buf[7];
> -
> -     /* Get pointer to the string in the message */
> -     value.ptr = ((char*)buf + ATTR_HDR_LEN + 4);
> -     value.slen = attr->hdr.length - 4;
> --    /* Make sure the length is never negative */
> --    if (value.slen < 0)
> --        value.slen = 0;
> -
> -     /* Copy the string to the attribute */
> -     pj_strdup(pool, &attr->reason, &value);
> diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
> index 9935575567..2edd97bed4 100644
> --- a/package/libpjsip/libpjsip.hash
> +++ b/package/libpjsip/libpjsip.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  4178bb9f586299111463fc16ea04e461adca4a73e646f8ddef61ea53dafa92d9  pjproject-2.13.tar.gz
> +sha256  32a5ab5bfbb9752cb6a46627e4c410e61939c8dbbd833ac858473cfbd9fb9d7d  pjproject-2.13.1.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 24db641446..f97d547fd7 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -LIBPJSIP_VERSION = 2.13
> +LIBPJSIP_VERSION = 2.13.1
>   LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
>   LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
>
> @@ -15,12 +15,6 @@ LIBPJSIP_CPE_ID_PRODUCT = pjsip
>   LIBPJSIP_INSTALL_STAGING = YES
>   LIBPJSIP_MAKE = $(MAKE1)
>
> -# 0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
> -LIBPJSIP_IGNORE_CVES += CVE-2022-23537
> -
> -# 0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
> -LIBPJSIP_IGNORE_CVES += CVE-2022-23547
> -
>   LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
>
>   # relocation truncated to fit: R_68K_GOT16O
>
>
> ------------------------------
>
> Message: 22
> Date: Tue, 26 Sep 2023 09:55:31 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.02.x] docs/manual: add
>          section to explain how to give credits to a sponsor
> Message-ID: <20230926090230.4E97180DA6@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=7da37962ced51497d9060c845b9f215fc67ec070
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x
>
> Sometimes it happens that a Company or a Physical Person sponsors the
> creation and/or the upstreaming process of a patch, but at the moment
> there is no way to give credits to it. In Linux they prepend '+sponsor'
> to the e-mail of the contributor in both authorship and commit log tag as
> discussed here[0]. So let's describe in the manual how to do that as a
> standard.
>
> [0]: https://lore.kernel.org/linux-doc/20230817220957.41582-1-giulio.benetti@benettiengineering.com/
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [yann.morin.1998@free.fr:
>    - reword to reference sub-addressing and the RFC
>    - move to the "submitting patches" section, that already deals with
>      SoB tags
>    - differentiate between Your/Their names
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit de349df08c653a822166f94dbe01295a5a3cfa6e)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   docs/manual/contribute.txt | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 94f1c64496..15fe36aef0 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -247,6 +247,23 @@ which have the upstream license), and that you are allowed to do so.
>   See http://developercertificate.org/[the Developer Certificate of
>   Origin] for details.
>
> +To give credits to who sponsored the creation of a patch or the process of
> +upstreaming it, you may use
> +https://datatracker.ietf.org/doc/html/rfc5233[email subaddressing] for
> +your git identity (i.e. what is used as commit author and email +From:+
> +field, as well as your Signed-off-by tag); add suffix to the local part,
> +separated from it by a plus `+` sign. E.g.:
> +
> +* for a company which sponsored the submitted work, use the company name
> +  as the detail (suffix) part:
> ++
> +`Your-Name Your-Surname <your-name.your-surname+companyname@mail.com>`
> +
> +* for an individual who sponsored who sponsored the submitted work, use
> +  their name and surname:
> ++
> +`Your-Name Your-Surname <your-name.your-surname+their-name.their-surname@mail.com>`
> +
>   When adding new packages, you should submit every package in a
>   separate patch. This patch should have the update to
>   +package/Config.in+, the package +Config.in+ file, the +.mk+ file, the
>
>
> ------------------------------
>
> Message: 23
> Date: Tue, 26 Sep 2023 11:11:57 +0200
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> To: buildroot@buildroot.org
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier
>          <maxime.chevallier@bootlin.com>, Giulio Benetti
>          <giulio.benetti@benettiengineering.com>, "Yann E . MORIN"
>          <yann.morin.1998@free.fr>, Pierre Floury <pierre.floury@gmail.com>
> Subject: [Buildroot] [PATCH v2 3/4] package/linux-tools: add rtla
> Message-ID:
>          <20230926091158.3767645-3-giulio.benetti@benettiengineering.com>
>
> From: Maxime Chevallier <maxime.chevallier@bootlin.com>
>
> The RealTime Linux Analysis tool includes a set of commands that relies
> on the osnoise and timerlat tracers from the ftrace kernel subsystem,
> allowing to analyze the lantency sources coming from the hardware and
> the kernel itself.
>
> This tool was introduced in v5.17, and relies on libtracefs and
> libtraceevent, although libtraceevent itself is already a dependency for
> libtracefs.
>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [Giulio: fix install with recent Linux versions]
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> Giulio:
> V1->V2:
> * fix install with recent Linux versions
> ---
>   DEVELOPERS                                |  1 +
>   package/linux-tools/Config.in             | 10 +++++++
>   package/linux-tools/linux-tool-rtla.mk.in | 36 +++++++++++++++++++++++
>   3 files changed, 47 insertions(+)
>   create mode 100644 package/linux-tools/linux-tool-rtla.mk.in
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 835c269461..31bfc67c8a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2099,6 +2099,7 @@ F:        package/timescaledb/
>   N:     Maxime Chevallier <maxime.chevallier@bootlin.com>
>   F:     package/libtraceevent/
>   F:     package/libtracefs
> +F:     package/linux-tools/linux-tool-rtla.mk.in
>
>   N:     Michael Durrant <mdurrant@arcturusnetworks.com>
>   F:     board/arcturus/
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 451b0eeff5..63e2796e45 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -102,6 +102,16 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
>
>   endif
>
> +config BR2_PACKAGE_LINUX_TOOLS_RTLA
> +       bool "rtla"
> +       select BR2_PACKAGE_LINUX_TOOLS
> +       select BR2_PACKAGE_LIBTRACEFS
> +       help
> +         Linux 5.17 and later has 2 new tracers, osnoise and timerlat.
> +         There tracers allow performing latency analysis, for which
> +         the rtla tool provides wrapper commands to visualize and
> +         extrace latency traces and reports.
> +
>   config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
>          bool"selftests"
>          depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
> new file mode 100644
> index 0000000000..a14571bb1c
> --- /dev/null
> +++ b/package/linux-tools/linux-tool-rtla.mk.in
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# rtla
> +#
> +################################################################################
> +
> +LINUX_TOOLS += rtla
> +
> +RTLA_DEPENDENCIES = host-pkgconf libtracefs
> +RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
> +       CC=$(TARGET_CC) \
> +       LDFLAGS="$(TARGET_LDFLAGS)" \
> +       PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
> +
> +define RTLA_BUILD_CMDS
> +       $(Q)if ! grep install $(LINUX_DIR)/tools/tracing/rtla/Makefile >/dev/null 2>&1 ; then \
> +               echo "Your kernel version is too old and does not implement the rtla tool." ; \
> +               echo "At least kernel 5.17 must be used." ; \
> +               exit 1 ; \
> +       fi
> +
> +       $(TARGET_MAKE_ENV) \
> +       $(MAKE) $(RTLA_MAKE_OPTS) \
> +       -C $(LINUX_DIR)/tools/tracing rtla
> +endef
> +
> +# make rtla_install build and install by default documentation using rst2man
> +# but it's not available in Buildroot and we don't want manual files in target
> +# folder so let's simply install the resulting rtla binary and create symlinks
> +# like Linux does in its tools/tracing/rtla/Makefile
> +define RTLA_INSTALL_TARGET_CMDS
> +       $(INSTALL) -m 0755 -D $(LINUX_DIR)/tools/tracing/rtla/rtla $(TARGET_DIR)/usr/bin
> +       ln -sf rtla $(TARGET_DIR)/usr/bin/osnoise
> +       ln -sf rtla $(TARGET_DIR)/usr/bin/hwnoise
> +       ln -sf rtla $(TARGET_DIR)/usr/bin/timerlat
> +endef
> --
> 2.34.1
>
>
>
> ------------------------------
>
> Message: 24
> Date: Tue, 26 Sep 2023 11:11:58 +0200
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> To: buildroot@buildroot.org
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier
>          <maxime.chevallier@bootlin.com>, Giulio Benetti
>          <giulio.benetti@benettiengineering.com>, "Yann E . MORIN"
>          <yann.morin.1998@free.fr>, Pierre Floury <pierre.floury@gmail.com>
> Subject: [Buildroot] [PATCH v2 4/4] package/trace-cmd: bump to 3.1.7
> Message-ID:
>          <20230926091158.3767645-4-giulio.benetti@benettiengineering.com>
>
> From: Maxime Chevallier <maxime.chevallier@bootlin.com>
>
> trace-cmd's dependencies 'libtracefs' and 'libtraceevent' were split
> into dedicated projects, maintained outside of trace-cmd.
>
> This release, on top of bumping the version, adds this new dependencies.
>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [Giulio: bump to version 3.1.7]
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> Giulio:
> V1->V2:
> * bump to version 3.1.7
> ---
>   package/trace-cmd/Config.in      | 2 ++
>   package/trace-cmd/trace-cmd.hash | 2 +-
>   package/trace-cmd/trace-cmd.mk   | 6 ++++--
>   3 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
> index 2d0accd7ae..00b9ebbd9a 100644
> --- a/package/trace-cmd/Config.in
> +++ b/package/trace-cmd/Config.in
> @@ -4,6 +4,8 @@ config BR2_PACKAGE_TRACE_CMD
>          depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>          depends on BR2_USE_MMU # fork()
>          depends on !BR2_STATIC_LIBS # dlopen()
> +       select BR2_PACKAGE_LIBTRACEEVENT
> +       select BR2_PACKAGE_LIBTRACEFS
>          help
>            Command line reader for ftrace.
>
> diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
> index 4d39e4d5ea..6edcaf0e1c 100644
> --- a/package/trace-cmd/trace-cmd.hash
> +++ b/package/trace-cmd/trace-cmd.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  a74d9ade2633b88d0ad199360d51996427e23f4835594133e456cd6e3bd3a651  trace-cmd-v2.9.7.tar.gz
> +sha256  e496d41e599f8ef3c9a74675da05f86be0d8d48d524f0182c73ab98cd16da0b0  trace-cmd-v3.1.7.tar.gz
>   sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
>   sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
>   sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
> diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
> index 52bb99036c..3d4d88c964 100644
> --- a/package/trace-cmd/trace-cmd.mk
> +++ b/package/trace-cmd/trace-cmd.mk
> @@ -4,14 +4,14 @@
>   #
>   ################################################################################
>
> -TRACE_CMD_VERSION = 2.9.7
> +TRACE_CMD_VERSION = 3.1.7
>   TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
>   TRACE_CMD_SITE = \
>          https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
>   TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
>   TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB LICENSES/GPL-2.0 LICENSES/LGPL-2.1
>
> -TRACE_CMD_DEPENDENCIES = host-pkgconf
> +TRACE_CMD_DEPENDENCIES = host-pkgconf libtracefs libtraceevent
>   TRACE_CMD_MAKE_OPTS = prefix=/usr etcdir=/etc
>
>   ifeq ($(BR2_PACKAGE_AUDIT),y)
> @@ -34,6 +34,8 @@ ifeq ($(BR2_sparc64),y)
>   TRACE_CMD_CFLAGS += -fPIC
>   endif
>
> +TRACE_CMD_CFLAGS += $($(HOST_DIR)/bin/pkg-config --cflags libtracefs)
> +
>   # trace-cmd use CPPFLAGS to add some extra flags.
>   # But like for CFLAGS, $(TARGET_CPPFLAGS) contains _LARGEFILE64_SOURCE
>   # that causes build problems.
> --
> 2.34.1
>
>
>
> ------------------------------
>
> Message: 25
> Date: Tue, 26 Sep 2023 11:11:55 +0200
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> To: buildroot@buildroot.org
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier
>          <maxime.chevallier@bootlin.com>, Giulio Benetti
>          <giulio.benetti@benettiengineering.com>, "Yann E . MORIN"
>          <yann.morin.1998@free.fr>, Pierre Floury <pierre.floury@gmail.com>
> Subject: [Buildroot] [PATCH v2 1/4] package/libtraceevent: new package
> Message-ID:
>          <20230926091158.3767645-1-giulio.benetti@benettiengineering.com>
>
> From: Maxime Chevallier <maxime.chevallier@bootlin.com>
>
> Introduce the libtraceevent library, that used to be bundled with the
> trace-cmd tool. This library is now used by several tools and libraries
> such as trace-cmd, libtracefs and rtla.
>
> This package tries to install libraries in /usr/local/lib by default,
> hence the redefinition of the "prefix" variable, so that the library
> gets installed in "/usr/lib" instead.
>
> The same applies to the pkgconfig handling of the proved Makefile, which
> installs the .pc files in the /usr/local area by default, hence the
> redefinition of the pkgconfig_dir to either the correct directory within the
> staging area, or to empty value for the target to avoid installing the .pc
> in that case.
>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [Giulio: bump version to 1.7.3 and add hash file]
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> Giulio:
> V1->V2:
> * bump to version 1.7.3
> * add hash file
> ---
>   DEVELOPERS                               |  3 +++
>   package/Config.in                        |  1 +
>   package/libtraceevent/Config.in          |  9 +++++++
>   package/libtraceevent/libtraceevent.hash |  4 +++
>   package/libtraceevent/libtraceevent.mk   | 33 ++++++++++++++++++++++++
>   5 files changed, 50 insertions(+)
>   create mode 100644 package/libtraceevent/Config.in
>   create mode 100644 package/libtraceevent/libtraceevent.hash
>   create mode 100644 package/libtraceevent/libtraceevent.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 38973a75dc..306c3cf2be 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2096,6 +2096,9 @@ F:        package/postgresql/
>   F:     package/protozero/
>   F:     package/timescaledb/
>
> +N:     Maxime Chevallier <maxime.chevallier@bootlin.com>
> +F:     package/libtraceevent/
> +
>   N:     Michael Durrant <mdurrant@arcturusnetworks.com>
>   F:     board/arcturus/
>   F:     configs/arcturus_ucp1020_defconfig
> diff --git a/package/Config.in b/package/Config.in
> index 1e8b6f90c1..cb7afd188e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -117,6 +117,7 @@ menu "Debugging, profiling and benchmark"
>          source "package/kyua/Config.in"
>          source "package/latencytop/Config.in"
>          source "package/libbpf/Config.in"
> +       source "package/libtraceevent/Config.in"
>          source "package/lmbench/Config.in"
>          source "package/lsof/Config.in"
>          source "package/ltp-testsuite/Config.in"
> diff --git a/package/libtraceevent/Config.in b/package/libtraceevent/Config.in
> new file mode 100644
> index 0000000000..d351e3b4de
> --- /dev/null
> +++ b/package/libtraceevent/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBTRACEEVENT
> +       bool "libtraceevent"
> +       help
> +         libtraceevent is a library that interfaces with the ftrace
> +         subsystem in the linux kernel.
> +         It used to be bundled directly in the trace-cmd
> +         tool, but it was eventually extracted so that it can be used
> +         by multiple other tools and libraries, such as libtracefs and
> +         rtla.
> diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
> new file mode 100644
> index 0000000000..15c4883afd
> --- /dev/null
> +++ b/package/libtraceevent/libtraceevent.hash
> @@ -0,0 +1,4 @@
> +# Locally computed
> +sha256  097b72e0d907f3107825fb2edf0188324bf70dc9da360f6efa68dc484ffde541  libtraceevent-1.7.3.tar.gz
> +sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  GPL-2.0
> +sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LGPL-2.1
> diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
> new file mode 100644
> index 0000000000..75c23f7410
> --- /dev/null
> +++ b/package/libtraceevent/libtraceevent.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# libtraceevent
> +#
> +################################################################################
> +
> +LIBTRACEEVENT_VERSION = 1.7.3
> +LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
> +LIBTRACEEVENT_INSTALL_STAGING = YES
> +LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
> +LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
> +
> +define LIBTRACEEVENT_BUILD_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +endef
> +
> +define LIBTRACEEVENT_INSTALL_STAGING_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> +       DESTDIR=$(STAGING_DIR) \
> +       pkgconfig_dir="/usr/lib/pkgconfig" \
> +       prefix="/usr" \
> +       install
> +endef
> +
> +define LIBTRACEEVENT_INSTALL_TARGET_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> +       DESTDIR=$(TARGET_DIR) \
> +       pkgconfig_dir="" \
> +       prefix="/usr" \
> +       install
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.34.1
>
>
>
> ------------------------------
>
> Message: 26
> Date: Tue, 26 Sep 2023 11:11:56 +0200
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> To: buildroot@buildroot.org
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier
>          <maxime.chevallier@bootlin.com>, Giulio Benetti
>          <giulio.benetti@benettiengineering.com>, "Yann E . MORIN"
>          <yann.morin.1998@free.fr>, Pierre Floury <pierre.floury@gmail.com>
> Subject: [Buildroot] [PATCH v2 2/4] package/libtracefs: new package
> Message-ID:
>          <20230926091158.3767645-2-giulio.benetti@benettiengineering.com>
>
> From: Maxime Chevallier <maxime.chevallier@bootlin.com>
>
> Introduce the libtracefs library, that used to be bundled with the
> trace-cmd tool. This library is now used by several tools and libraries
> such as trace-cmd and rtla, and is used as an interface to the ftrace
> kernel subsystem through tracefs.
>
> This package tries to install libraries in /usr/local/lib by default,
> hence the redefinition of the "prefix" variable, so that the library
> gets installed in "/usr/lib" instead.
>
> The same applies to the pkgconfig handling of the proved Makefile, which
> installs the .pc files in the /usr/local area by default, hence the
> redefinition of the pkgconfig_dir to either the correct directory within the
> staging area, or to empty value for the target to avoid installing the .pc
> in that case.
>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [Giulio: bump version to 1.7.0 and add hash file]
> Signeg-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> Giulio:
> V1->V2:
> * bump to version 1.7.0
> * add hash file
> ---
>   DEVELOPERS                         |  1 +
>   package/Config.in                  |  1 +
>   package/libtracefs/Config.in       |  6 +++++
>   package/libtracefs/libtracefs.hash |  4 ++++
>   package/libtracefs/libtracefs.mk   | 35 ++++++++++++++++++++++++++++++
>   5 files changed, 47 insertions(+)
>   create mode 100644 package/libtracefs/Config.in
>   create mode 100644 package/libtracefs/libtracefs.hash
>   create mode 100644 package/libtracefs/libtracefs.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 306c3cf2be..835c269461 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2098,6 +2098,7 @@ F:        package/timescaledb/
>
>   N:     Maxime Chevallier <maxime.chevallier@bootlin.com>
>   F:     package/libtraceevent/
> +F:     package/libtracefs
>
>   N:     Michael Durrant <mdurrant@arcturusnetworks.com>
>   F:     board/arcturus/
> diff --git a/package/Config.in b/package/Config.in
> index cb7afd188e..bd30e956bd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -118,6 +118,7 @@ menu "Debugging, profiling and benchmark"
>          source "package/latencytop/Config.in"
>          source "package/libbpf/Config.in"
>          source "package/libtraceevent/Config.in"
> +       source "package/libtracefs/Config.in"
>          source "package/lmbench/Config.in"
>          source "package/lsof/Config.in"
>          source "package/ltp-testsuite/Config.in"
> diff --git a/package/libtracefs/Config.in b/package/libtracefs/Config.in
> new file mode 100644
> index 0000000000..92ce0986df
> --- /dev/null
> +++ b/package/libtracefs/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LIBTRACEFS
> +       bool "libtracefs"
> +       select BR2_PACKAGE_LIBTRACEEVENT
> +       help
> +         libtracefs is used to easily interface with the ftrace
> +         interface through the tracefs virtual filesystem.
> diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
> new file mode 100644
> index 0000000000..676fcf1111
> --- /dev/null
> +++ b/package/libtracefs/libtracefs.hash
> @@ -0,0 +1,4 @@
> +# Locally computed
> +sha256  411fcbf3434ecbaefa6c2b1bf092266293a672e2d7ee46fdd6b402753cb8bd16  libtracefs-1.7.0.tar.gz
> +sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  GPL-2.0
> +sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LGPL-2.1
> diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
> new file mode 100644
> index 0000000000..0b32b2102a
> --- /dev/null
> +++ b/package/libtracefs/libtracefs.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# libtracefs
> +#
> +################################################################################
> +
> +LIBTRACEFS_VERSION = 1.7.0
> +LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
> +LIBTRACEFS_INSTALL_STAGING = YES
> +LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
> +LIBTRACEFS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
> +
> +LIBTRACEFS_DEPENDENCIES = host-pkgconf libtraceevent
> +
> +define LIBTRACEFS_BUILD_CMDS
> +       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +endef
> +
> +define LIBTRACEFS_INSTALL_STAGING_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> +       DESTDIR=$(STAGING_DIR) \
> +       pkgconfig_dir="/usr/lib/pkgconfig" \
> +       prefix="/usr" \
> +       install
> +endef
> +
> +define LIBTRACEFS_INSTALL_TARGET_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> +       DESTDIR=$(TARGET_DIR) \
> +       pkgconfig_dir="" \
> +       prefix="/usr" \
> +       install
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.34.1
>
>
>
> ------------------------------
>
> Message: 27
> Date: Tue, 26 Sep 2023 13:51:12 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.08.x] package/libopenssl:
>          bump to version 3.0.11
> Message-ID: <20230926115319.E953E81426@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=f4c3e4a55e4b43dec6dece3ee47c199cd5775f77
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x
>
> Fixes CVE-2023-4807 (Windows-only):
> https://www.openssl.org/news/vulnerabilities.html
>
> Changelog: https://www.openssl.org/news/openssl-3.0-notes.html
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/libopenssl/libopenssl.hash | 4 ++--
>   package/libopenssl/libopenssl.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index b43281c7eb..27e2c73d1d 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://www.openssl.org/source/openssl-3.0.10.tar.gz.sha256
> -sha256  1761d4f5b13a1028b9b6f3d4b8e17feb0cedc9370f6afe61d7193d2cdce83323  openssl-3.0.10.tar.gz
> +# From https://www.openssl.org/source/openssl-3.0.11.tar.gz.sha256
> +sha256  b3425d3bb4a2218d0697eb41f7fc0cdede016ed19ca49d168b78e8d947887f55  openssl-3.0.11.tar.gz
>
>   # License files
>   sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 8bc3687921..5ff878dded 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -LIBOPENSSL_VERSION = 3.0.10
> +LIBOPENSSL_VERSION = 3.0.11
>   LIBOPENSSL_SITE = https://www.openssl.org/source
>   LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>   LIBOPENSSL_LICENSE = Apache-2.0
>
>
> ------------------------------
>
> Message: 28
> Date: Tue, 26 Sep 2023 17:47:03 +0200
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: buildroot@buildroot.org
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,  Julien Olivain
>          <ju.o@free.fr>
> Subject: [Buildroot] [PATCH] support/runtime-test: fix weston test
> Message-ID: <20230926154703.160448-1-yann.morin.1998@free.fr>
>
> The weston runtime test uses the CRC of the framebuffer to detect that
> "something" is being drawned on the framebuffer. This requires that the
> sampling of the CRC happens does not happen too early after trigerring
> an action, or the rendering may be not be finishe, either:
>
>    - weston may not have had time to initialise, or
>    - the test application may not have started rednering,
>
> The sequence of rendering that has been observed yields this sequence of
> CRCs (elided for brevity):
>
>    - boot:
>      - alternating between 0x4c4126bf and 0x5d2f9aa5: console cursor
>        blinking
>
>    - start weston:
>      - 0x4c4126bf: weston switches to an clearted vt)
>        ...
>      - 0xe54b7895: weston is starting
>        ...
>      - 0xe54b7895: wayland socket appears!
>        ...
>      - 0x6bf28bdf: weston is ready
>        ...
>
>    - start weston-simple-egl:
>      - 0x6bf28bdf: application is starting
>        ...
>      - 0xNNNNNNNN: random CRCs while the application renders
>        ...
>
>    - stop weston-simple-egl:
>      - 0xNNNNNNNN: izero, one, or two random CRCs while the application
>          renders before it handles SIGTERM
>      - 0x6bf28bdf: application is stopped
>        ...
>
>    - stop weston:
>      - 0x6bf28bdf: a few CRC identical to when weston was started, while
>          weston is processing SIGTERM
>      - ocillating between 0x4c4126bf and 0x5d2f9aa5: console cursor
>          blinking, back to initial vt, weston dead.
>
> So, we need to wait "enough" after each action. Moreover, when the
> wayland socket appears, weston may not have stabilised yet, so we also
> need to wait after the socket appears.
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Julien Olivain <ju.o@free.fr>
> ---
>   support/testing/tests/package/test_weston.py | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
> index 276788c649..df1b7a4135 100644
> --- a/support/testing/tests/package/test_weston.py
> +++ b/support/testing/tests/package/test_weston.py
> @@ -78,6 +78,7 @@ class TestWeston(infra.basetest.BRTest):
>           wayland_socket = "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}"
>           cmd = f"while [ ! -e \"{wayland_socket}\" ] ; do sleep 1 ; done"
>           self.assertRunOk(cmd, timeout=10)
> +        time.sleep(4)
>
>       def stop_weston(self):
>           cmd = "killall weston && sleep 3"
> --
> 2.25.1
>
>
>
> ------------------------------
>
> Message: 29
> Date: Tue, 26 Sep 2023 19:37:44 +0300
> From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
> To: Marcin Niestroj <m.niestroj@grinn-global.com>,
>          buildroot@buildroot.org
> Cc: Sergey Matyukevich <geomatsi@gmail.com>, Peter Korsgaard
>          <peter@korsgaard.com>
> Subject: Re: [Buildroot] [PATCH v2] board: add Orangepi Zero3 support
> Message-ID: <05b7f0d8-163d-52e0-fa48-c275bb89fff0@gmail.com>
> Content-Type: text/plain; charset=UTF-8; format=flowed
>
> Tested-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
>
> 18.09.2023 09:47, Marcin Niestroj ?????:
>> Add initial support for Orangepi Zero3 board:
>> - U-Boot 2021.07 fork by Orangepi
>> - Linux 6.1.31 fork by Orangepi
>> - Default packages from buildroot
>>
>> Enable CONFIG_MFD_AC200 as it is used directly by other module,
>> resulting in build failure when disabled.
>>
>> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
>> ---
>> v1 -> v2:
>>    * use 'linux_sunxi64' instead of default arch defconfig, which fixes
>>      ethernet networking (suggested by Sergey)
>>    * disabled rootfs.tar generation (suggested by Sergey)
>>    * increased ext2 fs size to 180M to fit more kernel modules
>>    * added DEVELOPERS entries for board files
>>
>>    DEVELOPERS                                 |  2 +
>>    board/orangepi/orangepi-zero3/linux.config |  1 +
>>    board/orangepi/orangepi-zero3/readme.txt   | 34 +++++++++++++
>>    configs/orangepi_zero3_defconfig           | 57 ++++++++++++++++++++++
>>    4 files changed, 94 insertions(+)
>>    create mode 100644 board/orangepi/orangepi-zero3/linux.config
>>    create mode 100644 board/orangepi/orangepi-zero3/readme.txt
>>    create mode 100644 configs/orangepi_zero3_defconfig
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index e8b78a8d46..66abc39e16 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -1953,8 +1953,10 @@ F:     package/ecryptfs-utils/
>>    N:  Marcin Niestroj <m.niestroj@grinn-global.com>
>>    F:  board/grinn/
>>    F:  board/orangepi/orangepi-zero-plus/
>> +F:   board/orangepi/orangepi-zero3/
>>    F:  configs/grinn_*
>>    F:  configs/orangepi_zero_plus_defconfig
>> +F:   configs/orangepi_zero3_defconfig
>>    F:  package/argparse/
>>    F:  package/dt-utils/
>>    F:  package/easydbus/
>> diff --git a/board/orangepi/orangepi-zero3/linux.config b/board/orangepi/orangepi-zero3/linux.config
>> new file mode 100644
>> index 0000000000..09b7a93a5a
>> --- /dev/null
>> +++ b/board/orangepi/orangepi-zero3/linux.config
>> @@ -0,0 +1 @@
>> +CONFIG_MFD_AC200=y
>> diff --git a/board/orangepi/orangepi-zero3/readme.txt b/board/orangepi/orangepi-zero3/readme.txt
>> new file mode 100644
>> index 0000000000..4872a363e7
>> --- /dev/null
>> +++ b/board/orangepi/orangepi-zero3/readme.txt
>> @@ -0,0 +1,34 @@
>> +Intro
>> +=====
>> +
>> +This default configuration will allow you to start experimenting with the
>> +buildroot environment for the Orangepi Zero3. With the current configuration
>> +it will bring-up the board, and allow access through the serial console.
>> +
>> +Orangepi Zero3 link:
>> +http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-3.html
>> +
>> +This configuration uses Orangepi's fork of U-Boot and Linux kernel.
>> +
>> +How to build
>> +============
>> +
>> +    $ make orangepi_zero3_defconfig
>> +    $ make
>> +
>> +Note: you will need access to the internet to download the required
>> +sources.
>> +
>> +How to write the SD card
>> +========================
>> +
>> +Once the build process is finished you will have an image called "sdcard.img"
>> +in the output/images/ directory.
>> +
>> +Copy the bootable "sdcard.img" onto an SD card with "dd":
>> +
>> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
>> +  $ sudo sync
>> +
>> +Insert the micro SDcard in your Orangepi Zero3 and power it up. The console
>> +is on the serial line, 115200 8N1.
>> diff --git a/configs/orangepi_zero3_defconfig b/configs/orangepi_zero3_defconfig
>> new file mode 100644
>> index 0000000000..51a6efd3ed
>> --- /dev/null
>> +++ b/configs/orangepi_zero3_defconfig
>> @@ -0,0 +1,57 @@
>> +BR2_aarch64=y
>> +BR2_cortex_a53=y
>> +BR2_ARM_FPU_VFPV4=y
>> +
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>> +BR2_SYSTEM_DHCP="eth0"
>> +
>> +# Firmware
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h616"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>> +
>> +# Bootloader
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,orangepi-xunlong,u-boot-orangepi,6fe17fac388aad17490cf386578b7532975e567f)/u-boot-orangepi-6fe17fac388aad17490cf386578b7532975e567f.tar.gz"
>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero3"
>> +BR2_TARGET_UBOOT_NEEDS_DTC=y
>> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>> +BR2_TARGET_UBOOT_SPL=y
>> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
>> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
>> +
>> +# Kernel
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,orangepi-xunlong,linux-orangepi,3495b5ee0594566c9fed930b96b1cae90600412e)/linux-orangepi-3495b5ee0594566c9fed930b96b1cae90600412e.tar.gz"
>> +BR2_LINUX_KERNEL_DEFCONFIG="linux_sunxi64"
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h616-orangepi-zero3"
>> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>> +BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
>> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero3/linux.config"
>> +
>> +# Filesystem
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero3"
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +BR2_TARGET_ROOTFS_EXT2_4=y
>> +BR2_TARGET_ROOTFS_EXT2_SIZE="180M"
>> +# BR2_TARGET_ROOTFS_TAR is not set
>> +
>> +# host tools
>> +BR2_PACKAGE_HOST_GENIMAGE=y
>> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>> +
>> +# image scripts
>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>
>
> ------------------------------
>
> Message: 30
> Date: Tue, 26 Sep 2023 21:23:36 +0200
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: Adam Duskett <adam.duskett@amarulasolutions.com>
> Cc: Asaf Kahlon <asafka7@gmail.com>, Julien Olivain <ju.o@free.fr>,
>          Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
>          buildroot@buildroot.org, Michael Trimarchi
>          <michael@amarulasolutions.com>, Angelo Compagnucci
>          <angelo@amarulasolutions.com>
> Subject: Re: [Buildroot] [PATCH v9 7/7]
>          support/testing/tests/package/test_flutter.py: new runtime test
> Message-ID: <20230926192336.GT1469982@scaer>
> Content-Type: text/plain; charset=utf-8
>
> Adam, All,
>
> On 2023-09-23 10:35 +0200, Yann E. MORIN spake thusly:
>> On 2023-09-19 14:42 -0600, Adam Duskett spake thusly:
>>> This is a simple test that builds and runs the futter-gallery application and
>>> checks if the service is active.
>> This runtime test does not demonstrate a worlking flutter stack, because
>> the application in fact does not work:
> Note: as discussed on IRC: the above was a bit rough, sorry.
>
> I understand that you did manage to get a flutter stack working, and
> this *is* impressive!
>
> What I meant is that this runtime test does not demonstrate that,
> unfortunately.
>
> The CI/CD pipelines are running in containers that do not have access to
> a GPU. Hence a runtime test that uses GPU passthrough as you initially
> provided is not going to work. That is why I have been insistent on
> doing a headless runtime test.
>
> We do already have working runtime tests for graphical packages, like
> the weston test. What those tests do, is run the graphical application
> to test, and check that the framebuffer changes (by comparing the CRC
> provided by the kernel, as we don't care about what is rendered, just
> that "something" is rendered). This is what I would have expected for
> the flutter test too.
>
> [--SNIP--]
>> So, a few things about this:
>>    - the real issues I'm most afraid of, are the one about mesa failing
>>      to load the proper drivers,
> So I had a deeper look, and ran the weston test by hand (I had to fix it
> while at it [0]), and noticed that weston whines about the exact same
> drivers, yet works. So the issue about missing zynq and vkms is benign.
>
>>      [snip] and/or that it can't create an EGL GBM
>>      surface; I think this is the real problem;
> So, the remaining issue is that flutter-pi can't t create a GBM surface.
> This is very very similar to an old upstream issue, which got fixed a
> year ago:
>
>      https://github.com/ardera/flutter-pi/issues/269
>      https://github.com/ardera/flutter-pi/pull/270
>
> However, upstream did a big overhaul of the code recently, and the fix
> got lost in the rewrite. Here's what I now came up with (patch against
> flutter-pi):
>
>      From 856f9849763535d62ed01b538ba23905875c93f4 Mon Sep 17 00:00:00 2001
>      From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>      Date: Tue, 26 Sep 2023 20:31:17 +0200
>      Subject: [PATCH] src/egl_gbm_render_surface: properly fallback to surface with
>       no modifier
>
>      In 869fa7fcfbeb, we added a fallback to be able to create an EGL sruface
>      when the driver do not support modifiers, like the llvmpipe software
>      renderer (or like some proprietary drivers, like the MALI ones), as
>      reported in #269 [0].
>
>      However, in c6537673c9b6, there was a big overhaul of renderer
>      infrastructure. That commit lost the with-modifiers code path and only
>      kept the without-modifiers fallback one (i.e. it only kept the call to
>      gbm_surface_create(), not to gbm_surface_create_with_modifiers()).
>
>      Then in b0d09f5032a4, the with-modifiers code path was re-instated, but
>      in a way that made it exclusive with the without-modifiers one. That is,
>      the without-modifiers code path was not a fallback to when the other
>      failed.
>
>      Re-instate the fallback mechanism as initially implemented.
>
>      [0] https://github.com/ardera/flutter-pi/issues/269
>
>      Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>      ---
>       src/egl_gbm_render_surface.c | 6 ++++--
>       1 file changed, 4 insertions(+), 2 deletions(-)
>
>      diff --git a/src/egl_gbm_render_surface.c b/src/egl_gbm_render_surface.c
>      index ce9e5e7..8a58667 100644
>      --- a/src/egl_gbm_render_surface.c
>      +++ b/src/egl_gbm_render_surface.c
>      @@ -146,6 +146,7 @@ static int egl_gbm_render_surface_init(
>           }
>       #endif
>
>      +    gbm_surface = NULL;
>           if (allowed_modifiers != NULL) {
>               gbm_surface = gbm_surface_create_with_modifiers(
>                   gbm_device,
>      @@ -158,9 +159,10 @@ static int egl_gbm_render_surface_init(
>               if (gbm_surface == NULL) {
>                   ok = errno;
>                   LOG_ERROR("Couldn't create GBM surface for rendering. gbm_surface_create_with_modifiers: %s\n", strerror(ok));
>      -            return ok;
>      +            LOG_ERROR("Will retry without modifiers\n");
>               }
>      -    } else {
>      +    }
>      +    if (gbm_surface == NULL) {
>               gbm_surface = gbm_surface_create(
>                   gbm_device,
>                   size.x,
>      --
>      2.25.1
>
> With this patch, the application no longer coredumps, and keeps running.
>
> As for the CRC of the framebuffer: without flutter-pi running, the value
> is 0x4c4126bf. Starting the flutter application (and waiting quite a
> bit), it suddenly changes to an arbitrary value! Stopping flutter-pi,
> the CRC reverts to 0x4c4126bf. Starting again, new value! Note that it
> can be like 10s or more before the CRC changes at application start.
>
> So, to me, that means the application is now running! I have no idea what
> is supposed to be displayed, but something is being rendered, and that's
> all that matters!
>
> Care to integrate that patch in your series, test in your actual setup,
> see if it's possible to send it upstream, update the runtime test to
> check on the CRC (instead of checkign the systemd unit status), and
> respin the series, please?
>
> (I'm on the move the next few days, but I'll be able to dedicate time
> during the WE).
>
>>    - you're pointing the gallery app to /usr/share/flutter/gallery/release/
>>      but therat does not exist (what should it contain, btw?).
> (blark typoes of mine). I must have messed things with another test,
> because /usr/share/flutter/gallery/release/ *is* populated as expected.
>
> [0] https://patchwork.ozlabs.org/project/buildroot/patch/20230926154703.160448-1-yann.morin.1998@free.fr/
>
> Regards,
> Yann E. MORIN.
>
>> Can you look at that test, please?
>>
>> Regards,
>> Yann E. MORIN.
>>
>>> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>>> ---
>>> v8 -> v9:
>>>    - Changed to aarch64 to avoid problems with older versions of qemu.
>>>    - Added BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
>>>
>>>   DEVELOPERS                                    |  1 +
>>>   support/testing/tests/package/test_flutter.py | 56 +++++++++++++++++++
>>>   .../package/test_flutter/linux-vkms.fragment  |  2 +
>>>   .../flutter-gallery.service                   |  1 +
>>>   .../systemd/system/flutter-gallery.service    | 11 ++++
>>>   5 files changed, 71 insertions(+)
>>>   create mode 100644 support/testing/tests/package/test_flutter.py
>>>   create mode 100644 support/testing/tests/package/test_flutter/linux-vkms.fragment
>>>   create mode 120000 support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
>>>   create mode 100644 support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
>>>
>>> diff --git a/DEVELOPERS b/DEVELOPERS
>>> index 48a4ec776a..f46d83679a 100644
>>> --- a/DEVELOPERS
>>> +++ b/DEVELOPERS
>>> @@ -37,6 +37,7 @@ F:        package/flutter-engine/
>>>   F: package/flutter-gallery/
>>>   F: package/flutter-pi/
>>>   F: package/flutter-sdk-bin/
>>> +F: support/testing/tests/package/test_flutter.py
>>>
>>>   N: Adam Heinrich <adam@adamh.cz>
>>>   F: package/jack1/
>>> diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
>>> new file mode 100644
>>> index 0000000000..e17ed9f659
>>> --- /dev/null
>>> +++ b/support/testing/tests/package/test_flutter.py
>>> @@ -0,0 +1,56 @@
>>> +import os
>>> +import time
>>> +import infra.basetest
>>> +
>>> +
>>> +class TestFlutter(infra.basetest.BRTest):
>>> +    config = f"""
>>> +        BR2_aarch64=y
>>> +        BR2_TOOLCHAIN_EXTERNAL=y
>>> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>>> +        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_flutter/overlay")}"
>>> +        BR2_PER_PACKAGE_DIRECTORIES=y
>>> +        BR2_INIT_SYSTEMD=y
>>> +        BR2_LINUX_KERNEL=y
>>> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.54"
>>> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>>> +        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
>>> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>>> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{infra.filepath("tests/package/test_flutter/linux-vkms.fragment")}"
>>> +        BR2_PACKAGE_LIBDRM=y
>>> +        BR2_PACKAGE_MESA3D=y
>>> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
>>> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
>>> +        BR2_PACKAGE_MESA3D_OPENGL_ES=y
>>> +        BR2_PACKAGE_FLUTTER_PI=y
>>> +        BR2_PACKAGE_FLUTTER_PI_RAW_KEYBOARD_PLUGIN=y
>>> +        BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN=y
>>> +        BR2_PACKAGE_FLUTTER_GALLERY=y
>>> +        BR2_PACKAGE_FLUTTER_ENGINE=y
>>> +        BR2_TARGET_ROOTFS_EXT2=y
>>> +        BR2_TARGET_ROOTFS_EXT2_4=y
>>> +        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
>>> +        # BR2_TARGET_ROOTFS_TAR is not set
>>> +        """
>>> +
>>> +    def test_run(self):
>>> +        timeout = 35 * self.emulator.timeout_multiplier
>>> +        img = os.path.join(self.builddir, "images", "rootfs.ext2")
>>> +        kern = os.path.join(self.builddir, "images", "Image")
>>> +        self.emulator.boot(
>>> +            arch="aarch64",
>>> +            kernel=kern,
>>> +            kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
>>> +            options=["-M", "virt",
>>> +                     "-cpu", "cortex-a57",
>>> +                     "-m", "512M",
>>> +                     "-smp", "4",
>>> +                     "-vga", "std",
>>> +                     "-vnc", "none",
>>> +                     "-drive", f"file={img},if=virtio,format=raw"])
>>> +        self.emulator.login()
>>> +        cmd = "systemctl is-active flutter-gallery"
>>> +        output, exit_code = self.emulator.run(cmd, 10)
>>> +        self.assertEqual(exit_code, 0)
>>> +        self.assertEqual(output[0], "active")
>>> diff --git a/support/testing/tests/package/test_flutter/linux-vkms.fragment b/support/testing/tests/package/test_flutter/linux-vkms.fragment
>>> new file mode 100644
>>> index 0000000000..3fc7a5dded
>>> --- /dev/null
>>> +++ b/support/testing/tests/package/test_flutter/linux-vkms.fragment
>>> @@ -0,0 +1,2 @@
>>> +CONFIG_DEBUG_FS=y
>>> +CONFIG_DRM_VKMS=y
>>> diff --git a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
>>> new file mode 120000
>>> index 0000000000..40993fb16c
>>> --- /dev/null
>>> +++ b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
>>> @@ -0,0 +1 @@
>>> +../../../../usr/lib/systemd/system/flutter-gallery.service
>>> \ No newline at end of file
>>> diff --git a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
>>> new file mode 100644
>>> index 0000000000..88a2bcbf0b
>>> --- /dev/null
>>> +++ b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
>>> @@ -0,0 +1,11 @@
>>> +[Unit]
>>> +Description=flutter-gallery daemon
>>> +After=dbus.service systemd-udevd.service
>>> +
>>> +[Service]
>>> +ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/gallery/release/
>>> +Restart=always
>>> +KillMode=process
>>> +
>>> +[Install]
>>> +WantedBy=multi-user.target
>>> --
>>> 2.39.2
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>> --
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> '------------------------------^-------^------------------^--------------------'
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
>
>
> ------------------------------
>
> Message: 31
> Date: Tue, 26 Sep 2023 23:37:00 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.05.x] Update for
>          2023.05.3
> Message-ID: <20230926214006.9067681D2A@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=70638523a704aca46313aba05b74783340b11b32
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   CHANGES                  | 29 +++++++++++++++++++++++++++++
>   Makefile                 |  4 ++--
>   support/misc/Vagrantfile |  2 +-
>   3 files changed, 32 insertions(+), 3 deletions(-)
>
> diff --git a/CHANGES b/CHANGES
> index fb52f9bd1a..bf9b57e21d 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -1,3 +1,32 @@
> +2023.05.3, released September 26th, 2023
> +
> +       Important / security related fixes.
> +
> +       Defconfigs: PC x86-64 bios/efi: Needs libelf. Raspberrypi:
> +       Also enable HDMI console when systemd is used.
> +
> +       Updated/fixed packages: agentpp, asterisk, at91dataflashboot,
> +       aubio, berkeleydb, bind, bwm-ng, chocolate-doom, clamav,
> +       compiler-rt, connman, cpio, cups, dav1d, diffutils, dracut,
> +       dt, expect, fail2ban, fio, flite, freerdp, freeswitch,
> +       fstrcmp, gcc, gdb, ghostscript, gmp, go, grub2, haproxy,
> +       heirloom-mailx, hwloc, icu, intel-microcode, irssi, less,
> +       libcoap, libcurl, libglib2, libiec61850, libjxl, libks,
> +       libksba, libmodsecurity, libpjsip, libqb, libraw, libssh,
> +       libtommath, lldpd, log4cxx, lsof, mdadm, mosquitto, mpd, mpv,
> +       mutt, mv-ddr-marvell, ne10, netatalk, network-manager,
> +       nftables, nodejs, ntpsec, nut, openblas, openjdk, openjdk-bin,
> +       opensc, openssh, pcm-tools, perftest, petitboot, php, pixman,
> +       poppler, postgresql, python-django, python-ipython,
> +       python-pip, python-pylibfdt, python-tornado, python3, qt5,
> +       ramspeed, rtl8189fs, rtl8812au-aircrack-ng, samba4, screen,
> +       screenfetch, sngrep, sofia-sip, stellarium, stress-ng,
> +       strongswan, sysstat, tar, tcl, uboot, uclibc, vim, webkitgtk,
> +       webp, wireshark, xfsprogs, xserver_xorg-server, xterm, yajl,
> +       zbar, zxing-cpp
> +
> +       New packages: xlib_libXpresent
> +
>   2023.05.2, released August 31th, 2023
>
>          Important / security related fixes.
> diff --git a/Makefile b/Makefile
> index 2ea0467fc9..eedf4ea296 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -90,9 +90,9 @@ all:
>   .PHONY: all
>
>   # Set and export the version string
> -export BR2_VERSION := 2023.05.2
> +export BR2_VERSION := 2023.05.3
>   # Actual time the release is cut (for reproducible builds)
> -BR2_VERSION_EPOCH = 1693493000
> +BR2_VERSION_EPOCH = 1695764000
>
>   # Save running make version since it's clobbered by the make package
>   RUNNING_MAKE_VERSION := $(MAKE_VERSION)
> diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
> index 75aae858b7..0b26583ea9 100644
> --- a/support/misc/Vagrantfile
> +++ b/support/misc/Vagrantfile
> @@ -5,7 +5,7 @@
>   ################################################################################
>
>   # Buildroot version to use
> -RELEASE='2023.05.2'
> +RELEASE='2023.05.3'
>
>   ### Change here for more memory/cores ###
>   VM_MEMORY=2048
>
>
> ------------------------------
>
> Message: 32
> Date: Tue, 26 Sep 2023 13:55:57 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.05.x] Revert
>          "package/docker-cli: backport fix for host header check"
> Message-ID: <20230926214006.7254E81A15@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=8515c0afcfa90b08a016966962d8db73b4303b50
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x
>
> This reverts commit ce1b80f27dc86d7b23aa221b7d1601dcd57e451e.
>
> With the bump to go 1.19.13, this workaround is no longer needed.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   .checkpackageignore                                |   1 -
>   ...001-backport-fix-for-go-Host-header-check.patch | 127 ---------------------
>   2 files changed, 128 deletions(-)
>
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 81fb9c2d8a..9ec76bc15f 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -354,7 +354,6 @@ package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch Upstream
>   package/dmraid/0001-fix-compilation-under-musl.patch Upstream
>   package/dmraid/S20dmraid Variables
>   package/dnsmasq/S80dnsmasq Shellcheck Variables
> -package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch Upstream
>   package/docker-engine/0001-client-define-a-dummy-hostname-to-use-for-local-conn.patch Upstream
>   package/docker-engine/0002-pkg-plugins-use-a-dummy-hostname-for-local-connectio.patch Upstream
>   package/docker-engine/S60dockerd Indent Shellcheck Variables
> diff --git a/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch b/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch
> deleted file mode 100644
> index 2b58582538..0000000000
> --- a/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch
> +++ /dev/null
> @@ -1,127 +0,0 @@
> -From 4dc783e2bdf414761ef7c209b435d0a30f17c858 Mon Sep 17 00:00:00 2001
> -From: Sebastiaan van Stijn <github@gone.nl>
> -Date: Sat, 15 Jul 2023 02:22:10 +0200
> -Subject: [PATCH] backport fix for go Host header check
> -
> -Go 1.20.6 and 1.19.11 include a security check of the http Host header:
> -
> -  https://github.com/golang/go/issues/60374
> -
> -docker-cli fails this check:
> -
> -  $ docker exec -it ctr bash
> -  http: invalid Host header
> -
> -This is a backported patch to fix this issue.
> -
> -Issue: https://github.com/moby/moby/issues/45935
> -Upstream PR: https://github.com/moby/moby/pull/45942
> -
> -The upstream PR has been merged and will be included in v24.0.5.
> -
> -Signed-off-by: Christian Stewart <christian@aperture.us>
> -[Peter: drop vendor.mod/vendor.sum changes]
> ----
> -
> -For local communications (npipe://, unix://), the hostname is not used,
> -but we need valid and meaningful hostname.
> -
> -The current code used the socket path as hostname, which gets rejected by
> -go1.20.6 and go1.19.11 because of a security fix for [CVE-2023-29406 ][1],
> -which was implemented in  https://go.dev/issue/60374.
> -
> -Prior versions go Go would clean the host header, and strip slashes in the
> -process, but go1.20.6 and go1.19.11 no longer do, and reject the host
> -header.
> ----
> - .../github.com/docker/docker/client/client.go | 30 +++++++++++++++++
> - .../github.com/docker/docker/client/hijack.go |  6 +++-
> - .../docker/docker/client/request.go           | 10 +++---
> - 4 files changed, 72 insertions(+), 40 deletions(-)
> -
> -diff --git a/vendor/github.com/docker/docker/client/client.go b/vendor/github.com/docker/docker/client/client.go
> -index 1c081a51ae..54fa36cca8 100644
> ---- a/vendor/github.com/docker/docker/client/client.go
> -+++ b/vendor/github.com/docker/docker/client/client.go
> -@@ -56,6 +56,36 @@ import (
> -       "github.com/pkg/errors"
> - )
> -
> -+// DummyHost is a hostname used for local communication.
> -+//
> -+// It acts as a valid formatted hostname for local connections (such as "unix://"
> -+// or "npipe://") which do not require a hostname. It should never be resolved,
> -+// but uses the special-purpose ".localhost" TLD (as defined in [RFC 2606, Section 2]
> -+// and [RFC 6761, Section 6.3]).
> -+//
> -+// [RFC 7230, Section 5.4] defines that an empty header must be used for such
> -+// cases:
> -+//
> -+//    If the authority component is missing or undefined for the target URI,
> -+//    then a client MUST send a Host header field with an empty field-value.
> -+//
> -+// However, [Go stdlib] enforces the semantics of HTTP(S) over TCP, does not
> -+// allow an empty header to be used, and requires req.URL.Scheme to be either
> -+// "http" or "https".
> -+//
> -+// For further details, refer to:
> -+//
> -+//   - https://github.com/docker/engine-api/issues/189
> -+//   - https://github.com/golang/go/issues/13624
> -+//   - https://github.com/golang/go/issues/61076
> -+//   - https://github.com/moby/moby/issues/45935
> -+//
> -+// [RFC 2606, Section 2]: https://www.rfc-editor.org/rfc/rfc2606.html#section-2
> -+// [RFC 6761, Section 6.3]: https://www.rfc-editor.org/rfc/rfc6761#section-6.3
> -+// [RFC 7230, Section 5.4]: https://datatracker.ietf.org/doc/html/rfc7230#section-5.4
> -+// [Go stdlib]: https://github.com/golang/go/blob/6244b1946bc2101b01955468f1be502dbadd6807/src/net/http/transport.go#L558-L569
> -+const DummyHost = "api.moby.localhost"
> -+
> - // ErrRedirect is the error returned by checkRedirect when the request is non-GET.
> - var ErrRedirect = errors.New("unexpected redirect in response")
> -
> -diff --git a/vendor/github.com/docker/docker/client/hijack.go b/vendor/github.com/docker/docker/client/hijack.go
> -index 6bdacab10a..4dcaaca4c5 100644
> ---- a/vendor/github.com/docker/docker/client/hijack.go
> -+++ b/vendor/github.com/docker/docker/client/hijack.go
> -@@ -64,7 +64,11 @@ func fallbackDial(proto, addr string, tlsConfig *tls.Config) (net.Conn, error) {
> - }
> -
> - func (cli *Client) setupHijackConn(ctx context.Context, req *http.Request, proto string) (net.Conn, string, error) {
> --      req.Host = cli.addr
> -+      req.URL.Host = cli.addr
> -+      if cli.proto == "unix" || cli.proto == "npipe" {
> -+              // Override host header for non-tcp connections.
> -+              req.Host = DummyHost
> -+      }
> -       req.Header.Set("Connection", "Upgrade")
> -       req.Header.Set("Upgrade", proto)
> -
> -diff --git a/vendor/github.com/docker/docker/client/request.go b/vendor/github.com/docker/docker/client/request.go
> -index c799095c12..bcedcf3bd9 100644
> ---- a/vendor/github.com/docker/docker/client/request.go
> -+++ b/vendor/github.com/docker/docker/client/request.go
> -@@ -96,16 +96,14 @@ func (cli *Client) buildRequest(method, path string, body io.Reader, headers hea
> -               return nil, err
> -       }
> -       req = cli.addHeaders(req, headers)
> -+      req.URL.Scheme = cli.scheme
> -+      req.URL.Host = cli.addr
> -
> -       if cli.proto == "unix" || cli.proto == "npipe" {
> --              // For local communications, it doesn't matter what the host is. We just
> --              // need a valid and meaningful host name. (See #189)
> --              req.Host = "docker"
> -+              // Override host header for non-tcp connections.
> -+              req.Host = DummyHost
> -       }
> -
> --      req.URL.Host = cli.addr
> --      req.URL.Scheme = cli.scheme
> --
> -       if expectedPayload && req.Header.Get("Content-Type") == "" {
> -               req.Header.Set("Content-Type", "text/plain")
> -       }
> ---
> -2.41.0
> -
>
>
> ------------------------------
>
> Message: 33
> Date: Tue, 26 Sep 2023 13:56:52 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.05.x] Revert
>          "package/docker-engine: backport fix for host header check"
> Message-ID: <20230926214006.7E363805F4@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=763d1934598b581ebfdfa4039df3b2ce53ea0ca7
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x
>
> This reverts commit 0b608f0252f51b7d2f54219153976eac7e30669c.
>
> With the bump to go 1.19.13, this workaround is no longer needed.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   .checkpackageignore                                |   2 -
>   ...ne-a-dummy-hostname-to-use-for-local-conn.patch | 174 ---------------------
>   ...-use-a-dummy-hostname-for-local-connectio.patch |  69 --------
>   3 files changed, 245 deletions(-)
>
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 9ec76bc15f..b627bda61d 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -354,8 +354,6 @@ package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch Upstream
>   package/dmraid/0001-fix-compilation-under-musl.patch Upstream
>   package/dmraid/S20dmraid Variables
>   package/dnsmasq/S80dnsmasq Shellcheck Variables
> -package/docker-engine/0001-client-define-a-dummy-hostname-to-use-for-local-conn.patch Upstream
> -package/docker-engine/0002-pkg-plugins-use-a-dummy-hostname-for-local-connectio.patch Upstream
>   package/docker-engine/S60dockerd Indent Shellcheck Variables
>   package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch Upstream
>   package/domoticz/S99domoticz Shellcheck
> diff --git a/package/docker-engine/0001-client-define-a-dummy-hostname-to-use-for-local-conn.patch b/package/docker-engine/0001-client-define-a-dummy-hostname-to-use-for-local-conn.patch
> deleted file mode 100644
> index c5f8d1eb71..0000000000
> --- a/package/docker-engine/0001-client-define-a-dummy-hostname-to-use-for-local-conn.patch
> +++ /dev/null
> @@ -1,174 +0,0 @@
> -From 8ced4331e5e3a6760465a8ce2bd42c66d3232c96 Mon Sep 17 00:00:00 2001
> -From: Sebastiaan van Stijn <github@gone.nl>
> -Date: Wed, 12 Jul 2023 14:15:38 +0200
> -Subject: [PATCH] client: define a "dummy" hostname to use for local
> - connections
> -
> -Go 1.20.6 and 1.19.11 include a security check of the http Host header:
> -
> -  https://github.com/golang/go/issues/60374
> -
> -This is a backported patch to fix this issue.
> -
> -Issue: https://github.com/moby/moby/issues/45935
> -Upstream PR: https://github.com/moby/moby/pull/45942
> -
> -The upstream PR has been merged and will be included in v24.0.5.
> -
> -Signed-off-by: Christian Stewart <christian@aperture.us>
> -
> ----
> -
> -For local communications (npipe://, unix://), the hostname is not used,
> -but we need valid and meaningful hostname.
> -
> -The current code used the client's `addr` as hostname in some cases, which
> -could contain the path for the unix-socket (`/var/run/docker.sock`), which
> -gets rejected by go1.20.6 and go1.19.11 because of a security fix for
> -[CVE-2023-29406 ][1], which was implemented in  https://go.dev/issue/60374.
> -
> -Prior versions go Go would clean the host header, and strip slashes in the
> -process, but go1.20.6 and go1.19.11 no longer do, and reject the host
> -header.
> -
> -This patch introduces a `DummyHost` const, and uses this dummy host for
> -cases where we don't need an actual hostname.
> -
> -Before this patch (using go1.20.6):
> -
> -    make GO_VERSION=1.20.6 TEST_FILTER=TestAttach test-integration
> -    === RUN   TestAttachWithTTY
> -        attach_test.go:46: assertion failed: error is not nil: http: invalid Host header
> -    --- FAIL: TestAttachWithTTY (0.11s)
> -    === RUN   TestAttachWithoutTTy
> -        attach_test.go:46: assertion failed: error is not nil: http: invalid Host header
> -    --- FAIL: TestAttachWithoutTTy (0.02s)
> -    FAIL
> -
> -With this patch applied:
> -
> -    make GO_VERSION=1.20.6 TEST_FILTER=TestAttach test-integration
> -    INFO: Testing against a local daemon
> -    === RUN   TestAttachWithTTY
> -    --- PASS: TestAttachWithTTY (0.12s)
> -    === RUN   TestAttachWithoutTTy
> -    --- PASS: TestAttachWithoutTTy (0.02s)
> -    PASS
> -
> -[1]: https://github.com/advisories/GHSA-f8f7-69v5-w4vx
> -
> -Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
> -(cherry picked from commit 92975f0c11f0566cc3c36659f5e3bb9faf5cb176)
> -Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
> ----
> - client/client.go       | 30 ++++++++++++++++++++++++++++++
> - client/hijack.go       |  6 +++++-
> - client/request.go      | 10 ++++------
> - client/request_test.go |  4 ++--
> - 4 files changed, 41 insertions(+), 9 deletions(-)
> -
> -diff --git a/client/client.go b/client/client.go
> -index 1c081a51ae..54fa36cca8 100644
> ---- a/client/client.go
> -+++ b/client/client.go
> -@@ -56,6 +56,36 @@ import (
> -       "github.com/pkg/errors"
> - )
> -
> -+// DummyHost is a hostname used for local communication.
> -+//
> -+// It acts as a valid formatted hostname for local connections (such as "unix://"
> -+// or "npipe://") which do not require a hostname. It should never be resolved,
> -+// but uses the special-purpose ".localhost" TLD (as defined in [RFC 2606, Section 2]
> -+// and [RFC 6761, Section 6.3]).
> -+//
> -+// [RFC 7230, Section 5.4] defines that an empty header must be used for such
> -+// cases:
> -+//
> -+//    If the authority component is missing or undefined for the target URI,
> -+//    then a client MUST send a Host header field with an empty field-value.
> -+//
> -+// However, [Go stdlib] enforces the semantics of HTTP(S) over TCP, does not
> -+// allow an empty header to be used, and requires req.URL.Scheme to be either
> -+// "http" or "https".
> -+//
> -+// For further details, refer to:
> -+//
> -+//   - https://github.com/docker/engine-api/issues/189
> -+//   - https://github.com/golang/go/issues/13624
> -+//   - https://github.com/golang/go/issues/61076
> -+//   - https://github.com/moby/moby/issues/45935
> -+//
> -+// [RFC 2606, Section 2]: https://www.rfc-editor.org/rfc/rfc2606.html#section-2
> -+// [RFC 6761, Section 6.3]: https://www.rfc-editor.org/rfc/rfc6761#section-6.3
> -+// [RFC 7230, Section 5.4]: https://datatracker.ietf.org/doc/html/rfc7230#section-5.4
> -+// [Go stdlib]: https://github.com/golang/go/blob/6244b1946bc2101b01955468f1be502dbadd6807/src/net/http/transport.go#L558-L569
> -+const DummyHost = "api.moby.localhost"
> -+
> - // ErrRedirect is the error returned by checkRedirect when the request is non-GET.
> - var ErrRedirect = errors.New("unexpected redirect in response")
> -
> -diff --git a/client/hijack.go b/client/hijack.go
> -index 6bdacab10a..4dcaaca4c5 100644
> ---- a/client/hijack.go
> -+++ b/client/hijack.go
> -@@ -64,7 +64,11 @@ func fallbackDial(proto, addr string, tlsConfig *tls.Config) (net.Conn, error) {
> - }
> -
> - func (cli *Client) setupHijackConn(ctx context.Context, req *http.Request, proto string) (net.Conn, string, error) {
> --      req.Host = cli.addr
> -+      req.URL.Host = cli.addr
> -+      if cli.proto == "unix" || cli.proto == "npipe" {
> -+              // Override host header for non-tcp connections.
> -+              req.Host = DummyHost
> -+      }
> -       req.Header.Set("Connection", "Upgrade")
> -       req.Header.Set("Upgrade", proto)
> -
> -diff --git a/client/request.go b/client/request.go
> -index c799095c12..bcedcf3bd9 100644
> ---- a/client/request.go
> -+++ b/client/request.go
> -@@ -96,16 +96,14 @@ func (cli *Client) buildRequest(method, path string, body io.Reader, headers hea
> -               return nil, err
> -       }
> -       req = cli.addHeaders(req, headers)
> -+      req.URL.Scheme = cli.scheme
> -+      req.URL.Host = cli.addr
> -
> -       if cli.proto == "unix" || cli.proto == "npipe" {
> --              // For local communications, it doesn't matter what the host is. We just
> --              // need a valid and meaningful host name. (See #189)
> --              req.Host = "docker"
> -+              // Override host header for non-tcp connections.
> -+              req.Host = DummyHost
> -       }
> -
> --      req.URL.Host = cli.addr
> --      req.URL.Scheme = cli.scheme
> --
> -       if expectedPayload && req.Header.Get("Content-Type") == "" {
> -               req.Header.Set("Content-Type", "text/plain")
> -       }
> -diff --git a/client/request_test.go b/client/request_test.go
> -index 6e5a6e81f2..50b09d954c 100644
> ---- a/client/request_test.go
> -+++ b/client/request_test.go
> -@@ -29,12 +29,12 @@ func TestSetHostHeader(t *testing.T) {
> -       }{
> -               {
> -                       "unix:///var/run/docker.sock",
> --                      "docker",
> -+                      DummyHost,
> -                       "/var/run/docker.sock",
> -               },
> -               {
> -                       "npipe:////./pipe/docker_engine",
> --                      "docker",
> -+                      DummyHost,
> -                       "//./pipe/docker_engine",
> -               },
> -               {
> ---
> -2.41.0
> -
> diff --git a/package/docker-engine/0002-pkg-plugins-use-a-dummy-hostname-for-local-connectio.patch b/package/docker-engine/0002-pkg-plugins-use-a-dummy-hostname-for-local-connectio.patch
> deleted file mode 100644
> index 5bd8682927..0000000000
> --- a/package/docker-engine/0002-pkg-plugins-use-a-dummy-hostname-for-local-connectio.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -From 09306e7eb3c26ade69ef1e4c99d5b1fd9c0b7364 Mon Sep 17 00:00:00 2001
> -From: Sebastiaan van Stijn <github@gone.nl>
> -Date: Wed, 12 Jul 2023 15:07:59 +0200
> -Subject: [PATCH] pkg/plugins: use a dummy hostname for local connections
> -
> -For local communications (npipe://, unix://), the hostname is not used,
> -but we need valid and meaningful hostname.
> -
> -The current code used the socket path as hostname, which gets rejected by
> -go1.20.6 and go1.19.11 because of a security fix for [CVE-2023-29406 ][1],
> -which was implemented in  https://go.dev/issue/60374.
> -
> -Prior versions go Go would clean the host header, and strip slashes in the
> -process, but go1.20.6 and go1.19.11 no longer do, and reject the host
> -header.
> -
> -Before this patch, tests would fail on go1.20.6:
> -
> -    === FAIL: pkg/authorization TestAuthZRequestPlugin (15.01s)
> -    time="2023-07-12T12:53:45Z" level=warning msg="Unable to connect to plugin: //tmp/authz2422457390/authz-test-plugin.sock/AuthZPlugin.AuthZReq: Post \"http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq\": http: invalid Host header, retrying in 1s"
> -    time="2023-07-12T12:53:46Z" level=warning msg="Unable to connect to plugin: //tmp/authz2422457390/authz-test-plugin.sock/AuthZPlugin.AuthZReq: Post \"http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq\": http: invalid Host header, retrying in 2s"
> -    time="2023-07-12T12:53:48Z" level=warning msg="Unable to connect to plugin: //tmp/authz2422457390/authz-test-plugin.sock/AuthZPlugin.AuthZReq: Post \"http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq\": http: invalid Host header, retrying in 4s"
> -    time="2023-07-12T12:53:52Z" level=warning msg="Unable to connect to plugin: //tmp/authz2422457390/authz-test-plugin.sock/AuthZPlugin.AuthZReq: Post \"http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq\": http: invalid Host header, retrying in 8s"
> -        authz_unix_test.go:82: Failed to authorize request Post "http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq": http: invalid Host header
> -
> -[1]: https://github.com/advisories/GHSA-f8f7-69v5-w4vx
> -
> -Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
> -(cherry picked from commit 6b7705d5b29e226a24902a8dcc488836faaee33c)
> -Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
> ----
> - pkg/plugins/client.go | 14 ++++++++++++--
> - 1 file changed, 12 insertions(+), 2 deletions(-)
> -
> -diff --git a/pkg/plugins/client.go b/pkg/plugins/client.go
> -index 752fecd0ae..e683eb777d 100644
> ---- a/pkg/plugins/client.go
> -+++ b/pkg/plugins/client.go
> -@@ -18,6 +18,12 @@ import (
> -
> - const (
> -       defaultTimeOut = 30
> -+
> -+      // dummyHost is a hostname used for local communication.
> -+      //
> -+      // For local communications (npipe://, unix://), the hostname is not used,
> -+      // but we need valid and meaningful hostname.
> -+      dummyHost = "plugin.moby.localhost"
> - )
> -
> - func newTransport(addr string, tlsConfig *tlsconfig.Options) (transport.Transport, error) {
> -@@ -44,8 +50,12 @@ func newTransport(addr string, tlsConfig *tlsconfig.Options) (transport.Transpor
> -               return nil, err
> -       }
> -       scheme := httpScheme(u)
> --
> --      return transport.NewHTTPTransport(tr, scheme, socket), nil
> -+      hostName := u.Host
> -+      if hostName == "" || u.Scheme == "unix" || u.Scheme == "npipe" {
> -+              // Override host header for non-tcp connections.
> -+              hostName = dummyHost
> -+      }
> -+      return transport.NewHTTPTransport(tr, scheme, hostName), nil
> - }
> -
> - // NewClient creates a new plugin client (http).
> ---
> -2.41.0
> -
>
>
> ------------------------------
>
> Message: 34
> Date: Tue, 26 Sep 2023 23:40:54 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.02.x] Revert
>          "package/docker-cli: backport fix for host header check"
> Message-ID: <20230926214535.E846C81D55@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=4983ac79ff7da263392fb347b5b8f70bd8180c21
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x
>
> This reverts commit ce1b80f27dc86d7b23aa221b7d1601dcd57e451e.
>
> With the bump to go 1.19.13, this workaround is no longer needed.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   ...001-backport-fix-for-go-Host-header-check.patch | 127 ---------------------
>   1 file changed, 127 deletions(-)
>
> diff --git a/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch b/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch
> deleted file mode 100644
> index 2b58582538..0000000000
> --- a/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch
> +++ /dev/null
> @@ -1,127 +0,0 @@
> -From 4dc783e2bdf414761ef7c209b435d0a30f17c858 Mon Sep 17 00:00:00 2001
> -From: Sebastiaan van Stijn <github@gone.nl>
> -Date: Sat, 15 Jul 2023 02:22:10 +0200
> -Subject: [PATCH] backport fix for go Host header check
> -
> -Go 1.20.6 and 1.19.11 include a security check of the http Host header:
> -
> -  https://github.com/golang/go/issues/60374
> -
> -docker-cli fails this check:
> -
> -  $ docker exec -it ctr bash
> -  http: invalid Host header
> -
> -This is a backported patch to fix this issue.
> -
> -Issue: https://github.com/moby/moby/issues/45935
> -Upstream PR: https://github.com/moby/moby/pull/45942
> -
> -The upstream PR has been merged and will be included in v24.0.5.
> -
> -Signed-off-by: Christian Stewart <christian@aperture.us>
> -[Peter: drop vendor.mod/vendor.sum changes]
> ----
> -
> -For local communications (npipe://, unix://), the hostname is not used,
> -but we need valid and meaningful hostname.
> -
> -The current code used the socket path as hostname, which gets rejected by
> -go1.20.6 and go1.19.11 because of a security fix for [CVE-2023-29406 ][1],
> -which was implemented in  https://go.dev/issue/60374.
> -
> -Prior versions go Go would clean the host header, and strip slashes in the
> -process, but go1.20.6 and go1.19.11 no longer do, and reject the host
> -header.
> ----
> - .../github.com/docker/docker/client/client.go | 30 +++++++++++++++++
> - .../github.com/docker/docker/client/hijack.go |  6 +++-
> - .../docker/docker/client/request.go           | 10 +++---
> - 4 files changed, 72 insertions(+), 40 deletions(-)
> -
> -diff --git a/vendor/github.com/docker/docker/client/client.go b/vendor/github.com/docker/docker/client/client.go
> -index 1c081a51ae..54fa36cca8 100644
> ---- a/vendor/github.com/docker/docker/client/client.go
> -+++ b/vendor/github.com/docker/docker/client/client.go
> -@@ -56,6 +56,36 @@ import (
> -       "github.com/pkg/errors"
> - )
> -
> -+// DummyHost is a hostname used for local communication.
> -+//
> -+// It acts as a valid formatted hostname for local connections (such as "unix://"
> -+// or "npipe://") which do not require a hostname. It should never be resolved,
> -+// but uses the special-purpose ".localhost" TLD (as defined in [RFC 2606, Section 2]
> -+// and [RFC 6761, Section 6.3]).
> -+//
> -+// [RFC 7230, Section 5.4] defines that an empty header must be used for such
> -+// cases:
> -+//
> -+//    If the authority component is missing or undefined for the target URI,
> -+//    then a client MUST send a Host header field with an empty field-value.
> -+//
> -+// However, [Go stdlib] enforces the semantics of HTTP(S) over TCP, does not
> -+// allow an empty header to be used, and requires req.URL.Scheme to be either
> -+// "http" or "https".
> -+//
> -+// For further details, refer to:
> -+//
> -+//   - https://github.com/docker/engine-api/issues/189
> -+//   - https://github.com/golang/go/issues/13624
> -+//   - https://github.com/golang/go/issues/61076
> -+//   - https://github.com/moby/moby/issues/45935
> -+//
> -+// [RFC 2606, Section 2]: https://www.rfc-editor.org/rfc/rfc2606.html#section-2
> -+// [RFC 6761, Section 6.3]: https://www.rfc-editor.org/rfc/rfc6761#section-6.3
> -+// [RFC 7230, Section 5.4]: https://datatracker.ietf.org/doc/html/rfc7230#section-5.4
> -+// [Go stdlib]: https://github.com/golang/go/blob/6244b1946bc2101b01955468f1be502dbadd6807/src/net/http/transport.go#L558-L569
> -+const DummyHost = "api.moby.localhost"
> -+
> - // ErrRedirect is the error returned by checkRedirect when the request is non-GET.
> - var ErrRedirect = errors.New("unexpected redirect in response")
> -
> -diff --git a/vendor/github.com/docker/docker/client/hijack.go b/vendor/github.com/docker/docker/client/hijack.go
> -index 6bdacab10a..4dcaaca4c5 100644
> ---- a/vendor/github.com/docker/docker/client/hijack.go
> -+++ b/vendor/github.com/docker/docker/client/hijack.go
> -@@ -64,7 +64,11 @@ func fallbackDial(proto, addr string, tlsConfig *tls.Config) (net.Conn, error) {
> - }
> -
> - func (cli *Client) setupHijackConn(ctx context.Context, req *http.Request, proto string) (net.Conn, string, error) {
> --      req.Host = cli.addr
> -+      req.URL.Host = cli.addr
> -+      if cli.proto == "unix" || cli.proto == "npipe" {
> -+              // Override host header for non-tcp connections.
> -+              req.Host = DummyHost
> -+      }
> -       req.Header.Set("Connection", "Upgrade")
> -       req.Header.Set("Upgrade", proto)
> -
> -diff --git a/vendor/github.com/docker/docker/client/request.go b/vendor/github.com/docker/docker/client/request.go
> -index c799095c12..bcedcf3bd9 100644
> ---- a/vendor/github.com/docker/docker/client/request.go
> -+++ b/vendor/github.com/docker/docker/client/request.go
> -@@ -96,16 +96,14 @@ func (cli *Client) buildRequest(method, path string, body io.Reader, headers hea
> -               return nil, err
> -       }
> -       req = cli.addHeaders(req, headers)
> -+      req.URL.Scheme = cli.scheme
> -+      req.URL.Host = cli.addr
> -
> -       if cli.proto == "unix" || cli.proto == "npipe" {
> --              // For local communications, it doesn't matter what the host is. We just
> --              // need a valid and meaningful host name. (See #189)
> --              req.Host = "docker"
> -+              // Override host header for non-tcp connections.
> -+              req.Host = DummyHost
> -       }
> -
> --      req.URL.Host = cli.addr
> --      req.URL.Scheme = cli.scheme
> --
> -       if expectedPayload && req.Header.Get("Content-Type") == "" {
> -               req.Header.Set("Content-Type", "text/plain")
> -       }
> ---
> -2.41.0
> -
>
>
> ------------------------------
>
> Message: 35
> Date: Tue, 26 Sep 2023 23:41:11 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit branch/2023.02.x] Revert
>          "package/docker-engine: backport fix for host header check"
> Message-ID: <20230926214536.00A9C81D5C@busybox.osuosl.org>
>
> commit: https://git.buildroot.net/buildroot/commit/?id=a0a7113ae8d7efd7455e361d320d5d8b60bb9b02
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x
>
> This reverts commit 0b608f0252f51b7d2f54219153976eac7e30669c.
>
> With the bump to go 1.19.13, this workaround is no longer needed.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   ...ne-a-dummy-hostname-to-use-for-local-conn.patch | 174 ---------------------
>   ...-use-a-dummy-hostname-for-local-connectio.patch |  69 --------
>   2 files changed, 243 deletions(-)
>
> diff --git a/package/docker-engine/0001-client-define-a-dummy-hostname-to-use-for-local-conn.patch b/package/docker-engine/0001-client-define-a-dummy-hostname-to-use-for-local-conn.patch
> deleted file mode 100644
> index c5f8d1eb71..0000000000
> --- a/package/docker-engine/0001-client-define-a-dummy-hostname-to-use-for-local-conn.patch
> +++ /dev/null
> @@ -1,174 +0,0 @@
> -From 8ced4331e5e3a6760465a8ce2bd42c66d3232c96 Mon Sep 17 00:00:00 2001
> -From: Sebastiaan van Stijn <github@gone.nl>
> -Date: Wed, 12 Jul 2023 14:15:38 +0200
> -Subject: [PATCH] client: define a "dummy" hostname to use for local
> - connections
> -
> -Go 1.20.6 and 1.19.11 include a security check of the http Host header:
> -
> -  https://github.com/golang/go/issues/60374
> -
> -This is a backported patch to fix this issue.
> -
> -Issue: https://github.com/moby/moby/issues/45935
> -Upstream PR: https://github.com/moby/moby/pull/45942
> -
> -The upstream PR has been merged and will be included in v24.0.5.
> -
> -Signed-off-by: Christian Stewart <christian@aperture.us>
> -
> ----
> -
> -For local communications (npipe://, unix://), the hostname is not used,
> -but we need valid and meaningful hostname.
> -
> -The current code used the client's `addr` as hostname in some cases, which
> -could contain the path for the unix-socket (`/var/run/docker.sock`), which
> -gets rejected by go1.20.6 and go1.19.11 because of a security fix for
> -[CVE-2023-29406 ][1], which was implemented in  https://go.dev/issue/60374.
> -
> -Prior versions go Go would clean the host header, and strip slashes in the
> -process, but go1.20.6 and go1.19.11 no longer do, and reject the host
> -header.
> -
> -This patch introduces a `DummyHost` const, and uses this dummy host for
> -cases where we don't need an actual hostname.
> -
> -Before this patch (using go1.20.6):
> -
> -    make GO_VERSION=1.20.6 TEST_FILTER=TestAttach test-integration
> -    === RUN   TestAttachWithTTY
> -        attach_test.go:46: assertion failed: error is not nil: http: invalid Host header
> -    --- FAIL: TestAttachWithTTY (0.11s)
> -    === RUN   TestAttachWithoutTTy
> -        attach_test.go:46: assertion failed: error is not nil: http: invalid Host header
> -    --- FAIL: TestAttachWithoutTTy (0.02s)
> -    FAIL
> -
> -With this patch applied:
> -
> -    make GO_VERSION=1.20.6 TEST_FILTER=TestAttach test-integration
> -    INFO: Testing against a local daemon
> -    === RUN   TestAttachWithTTY
> -    --- PASS: TestAttachWithTTY (0.12s)
> -    === RUN   TestAttachWithoutTTy
> -    --- PASS: TestAttachWithoutTTy (0.02s)
> -    PASS
> -
> -[1]: https://github.com/advisories/GHSA-f8f7-69v5-w4vx
> -
> -Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
> -(cherry picked from commit 92975f0c11f0566cc3c36659f5e3bb9faf5cb176)
> -Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
> ----
> - client/client.go       | 30 ++++++++++++++++++++++++++++++
> - client/hijack.go       |  6 +++++-
> - client/request.go      | 10 ++++------
> - client/request_test.go |  4 ++--
> - 4 files changed, 41 insertions(+), 9 deletions(-)
> -
> -diff --git a/client/client.go b/client/client.go
> -index 1c081a51ae..54fa36cca8 100644
> ---- a/client/client.go
> -+++ b/client/client.go
> -@@ -56,6 +56,36 @@ import (
> -       "github.com/pkg/errors"
> - )
> -
> -+// DummyHost is a hostname used for local communication.
> -+//
> -+// It acts as a valid formatted hostname for local connections (such as "unix://"
> -+// or "npipe://") which do not require a hostname. It should never be resolved,
> -+// but uses the special-purpose ".localhost" TLD (as defined in [RFC 2606, Section 2]
> -+// and [RFC 6761, Section 6.3]).
> -+//
> -+// [RFC 7230, Section 5.4] defines that an empty header must be used for such
> -+// cases:
> -+//
> -+//    If the authority component is missing or undefined for the target URI,
> -+//    then a client MUST send a Host header field with an empty field-value.
> -+//
> -+// However, [Go stdlib] enforces the semantics of HTTP(S) over TCP, does not
> -+// allow an empty header to be used, and requires req.URL.Scheme to be either
> -+// "http" or "https".
> -+//
> -+// For further details, refer to:
> -+//
> -+//   - https://github.com/docker/engine-api/issues/189
> -+//   - https://github.com/golang/go/issues/13624
> -+//   - https://github.com/golang/go/issues/61076
> -+//   - https://github.com/moby/moby/issues/45935
> -+//
> -+// [RFC 2606, Section 2]: https://www.rfc-editor.org/rfc/rfc2606.html#section-2
> -+// [RFC 6761, Section 6.3]: https://www.rfc-editor.org/rfc/rfc6761#section-6.3
> -+// [RFC 7230, Section 5.4]: https://datatracker.ietf.org/doc/html/rfc7230#section-5.4
> -+// [Go stdlib]: https://github.com/golang/go/blob/6244b1946bc2101b01955468f1be502dbadd6807/src/net/http/transport.go#L558-L569
> -+const DummyHost = "api.moby.localhost"
> -+
> - // ErrRedirect is the error returned by checkRedirect when the request is non-GET.
> - var ErrRedirect = errors.New("unexpected redirect in response")
> -
> -diff --git a/client/hijack.go b/client/hijack.go
> -index 6bdacab10a..4dcaaca4c5 100644
> ---- a/client/hijack.go
> -+++ b/client/hijack.go
> -@@ -64,7 +64,11 @@ func fallbackDial(proto, addr string, tlsConfig *tls.Config) (net.Conn, error) {
> - }
> -
> - func (cli *Client) setupHijackConn(ctx context.Context, req *http.Request, proto string) (net.Conn, string, error) {
> --      req.Host = cli.addr
> -+      req.URL.Host = cli.addr
> -+      if cli.proto == "unix" || cli.proto == "npipe" {
> -+              // Override host header for non-tcp connections.
> -+              req.Host = DummyHost
> -+      }
> -       req.Header.Set("Connection", "Upgrade")
> -       req.Header.Set("Upgrade", proto)
> -
> -diff --git a/client/request.go b/client/request.go
> -index c799095c12..bcedcf3bd9 100644
> ---- a/client/request.go
> -+++ b/client/request.go
> -@@ -96,16 +96,14 @@ func (cli *Client) buildRequest(method, path string, body io.Reader, headers hea
> -               return nil, err
> -       }
> -       req = cli.addHeaders(req, headers)
> -+      req.URL.Scheme = cli.scheme
> -+      req.URL.Host = cli.addr
> -
> -       if cli.proto == "unix" || cli.proto == "npipe" {
> --              // For local communications, it doesn't matter what the host is. We just
> --              // need a valid and meaningful host name. (See #189)
> --              req.Host = "docker"
> -+              // Override host header for non-tcp connections.
> -+              req.Host = DummyHost
> -       }
> -
> --      req.URL.Host = cli.addr
> --      req.URL.Scheme = cli.scheme
> --
> -       if expectedPayload && req.Header.Get("Content-Type") == "" {
> -               req.Header.Set("Content-Type", "text/plain")
> -       }
> -diff --git a/client/request_test.go b/client/request_test.go
> -index 6e5a6e81f2..50b09d954c 100644
> ---- a/client/request_test.go
> -+++ b/client/request_test.go
> -@@ -29,12 +29,12 @@ func TestSetHostHeader(t *testing.T) {
> -       }{
> -               {
> -                       "unix:///var/run/docker.sock",
> --                      "docker",
> -+                      DummyHost,
> -                       "/var/run/docker.sock",
> -               },
> -               {
> -                       "npipe:////./pipe/docker_engine",
> --                      "docker",
> -+                      DummyHost,
> -                       "//./pipe/docker_engine",
> -               },
> -               {
> ---
> -2.41.0
> -
> diff --git a/package/docker-engine/0002-pkg-plugins-use-a-dummy-hostname-for-local-connectio.patch b/package/docker-engine/0002-pkg-plugins-use-a-dummy-hostname-for-local-connectio.patch
> deleted file mode 100644
> index 5bd8682927..0000000000
> --- a/package/docker-engine/0002-pkg-plugins-use-a-dummy-hostname-for-local-connectio.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -From 09306e7eb3c26ade69ef1e4c99d5b1fd9c0b7364 Mon Sep 17 00:00:00 2001
> -From: Sebastiaan van Stijn <github@gone.nl>
> -Date: Wed, 12 Jul 2023 15:07:59 +0200
> -Subject: [PATCH] pkg/plugins: use a dummy hostname for local connections
> -
> -For local communications (npipe://, unix://), the hostname is not used,
> -but we need valid and meaningful hostname.
> -
> -The current code used the socket path as hostname, which gets rejected by
> -go1.20.6 and go1.19.11 because of a security fix for [CVE-2023-29406 ][1],
> -which was implemented in  https://go.dev/issue/60374.
> -
> -Prior versions go Go would clean the host header, and strip slashes in the
> -process, but go1.20.6 and go1.19.11 no longer do, and reject the host
> -header.
> -
> -Before this patch, tests would fail on go1.20.6:
> -
> -    === FAIL: pkg/authorization TestAuthZRequestPlugin (15.01s)
> -    time="2023-07-12T12:53:45Z" level=warning msg="Unable to connect to plugin: //tmp/authz2422457390/authz-test-plugin.sock/AuthZPlugin.AuthZReq: Post \"http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq\": http: invalid Host header, retrying in 1s"
> -    time="2023-07-12T12:53:46Z" level=warning msg="Unable to connect to plugin: //tmp/authz2422457390/authz-test-plugin.sock/AuthZPlugin.AuthZReq: Post \"http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq\": http: invalid Host header, retrying in 2s"
> -    time="2023-07-12T12:53:48Z" level=warning msg="Unable to connect to plugin: //tmp/authz2422457390/authz-test-plugin.sock/AuthZPlugin.AuthZReq: Post \"http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq\": http: invalid Host header, retrying in 4s"
> -    time="2023-07-12T12:53:52Z" level=warning msg="Unable to connect to plugin: //tmp/authz2422457390/authz-test-plugin.sock/AuthZPlugin.AuthZReq: Post \"http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq\": http: invalid Host header, retrying in 8s"
> -        authz_unix_test.go:82: Failed to authorize request Post "http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq": http: invalid Host header
> -
> -[1]: https://github.com/advisories/GHSA-f8f7-69v5-w4vx
> -
> -Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
> -(cherry picked from commit 6b7705d5b29e226a24902a8dcc488836faaee33c)
> -Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
> ----
> - pkg/plugins/client.go | 14 ++++++++++++--
> - 1 file changed, 12 insertions(+), 2 deletions(-)
> -
> -diff --git a/pkg/plugins/client.go b/pkg/plugins/client.go
> -index 752fecd0ae..e683eb777d 100644
> ---- a/pkg/plugins/client.go
> -+++ b/pkg/plugins/client.go
> -@@ -18,6 +18,12 @@ import (
> -
> - const (
> -       defaultTimeOut = 30
> -+
> -+      // dummyHost is a hostname used for local communication.
> -+      //
> -+      // For local communications (npipe://, unix://), the hostname is not used,
> -+      // but we need valid and meaningful hostname.
> -+      dummyHost = "plugin.moby.localhost"
> - )
> -
> - func newTransport(addr string, tlsConfig *tlsconfig.Options) (transport.Transport, error) {
> -@@ -44,8 +50,12 @@ func newTransport(addr string, tlsConfig *tlsconfig.Options) (transport.Transpor
> -               return nil, err
> -       }
> -       scheme := httpScheme(u)
> --
> --      return transport.NewHTTPTransport(tr, scheme, socket), nil
> -+      hostName := u.Host
> -+      if hostName == "" || u.Scheme == "unix" || u.Scheme == "npipe" {
> -+              // Override host header for non-tcp connections.
> -+              hostName = dummyHost
> -+      }
> -+      return transport.NewHTTPTransport(tr, scheme, hostName), nil
> - }
> -
> - // NewClient creates a new plugin client (http).
> ---
> -2.41.0
> -
>
>
> ------------------------------
>
> Subject: Digest Footer
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>
>
> ------------------------------
>
> End of buildroot Digest, Vol 207, Issue 55
> ******************************************


-- 
Thanks,
Nayab

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

