Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9133C4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 07:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D56D417A1;
	Fri,  3 May 2024 07:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxqwVbxa77ds; Fri,  3 May 2024 07:42:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2541341809
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2541341809;
	Fri,  3 May 2024 07:42:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BFEC1BF2AF
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 07:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7746041F14
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 07:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckx5TGQZ1fLf for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 07:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c213::5;
 helo=zr1p278cu001.outbound.protection.outlook.com;
 envelope-from=stefan.mueller@rey-technology.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F74E40921
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F74E40921
Received: from ZR1P278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c213::5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F74E40921
 for <buildroot@buildroot.org>; Fri,  3 May 2024 07:42:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeDlpUG6tpJdgbTehYy3G3RkqhaWK5Dv24vzUIsCLKXCPqRC07/wV65qY7AcoJJ7uH/nqyTpS44SiGEmHdE1nlt4HJ5GK4ywdI3hQ8Nu7i6srihmrhpmegkqemVhFz9pO10t87LDg/hksVyJks9iNGZhrAyE95cCfTb7LTfg3ymb45mhHDsH8mpVLIbUdEQMeV+yg1H0fNgRLXXgCIXFzixWgUfXoPnuuwxworNAz4mRc/GwsW8YQ5+DoIiiCTP/Va8lRqMn+Sri7U1BEm0Dl+mNdRGN/fOzfhiE0u/irco5azhoy/3fEqGCqvEZBH1k8U1NUWL5fNAZ2Auzw85Lqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNCzkZSmLA+mAfHV+a27RyLOONwjy49iyg5T9Eg8mcg=;
 b=M666f4IbU+5qdiQ4BtYA7t2sWlp+/+YxNMZneS1voEo4Hph7Mnei/nOldSWT+U/9Ia8CXLDPISoChat/Ivtc4vm9LnJewoIe9p00KmlPD5Dd4TTJiERy9Oc0wnGpa2Om1lc1o5eEtEU7NYbqDfb/7Ecv1Co0WwklO4jUmEFb1eTDkri2WH24bhTREDzSypJ/FAGo4qdxU+UL9KSear3SdyMp2xVRpZVX2Esm0z9G5m+AP9R+sXDtsmXv9agGWKgCeKFskZYlqb++n3KVkPFPWipvNNcX+vrwpF+/2tNvAJoipZnrDPonUpHMmKkm01BRU4FQsR+hk6E46/z2LMPsBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rey-technology.com; dmarc=pass action=none
 header.from=rey-technology.com; dkim=pass header.d=rey-technology.com;
 arc=none
Received: from ZR0P278MB0201.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:33::13)
 by GV0P278MB1271.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 07:42:42 +0000
