Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B126460A2608
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 16:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SUBNO9cq;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=r3dLelm/
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81AB4408D1;
	Tue, 10 Nov 2026 16:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLIvn08epdUy; Tue, 10 Nov 2026 16:12:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A1A2E40888
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794327179;
	b=PSxjy1kt1cVlZAX6Rh52iidrRB5XLzUTUSRlMbczumhsfNy83Zd+TrbNNDdy8v/f6/E5
	 2teJ3CdiJA9jVCfKZT7I8sy7XDk7Bues+tASRG6aVewX+XirH1QpumsVYuVvnRAQkpXU0
	 gjZlSWKwTp/pKh5p7HizA6vpcfUhGojV1XivSoiCpXLwalYzxTBzc6GCLRUIMhAUDFhsN
	 hvkVqfMhBtt6l8hoL4a3LNrpzHnAqEm76o4ch/1vP2XVl1Kb3gLbD3xVGsEGtL3jGNtrL
	 KQPPw3cuApgoNyrBzoOqJxh067z4iTKWlriqcOXbjUBqesi2JiTRUy9Lu8dSBu33xsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794327179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Received:Received:Received:Received:
	 MIME-Version:From:To:CC:In-Reply-To:References:Date:Message-ID:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SjcGI/JJbxzvFYP/roV9O5bd5lrFlsIRifdgyzmavCA=;
	b=eEJkh25KVlux5WDmNYbpAEi4w+vLP1A/a6+lB8yo9TPgfDy5SjBsdZXWG2Xn+qv+92Fh
	 OKjJcIpNBjpHUrbGjXOBTyoHu8MLWdg8P6lx6N/wao+sujiqJCUyTGIydkXsN0lHygip8
	 8wU2K0Wu/VoRcf8lgK0rBg183GBjC2C2dwlzqtSejRYKdi4yngHcTrzOTWbZREXVEFj/V
	 VDiId2FmOpWHsLdk9XPvu9qsRxVJCP0MvaNOnPkJrJR+misAWzb6+U0jR8fn2F0RBJmXC
	 eIMWLleScH9jNb8MBZvXcLrfyaWtMU0W/TNBXe/DGQ1IN5r8IvTvQoHCy9z+Gct3Eig==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794327179;
	bh=SjcGI/JJbxzvFYP/roV9O5bd5lrFlsIRifdgyzmavCA=;
	h=From:To:CC:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SUBNO9cqysF6U3nlcWkUFVBRFKCbwldKNL6AEbB3dUTlGmla5oskqgUoX92vbaaQ1
	 wWcCZOmSSIJBLw+AckMzkiDCQ8SbIohttIjvyhiyfOuuxzy3/CjRFfiUoNlaPQnYVF
	 Y9QpqHWuyg0hmVbtPu05QcYEqkF06l3LMENRGkGOSJGd6SNfTMdztDeINhMPOeE+uR
	 kiPRHvTgkFnpv1SFlDxkwp/dHzeqQ012373MB3nE74OL9Q334fNS60PQ8YqpFYfiFx
	 jxP2gd8XCfYqKW248pR2EA3Af90yG4EsHMluYBrDbo+K1iHXrteDAza8m4zLiEvrr5
	 xSbfVYlzm/7iA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1A2E40888;
	Tue, 10 Nov 2026 16:12:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43C39731
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 358A38112E
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-xddqXsLbUv for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 16:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4C102810E6
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:c200::3"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::3;
 helo=du2pr03cu002.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=r3dLelm/
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C102810E6
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBthZLrE4gc9MqU9zqwSa8+AD56X2IDDKqPIb5A5O7c=;
 b=r3dLelm/rCJJHrZUrjPGCEzdEODBGz4K98IzsYrHi1EI+uRffU0JAN+tPgvheusjA+x5SbNA7FKrozudXTXA8zJr45oL6fxUmgHK22WmKQ4vB/KceS9IzEHyOXffjGrmFj3lZol5O02/PpPTbuJIZjUStTR9i0vfoRq3kGxWUMY=
