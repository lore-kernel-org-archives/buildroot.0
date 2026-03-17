Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1369EFED9E0
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 15:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9951541682;
	Tue, 17 Mar 2026 15:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EjPXbO_KSxPd; Tue, 17 Mar 2026 15:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EEDA41684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773761106;
	bh=hsUwbJEnunG+Vo4dSRu3iDgxVSBym8SZciHt5Tt0Yc0=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WBTmavow6mTMh6nsDFQSz9P3LWFMYEjKaFZ5lYjp1sMzvRJzKNkFdv/VE/vSXyjG6
	 QPz5fCFmFmA/R7jppytH83iVhJIN1BJBlVo1ehVHlqJOrUPWnTkaZB6oGvnMgrTj7W
	 9k1cxUH9+KcPHVR4mz71Fqw9IyVW5p/pUTVMoK3NU0Ab0yIwmiUAPXivIqdHjfjx+a
	 t4qpy+LPU5/nFJo1nq1VdQ6plEQ62Vud6senE8NL3QHVPG46DNDfG0YTJnl+drhLBS
	 6TeQ/49B2B7VExjvTncR82F5rUvYXaJUuGWe+csMXq+X9xDZdeXscSGB1GUlhRejXh
	 ZiFuqeuVtWGZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EEDA41684;
	Tue, 17 Mar 2026 15:25:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 261FBD3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98188614E4
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIVq8LMkLvpZ for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 15:24:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::5;
 helo=duzpr83cu001.outbound.protection.outlook.com;
 envelope-from=jimmy.wesolowski@mobileye.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8288614E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8288614E6
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8288614E6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:24:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhIvXjnOTObba/SE377JH/0qGFuMjGkNql9D9akvnyyXsPYWwVtgPSyUbUv2g/eYzIRyZx9YREOu+lSAkblG5vEilO2Eq1wG8GaDtryzgOagARKDso8GgMUr0nVEr1XEq4uhJCBZRBVL/d1HbB3RexSzLIG6xZF2k1TduJLjKRJooB6bi4oksbExte6iMafMLev6wHQkPKyX+h6QPNjbBu8wCS/zIREWD+x1odYl9ZsRJL0Bmx7nuLH3sSTg4C/KwtfYX7JgruSfLcYJtSmrpTXWz2u81oJzpXxNkUxk7hXGxkGqJNcHbwyl62zYxGv9FDf0YovKAGBMXMVhftduVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6rumXFWSkYLg64KSLwmlG59LdiUF2WdMooQyizCOig=;
 b=gU85VqsyK9qfMm+5/aCTCP8VNoV78rFelGtWxOnc4mOnoq6nm8cddZKAKa2j1JVzzJKYEoBJbvxtRtEFfDJ4M2k3Gb9JHOkHDfDv7Xk3hPImzmqfIPG+pKDSEOm3onFj4Z14Gj1tNLeTjTIilX2BCiUytQ1Aspq8O+3Sa+ROjvzdOm7tcY9z+DREYQysbDOWERAn1+NJEe11h4kW3WFTw05QQcAG55Fssq2flPwr3KkG4dAJkduvfylo7kRvqEmGBauWrpWKp9Fqy6BZFjIKNonnYeWCPK4lssACS+jNqU1eH+lVOYP5zDatXct0cRIYfkYc8neSulwb1sUh7Zr2gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com (2603:10a6:10:2a7::13)
 by AM0PR09MB4419.eurprd09.prod.outlook.com (2603:10a6:20b:148::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 15:24:52 +0000
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f]) by DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 15:24:51 +0000
To: Quentin Schulz <quentin.schulz@cherry.de>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: Kadambini Nema <kadambini.nema@gmail.com>, Guenther Harrasser
 <Guenther.Harrasser@mobileye.com>
Thread-Topic: [Buildroot] [PATCH 1/5] package/libopenssl: bump version to 3.5.0
Thread-Index: AQHctV/5olxV+cvSf0+xPbcwLOeE/bWy0rYAgAAFhe4=
Date: Tue, 17 Mar 2026 15:24:51 +0000
Message-ID: <DB9PR09MB4987B2E35A2A300EEA66889DF641A@DB9PR09MB4987.eurprd09.prod.outlook.com>
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
 <d703edf5-c644-453d-a3e3-7e2024d1890e@cherry.de>
