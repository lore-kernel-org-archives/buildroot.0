Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FB1C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 18:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5682A60B94;
	Sat, 29 Apr 2023 18:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5682A60B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VecfqRv1jG3T; Sat, 29 Apr 2023 18:12:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F392608A5;
	Sat, 29 Apr 2023 18:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F392608A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22E981BF4DA
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 18:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEC534032A
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 18:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEC534032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tmHUkEGjKoXH for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 18:12:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02703400FB
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::800])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02703400FB
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 18:12:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNyC7+Nh2JGAeBBFAJTZAskIrvbQEYZluF00qnDob5l5q1r8CoMg5isDD3WexzenU8zzvzhU30Uh+DdVyR3VMfhP8Gz+IIvkiV/lw98t37Q4UEV0lBh+Zy3E5HGsDltdNMwNTYINERI/qYcuqyhoZOI82n2AV/fpKWKZmLwLT5bbrE0htlPTBYIO3fkDW9w+TZo13g250ys0yA2SdSxeH+JofVWO5Sd0csoIv7uiJVg5n4qLk/d1EU7jjB0hAVsxdOsU+zsL/fFp7uNwsgDTfiKsNsNQg1HCTdRyaL4ufAkxZjrSURuj3zYpRhPh9vENJcNM5UiruuAQNdsKg4YvKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEs/WB3O4JTPJhqYefgEIiv2nZC6JDWoHCDVV/opz+s=;
 b=FgOTpoqp4tjJAGogl2nVpjcjzYNzOYS0wLgMKs0FGrr5lC2Fi13alMrb3PZVnFqZDR9z/+PHFZdLVR/4LvragvSQvmFCsnA41+7nPbRQjJBJauZeLqK8GB4d33K2UGQc0Yb49O1BE6qlX44lqIhWEZDE7JoBdWQhE9qNOQphe8HtWitDresp/puFNCEXIkgaEMwDGCT1KdADoU/4TGD8GZRNkGvXkrSQhMA+TAx5SNTRwJxdfrxILatuJKvDKlWiETjBDlgieifeqhnKbCgjcvuKfXKMeVuolfwD/kJ0C8peYjkF9E3QegqOqt0isSHRX93JqP2WuIMCHuszYP21jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by CY5P221MB0854.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:2e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Sat, 29 Apr
 2023 18:12:52 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6319.032; Sat, 29 Apr 2023
 18:12:52 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 14:12:01 -0400
