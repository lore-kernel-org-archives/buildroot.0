Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52516C77B61
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 19:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A555A60C23;
	Tue, 25 Apr 2023 19:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A555A60C23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpNPbai9_Y5T; Tue, 25 Apr 2023 19:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA35960BF0;
	Tue, 25 Apr 2023 19:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA35960BF0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A031C1BF83B
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 19:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4976481E56
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 19:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4976481E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tVtsa0PFLxN4 for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 19:48:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FBFA81E50
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2082b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::82b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FBFA81E50
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 19:48:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jL9iMAmELspTctZVPtYhsDCux058obn2GfJquKpKDXsk2Y7g+RlvBQQz/HhoHMnJiyq5CDTUcPYI012gwD2TJyrqFN5pQUHxHeMXzoc0AiEgICIm0HT2OZGyTgsVeLvE1G8imMGx4+JwjzitoPcNvIa5uXLBcH48F1CuUEya/M6fHgSt8t1PRq5xH1s4tMcu0EN7m3ceUUJ2ZZoQcRCQN7UUrmym1LcNyjho7zmEGk0wUODKZogpa5d1e5i/6RxjHNAaF4e4pJjGwq/M9j9gqsEO8uL1nJYwV389V/TlF4sduDyYIrWR254Ce4scNxkT+hDv1Y1b9awyF6mcE1HaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BC0JcSpgBqS8lmpa8FWjzT2mNNY4SwT0HA9V7hDIHrQ=;
 b=RDzm1Vr3eeG0OFRbE9DFeMXivjI7UjIAwrtqfecesN6ZiyKWx9aHcKpaiWmYsvipyKjInz7WYWvNCiCbl84HRDwvcUHAOthP0FTMOJMBjJA690nUZqXrxWBVu9DroZAc6gS6gk8WSADkfk2zMIZXd12fi6RUVanNs2KHspxmBxl0SV1q02+iWsM83IPEP9YcgWKHWNFtc21JxL/amtRsz9kM/zQF+kEmi+W3TxuR8YKpEUi5uicjnyfeGALw2OnP9nBGphsXG661zpWEJUExkK0QYuFU8CqsFzjbZdtI5qOTL71dYQUq2nhhuXI6EhqJcfFKPNhEJ4N5DAHD+2j0Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by PH0P221MB0720.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 19:47:57 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6319.032; Tue, 25 Apr 2023
 19:47:57 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 15:47:37 -0400
