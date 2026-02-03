Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFABE8782F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B80981992;
	Tue,  3 Feb 2026 13:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WU3YAXLJiEEs; Tue,  3 Feb 2026 13:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28FEA81EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126825;
	bh=bRPDEvgAoxrOUzwvncCWkJmTHayFY4pvoiDYsPnxOQY=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FkN9Qhl5SI/L9Adxhhy5HpJlM9plIKo8s7bkcSUnf+kxh4DvGAnVQz1JvSfV7VSBf
	 dsjfQM1OHZqI1S5tOB4Op296JUcEzfEa3CitMAhs4SEIK0mHuTmel4neFDyfZxDqTC
	 ePhQSskmiFzcRVxy3jTZ5bWXw4sO1LOljZwkBABWzGKUR7MNrkGjwOhp7JyA9qyJvq
	 dr4/lxG2B5vnvWZH7HeLvbUDNt+wFv58z/rcN6YhwiFAb5UDAgYPWua/iEZqkU4tae
	 AiPQrrxsY24kB4VSJKM7P8xdKSk4kBuaAslKT4H0G713icnL9uqMVNKcerwHZHh60d
	 1KyVUtcJstBYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28FEA81EA1;
	Tue,  3 Feb 2026 13:53:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82AC2F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BAC140259
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1Mp6kGsWq7Z for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:53:42 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::609;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E7C340060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E7C340060
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0609.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::609])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E7C340060
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=p8Ab1Pu0fMP6PPedaSDmeggS1bOZA8xAKqg6p49Sho4S89y9XROeMwvqaCBxrIXe9t0e3+eY/QwC5tLyWC7ssmMfMd/Vr4SEgwOOI62lTp4MkGk+8V+lWYzrPKz2/IuP9MuTuOhu3p1GhbewawyKh/4/gODtFystjaTGvoYMY7I8nNkYkAPlKlOiai8GfT62UUxOXMp+pGZIOcLMMGoxV4ywJoKRq7uAvCwxMYMcUjkncNRLWBTBm1LP7nX8KP0La6dt5JHI/MgPhR/Zowi/FkFUGPbqhF0KCoIQy+/AJnu/Tdpjsf0ljYGVZk+sMq5b20djZZlbdSCqozNAJOs5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQOT/fSxwR28+TJyPXD7ljIyv8kPOovGhUHm/futbts=;
 b=Z0O3GcXdmcjzvtejRbT48Fq++iHI3Gdl6IhYmXRB67LV2kjNZOHz8dKyV6CMlXCpd6/xMqsRbcfNB4rdsN3UTGhcgglNAO4ujZ0lHDRsZcsRNAJHBUkOVXtHNoi2v4aIxVXoEt8Rr9rBRMI80OX3sE4ZcyHV9hjDQCQVqxL7EpEeja/edB4SVQDHMqnqAt7DPhoWYkefAbhJZ3yl59oWDr6Q5Mmr9I6SY+OgZf1PSKqbkBJp1LPv0wEa9jYSfjgIUskh7/Ex6hbHF4dVOtUUY1+ky9DeymZsUZSW8tels4x7jDlX/OsNmoKNJB1RdSB3Gc+ZBfgvkYZlIGz4S6tExQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1618.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:188::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 13:53:33 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 13:53:33 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
CC: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, Romain Naour
 <romain.naour@smile.fr>
Thread-Topic: [Buildroot] [PATCH 1/1] package/python-pybind: install headers
 into host directory
Thread-Index: AQHclRR8+RnLfMR070WXoLZHoXJvcQ==
Date: Tue, 3 Feb 2026 13:53:33 +0000
Message-ID: <PH1P110MB1603980A8BCF610A0550E2329F9BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260101134901.882436-1-bernd@kuhls.net>
 <CADvTj4omtKN31WgG0cP=Gr9EBEqW1-Q1guBOKwgMB1gUCxe3gA@mail.gmail.com>
 <PH1P110MB16031EE97EF70A7F79F5B8079F9BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB16031EE97EF70A7F79F5B8079F9BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1618:EE_