Received: from ZR0P278MB0201.CHEP278.PROD.OUTLOOK.COM
 ([fe80::d9dd:c375:15:c257]) by ZR0P278MB0201.CHEP278.PROD.OUTLOOK.COM
 ([fe80::d9dd:c375:15:c257%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 07:42:42 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: question: used wrong librarys to build packages
Thread-Index: AdqdLSlQxVPJhkERS+iK1q9U+h9yWw==
Date: Fri, 3 May 2024 07:42:42 +0000
Message-ID: <ZR0P278MB0201C028ACBF4BFB1CEE9FB0BF1F2@ZR0P278MB0201.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-CH, de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0201:EE_|GV0P278MB1271:EE_
x-ms-office365-filtering-correlation-id: 52ef6aa3-4731-4bbd-f821-08dc6b449d57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?HwnyFpp+PhAULa4XAD6OGzg1zvAq4J2hZILU5MA1wKkRxgUC9swrH3txqs?=
 =?iso-8859-1?Q?zIs6TX2wznF3jpsT4LZTDLrbEhpy2NHg+3OKx9Zh3Am0zEFdYSaB/AVviC?=
 =?iso-8859-1?Q?JCwYg+1w0MMGrguJEX7ZNSNh8Dvh2Rq7+fXKNoCFUHizvdykj+sHGo84ua?=
 =?iso-8859-1?Q?vVr+UKU75pec9mk9lkyAGqwxJFB62+qAh+vuiIzMkxKnI4bxQTycQKEbRs?=
 =?iso-8859-1?Q?Me2OA+btL6+7VXGXmLz2R4coMlBrxP6wmR+2tk6z+KhqnLu4VJgdLYbrNs?=
 =?iso-8859-1?Q?rpUBHzqNDjby19QFU9kuHwbaaKHECZTGdgHnciZiFo4si4mS7CcDWB1udi?=
 =?iso-8859-1?Q?+EpPxXXSBqbyQyYB/SpxibmUaAWuC96vhUgLEentFt8cXVJqgZLAiEAQTP?=
 =?iso-8859-1?Q?8n5Pm35EGF190Nzfr/WNVVNcHHDuQsptu5aRNnxohh9JFtWwDWKb7BxGum?=
 =?iso-8859-1?Q?yrThMozMaidJXNzaw9dWxJizVCQWjcxcNAidiKP3yGhWOOZXNoJ/3GwrDO?=
 =?iso-8859-1?Q?e7uGb3h87HgJBwDe6Lx9FSb2iV1gpWYp/uJehTB5/YhgzkOcUjS2LTruW/?=
 =?iso-8859-1?Q?ESTk0odtIl3/5yI/fF+tfiMiUyqiLV63rDB+M5t4bcrZS1SluAgczEGAam?=
 =?iso-8859-1?Q?bAdJGzi5OVQ1D/Psdcz5rtel3g9B9/TjBWGXjJ+GJ/k/SI9A+J0GRqSmoD?=
 =?iso-8859-1?Q?aMpCwZ2YnokeH+NthIeI+rTOe4nahBYrvRCQ2teRoHr8t2MZ5eDk7cZqbO?=
 =?iso-8859-1?Q?GVp7outHyE1fdUkZqV53ddDM+KO/+tEptaDi+a7ngS2p39yYsbvQudEPDB?=
 =?iso-8859-1?Q?Vvdt0gGrgfrPAZVO69rv1DM6937W33MeDzzxL6gS/Yl35WMJFe1oGUrTjC?=
 =?iso-8859-1?Q?XK6UQ30PmeI7UtuBbP9bNxVSy2sTSYBAcSWJezAOM+XJeJzwtJTfloYimv?=
 =?iso-8859-1?Q?VRLxetV+rlsD3/JqHW2c2Glgo+x6M9bnQ9Ls5PYgSDB//BJPo3DL2jprft?=
 =?iso-8859-1?Q?4LjEo7+cyx0jZpqTDUHaY0PFvo5y7aSaxVBVYnyhMHdEX91x17JMZg9wIo?=
 =?iso-8859-1?Q?GYYFJdbC22EjSpQMr32tbYMylPwcMP8vO/OBPtiatvmQEibpd5GlI0Cx9T?=
 =?iso-8859-1?Q?XfL7xuiICCloNOx66R4doEYAeNm7x1kGYenRNsbCo/1Bug97886Uxn17te?=
 =?iso-8859-1?Q?kLnt8h8n4I6ZA9EOrVWn3xDV3JRaDX+Wan/Gl76s0TuEe+zDJajvtcUArO?=
 =?iso-8859-1?Q?y8rzZ8NJoTz7zLZtlPrh8ToNAItcsT5z5GbKvfFdWPHIounBNKUBVGn7Xq?=
 =?iso-8859-1?Q?/uzaW/kXIxoNSSfmFcp7q7tVEPk49FaPb+VaCk9kRl+EjBeJy2TePR5BLK?=
 =?iso-8859-1?Q?CVi5VnTaOf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0201.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?TdL/OEpEHytHA9QpMV6QyCy/tB3WG3+kd3BVH2u5OZgfoTFEI/aLQ7AjSB?=
 =?iso-8859-1?Q?xFxcJ+e8dHK5k87wxAsyPaBApNYzR3MZntCRA5W6PMcHvZo8PwwOQHTzI4?=
 =?iso-8859-1?Q?GY8Hv3wSqGklxEVW9rJ+lo4q50apfjN4OAvVV3yldhhoPmnrCn+6M7ZIeq?=
 =?iso-8859-1?Q?L+KoPu8ucJ9MHS8N18/TuOGcW/enLx+VNuSJPpHiUtgHvADRjegOOFP7r9?=
 =?iso-8859-1?Q?jNaHxRHzMrzObSTyyvHf6xqavZdLvHvGbKUPf/HJuEAs6n/X090t04VlYS?=
 =?iso-8859-1?Q?ijU55vGAOgFPmT+lhJWy6TN1TMAuUnx8DFZ7Yee/ZHsfunhkVue4BXdS1D?=
 =?iso-8859-1?Q?eJ1cdSoT8cEeDTKfcOOmd26lONQrEqpfHn75g9TQ71peiL4RU8McHJrC0w?=
 =?iso-8859-1?Q?Lm2/MhZfb8+tWMcGS3lt0arigd8MBJlWjC0mGh8yf3pGDJMuO92c4eh4zD?=
 =?iso-8859-1?Q?YvKUoblkL1Mzj/zT9Ae2tNdQ91nNbbfEpSfcyffIqtspzdCpV0HyHAH6+p?=
 =?iso-8859-1?Q?MIjezQW8Rp/wWWUawn8uKOBqE+YAq2E8lhBu86oaY28u1uxt2dGMTKC/wA?=
 =?iso-8859-1?Q?vdO6YXII7T/mM8v3JsdEtMFSrXzcwaI2XWKtZ5R0Snfps+dIQIrWCD9g5t?=
 =?iso-8859-1?Q?EQJO3TBzxTU/3hS3Ibg1RXMX1GJsvi0vH/kn2MBS6DtHeJDjHPKQSM57jb?=
 =?iso-8859-1?Q?6vgRSQU6XRK47pgT236XQH80VkwkzV2blWglMM7Ln7kTzG+e9KAKzD8x+5?=
 =?iso-8859-1?Q?/NJ6pofbIENvXSadLfz2JcjDht5zaC3DBC8lAm1yWe75aXRQ2rfTG5PclN?=
 =?iso-8859-1?Q?AlcEwkrPXNI5y9OH313cLocs7QtfH55QNQJfSJGak/RdOFnL+SwIyUuwhD?=
 =?iso-8859-1?Q?I6+habOlGyeLXGSiWD04ij1nfeJlt3PI1WpvHXR6w2uQXkkmq6GdBYNyf3?=
 =?iso-8859-1?Q?UNSfeboybAq+pPv9vFwJ7pQ8ZLs1nNooyHu8VjnIKd+VvdM3Bwi4jmab1O?=
 =?iso-8859-1?Q?kfGAPu7kGNi3UrNA7jcmHpBgv6cepY4p2o1FyCJdXcROnCG8apIBA6fHIo?=
 =?iso-8859-1?Q?/L2nmvc75BCj7IHOP/B/yi95CWl/IZ4QhYsrrjAePph1/qwSD6vyyD3xcD?=
 =?iso-8859-1?Q?vgs//FWSUHE0cmXgv6LkI6WDh2X1G37N3jAd/FgRO9yPQthLYplzQ/kvym?=
 =?iso-8859-1?Q?T4Ct1TF4l8CBdJe2sMWCPfa/2JM8g2M891XVyThpT/hRMuTOVM6i1WkSYF?=
 =?iso-8859-1?Q?jJEYxXpTbK0oe23+YODB3EAVE0SeEX78thsKvQn5WAy5409rTiCJped0Vp?=
 =?iso-8859-1?Q?YwKPDNLc2kRUJ7l2skU1rgjk2TT79VNFGKc9sEIKcCMLxI+atKvMFTQg2m?=
 =?iso-8859-1?Q?IPvlisJi+6IEevIY9PZn294h7mSa5goBkD/4lbz0h8SQC5ETIdgQiNQbgx?=
 =?iso-8859-1?Q?OM5QFO2/cqr5DoSx8aG+NO6wfa79RYh6jQYlRmCJ65Jslqex8RdB89aj2Y?=
 =?iso-8859-1?Q?mCgw764mw/b85Uh/F4ep7ZFDk8sr9VWIDXciHcG8Pk16CAqICv/wNLzVSY?=
 =?iso-8859-1?Q?t3OGGpCB9gZpNfemHtxKYzecICzHCcCu24CDfUORr+zQn+XHLIFj2Q4SV/?=
 =?iso-8859-1?Q?uqGa0mod4yIrZQqNYVlaJM1XcYutO9I2beD6iTshCZklD05lf4ch6x/Q?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: rey-technology.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0201.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ef6aa3-4731-4bbd-f821-08dc6b449d57
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 07:42:42.1478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7137cfb5-c814-4224-8896-1b4a6ff99146
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Haiv+GJw+elv0Ir7CgKokQ/NgvlMwoqGAGHqwyOzdLZk3lPNpTbMUFYFofC2dVs8FOnszYTDjQvQUFkX6e7Wg4Ef809kpoter4v6mPpq2YvN/5nBDw695haQHVSsrQ/C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1271
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rey-technology.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNCzkZSmLA+mAfHV+a27RyLOONwjy49iyg5T9Eg8mcg=;
 b=dI5QNTfViTB68l4R6maZ92KQWYtd9jtNY0FyzViym0Ls1yop3lff/+QOFOgZJaxDvNVbij0W87v/eDt323hsP361iJR08IPYX+NrKf1dtm1xP5y4NLYdomeqlVLnmf/UAd/7VyGhJgQ2VBMucW7E/gpYHNIBFdIQ7LhlEJT5myvbBbqNhG8+fkvfd1g57d6HOvz026ZAk4wfdGJtVzBtQr5xXRB9Q2gDEt3QY69UMKsr9AmY9lAHCgaITPnkB+jsocJtmGQRuis03Si43XgYR+zhDYNvS353LymGm5zLSLlzD7eou6RkLPfNwA1PgJo3ZcAAHh+BtRyyGlAvO8q1pA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rey-technology.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rey-technology.com header.i=@rey-technology.com
 header.a=rsa-sha256 header.s=selector1 header.b=dI5QNTfV
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rey-technology.com;
Subject: [Buildroot] question: used wrong librarys to build packages
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
From: =?utf-8?q?Stefan_M=C3=BCller_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?iso-8859-1?Q?Stefan_M=FCller?= <stefan.mueller@rey-technology.com>
Content-Type: multipart/mixed; boundary="===============6032357699152045069=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6032357699152045069==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_ZR0P278MB0201C028ACBF4BFB1CEE9FB0BF1F2ZR0P278MB0201CHEP_"

--_000_ZR0P278MB0201C028ACBF4BFB1CEE9FB0BF1F2ZR0P278MB0201CHEP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi guys

how is it possible that buildroot builds packages and links them against li=
braries that do not exist in buildroot (only on the host system, not below =
the buildroot directory)? - i am a bit confused now.
i downloaded buildroot 2024.02.01 and just copied my configs into it.

many of the built packages are now linked against libssl.so.1.1 (but buidro=
ot uses openssl 3):
example:
build@build:~/buildroot/output/target/usr/sbin$ ldd NetworkManager
./NetworkManager: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not=
 found (required by ./NetworkManager)
./NetworkManager: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not=
 found (required by ./NetworkManager)
./NetworkManager: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not=
 found (required by ./NetworkManager)
./NetworkManager: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not=
 found (required by ./NetworkManager)
        linux-vdso.so.1 (0x00007ffe9f755000)
        libgio-2.0.so.0 =3D> /lib/x86_64-linux-gnu/libgio-2.0.so.0 (0x00007=
f2b90e93000)
<snip>
...
<snip>
        libssh.so.4 =3D> /lib/x86_64-linux-gnu/libssh.so.4 (0x00007f2b9040d=
000)
        libpsl.so.5 =3D> /lib/x86_64-linux-gnu/libpsl.so.5 (0x00007f2b903fa=
000)
        libssl.so.1.1 =3D> /lib/x86_64-linux-gnu/libssl.so.1.1 (0x00007f2b9=
0367000)
        libcrypto.so.1.1 =3D> /lib/x86_64-linux-gnu/libcrypto.so.1.1 (0x000=
07f2b90090000)

but:
build@build:~/buildroot/output/target/usr/sbin$ find ../../../host/ -name l=
ibssl*
../../../host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/libssl.p=
c
../../../host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so.3
../../../host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
../../../host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libssl.a
../../../host/lib/pkgconfig/libssl.pc
../../../host/lib/libssl.so.3
../../../host/lib/libssl.so
../../../host/lib/libssl.a
build@build:~/buildroot/output/target/usr/sbin$

and (host system that runs buildroot):
build@build:~/buildroot/output/target/usr/sbin$ find /usr -name libssl*
/usr/lib/x86_64-linux-gnu/pkgconfig/libssl.pc
/usr/lib/x86_64-linux-gnu/libssl.so
/usr/lib/x86_64-linux-gnu/libssl.so.1.1
/usr/lib/x86_64-linux-gnu/libssl.a
/usr/lib/x86_64-linux-gnu/libssl3.so
/usr/share/doc/libssl1.1
/usr/share/doc/libssl-dev
build@build:~/buildroot/output/target/usr/sbin$

shouldn't buildroot use the libraries that are inside the buildroot directo=
ry?
Can anyone help me find out what is wrong?
thanks

--_000_ZR0P278MB0201C028ACBF4BFB1CEE9FB0BF1F2ZR0P278MB0201CHEP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE-CH" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi guys<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">how is it possible that buildro=
ot builds packages and links them against libraries that do not exist in bu=
ildroot (only on the host system, not below the buildroot directory)? - i a=
m a bit confused now.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">i downloaded buildroot 2024.02.=
01 and just copied my configs into it.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">many of the built packages are =
now linked against libssl.so.1.1 (but buidroot uses openssl 3):<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">example:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">build@build:~/buildroot/output/=
target/usr/sbin$ ldd NetworkManager<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./NetworkManager: /lib/x86_64-l=
inux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by ./NetworkMa=
nager)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./NetworkManager: /lib/x86_64-l=
inux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by ./NetworkMa=
nager)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./NetworkManager: /lib/x86_64-l=
inux-gnu/libc.so.6: version `GLIBC_2.32' not found (required by ./NetworkMa=
nager)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./NetworkManager: /lib/x86_64-l=
inux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by ./NetworkMa=
nager)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; linux-vdso.so.1 (0x00007ffe9f755000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; libgio-2.0.so.0 =3D&gt; /lib/x86_64-linux-gnu/libgio-2.0.so.0 (=
0x00007f2b90e93000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&lt;snip&gt;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&lt;snip&gt;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; libssh.so.4 =3D&gt; /lib/x86_64-linux-gnu/libssh.so.4 (0x00007f=
2b9040d000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; libpsl.so.5 =3D&gt; /lib/x86_64-linux-gnu/libpsl.so.5 (0x00007f=
2b903fa000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; libssl.so.1.1 =3D&gt; /lib/x86_64-linux-gnu/libssl.so.1.1 (0x00=
007f2b90367000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; libcrypto.so.1.1 =3D&gt; /lib/x86_64-linux-gnu/libcrypto.so.1.1=
 (0x00007f2b90090000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">but:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">build@build:~/buildroot/output/=
target/usr/sbin$ find ../../../host/ -name libssl*<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">../../../host/x86_64-buildroot-=
linux-gnu/sysroot/usr/lib/pkgconfig/libssl.pc<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">../../../host/x86_64-buildroot-=
linux-gnu/sysroot/usr/lib/libssl.so.3<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">../../../host/x86_64-buildroot-=
linux-gnu/sysroot/usr/lib/libssl.so<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">../../../host/x86_64-buildroot-=
linux-gnu/sysroot/usr/lib/libssl.a<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">../../../host/lib/pkgconfig/lib=
ssl.pc<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">../../../host/lib/libssl.so.3<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">../../../host/lib/libssl.so<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">../../../host/lib/libssl.a<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">build@build:~/buildroot/output/=
target/usr/sbin$<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">and (host system that runs buil=
droot):<br>
build@build:~/buildroot/output/target/usr/sbin$ find /usr -name libssl*<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">/usr/lib/x86_64-linux-gnu/pkgco=
nfig/libssl.pc<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR-CH">/usr/lib/x86_64-linux-gnu/libss=
l.so<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR-CH">/usr/lib/x86_64-linux-gnu/libss=
l.so.1.1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR-CH">/usr/lib/x86_64-linux-gnu/libss=
l.a<o:p></o:p></span></p>
<p class=3D"MsoNormal">/usr/lib/x86_64-linux-gnu/libssl3.so<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">/usr/share/doc/libssl1.1<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">/usr/share/doc/libssl-dev<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">build@build:~/buildroot/output/=
target/usr/sbin$<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">shouldn't buildroot use the lib=
raries that are inside the buildroot directory?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Can anyone help me find out wha=
t is wrong?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">thanks<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_ZR0P278MB0201C028ACBF4BFB1CEE9FB0BF1F2ZR0P278MB0201CHEP_--

--===============6032357699152045069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6032357699152045069==--