Message-ID: <SN4P221MB068213B5F9C9C24C43CBB99AA0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [NJjRWgeJJ0TPPf5/b958JfdmZ1AIGQph]
X-ClientProxiedBy: YQBPR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::27) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230429181205.3620-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|CY5P221MB0854:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d7513db-d981-406b-00e6-08db48dd5873
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvs2LcEE47sqC+gyshUAxDzMJD0Wj5flQiXh44+/G9XYwBQhK8YPkYT+/QvMUpyA9UCOpk2jUjOOIC9barelsewaKPoiVzmiYGC0SW/Vo5WFwCrP1Rwf/ypfq1i9HsdMbf/dQa+bfm/+544NgSZopI27AIQKvOiPgclnudr09VfKjV0/osNrwWnBNyOM9NSgIW+KN98IhI+MiJvJ4KxgN3N5Ee+xV7puwFAnWBRLHHT0NzjFTNPYBkJkZMt3Lm0FRfPee++M1Y1or45ImqhglV9GZ9zuxPlepKlV/eParic5VGGB7wMAGoAAC7moysa+sd/221sEHfNawBDetKkBG+9VBJqnejTfuESzI+x21WXgLWN/LZuJZ5CXKNg2pfH4GgeLayLNsyfzsCKRjE3E0D/IlnU9fAZjIpn4C+6uk+U+zAYd1GtGIVWwCt/nwv3Ss+uLGYnjB0chc4g5NSpuzjlxQz7JkqAx8cwkj+yMYXBwJkxWGB+l+CUivzLYDcypDVJhTaHf8Ss7cey1R5b6eL1yDmHbkjUMHFh5THVIREbze3xGZJajOsuW+d4PRydvENfJWoUwzUiLJK6Tl7mnLmY+0xx3PzfK2Ih/6rf9Re6v74YG5Wwfq84somRs8V1FS9TTUyAJ3qI4expAVuOakuG6a64bMwV4YM5D2sVRV+fP4Qj2auNI0Yzou2EllYZgmSZlfMWUyxaReTnhJtyq/AHwolyzhKjqeIpTa5kxPWsgk2DTL+hA8bcEJLe3XJCOwQw=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FfMpPMN2Ac9C1DSRElN4GhS+Pe8NAnQDmldoaRaHq1t972D94QhKrd32aesJQQ8ejRzb0NLl86gM7+q8Y7MU3qNKEU3Aof927RySNS+jeHgODEC3gf0B+phrZJv+U2Vd+JSdZV6rxDWYIW82jB3NDci99rqEiFlQG2SzIMQsp17/LgkConbZq0Z7qAVdmjzQEna3/61g4JJlVp7cOGQ77bQjdM8+Cs/P22HMMhbtuYYE1rCFS9IK5kzXCQuBbzkcnp6SMcIXrIFMgC2pRcV7UpLJejWNyYRU8lurvDhCYCSu3+wo3jel2g5qiyWgdgiG9ac4D7UWmoFMKBB0NF/fTxOVk/Ct0F9udT6rTYoJeb57tM7W7iUJjU8lU6HqXa1WrN/ODkTjHiktXBZPtaAaeZ6cUaSSl7pljITgteKxLkf0VZ4F9fay3ZH9U6MB1mn6H42GcLSdLsWN9V46Jq/CI8LMmDofEsL8bUF3pHi8k5qex5d7r1awcxSzqS9Xo/hKxke6fVAcZQgBNblc04gT38Kiv+BwfpxodNmEnxY/5CumwKY60Q6xZ9nc2WDCpYnhEHH6zp7VyAIM1Cgo4162kJhA5p4x2tQ0RVxVU6/KGom37wa94X2MP5DqAgjq4On
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H+eDMxj6rK+LSouc1sxsaly9gtnMNm79wfVzW3phI8Zo9xwIc0kXFNG5Jilh?=
 =?us-ascii?Q?9ut5deTu8/3w4ny2YRdwyHF5Lha/leLl0aYJL/JDT+wE07cAKVwBVsAvnNs0?=
 =?us-ascii?Q?ScsobVCtdFjCvqvsYoU5xH5lrZC+2huiPsVPRuQlZAPOkIHdVDiy5Hg5xcqq?=
 =?us-ascii?Q?+gwqq2HGojTn6KqFII+Yv4Os6Rqm1XTdg87MXcVGGHA3WLq8QLel0MWW2o+W?=
 =?us-ascii?Q?5DUYSbXPKinVFZrEqHOcDA4PNafg/Otf/BXxIml3kGWbBDWyjGccBbllxsJ1?=
 =?us-ascii?Q?vBsoAybtK1Jbo2JZpDqrbrJMxdPigpiHCVcqo5TfHKJp2K17RTdBPHYyAC0n?=
 =?us-ascii?Q?lzg9SHBsFEXYlZQA+UNUn74OZ/0agPDkjIWkcH4Rdx7lT1QA+33hR5zWDf41?=
 =?us-ascii?Q?BaJuQ060mdWFByEgaJT52nnIe0YSCveQgQyhTQWpIh/tO7mZ9C5N7vJuFYhn?=
 =?us-ascii?Q?hIHXwZoW4t59hHMrRTsqITKm/qPLIZn6CbaoLOZqBTZEfMTy40zVFiNTCqn1?=
 =?us-ascii?Q?1Iy6q+L3OLVoHJXo/Dd+WKtqPRwvJfptMMIDpna6HoDC6yfNZJO2rDh897+u?=
 =?us-ascii?Q?PqXBukvvgMLzXTGIfG3yXFFMyzPZpaQ9fRSuHKSVxJfk/3v1m2+qKM71WL5w?=
 =?us-ascii?Q?1IvvXySwpJXg9Wm5iTwb6aWy/0XdgcMp0a6eRwKSEKJinUePrtWV3otDl3Td?=
 =?us-ascii?Q?yFYksT2zKlLWqGCNa1NxG8G/824V3Rmqn+T/FLUhO4Xy55y2AyntEs67IYw4?=
 =?us-ascii?Q?jIetKYCDkRiYFUcmmfJxb5DGOhAe0ldU3+dv548vI1gJTaZcJoMUDY7lzhDj?=
 =?us-ascii?Q?bwqg0X5sMmJ1uuPYKgZtQSZVkL1aN3DX3yX2/GrGnEOS7V3e46FymFSiE7jG?=
 =?us-ascii?Q?MFSGD/77y2ErCucaUgOJvgvcmfxKWkYmKg71r48bhw4WP3up2Ot5u6tSdj/7?=
 =?us-ascii?Q?LkylcA6RIAIWhhsv+MH8VmtO13igaAlWdOLR2Og3um5PQtMOaOa8ajT0zM5R?=
 =?us-ascii?Q?qKooei8LoblWGd/Xj3IocqKElxcSJX0kB/S5ByB3vQX95QFL+ouRGWZEUJDJ?=
 =?us-ascii?Q?C0Wn+lx2H1OWXlxcSe+lmusTvIUfOTfgc4+bmP5ElabrJn9MOR1OAI7RWTR0?=
 =?us-ascii?Q?oCS4CimiKNoOXHsdH0n3fjyHhBN3fvApbYhGQ8qMNycIzrI8pIM/zwhwJwow?=
 =?us-ascii?Q?kHyXZmtbudPDV04Gj+x2ruVz3MbDjHbhVaGI/5ChlxQ0gF/8r482ykyq4os?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7513db-d981-406b-00e6-08db48dd5873
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 18:12:52.1003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5P221MB0854
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEs/WB3O4JTPJhqYefgEIiv2nZC6JDWoHCDVV/opz+s=;
 b=rhPGLi5NE3nrGYBRV59oy/Zw6Xthj8Pvgj4sxetRVSSyXSHeE1ijOqLaJQb/3fb0gQKylz5aKaLjBZpvE6q/SjrYDwRNpOd2fsq1rbL+5z3GvnIm4L86MKPErdc2urJcjsbo+mVaEPgKlmkcyF0BMPKwC8N++20+REz9YxAZolWr1IBZbk3vaXvT8mc3vkDo4smLI83DNoOYVTADrqmKb+fhNCSdARIjulaGO8lPzX345Fjm+3laiE3sW3aSLGb/cp/5OWF60m80jX0WjmUagV7tH6EGTnP/Jo/V2A7Z8lwsfJ5Qid3jqQuT5rWAIRPV1BwTAXSGow6/+WYi7eaFOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=rhPGLi5N
