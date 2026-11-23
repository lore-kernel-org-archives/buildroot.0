Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5C7606A330
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ec4EbqOt
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B5B96077E;
	Mon, 23 Nov 2026 13:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8OSYEFEX5AT; Mon, 23 Nov 2026 13:46:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3387A6073D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795441604;
	b=eJqpzM+lPIVXCuQhgGOzXhnxejZJltnGcqmYPfz/DutF14mHI3yN1EjgZIX69xxXUgcT
	 Jt2h2nC8ug0eOKuINJxL0CeDn74uIsrcYC9wOaz9GDoQbjX45dWyVdgcRtHWaqa7KlcSb
	 4SODT9G7Gmqq5pxyJjmXAxNzwE3SonAGL3d2vs/48ce8DSp213TvZGGqksXdLaYcJUSDD
	 veVEF9tSrWBav0b8C5qKpEU2hzwOecBh/6inSPIRzac/3l6BPUd7C8lZrABGnvJDnrAuj
	 cvtHSipray8BeEUq32+3ISFQ9sg0szlzpHOPFHS1MvSbnwqTs/CruaHtHQ8TcYX7uAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795441604;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Date:To:Cc:Message-ID:References:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kHcck03Tzro6vWSP9lDVTSzwSY9jw0GH6JJAaTsZDAo=;
	b=sQmNs9iJPWeUPr943c0OJINAa3kCeXjx2ZxOCwdsrYRUolLpSao2sMufb4r6qJQYmVA/
	 cwFv6qMcGmaXk2Rn7LAY/OgvKt/nNM20iacB8pUQY+K5DYjjKX2fbdrF3bLHPzQh/HJPG
	 tt9N3TFJ0sldzM7gTqEmH2izMKvFfH77E+dlOhlJNnntcHKKFWR93CIpfec0JmgNFkp1U
	 OAJbWV1Pc7Y+ekyYXXNa0JXY7sxhVDHJ37kEjRZh+wvdcbUWrnD4pA+FSQLvlZL6/3+Kd
	 /X/Gc2xn81THIPpcirfjVuZK55GdtCbjJ8nSdApQpxQZFhTUvQeA3MNsYp5oTIXeICg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795441604;
	bh=kHcck03Tzro6vWSP9lDVTSzwSY9jw0GH6JJAaTsZDAo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ec4EbqOtOmi1MeEshVi38Se3uyZ4UVF7SeIgDpO751QFQfj/tLEWC2zps+q6zUjVZ
	 OhLJ98EbjchI9d/p+UJiz8BOj+V2CqAA/KCVOwd2mTPGZN2YG6/oOQeXCSjrMfBx2v
	 L/emt5ru295OvsJ3prk1sOWjvuwPDXXDsrtNsfE91W0RC6OjUxceRVH9J9u7jY/WQC
	 uGvQFfeQO5ceu3R9N34XPW1vzEdOhSLoqY8vJnqXum5XY4W/ujibrI/jE0Ds7DmK5R
	 TFMnqC97BNcm2Dj3fMUpvnWyduGLn3wX8gMwW4H+e3TJHuSgTX8DDBJGWRDhoy2aGm
	 U1r3PG3lcii/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3387A6073D;
	Mon, 23 Nov 2026 13:46:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFDA41AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 13:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A61BA80E23
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 13:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuSSnWbvBHoq for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 13:46:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AF7DC80BB9
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10c::1;
 helo=sa9pr02cu001.outbound.protection.outlook.com;
 envelope-from=colin.foster@in-advantage.com; receiver=<UNKNOWN> 
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10c::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF7DC80BB9
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 13:46:40 +0000 (UTC)
Received: from CH0PR10MB5290.namprd10.prod.outlook.com (2603:10b6:610:dc::14)
 by DS0PR10MB6222.namprd10.prod.outlook.com (2603:10b6:8:c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 13:46:32 +0000
Received: from CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5]) by CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 13:46:31 +0000
Date: Mon, 23 Nov 2026 07:46:28 -0600
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
Message-ID: <awRDtN3q72tuxKWT@colin-ia-desktop>
References: <20240103002810.1055951-1-colin.foster@in-advantage.com>
 <20261121203726.3858693-1-angelo.compagnucci@gmail.com>