Message-ID: <SN4P221MB0682FB7AA70635712FC71C57A0649@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
X-TMN: [d1mqRh64Yk4n9GUAigEDrrxE16iuggD8]
X-ClientProxiedBy: YQZPR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::13) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230425194737.4573-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|PH0P221MB0720:EE_
X-MS-Office365-Filtering-Correlation-Id: 9492c7eb-e71d-4295-d299-08db45c5f7ee
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvs+Zhh6OL35slIseIeUQLKVowitT+a+WY0qZRaNZAtTmnJXlhc2v+oazfxBVWFi64bmKyHB0UgNIjI/c0QHl9tl4pOwHiKsJsMxwQ9VLLZMY8m6v6ldTeNfovrAgOvAt+Noek7mqryjbVRaLpVtqMtTfuSA9AjPlIUdNwZ/Rp2uRABb9z38NfVcNbkp9JUxBci39k4Bh988+3ff2zVNHV3DISFmoV3Uk/heFWDk7FksxDS1HlPeOZmmNkoUXvEzdo0AaBQxeJrlDuA7m0oF9u7FG3pczAjjj8J6FCYW7Sk6tYm9ZVBQnv0y9WunJvOGEzUxgADBxNFTXWPZqS8ws0sQnNUeueos0+Zoi03nVhE5adSk9itGkhPQbmQhI3kRjYZ19ezOiAQD+qNVckYcXcx9Pj7b5AWsgUoxN0x0Gplqmh6Qt/5Ia2PbcGargcOyVTOai/EML3dPSy5CnNmGA7kUQcbKUbypB/31cewTbbDT8RnBKKUFvU/dWza6Mtwp4IR+4s9kfV1ncikHE3N1Xzj6BEvNbK/1jADD98eIJDDrt19kQlK3SBJGGuB88jpfbeqqGIwjzbop9wVdjCE/GOcWienfg7DrBSX6cbOJ+nl7ygHvpqkaVD77LGrQ1Mamp0Wa6L01uzVb9n5a8W+J4ggrU+XW2WzpY4orjcNr556dOSs6w9EwEZs61XER4H3RMbHkfio9QnMc/MRCulxePzjGH17+q7eppMdk4l+doZ2Xssdhy0kRwM8ZxXZuJ/0k5AI=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mgynX2qvvzmNy/25PwTb107xaTz5YbPN4ftNbn8B/rlBHs9w40yEPpWsilIiR4Wbf3l+edDxVXBuKazZy7cG5ULO4QE2KP2bwrgnhDoDhnY62VqVPJmN9XidlUf1gzEq+l2qY/u1GRVLstYGEZKNiK92tq0JWQFI7ogeuZ7VMtA9Rdix2qyzMDUn0j4UCVPRvy4/eLomPOnbghk2HBwqNNAlq5GIiMN7cGNQBLv/bo/zCN8hz2+tvyT3+ps5QQ1XQUeq9E6L8IKTDuDZAVQ4t9PEg2oAvpxD66fmGWNy6Qw6CuHO9jq0gyt3alzX0CA1UoF+x/rpYv8RsVR6gScdY6/MMB8lGZuphbX5BFEjoUfi0LHeuHPyexrYUtP8ftkuIkQffCDsPKmb0oeE5ZCQGRHZGhRjmQJF7VWYsopuf1uVGU024h4WV1aF7B8B0RUCmNm6Xjw2mmJu79wq1QwS5ZT7yoCbxEUkbZ3nJGwb35zXT8nRq86RhPXGbF1M6BR/WjGjueBZFHryrXKJqe3iiOHNbhYtcxAKVGjE58QFifZKeWNfU84hinoLbYKiSC7GgjN4lLhVXf620adzjFJtj9hmF38gnPNWBJ8DobWGRCfk3tJ3CuHhbuEc1KgygY2V
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jw+g5zJMmSe9mqmgjtZNyanmh2rUmwbz2tnLjzanXRXR/RYwqoH7oEIFhKak?=
 =?us-ascii?Q?MSl3PoDHjF6pHHgKC4DnH+8iXo2UyVGGEug090V4uGWQjldpmHV0Q59r6piE?=
 =?us-ascii?Q?RB8xupXAG5tDJyQJmLvGDO+AYLU9AwwXPmqnFIBD5XeTFuB7KwclQHrKILoT?=
 =?us-ascii?Q?NrHSkMbpJQJaiMAYkgzyMtJOUTewwBxeeaRtoUODvPHLyfnML/R846bQ50Fo?=
 =?us-ascii?Q?qxZgbhpB4XeK3O81zMaqRC0+3niKdV0WvtdDBhBb6qL8OJJ5vJgMJfPBAlRV?=
 =?us-ascii?Q?m9L4ls6HRCuEWytVZHz4L3go7TdEeiRSERbJKw6KpSzMuu9zH9ie8zkht68c?=
 =?us-ascii?Q?u+2Q0uiGvusSrr6nmAx5c8Y27Z40CzhSWVO1DvFcI97o8t+WnnKPR7ZBRZ0x?=
 =?us-ascii?Q?LJDChBbXwnHNlAMYhH7k841wQLZbV0xI1NYqQ3JDodTo+Cavfh9AZITSQmW+?=
 =?us-ascii?Q?g/Mpjn1gN1mZELRSTOjeUBgvBjkNAWg9RnBj22kU3Cv5uWxf3Y1x1buPhtCB?=
 =?us-ascii?Q?J63U7KW1pFDbtXhcc8bz1plBSTfxapj37Z9b9q97fiPljws49gSE3Ma32EVq?=
 =?us-ascii?Q?t11MLQh3nDv63SpL2Bab5+l5Xem6pSQAZ0PCV7UhQkIvzoQLEdBBsThneh2s?=
 =?us-ascii?Q?DSAfe95XlRqS9ZEnbIjqnHkgCaTOJbumZHTX2nlFRpBDgeuJsiIYeUZ3MYux?=
 =?us-ascii?Q?IfJbgUbcJJpPDpScOoP9dHyjN6y30n0GoujAFq/UDvbzxDzt47b2c3wfnhMv?=
 =?us-ascii?Q?KnszmivTi3r+4OcqpfgmGMuTni6jNEQ7kEwpjvzvxtQSV8BNltVMNW/s3OOh?=
 =?us-ascii?Q?GB1lDzGTcr7HkxSQH04QAxO8noe0gPR+8USZ1acZMvLI8T8Lu7xyc/9aDkGq?=
 =?us-ascii?Q?7WkAJISiY6bCDaSLc6zlT9YK1Gm6Vbb2gZFeiCa0Muiajf7gy1kRTSgU0bF3?=
 =?us-ascii?Q?qWx7q5rvDAi6/zodVncglK8DamcGaloeH+IHNoRWE10tVv/7vrfkoLjtZKzl?=
 =?us-ascii?Q?Iy6NpK3iDhH8hCeszyLRpBTV6N1/D8xv23fYyN627F0iXmGZ9GyxXftnL6ke?=
 =?us-ascii?Q?svTTxoA4d5uGjDbIZu8smzFqtZLuceOhNTTIu9xOMZ1Kizsep9if3eA/7CSh?=
 =?us-ascii?Q?f66oRyfzeKo0OtyD3rwnEd1X3+B+jBm/lSs3ftcXHnBMXW6aqmYtTi/RIGrJ?=
 =?us-ascii?Q?k6p9BoDn4C1/Iy/fzN+4UOytx2CQHYVITHjf+psvhLJYw5Zfbjbyxn2SBiY?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9492c7eb-e71d-4295-d299-08db45c5f7ee
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 19:47:57.8129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0P221MB0720
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BC0JcSpgBqS8lmpa8FWjzT2mNNY4SwT0HA9V7hDIHrQ=;
 b=lUHV5960O3VP744b4VJrU+FOJLayLs2Jh+bfNINes2tJAM7PNNideU6eGtDJZq0ljb4dKHHFC5uslijlFWAo/1QIfo9UElO1jATQgtlyNp8DHrpSaKL2iMSz49x5MnVgtngmmF6qBD5tK+R90xOPIii2DPWowAZxrcOPu8wMaTv8tfvzmW5X2MsLOo3ZD+0v15/rTBptXHsvHn3yQJ+SQTzCluuQyJB38BMvju/UKpjVzELEvvO8Gimi39q2nFFUsQHjDJ8yo4MJrfQZ5cyaO/2GiPCToKFB7jUEfmUxx1vI/KQqII8EGGm+070TZn4RNoYeY9Lyp918OHae13kN5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=lUHV5960
Subject: [Buildroot] [PATCH] package/sway: add runtime dependency on
 xkeyboard-data
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
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following change automatically selected the xkeyboard-data package
when sway package is activated. Sway relies on libxkbcommon package to
provide support for keyboard keymaps. The libxkbcommon package does not
provide any default keymap data to use. In an environment where no
keymap data is provided, Sway will fail to run (at this time, the
program will SEGFLT; but even if Sway is updated to handle this error,
the runtime state would not have any keyboard support):

    $ sway
    xkbcommon: ERROR: failed to add default include path /usr/share/X11/xkb
    Segmentation fault (core dumped)

To help prevent this from happening, the xkeyboard-data package should
be installed as well to ensure a common dataset of keymap data exists.
This is the same approach used for the weston package at this time.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/sway/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index f8d073520f10c6bf8e00507e70cde99726da1837..802d3d0aa93ed68fb64a3bbc3f5c50086054d2f4 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_SWAY
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_XKEYBOARD_CONFIG # runtime dependency
 	help
 	  i3-compatible Wayland compositor
 
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