Subject: [Buildroot] [PATCH 0/4] support ignore-indent for check-package
 configs
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
Cc: James Knight <james.d.knight@live.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following series brings support for having a linter hint in
configuration files to avoid having `check-package` warn about bad
indentations for container-like configurations.

Buildroot ignores indentations for the root package configurations as
well as kodi/x11r7 packages. These configurations reference other
configurations, which makes it somewhat preferred to indent packages
under a menu option. For example:

    menu "<category>"
        source "package/<ref>/Config.in"
        ...
    endmenu

To prevent `check-package` from triggering a warning, an internal list
inside `lib_config.py` is maintained. This is less than ideal since (1)
it requires adjusting the library script if future "category"
configurations are added/removed, and (2) does not provide a way for
br2-external trees to utilize the same exceptions. For example, if a
br2-external tree manages a `Config.in` with pending upstream packages:

    menu "Target packages (Queued upstream)"
        source "$BR2_EXTERNAL_BAR_42_PATH/newpkg1/Config.in"
        source "$BR2_EXTERNAL_BAR_42_PATH/newpkg2/Config.in"
    endmenu

Utilizing Buildroot's `check-package` call on this file will generate an
indentation warning.

What this series brings is the ability to add a `ignore-indent` flag
into configuration scripts to avoid `check-package` from generating
errors for select files. Continuing with the above example, adding the
flag as follows will no longer generate an indentation error:

    # noqa: ignore-indent
    menu "Target packages (Queued upstream)"
        source "$BR2_EXTERNAL_BAR_42_PATH/newpkg1/Config.in"
        source "$BR2_EXTERNAL_BAR_42_PATH/newpkg2/Config.in"
    endmenu

This change allows dropping the internal list of configuration
exceptions (for package/Config.in, package/Config.in.host, kodi and
x11r7), to instead use the `ignore-indent` flag in the respective files.

James Knight (4):
  utils/check-package: cleanup line reading
  utils/check-package: support a file-state instance for library types
  utils/check-package: support ignore-indent flag for configurations
  utils/check-package: utilize ignore-indent flag for special configs

 package/Config.in                   |  2 ++
 package/Config.in.host              |  2 ++
 package/kodi/Config.in              |  2 ++
 package/x11r7/Config.in             |  2 ++
 utils/check-package                 | 30 ++++++++++++++++++---------
 utils/checkpackagelib/base.py       |  2 +-
 utils/checkpackagelib/lib.py        | 10 ++++-----
 utils/checkpackagelib/lib_config.py | 32 ++++++++++++++++++++---------
 utils/checkpackagelib/lib_hash.py   |  6 +++---
 utils/checkpackagelib/lib_mk.py     | 22 ++++++++++----------
 utils/checkpackagelib/lib_patch.py  |  6 +++---
 utils/checkpackagelib/lib_sysv.py   |  4 ++--
 utils/checkpackagelib/test_util.py  |  4 ++--
 13 files changed, 77 insertions(+), 47 deletions(-)

--
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