In-Reply-To: <d703edf5-c644-453d-a3e3-7e2024d1890e@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR09MB4987:EE_|AM0PR09MB4419:EE_
x-ms-office365-filtering-correlation-id: 202b4bb0-d127-4e46-96c9-08de843955b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 8vsNnJ7kHb8Cnx3DreodIwmnLdRNL4vWPggidAJwykpYyPCmqfKzrlULuZV9GGOXqTJ+Xr6zmDlPUgtd+BOrjMuVLgsKPwkT1zoPt7PX/o2CtPLKa9lxrX0ZTG566ux9f3so1IHBd7up4y389Gof+bif9yUyDUnu5cd9omIlpZhX4HUgoiOMyqA19VJN+OCRrs5bWusbzDJKq2KQKH1Gu/Be0x8kvtXSpsZhBF7wkdK5f53tqk+EeghuPHw0qNB5TjTBqagAt+b0tmJrun3mdKsqpxxWbbwYDGfxBjXLFSmYOkRWB8Fi+A/wcpNiVwqNDS/Ja+6sx0kqURDpKcaDjD3SRSH1qXi4xRzn6m4kHwCXqqWKUqWJCfIXUjd+QX6h2E5uWQbX/Ld+idNRrvSYrzdH24WF6Ld6NXuXdYmL84WkjjGSh3X7uEkr97eCekXmNlcZv1sASBhMxZsahf05fG8pmmMGhcJoHkx3RFHNtD8VzJe8dtNUss9kPqIhx3L19VWVXgNmGBTUgT/KHIir9dhFEHH8p8d9BPigNIK0MBsGAEnDbkGcVjdHGSsfHxqz1BZbYLk5ra0JrOiEvoHUhFQijWKqTU3pZAOXbuv9W+1hNkHh/IejwmORx2fAHmjFuAouO5MSMMFnyvOyEVZY3kwAHB2OvtpHryYEtrFKfH5MWzpOR9sw9u0rCFFEBTVto95B0OCR+rLr4oxklroB/6j66B79bOrsiFEXQAPbCEUna+P/yH+U45KaCEO9tmqm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR09MB4987.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?z60shDEaio+A7noCtv5nbCYpWZKw0FQwwIdp8pHLy40PGTCbU9s/Ev+G0F?=
 =?iso-8859-1?Q?2jLDtrAI8b+FhsCWoGtnzF0jdoDoaenZJpiTgCOuX5mvRRqN2rHDdru+7/?=
 =?iso-8859-1?Q?pYka7gWgC0wrSH1Bz3gqgsYZrmrI+yTeGjFVWqkAjg8gwmAZSmDyhyqDMJ?=
 =?iso-8859-1?Q?+9SgRT6pRl5rVZx8yBa3t3YlwpzJ7IEym6AY05czOtRgGZL3SwmF4AYQYK?=
 =?iso-8859-1?Q?Okg5eos9TrIjhIC19bt8AGDTLgK8/VmAIWxUsGd4ZwbiYajt+yLQhUODCa?=
 =?iso-8859-1?Q?go7PsEeIr5IelDSumyxB99lUWiSwRlY1CLXT4Pk1RjpZgTnFCSWZxRq05l?=
 =?iso-8859-1?Q?UjAFQ/jlZDKnloXEV5QgKfH7O0m4Pu6XTVZBLoeanELwv2IpHkZvQq+lnF?=
 =?iso-8859-1?Q?kGhQhXzQ63m9Eb79tyWVHuXB4CX2ZJYZv7CCSREM5knIu8VgqDhCHd71iE?=
 =?iso-8859-1?Q?BMcfCehHG1kZzP3fDigSeAN1SIcxErABMnfrb84icALoqWFDB5uYiCPPSo?=
 =?iso-8859-1?Q?sM5MRZTGKPY90jnzGP7LFFCqISPGsSXkS17N+ObOD3YRQxDu06QyNdM/Kh?=
 =?iso-8859-1?Q?Mm7DIjObGMAuOzuvkCbloCG9gJRhDVP7tZn57lSvkKQHtxiWJ6IOU6vij4?=
 =?iso-8859-1?Q?87v0aMAFdCFYokBC5VTXDSnc4A9gPnDfjoI/UZvbuyNTzaORV53ATPfueR?=
 =?iso-8859-1?Q?JLcjlFVDE2+ZSgOv1xvX0lk06k4gLExxeVW4VAgsy1nE1nljn+RD4a1eKZ?=
 =?iso-8859-1?Q?OOo5YvKrMuSxRvxPNJf/20PYhoetY3oC+vZXOvwXbkBOx/ecKW4CQgIPaF?=
 =?iso-8859-1?Q?onerRxQBrhY7rwlb5Sfmg8elBk5fneirujHPlAUwVHgIDym+ytkgFY18LL?=
 =?iso-8859-1?Q?TPtSa2q6bq88g04VzlTzDLlmMKHBgZ7GTwy0EVFfq9rVfBI6mlcLhdlqA6?=
 =?iso-8859-1?Q?sq0kY71N2IAmOd7dhVe3+MbTUOtT0Zjsfey0Xp2aMOwr4eYd/rV3LZnwKR?=
 =?iso-8859-1?Q?gL4JonoNWCSZKsdcPaHVRoA0RWEhLZDTzQQhCk0xzZ9+HfYjCs95s/fhAB?=
 =?iso-8859-1?Q?Zfhlvt92ll3rTizWFO4HcHgJm9+ZNsbqfqVcw6pbtzrk4ZclfQAeKfoqXE?=
 =?iso-8859-1?Q?9Mb0e4jPtHlceN90e/ehMLrD78YqPogCiCSHCm8u/eWtWRuannTZWOVVKi?=
 =?iso-8859-1?Q?KDS26swOsJ+MhtK9h9YD1RdNzD77nVtm0eF4tQp6GJ77agk/whEn/tvADd?=
 =?iso-8859-1?Q?HFpssBwieGmh3BVIaFhJYO+9ntYa1Otv+c/UuI0aHFM7TP4n9Wn2ImL8YS?=
 =?iso-8859-1?Q?2jjT9h0n8e4vJcMbKxjeAsDi1FGoWJlOYmiyMhYW4gPvEzUvRkH9dZlm8W?=
 =?iso-8859-1?Q?7H85jra2lgJo0dMwI69KJxOLStSU39oXaMhZ+Kx3wUasf6LR8YlVAQttIy?=
 =?iso-8859-1?Q?LvT1XglLsP9wmYnv0SoQxHU080dxm4OPOcBQjallSA9e69rLyrJsQGp+wz?=
 =?iso-8859-1?Q?1VmeEicJTnX4nssumrN/LzQkTK6xfvJGeMcV63RgRF3wCJCwzQfIiBSA+9?=
 =?iso-8859-1?Q?gkkLoSWefMZdeQVsbrmXe/a7pE9sv2qPpYmdv5JONc4I5CJiFUrKsmPz/R?=
 =?iso-8859-1?Q?97ytszpScEC08I/xqMIXltHUU5iKn8Cz6AxEliczrIwKgVcFWEVXcnxfp3?=
 =?iso-8859-1?Q?1N+Hv1RZ2xXf7e3qTWioGKScq/8HbSBfbh6Fd9y8JYypHuUa4JsgBYIGLP?=
 =?iso-8859-1?Q?cfYGAkqW7z0fFACgq+XW48acspEbeXlpCj9wL5f0rkpVyK?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR09MB4987.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202b4bb0-d127-4e46-96c9-08de843955b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 15:24:51.8685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MXwc6o0OX3K77whv6D/SMLCVhbhOj9JYAapp80JLwi47phZTPlNd4LK7oneZkqdQDGj8ZcJ0YJFvXBPHqfePrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4419
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mobileye.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6rumXFWSkYLg64KSLwmlG59LdiUF2WdMooQyizCOig=;
 b=dZBxFz35SrfCqcwIftbhcDOS8qeoGvihhC5I6VfxUUzCtss08qMi8jM08in04cui5o7E/AK9rayhpIStauqbz5Swl2XlsiXsqK3yn32WX5T5vL5ToyHr0oT8tvQUA1EfssAff7FMqYx2NyG6bJYPPprQSLACbshsP20tl7GlA34=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256
 header.s=selector1 header.b=dZBxFz35
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Subject: Re: [Buildroot] [PATCH 1/5] package/libopenssl: bump version to
 3.5.0
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
From: Jimmy Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Quentin,