Received: from DU2PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:10:3b::21)
 by AM0PR02MB5779.eurprd02.prod.outlook.com (2603:10a6:208:189::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 16:12:48 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::5e) by DU2PR04CA0016.outlook.office365.com
 (2603:10a6:10:3b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 16:12:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 16:12:48 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 10 Nov
 2026 17:12:46 +0100
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 10 Nov
 2026 17:12:46 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 10 Nov 2026 17:12:46 +0100
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 4BF982154;
 Tue, 10 Nov 2026 17:12:46 +0100 (CET)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id 3DD69305D5A8; Tue, 10 Nov 2026 17:12:46 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
CC: <buildroot@buildroot.org>
In-Reply-To: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
References: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
Date: Tue, 10 Nov 2026 17:12:33 +0100
Message-ID: <179432715366.3490013.16512819610590658919.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=674;
 i=kanak.shilledar@axis.com; h=from:subject:message-id;
 bh=mxNE+gonrYfRECHT9KNnWgy3yXT9ONlYd9K2i2jKZWk=;
 b=owGbwMvMwCV2JPnG7+2HZqUznlZLYsj67FRjb//51Bv/glwR82dc/G9MntlG9qge8Hl41OjA5
 ddbnXN2dpSyMIhxMciKKbKcM9oevT/5n+4caadLMHNYmUCGMHBxCsBEgv4wMiyceGWi94zLLc/u
 tmx5tH3n3vP/Drw9cnyTzOFjlgfVavT4Gf4K72nwMVTOmjRxXvC+K//37Sjt54yImH1ujsjVH+/
 Oy4ayAwA=
X-Developer-Key: i=kanak.shilledar@axis.com; a=openpgp;
 fpr=CDB0F1C8EAD5B522C7B3A77928221FF065DB55F9
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|AM0PR02MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 663e0e69-96a2-40e5-480c-08df3f45767a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|22082099003|6133799003|11063799006|56012099006|10067099003|261026140227099003|261102123227099003|261009223027099003|261022075727099003|261021121427099003|261022105027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: YjbZc5wWKrXiOIxxtuPM2MwMOuw7RRtnNTUmPSyJJva7fI9/ADppNqH9jIR+/QRxos9UPT6KNUwZjbw6exvycP9QO9G36QU0aM968K5JxSGdmvohLOWfNjHMDb6UWscoT7/Xe1Kc6M7NW4CJYAyLcI+30HKAxjftpCYfVyNs6tQ8Lpww3XMA7i+03/W73r3aFti0lAw4HGSp4JuXcRGE85pSk5/RVCagTSLug3YYMcLICC4b18TYwR8GfUOiwanInSnA0Ove/gtl1/RX/uJ9lnlJSTaixFqIrLMIVYVYS/xFp5HBwpmcot22lR3GuQOhELCoz75JbkiEpo+iR6b8eftyrb6RFhCQpN2a7tOpnNV8DuSco6AwcV4VNntNuecN7uOUnwgvOUlAGDBnCcRVeuLXJlZw4ctn90jP4wbccURDWMyiW+zv3+TQLNeBYbi1nPKp6XDiWHi6IaxqrrXO5sRwUJor/7GaT2N17QqnsNhmQloIoZcea3rfDFK3jBgH+Y9StqSqTJp1Tn0Zf9gRI6tSAWzKUUPKiJXu0+TMEgcQY2+hmxVpBGPp+k++WoAOPJhxOMJfYbOpcebKaHUm8Vo7/SdXQpfQ2TTtJ+ULA1J4SQlNC/3+EBtASOd49BjEaS85AwZBl3SvQXHgU5IdF3pmmYQDDKuyfibI/X23QFgVkeLiP60pz6m20QaFPKITZL1rMga+QxhJfvwaNEX/lg==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261102123227099003)(261009223027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qx08a/+y9QUTbBRq5cw1neNyHEw1Vh2MLXfP7ZtRPfHMNkaarMY/Eygs/qb9NEOqMXPq4IDmHPbdWy/blJuaROFsgyAn86aV0+Gc9afHDtkC17p6uzZTlKv8g/5F4KCxajNEFkuiSTG7CnH0Eh2T9Hlds6+kE//kSuzdi7eao3tDUhVGdYAFTIcXUiryp6o1g75YHWQT0XPtzzcb+MoVUdf5Z5msKo7k6RekGGq+mgap+Or3jFi1QpF0POTTJ5SoWY7T1RuhuKb3O8OIXnPTWw0p5dgSB1wAeAfxu3h3CF8mpO98vsPTt1FmdSTXRyhtpu8iItH4PpUnhP2J/SvpsduSi0XOxZIm9SmdeMKHxJI6tvVMxQ5AIpcdzZZJnBVzgyDG8ElVl500fbRMUtr3+fECdISor2eRPFz03d/9ST8WtYTOW7OZ2mdnbVcH6SWA
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:12:48.2430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 663e0e69-96a2-40e5-480c-08df3f45767a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5779
Subject: Re: [Buildroot] [PATCH v2 1/6] configs/sipeed_lichee_rv*: require
 pkg_resources for binman
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 16:22:53 +0100, Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:
> The sunxi U-Boot build packs u-boot-sunxi-with-spl.bin with binman, and
> the defconfigs use a U-Boot fork based on 2024.01-rc1, so binman fails
> without pkg_resources, no longer provided by python-setuptools:
> 
>   ModuleNotFoundError: No module named 'pkg_resources'
> 
> Enable binman with host-python-pkg-resources. binman already selects
> pylibfdt, so the explicit option is dropped.
> 
> [...]

Reviewed-by: Kanak Shilledar <kanak.shilledar@axis.com>
Tested-by: Kanak Shilledar <kanak.shilledar@axis.com>

-- 
Kanak Shilledar <kanak.shilledar@axis.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