x-ms-office365-filtering-correlation-id: 48e90a48-6221-408a-c026-08de632b9efd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?aTRCaXJoYVpoeUw5NTdZM05tUUNwZldkRG1lZ2JDUERkdWpYSWhOeUNzVzc5?=
 =?utf-8?B?Vk5qb3JKVC9CdkhxbXoycy90SnpsaXZKRnJsNFhRK3JuQ0d3VXZoQUM5WWor?=
 =?utf-8?B?ditOdTF2QU1mcmJoeVFlejFmTFkybjJEcU1hMEJOV1FDS2xTVDA5YXNRNXNY?=
 =?utf-8?B?R0psZXlXT0s5UEYrT012VmovQTVwNGMzS3lCVGpsSE1IRlh6dmN6aUs1UlFz?=
 =?utf-8?B?YVVSMWNHSVhxNjhkRm9EbnRySGdRZnhYa1lTVDJ3M3h1WjZkdk80MVk5VG5v?=
 =?utf-8?B?eE8ySHRGZDhNT0krZ25ndkxpckpETG81akQzQlNiMUJEYzkxdFU3WmNDZWI4?=
 =?utf-8?B?d2NQVXQvVkNua1pLNmVlMGYwamwwajhMaVJVVi9XRlU1MWVTeXZQR1NzMGto?=
 =?utf-8?B?QTRkcVdxMy84L28zRlNmUGsvZUJGRDU4ZmhvSmsveUhxNEh2UCs5MExnd0hR?=
 =?utf-8?B?V2gvMlNEWmg2TGp4c1VZRFhCZ0pRV1NZclhIeTl1SkhjejlVcXpzRitDdU5C?=
 =?utf-8?B?TzZaRmtHbk9sNVFKV3V2RGtySEQvZU5BVlpTWldkMVhlNEVvdXA2b2N3R3dJ?=
 =?utf-8?B?dWkwamtONnNkdWdUVHdTayt2RFp3ZVVWOUpJSXN6OXE0WTBTTFl2cVgrdjZ5?=
 =?utf-8?B?UWRUNU9NeVN0c0Z3UGl3WUI5Uk16TzhlMTEyM3dnUkhpNUxKZkFaSERUd0Mr?=
 =?utf-8?B?UlJwNmRrVTBST1FYcjdrcERTK3NnMWdiZk5teUNsVU1nNmhoVUVtK3gwWDZ3?=
 =?utf-8?B?d2xtMGNpNW1YMUs1NmlkbVJubDdKMW50QlJnSHl0MzNOVWpMV1Zxd1YyNHB2?=
 =?utf-8?B?eVNpOXloZ3kxSTh2V2IwS21WYjJsTEY5aWZTVDJFVGF1SEZPSFA5TjF0VlV6?=
 =?utf-8?B?cFJCTXN1OGEwZHUvcmlqU2hDa0pPM1R0Y1JMSDRpVzZoTzVYZnZNNWV0anJz?=
 =?utf-8?B?WDBDdDdIMzJDbnJXYjVlMTVWV0RxaXdKb21UR0IvRUlVRjRaTHlXM1JRd0NB?=
 =?utf-8?B?eG9QL3Y5L2FDaitvTVJYdG9Da0I5RVc5UXluUVg3NnJYaWtPWFVqV2pKTXBX?=
 =?utf-8?B?NHJUa3YvZlVoVGdRU29ZOHNXRW9WclRaYjZJNVhmSGpjb3hKYjc5SlFSanpi?=
 =?utf-8?B?MWxwTXR5d2I4b3RNVXgxTHFTaEttbFo1THlTNkpiVGNHVkpJNWRJQTdzRGk5?=
 =?utf-8?B?SmZHay9HNnNPOGV2NU91RUtCdnl4dTZVZ3h5UGljT3hSWURUQUM0bGZuc3d0?=
 =?utf-8?B?K2xjdlBuUEVVWWc0UFcrTFptL25TRlNESkc2Qlhtb2hqNzVXL3krTGRaeGEy?=
 =?utf-8?B?WU45R1dNTWFpL1BQK2g5MDVzWkxKejEvUWQ2UUtWdHBIeTVDYU1zaWlFTXU4?=
 =?utf-8?B?cnhwcnNpRG9DTHBTa1lGaTVWL2x2dHRFYVE1QUczYjJxNE1JczhMdDhTVGRN?=
 =?utf-8?B?QytoMk0wUklkbVMrZXZ0OVk2VkkxWkk3M1FVSGE2aG96RlJVYWVZU1F1ZU80?=
 =?utf-8?B?cUdJS1d4QWRtdkFPN1hBSWZyNTFlWElYWExCNTBmRi9VRXdTaUM1Z25IMlZn?=
 =?utf-8?B?RXNJNkI5Q0RFMCtycDFiSFhUb09XMWVSSitEb3lsNmx5Sk8yRmJ2RGFUNjZR?=
 =?utf-8?B?VVNGUzJuR094eWlrUkovNVB0bm93N0YxVHNYOFF3K25DeWYxaG5Ld3RsZStL?=
 =?utf-8?B?NkJMNTZhTG9pTWd2cEE4VnBVMlZjckhhNHlLU0ZKTURzcThXQ1FoRUhRbE1F?=
 =?utf-8?B?Rkh5L3ZFd2o3SllUTmNnTEtoZlptZTJUVmtJd2t3STBwMXRSeVAxeGtiTkxE?=
 =?utf-8?B?cENOak50MldrT2lQWGFaU0RiOUtlZWpIUHRPRnp3dHRWOGZVcTNlWnY5bitO?=
 =?utf-8?B?QUxDQ1AyUzQrbGlTMlVpMFNaQlMxRkk3UFRZeGVsWDFzeXFOSnVTSEh3bzFR?=
 =?utf-8?B?OVBYSGljTWFHZVI4YVJEQ29JQWdXRjZaVndhaTVOQjV2M3IwYWtacWhVbDNy?=
 =?utf-8?B?NjVzNjR6Z1o4SDN2NEFTM3RXWjZ0dklUbjRFaFZFM2dCRnc2amorSzZ5RnF5?=
 =?utf-8?B?dkVNdzBoOUpBZUFCWjhiOUlBWTNHeWE2VjdhNGZITUczTFA4bC9Tc0Z3aGcy?=
 =?utf-8?Q?Udx7Me1umMSz6HOlHRkgQ40aV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cldKVGVwT3BSMjBwQ0xYR0pKdGtHOVd6OVdnWkN2dFBBL0UwbmZuTVNJN2lu?=
 =?utf-8?B?MEozQzJWUVFKZm83Y2ljaDgzOVpLL0hIYjJDYnp1SXZsNGJjenFQN0pVT1Z0?=
 =?utf-8?B?TFNZQWZDRXdlUVUxc0g5RWYxZkNpM0hjQkhaN2lLd3I1Tm1tcjZDM1NmUVFO?=
 =?utf-8?B?RUZndGNLdS9nQ2hpUm1tSXEwL2pVSDVidWMyN1l5K2VsK0NzdVpUTHVLbGVF?=
 =?utf-8?B?ajQra3R1eFJyaGlzNkdObmRET25jVWhXcEplbDI1NkFHUFREVGxUSFlGR2Fr?=
 =?utf-8?B?SmZPeFJwcEE3bm93MU5ZbFE0Mm5iWXJLem1hVWRSQXlaSyt5Y2ZhTzQycDRu?=
 =?utf-8?B?NjNUR0lwcnpZbGFyU2x2dDZneVNNby8zZFpiSW5pcURHamQwNk9UTlkrbzR0?=
 =?utf-8?B?YmRRUEgrRjFDaVFTVWcxZHhQQW9pQldmajYrMmlkN3FnbDltc1ArT29hdzBY?=
 =?utf-8?B?dG0wMmhydlpxSUJmajR3a2JRM0g2MUtsZTRNN3JpVTRCSENyL2V1V21KbG1k?=
 =?utf-8?B?Umw4OXVycWw1UVNoM3RLb3Z1dG0vQU1BYjl5S3FHTUM5SW1RTTNMK3cxTTBB?=
 =?utf-8?B?Q0o2VzhXSUsxeFZYQ0tadUk3b2lpbGFUeithTEJPZEcza2dVLzdCdjVpTFBs?=
 =?utf-8?B?MDJoMW5FakJyeUtaK1VqRlFPWnRPVFlON0ZlK0toVUxpTnlhQVdFeTNhRVdN?=
 =?utf-8?B?eXJYMjFYciszSVV2MVdsalNzSnQwTSt2dW9DWWdKTW1PdTh3NVl3cU9KbkNo?=
 =?utf-8?B?VUM5Zlg3YXpBUlduYUVVY242TjdCTzQwcFk1U0d3RlhNYy9odVVyQm1CNWhY?=
 =?utf-8?B?N1UvQVlqZUxHemExYUNVZHlUT0NSU0RkWkVxNGxwcmxjdjZGL1hCU3pnZFo3?=
 =?utf-8?B?czFjR1lXaFNWQWFVRnVBY2hvclVBM0pUUWIza0daQlE2dGdxaDBsS0xQN2R0?=
 =?utf-8?B?c1I2elZMSXo1Ymd0angvcHFBU3hIVEVqSTFtVUtydklzRW1iU2llSUVYL2pi?=
 =?utf-8?B?V2hkOW5oVmZnSThyYXJ4ckt0cUdwQ2poOEVwVWVEWDVIcVhRN2cvVUZvdnVn?=
 =?utf-8?B?ci9nSEFFb2lxQUlOcnRFM3VTdnN0UjZXSTdJKzdtZDBnOTZ5YjMva24zWWl2?=
 =?utf-8?B?K3RVU0duMHgyNTBqb1BxRy9uWFJxL013cHdoTWRUSWhJWXlFdnYwNGthb3lU?=
 =?utf-8?B?djRBalhKOXZIRXk4TFNNcURYZnd5Q3dQOWxkTmpIOGJSL2pWb1cwYU9lcC8y?=
 =?utf-8?B?NEp0TUMzOFh5WmhVMFgxK1EwNkVTUWVkSTIwUHA0VVVDL0RZV0RwcHJNZ0Z5?=
 =?utf-8?B?RXBJWmR4M0hJZkJlN1VxYjUzZ2VMbUNVNE04MmJPbzZuVjB2dkRmbFBMdCtQ?=
 =?utf-8?B?cnBCS0pVblp3bDg3Z0NCTDVlMGhqYXN1V1ZTWllremNQeUlIbXYvbi9vSTNE?=
 =?utf-8?B?bmtxS3ZqZUF2R2cyOWZQeGxkNUUwL0orY2M5YlpJZUJOM0l4RzA2VzNDOGFT?=
 =?utf-8?B?eEQ3dnIveVh6VFBPTXI1aFI4YzZoUjRzTGFkZG8zZEwrVlF6d25hb3lwaXEw?=
 =?utf-8?B?WEZoU0kyU2w5cU5GSXRab3ZBTFQ4S2UxMzAzM3R0d0NwYk5MaHdYUThWRXo0?=
 =?utf-8?B?V3d0QTJSdEhBSVg5WDBwamh4RnVnLzdCL2VrZXZUcWx0UHRyV2FXVzhXeTZx?=
 =?utf-8?B?YUwwUFpsZVlLQkRNeE9TY1VEdS9qYUIxV24zS3dmL1R6d1BiR1hmZ3FHZXla?=
 =?utf-8?B?VWp1SGUwTHdFT0p6cFU4WWYrcWNOa0J4eHI1WVdVR1BPWHlqUEN2VnJ5Zkpk?=
 =?utf-8?B?VUNMbC9yMUZHRWpSQXlEWVAyRHRJQ1d5N1lpVGhpa204a1plTXlRa0ZtbG82?=
 =?utf-8?B?cTU4ZVQxck1IYXZqaVlIZW5RKy9NMWNTajFobUhGZmNWTGRWWGM3VmZMYStW?=
 =?utf-8?B?WlBVZDIwSnl3Ym8vRk1JcGJTRnhMUmJRcEVFVi9RZlBYdmJYRXVRWENyWWt3?=
 =?utf-8?Q?OaPMkmpqBS3kDC0Hs0G0NnVK72cezI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e90a48-6221-408a-c026-08de632b9efd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 13:53:33.4931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1618
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQOT/fSxwR28+TJyPXD7ljIyv8kPOovGhUHm/futbts=;
 b=muf1aWIAGRQ7jXS56RjJ3zJln3OVR9t0mzckcUmvA7R+KDZSZlQgxlUrtRYmIjVx6gZGNYpKlrE2XtKjeOpNlE0GcMlaSCX2x8Vas8l8iJg4ZVOu+THwVSAOOvtiMEMkboAWc4oXP6xdEpKYxPqfVNBivQVDzOQnNjhOo01R00hHhjiMd2jrwwuLKYAPIvpWbHJNEfkcCT4MsPZn22YWoHUk9k8A6DmoWcwHthQ8sxff5aU+XhQhZ3TzOxcdv1B+3YDatX4hHaVhtqo5/TykdFJzrBETUjOkWGNGqh+F9BZIsL4HmcCEf6+3k20djilA+wSIOM9II1BIXI+1Gcyodg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=muf1aWIA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pybind: install headers
 into host directory
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYnVpbGRyb290IDxidWls
ZHJvb3QtYm91bmNlc0BidWlsZHJvb3Qub3JnPiBPbiBCZWhhbGYgT2YgVmluY2VudA0KPiBGYXpp
bw0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAzLCAyMDI2IDY6MDQgQU0NCj4gVG86IEphbWVz
IEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPjsgQmVybmQgS3VobHMNCj4gPGJl
cm5kQGt1aGxzLm5ldD4NCj4gQ2M6IEd1aWxsYXVtZSBXaWxsaWFtIEJycyA8Z3VpbGxhdW1lLmJy
ZXNzYWl4QGdtYWlsLmNvbT47DQo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnOyBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4NCj4gU3ViamVjdDogUmU6IFtCdWlsZHJvb3RdIFtF
eHRlcm5hbF0gLSBSZTogW1BBVENIIDEvMV0gcGFja2FnZS9weXRob24tcHliaW5kOg0KPiBpbnN0
YWxsIGhlYWRlcnMgaW50byBob3N0IGRpcmVjdG9yeQ0KPiANCj4gDQo+IA0KPiANCj4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IGJ1aWxkcm9vdCA8YnVpbGRyb290LWJv
dW5jZXNAYnVpbGRyb290Lm9yZz4gT24gQmVoYWxmIE9mIEphbWVzDQo+ID4gSGlsbGlhcmQNCj4g
PiBTZW50OiBTdW5kYXksIEphbnVhcnkgNCwgMjAyNiAxMjo0MCBQTQ0KPiA+IFRvOiBCZXJuZCBL
dWhscyA8YmVybmRAa3VobHMubmV0Pg0KPiA+IENjOiBHdWlsbGF1bWUgV2lsbGlhbSBCcnMgPGd1
aWxsYXVtZS5icmVzc2FpeEBnbWFpbC5jb20+Ow0KPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
DQo+ID4gU3ViamVjdDogW0V4dGVybmFsXSAtIFJlOiBbQnVpbGRyb290XSBbUEFUQ0ggMS8xXSBw
YWNrYWdlL3B5dGhvbi1weWJpbmQ6DQo+ID4gaW5zdGFsbCBoZWFkZXJzIGludG8gaG9zdCBkaXJl
Y3RvcnkNCj4gPg0KPiA+IE9uIFRodSwgSmFuIDEsIDIwMjYgYXQgNjo0OeKAr0FNIEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEZpeGVzIGJ1aWxkIGVy
cm9yIHdpdGggcHl0aG9uLXBpbGxvdyBzaW5jZSBpdHMgdmVyc2lvbiBidW1wIHRvIDEyLjAuMA0K
PiA+ID4gd2hpY2ggaW50cm9kdWNlZCBhIGRlcGVuZGVuY3kgdG8gcHliaW5kIHdpdGggYnVpbGRy
b290IGNvbW1pdA0KPiA+ID4gNWY0NDZhOGQ2ZGQ4NzE1Mzg1ZDZlMmRmMjcxNGYwNjRiZjI2MjQz
ZDoNCj4gPiA+DQo+ID4gPiBGaWxlTm90Rm91bmRFcnJvcjogW0Vycm5vIDJdIE5vIHN1Y2ggZmls
ZSBvciBkaXJlY3Rvcnk6DQo+ID4gPiAgJy9ob21lL2Jlcm5kL2J1aWxkcm9vdC9vdXRwdXQvaG9z
dC9saWIvcHl0aG9uMy4xMy9zaXRlLQ0KPiA+IHBhY2thZ2VzL2luY2x1ZGUvcHliaW5kMTEvZGV0
YWlsL2NvbW1vbi5oJw0KPiA+ID4NCj4gPiA+IHdpdGggdGhpcyBkZWZjb25maWc6DQo+ID4gPg0K
PiA+ID4gQlIyX3g4Nl82ND15DQo+ID4gPiBCUjJfeDg2X2NvcmVpNz15DQo+ID4gPiBCUjJfVE9P
TENIQUlOX0VYVEVSTkFMPXkNCj4gPiA+DQo+ID4NCj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9C
T09UTElOX1g4Nl82NF9DT1JFX0k3X0dMSUJDX0JMRUVESU5HXw0KPiA+IEVER0U9eQ0KPiA+ID4g
QlIyX1BBQ0tBR0VfUFlUSE9OMz15DQo+ID4gPiBCUjJfUEFDS0FHRV9QWVRIT05fUElMTE9XPXkN
Cj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0
Pg0KPiA+IFRlc3RlZC1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5j
b20+DQo+IA0KPiBUaGUgdXBzdHJlYW0gc2Rpc3QgaW5jbHVkZXMgdGhlIGMgaGVhZGVycyBpbiBh
biBpbmNsdWRlIGRpcmVjdG9yeSBsaWtlIHRoaXMNCj4gcGF0Y2gsIHNvIHRoaXMgc2VlbXMgcmVh
c29uYWJsZS4NCj4gDQo+IFNpbmNlIHdlJ3JlIGJ1aWxkaW5nIHRoZSBweWJpbmQgcGFja2FnZSBm
cm9tIHRoZSBnaXRodWIgc291cmNlcyBhdCBhIGtub3duDQo+IHJldmlzaW9uLCBpdCBjb3VsZCBi
ZSBhcmd1ZWQgdGhhdCB3ZSBjb3VsZCBqdXN0IGNvbXBsZXRlbHkgb3ZlcndyaXRlDQo+IGBfdmVy
c2lvbi5weWAgd2l0aCB0aGUgdmVyc2lvbiBpbmZvcm1hdGlvbiBpbnN0ZWFkIG9mIGNvcHlpbmcg
dGhlIGhlYWRlcnMgYW5kDQo+IHJlbHlpbmcgb24gdGhlIHNvdXJjZXMgcGFyc2luZyBhIEMgaGVh
ZGVyIHRvIGRldGVybWluZSB0aGUgdmVyc2lvbi4NCj4gDQo+IFRoZSB3aGVlbCBidWlsZCBvZiB0
aGUgcHliaW5kIHBhY2thZ2UgZG9lcyB0aGlzDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9weWJpbmQv
cHliaW5kMTEvYmxvYi84ZjY4ZWNkMzJjOGUxOGQzYjA2NGRiZjBlYTUNCj4gZmMzMWE2Y2IzN2U5
YS9weXByb2plY3QudG9tbCNMOTMNCj4gDQo+IEl0IGRvZXMgYWxzbyBjb3B5IHRoZSBoZWFkZXJz
IGludG8gdGhlIG1vZHVsZXMgaW5zdGFsbGF0aW9uLCBzbywgZWl0aGVyIHdheSwgdGhpcw0KPiBp
cyBwcm9iYWJseSAic2FmZXN0Ii4NCj4gDQoNCk9mIGNvdXJzZSwgSSBzYXkgdGhpcyBhbmQgdGhl
biByZWFsaXplOg0KDQpUaGUgaW5zdGFsbCBwYXRoIGZvciB0aGUgaGVhZGVycyBpcyAid3Jvbmci
IGZyb20gYSBweXRob24gcGFja2FnZSBzZW1hbnRpY3MgcGVyc3BlY3RpdmUuDQoNCkl0IG5vdyBt
YWtlcyBhIHBhY2thZ2UgY2FsbGVkICJpbmNsdWRlIiBpbXBvcnRhYmxlLCB3aGljaCBpcyBub3Qg
aWRlYWwgYXMgaXQgY29uZmxpY3RzIHdpdGggYSBwYWNrYWdlIG9mIHRoYXQgbmFtZSBsaWtlIGh0
dHBzOi8vZ2l0aHViLmNvbS9tYXhmaXNjaGVyMjc4MS9pbmNsdWRlDQoNCnZmYXppb0B2ZmF6aW8t
bDp+L2RldmVsb3BtZW50L2J1aWxkcm9vdCQgL2hvbWUvdmZhemlvL2RldmVsb3BtZW50L2J1aWxk
cm9vdC9vdXRwdXQvaG9zdC9iaW4vcHl0aG9uIC1jICJpbXBvcnQgaW5jbHVkZTsgcHJpbnQoaW5j
bHVkZS5fX3BhdGhfXykiDQpfTmFtZXNwYWNlUGF0aChbJy9ob21lL3ZmYXppby9kZXZlbG9wbWVu
dC9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvbGliL3B5dGhvbjMuMTQvc2l0ZS1wYWNrYWdlcy9pbmNs
dWRlJ10pDQoNCldlIGRvbid0IGhhdmUgdGhhdCBwYWNrYWdlIGluIEJ1aWRscm9vdCwgYnV0IHdl
IHNob3VsZCBhdm9pZCB0aGUgY29uZmxpY3QgcHJlLWVtcHRpdmVseS4NCg0KSSB0aGluayB0aGUg
YmVzdCBzb2x1dGlvbiBpcyB0byBvdmVyd3JpdGUgdGhlIGBfdmVyc2lvbi5weWAgZmlsZSBhbmQg
YXZvaWQgY29weWluZyBoZWFkZXJzIGluLg0KDQpXZSBjb3VsZCBtYWtlIGEgcGF0Y2ggdG8gZHJv
cCB0aGUgaGVhZGVyIHBhcnNpbmcgYW5kIG1ha2UgaXQgZWFzeSB0byB1c2UgYHNlZGAgdG8gcmVw
bGFjZSB0aGUgcGFja2FnZSdzIHZlcnNpb24uDQoNCklmIHdlIGNvcHkgaGVhZGVycyBpbiwgdGhl
IGBfdmVyc2lvbi5weWAgZmlsZSBzaG91bGQgYmUgcGF0Y2hlZCB0byBzZWFyY2ggYSBkaWZmZXJl
bnQgZGlyZWN0b3J5IGFuZCBub3QgImluY2x1ZGUiIElNTy4NCg0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