Thank you very much for the feedback!
I will create a cover letter for v2, thank you!

The timing is perfect, since I could finally run the CI. I was concerned that this
might take time, and I wanted to allow anyone interested in the patches to be
able to pick them as needed.

I could bump the version to 3.5.5; from my understanding of that 22.5.4 section,
I should do it for master as well.


Cheers,
-- 
Jimmy
________________________________________
From: Quentin Schulz <quentin.schulz@cherry.de>
Sent: 17 March 2026 16:00
To: Jimmy Wesolowski; buildroot@buildroot.org
Cc: Kadambini Nema; Guenther Harrasser
Subject: Re: [Buildroot] [PATCH 1/5] package/libopenssl: bump version to 3.5.0

EXTERNAL EMAIL: Do not click any links or open any attachments unless you trust the sender and know the content is safe.

Hi Jimmy,

Thanks for doing that :) A few things to improve though, see below.

This series doesn't follow the naming scheme required for backporting to
stable releases. See
https://buildroot.org/downloads/manual/manual.html#submitting-patches
22.5.4. Patches for maintenance branches, specifically

"""
However, some bugs may apply only to a specific release, for example
because it is using an older version of a package. In that case, patches
should be based off the maintenance branch, and the patch subject prefix
must include the maintenance branch name (for example "[PATCH 2020.02.x]").
"""

