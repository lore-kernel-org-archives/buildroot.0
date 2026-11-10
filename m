Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD5060A2604
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 16:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q49gKdD+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=S8z9945x
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFB838112E;
	Tue, 10 Nov 2026 16:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4S5szsWJZHo7; Tue, 10 Nov 2026 16:12:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DEFD8810E6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794327178;
	b=s/fda2AZiUZ9P6fx43PLCAwcCJWR8j2+uY0uBEKGNZnp3bH99AatorMfe0BENApDGv2s
	 Vgshx/qFPJP20qA33Q8H677XPzwB2wwNKAsAoLpMdtCXweqpzFqb/Mly9TCyKhybQm/oK
	 IaCWYzFdeorU5bj9xNK2MoU52gMVuF8a6a/MK0zRd7hs4GhYeYMsdfY93pKS29xA2pj9C
	 FkZ4lPN4VFHFKBiX2B1H2VAdZC1RBXf0SrTjJnGPXglBzCHl9rykXgTOTNjAYYZUim7Z7
	 Y0IpuXsZ1V4h6MgJCOXEeaKrbv3J5yZKr7+mWuawRwy/uQ2/Juumx1LB55txlFgSY1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794327178;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Received:Received:Received:
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
	bh=SisrWurgowRyDEFKyeVZKXlBsXOGYfl28OH+JjgV+9I=;
	b=kLWiNIWaBfTvZ6MCqlVKMhDxbYl+CBmcE15WhCGaHyzqdvnUyxjUwr2UnpGVWaM8LQv1
	 pDWzTZzI+XFyPjnOcWAfi0GJGhXSDBktuOSCFZlQn895k8V+y609JUgO16Qjk5W5385Rm
	 EHo7ZYGae5qP+b5FfARQ7ioCFy/YGxi1IdepeODKRKzM/fUzKqCZUUvHH1LxJPysmEyOz
	 vP/Z0JwB2qG8I1mOKrQTtlYunM7rLLXAJex0ni3c1rs/xaJPw9RQF+La49PdgKkFZ/+Cw
	 iLMjA8W3J174MGuY6pKBMz58bDN6Mk6GAB5+W5/+K2ragRAWdaTiOoy5lLvANrRsBJA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794327178;
	bh=SisrWurgowRyDEFKyeVZKXlBsXOGYfl28OH+JjgV+9I=;
	h=From:To:CC:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q49gKdD+FoJTzyOxi1d46NvN+tk70AnPxQV8KIDJq7GKfXr0VNHQg875JuI0j9lX8
	 fpqREkIrpl5njNSKDMeNTboElet8/Cf5hVari1YXNQelPtNKsSxNEreVGHhe/IU0Oy
	 yThKM558AifcLDDbA28t4NsnGq6nG7myDP/WW32Uq9gn6B2RKwf5VocCwDrnaiHXZF
	 ZuclVhqInbUA+TT4DISrKbKx5VKRPuPMU78Pg4+lYy6tNxtUxH0lnfhnlXp5Oy3pkd
	 A8ddnXtqBVfYeYEHvYiEY38qsb3ceJyMNlFXlDKNwk8A85zK4s4uepGmm54sGQZ0qk
	 KUCh6TjZPFA+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEFD8810E6;
	Tue, 10 Nov 2026 16:12:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFD0D388
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EFBD60847
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6G6SoG7BP-J for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 16:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 81E9C60778
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:c200::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::1;
 helo=db3pr0202cu003.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=S8z9945x
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81E9C60778
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gl47yqnuQhYvU0GTuKAyBU8bt2YEBoQvKcw96ZNuebw=;
 b=S8z9945xn3hsjBMNNSeMC7W7A8ENmz7mUJzUlDa+W4K/haU39qrIiHzqSnf1HQHK4sKoqMSISHaYOsTl6f6iyLz6yUUxndSRBgPfUaFehWTwmySX/EHD61geYK9W3WmnuswjgWJbJ0VqzJXPaiHv6eH6bWHP103ZjczKuYEOBJs=