Content-Disposition: inline
In-Reply-To: <20261121203726.3858693-1-angelo.compagnucci@gmail.com>
X-ClientProxiedBy: BN9P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::31) To CH0PR10MB5290.namprd10.prod.outlook.com
 (2603:10b6:610:dc::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5290:EE_|DS0PR10MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dfd98c3-3218-42c4-8802-08df49682e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261009223027099003|22082099003|18002099003|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|56012099006|4143699003|10067099003|261102123227099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: /cTiFlNlvObJeS/w7bugyqePYhtWYBXUuWX+bd5HBMSZomZbTOVSY1qSvjNFu/zjLw/U8THoGcIZg5s49DDoNe+DM/IsyVRoCUMSjvGDVzZlszBUGlnKpyA74Kni03PZyxDulJ38nqdgJRfbiHPW5yEod/qGYJhPX50I5BQD6kspXp7FeXsg0NDnA7wiWy9NTmemA+Nr1cAamKLDr2TYGH+NN4CV+obDt4/YIvLYs7zBipopzeo427mMhbNmH7DJ1/ciuU/kW/1072o5jQntm5HX3aXBl8GPyNNooIwLq1dOwkXVLDzseLSszXRndCvFoHdV6od/s/B5CRol2BM31Xj7+bLWX5G7lfEYGXHST8Onl33mx511KzgmevMnrO4qZxlJZo7CoXZjY61ZFW/8MqpCfjy1n5n2xMJ8UXRrkkVuASlYJwnTh13WUy9caWVHPIZThuVNZy8byXYAmbERITQ2nx+hul5GxrGdRjIYbklQQZ9Kc+bCrlECntV0gRSkX7uVS1AqMmP7jleC8dhtnt/MIVZINJU1DuRm2WvdDXIcJ8psii7dLxVkVwWpId9kK24UKmzhZpE1BHQ0fAzCYSoXEFnim6uatlRxcoZ8oEh7n/IvtoaC7Qt432ve592V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261009223027099003)(22082099003)(18002099003)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(56012099006)(4143699003)(10067099003)(261102123227099003)(11063799006)(5023799004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D09f2VBEtF+j/zJwlWRMzo9k1PQB/7hvupvPOinmQ9AKWtV2O1OoMm2yWsU0?=
 =?us-ascii?Q?kW8O7lXCYOgnXkhiBNN1UhTVzBym5QhqsLn3gS3601KzYG3c87Ib00IlRIeh?=
 =?us-ascii?Q?V+7L6wYYkApt2LCHB3LtBBgEvxF6D9TWkhvjnkErnQbY2JsBk2sj193oNeeD?=
 =?us-ascii?Q?rrBjBQUfUKy4iGhm9kCiGCBArlVKNPDNC/l2hrQkScXfXMez4XAm3yYtGXtQ?=
 =?us-ascii?Q?oKLh+Dsm9I9RMoVVdNBk657abmTl3lmkh6tXOJ2mZeRmz29mYhSqtNRXpS1T?=
 =?us-ascii?Q?VjHj+qwQ9jhStCKHOsb/oLFdPzddAWPHWreYyVpwGPhu4cRV2x0o1EzXzyKp?=
 =?us-ascii?Q?X6HcTpvvq5xhrZRgEdHfJllmm0HD/vCRHIDpZBwy5RQzUVBKY2DouVrQEoKj?=
 =?us-ascii?Q?tkYSvTWWfZJmYr8Chgn8zwJoKbezGzpwdRKMfYfbIzWWXCV8+SpSkWhz8qvp?=
 =?us-ascii?Q?sZ3JHECx+MDjVJhy52h5CrGKzXGrF1J8SfBsAQb5AyjBJhQGUMj9gZI/I4ZQ?=
 =?us-ascii?Q?msRMQcjJZ+YKSvKILmVs3LuIWT6cldJrsdsYy74GmVIVf7Yd6YRS+rgInkTc?=
 =?us-ascii?Q?s2Am42aiRCnyShtbqPJKe6wmBeXdLOOH/6iTctyYaqO036uP1GvYtxFa7Eml?=
 =?us-ascii?Q?E6l+pxILkX8gUYPNNydXAiU7OqpveOOM+Pkck4HYty9J9dkwGtjCGsw8JYZG?=
 =?us-ascii?Q?0s/8NHEoQqG37GX1qLYMuQMuhQRi0188SDz7PzHAZj1Xf7ZVR2Cse4NYVe4i?=
 =?us-ascii?Q?kFSUFyhKqQsQYNwR8lfIhD4Cq4vB1jWhZNUFNSmt0doWILJszpou6hzjskqW?=
 =?us-ascii?Q?5KI+7WVxhLoxFXuObAwrnpQ0K0lLIz8RBJexROaMwMZT3cjQKEpPTAr7T9bd?=
 =?us-ascii?Q?QItJoTLcFjSgwp8vXoN3PcIbIAxpy+Zh+qXqS1HkcSh4XhgBy8n+cn+Olpt0?=
 =?us-ascii?Q?aXj1t27fXV2I+C8w/KqnE0R1Ffv+Pbn48mfwZpslHoIVEgME/xcBgEEWftEM?=
 =?us-ascii?Q?0ow8Nu6MVpcmuGkvx2OifiRwNbqjmLMuRjzfa1rxxQ/WgHGzHX7S90eY2J1C?=
 =?us-ascii?Q?QcMM3xr74E9rfXvyF7xpMAPJiICjJJSDwa5HCCeEqqKOVFXKjOaz81tGThrx?=
 =?us-ascii?Q?HcsOrX1mEwUpuCOV9Q9OlLuINRkFGeI6XZxmMNf6t/RkVgl7EmTnJWAbrB/q?=
 =?us-ascii?Q?PQ94AjbfDxrgVbsAEY5EDvtdmBBSX7g36iWcnWdMRDS3tFgN0ynFGFtthY8O?=
 =?us-ascii?Q?ek/QS5fuE5F5ZCo7yA9NFBZHx3psIRozD4QxuZZyVcURGy/BXzPaYvRdT4he?=
 =?us-ascii?Q?wXnu+eoykLvC4qwweA2LknFW3hTKsoYpITXtqI4H4kam4Ceg219esVCpRCxv?=
 =?us-ascii?Q?c1w1WLvBCKcx+QMn11eutV4Z5/7tBwzTqD6attiol2aD83L3xrzgsUHcUmGs?=
 =?us-ascii?Q?ftZ9joFyIGmmbb2Z6kZ9BeacWNSmJn2HjF5WSgl7IezSoGsnHUPQd+BBux8G?=
 =?us-ascii?Q?3mzq0a4d2XQjgTa0wbl4hNdOGin2Nj86//7ufK9NLgQibAeNyce8I1JLDq1T?=
 =?us-ascii?Q?9ouj2120+6AaajzZxB53liyv/R0R/i03W7aH808FBX+V8Qrk4ODG4sNjvwYQ?=
 =?us-ascii?Q?LpAr7HrLuP/G4Yna+xqtE0uoXB4Ght9JYkATKVMxiQKpDW4WY8BktREnceA2?=
 =?us-ascii?Q?CVqwWjiwU4aPv/lhnoK31AYivzCVlvvw8nUHWnl9Ut55o2UuHbTpshC+CnQN?=
 =?us-ascii?Q?GqPp4akAAnnFM2tFN67jQdMwM+6RVEg=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfd98c3-3218-42c4-8802-08df49682e2d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 13:46:31.1171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rpVMrqu7MSlYraGWBXK6I1JJavutzCXZWrQZsL2htJuMzryL+wproVSc/EHxAfSuiQiHHBoMc7IzoNZt2XOpuWYSA5UUPflPAaiwbZ2Z68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6222
Subject: Re: [Buildroot] [PATCH v3] support/testing/run-tests: add ability
 to run tests from external
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Colin Foster via buildroot <buildroot@buildroot.org>
Reply-To: Colin Foster <colin.foster@in-advantage.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 09:37:26PM +0100, Angelo Compagnucci wrote:
> From: Colin Foster <colin.foster@in-advantage.com>
> 
> ---
> Changes v2 -> v3:
>   - new approach: instead of copying all the tests to a temporary
>     folder, merge the tests of the br2-externals in the tests package
>     with pkgutil.extend_path(). Nothing is copied, and infra stays the
>     one of Buildroot.
>   - drop patch 1/3 (try block) and patch 2/3 (temporary folder), not
>     needed anymore
>   - list and run the external tests with -l and --all too: nose2 only
>     discovers the tests of one folder
>   - the build failure in the v2 cover letter came from the build of the
>     test case: it does not use the BR2_EXTERNAL environment variable.
>     Document the br2_external member of the test class, which does it.
>   - document the feature in the manual
>   - rebase on master, drop RFC
> 
> Supersedes v2:
> https://patchwork.buildroot.org/project/buildroot/patch/20240103002810.1055951-2-colin.foster@in-advantage.com/
> https://patchwork.buildroot.org/project/buildroot/patch/20240103002810.1055951-3-colin.foster@in-advantage.com/
> https://patchwork.buildroot.org/project/buildroot/patch/20240103002810.1055951-4-colin.foster@in-advantage.com/
> 

Thanks for finding and running with this!

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