You also said on the #buildroot IRC channel to "Please wait that I test
it on the runner." so please consider only sending series once you're
done with your own testing.

I highly suggest to provide a cover letter to your v2, anybody not
following the IRC channel won't be able to understand why this was done
(and people who do follow the channel may forget about it). There needs
to be context and justification why this is fine to backport even though
it's a major version bump.

For what it's worth, I've done this in a local branch and added an
additional patch for OpenSSL 3.5.5 security bump (see
https://github.com/openssl/openssl/releases/tag/openssl-3.5.5) and I'm
about to publish a new release for one of our products based on that
(just so you know there's been *some* testing).

Cheers,
Quentin

On 3/16/26 5:13 PM, Jimmy Durand Wesolowski via buildroot wrote:
> From: Kadambini Nema <kadambini.nema@gmail.com>
>
> Release notes:
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.0
>
> Changelog:
> https://github.com/openssl/openssl/blob/master/CHANGES.md#openssl-35
>
> Rebased patches for the new version.
>
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> (cherry picked from commit 9868ca6ec98afa28a94aea50cc940db7df860396)
> Conflicts on
>    package/libopenssl/libopenssl.hash
>    package/libopenssl/libopenssl.mk
> due to intermediate security bumps from 4.1 to 4.4 with commits
>    0ec6cf7f69da "package/libopenssl: bump to v3.4.2"
>    cd6d8b9b251d "package/libopenssl: security bump to version 3.4.3"
>    dbf192e1764e "Package/libopenssl: security bump to v3.4.4"
> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
> ---
>   ...nfigure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 4 ++--
>   package/libopenssl/0003-Revert-Fix-static-builds.patch      | 6 +++---
>   package/libopenssl/libopenssl.hash                          | 4 ++--
>   package/libopenssl/libopenssl.mk                            | 2 +-
>   4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> index 629d9c26ce..2634d69f35 100644
> --- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> +++ b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> @@ -18,10 +18,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>    1 file changed, 4 insertions(+)
>
>   diff --git a/Configure b/Configure
> -index 5a699836f3..f9152b1702 100755
> +index 15054f9..ac3206e 100755
>   --- a/Configure
>   +++ b/Configure
> -@@ -1549,6 +1549,10 @@ unless ($disabled{asm}) {
> +@@ -1685,6 +1685,10 @@ unless ($disabled{asm}) {
>        }
>    }
>
> diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
> index b4b78c97fc..e800b782ad 100644
> --- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
> +++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
> @@ -15,10 +15,10 @@ Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>    1 file changed, 4 insertions(+), 4 deletions(-)
>
>   diff --git a/Configure b/Configure
> -index 2a5e58805c3b..0e8c1ce5cc74 100755
> +index ac3206e..764ef89 100755
>   --- a/Configure
>   +++ b/Configure
> -@@ -1466,10 +1466,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
> +@@ -1509,10 +1509,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
>            unless file_name_is_absolute($config{prefix});
>    }
>
> @@ -29,7 +29,7 @@ index 2a5e58805c3b..0e8c1ce5cc74 100755
>    # Allow overriding the build file name
>    $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
>
> -@@ -1764,6 +1760,10 @@ if ($strict_warnings)
> +@@ -1807,6 +1803,10 @@ if ($strict_warnings)
>                    }
>            }
>
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index ea288054e9..9f8b23005a 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.4.4/openssl-3.4.4.tar.gz.sha256
> -sha256  7bdf55ac20f2779e99e5eca306f824fad2b37dee5a06cc35ed5a8b85a6060010  openssl-3.4.4.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.0/openssl-3.5.0.tar.gz.sha256
> +sha256  344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0  openssl-3.5.0.tar.gz
>
>   # License files
>   sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 8e3ae4cc21..5e785e1bf0 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -LIBOPENSSL_VERSION = 3.4.4
> +LIBOPENSSL_VERSION = 3.5.0
>   LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>   LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>   LIBOPENSSL_LICENSE = Apache-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