Received: from AM9P195CA0023.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::28)
 by VI0PR02MB11692.eurprd02.prod.outlook.com (2603:10a6:800:315::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 16:12:47 +0000
Received: from AM2PEPF00070CF7.eurprd02.prod.outlook.com
 (2603:10a6:20b:21f:cafe::6f) by AM9P195CA0023.outlook.office365.com
 (2603:10a6:20b:21f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 16:12:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF00070CF7.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 16:12:46 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 10 Nov
 2026 17:12:46 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 10 Nov 2026 17:12:46 +0100
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 53B9121B6;
 Tue, 10 Nov 2026 17:12:46 +0100 (CET)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id 3EAC2305D5AB; Tue, 10 Nov 2026 17:12:46 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
CC: <buildroot@buildroot.org>
In-Reply-To: <20261102152258.1948796-2-angelo.compagnucci@gmail.com>
References: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
 <20261102152258.1948796-2-angelo.compagnucci@gmail.com>
Date: Tue, 10 Nov 2026 17:12:33 +0100
Message-ID: <179432715367.3490013.16517871149078449901.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=359;
 i=kanak.shilledar@axis.com; h=from:subject:message-id;
 bh=alsyUc5Vlu5v5flFGGZiWo+5BkhkN+M4JqJmdAhHHxY=;
 b=owGbwMvMwCV2JPnG7+2HZqUznlZLYsj67FT7rDQ3eM369b778tqONxgrTvun5PxyKvOq640HT
 U/EutUf6ChlYRDjYpAVU2Q5Z7Q9en/yP9050k6XYOawMoEMYeDiFICJHHrC8FeW+Uvcz8aNmosu
 +R1RzY9mndlpbWq8eg37vgZ/zoKYzoeMDEu2X75SYf3/fOztky83nHaZ2lPO7p76yyVsjUGe7wb
 uvfwA
X-Developer-Key: i=kanak.shilledar@axis.com; a=openpgp;
 fpr=CDB0F1C8EAD5B522C7B3A77928221FF065DB55F9
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF7:EE_|VI0PR02MB11692:EE_
X-MS-Office365-Filtering-Correlation-Id: ba668fea-aa71-4b6c-18c2-08df3f457585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|11063799006|56012099006|4143699003|261026140227099003|261022105027099003|261028144727099003|18002099003|22082099003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info: ELLVSwo+NVQAe5bp/fQ1tgsXQgvXtK3q86AIeOpR/664Z1cxBNimRtaW/AHhQpSV37D/NR8uSp1VTF3/qcmoMPkCNLWSLITyJyhv1+gha3mjGtMbDblVWxUMdwSfZu+c1noyXHOhz+9zB0mhUEbW+jjBOpzH2Sa3dQ7me/ivO7eY7ev7+rkxq9sj9CIjo09KJjRAOu0zkE6hBY0xa7BUXPTcj8CSqm7/qcwXbaLrwoyIcQjent1lPimNef8j9zQcXOsMnMulBLmIh7TUVmpdptQCRUDEKdE7IkSbPVMExOqCJiRJ6PZo2xfw1cERNGd37Slu2Xm2ZSsuWp5VSgt/ZPkRhVya/CAOBBK0uzKDvP7EEJIznTnBUUpsh4ZVwKZKkeQRiwppz0zjOAnZdB5fI8rx3oyw9dB+f3neW+uJdugl6VOvQl2h6bDbwDI7OdX2qtQFltkVGzqclktpKDq1nTojHyxqYjs4N4Vg0LaaJCyw8LqURMCvecx2FvP1KA6HkjtPd7eUO2krpjzLQETrt1yoojozMbWl7guc4Hxx4Vr7tO/Iz+mrSqT11o/8sGsu6m3j7+FYA2LpjD6Y9D4ChEDD8CnYxXUgi0QtV/EbGWLNGjjM3thYaVQifraXvWc1AU6MAabAMC/p7ideYUMong==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(4143699003)(261026140227099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003)(10067099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vlFR2UEEZPcdR34tO0GIlXSJfcSGCrVFMs92WbMAL5BkMpcr5Ya8hW7P1V8qss6R+tnA5MM34DZXDXnnfEafXB6NTI7p71UocM/OeizUN7IPmXgaRttdyGU/WvvkhZlRXsRIUCz8WObCQD8ScsAAWQ6w/aHdITqbmhepi+I80zE7pu6T/992N5wGj2w15athhCby7iOhg0eeYseOq9MG6l9dYAzKdaKN13R/dHVDc/ug9RiRK1h9VxQohIYI4Wr2W/xDfVyeJYT/iVNQi7TAmSm1speoTRqDW1q7ei1zjqN2s01qsR4QWygFBALlzXjJEq6m9m7lXp4T6DIKXswKe03AKy0rzF5CDQQqIMOFJX9Myk9Jkw8xgkzJHZNZJam5LsLzLF5WV6a7D/iejX2TdETiLMNu8/5Fx/p7ckD5/5mO/axnjX5ulLeHuGWdW/BU
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:12:46.6491 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba668fea-aa71-4b6c-18c2-08df3f457585
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11692
Subject: Re: [Buildroot] [PATCH v2 2/6] configs/sipeed_lichee_rv*: switch to
 Bootlin glibc toolchain
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

On Mon, 02 Nov 2026 16:22:54 +0100, Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:
> As recommended since:
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Reviewed-by: Kanak Shilledar <kanak.shilledar@axis.com>
Tested-by: Kanak Shilledar <kanak.shilledar@axis.com>

-- 
Kanak Shilledar <kanak.shilledar@axis.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
