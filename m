Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9486B60A2600
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 16:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MYOrotn4;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=XFvvtBTR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B55681343;
	Tue, 10 Nov 2026 16:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4A5UHdZNbaZN; Tue, 10 Nov 2026 16:13:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 525B781345
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794327181;
	b=lw3P7p0gdrrH8zU2sJiFAVaPjtqNGVnI/hr/GCnRbpcujBVRnnoe1Xi36tQCrjpQ8NBS
	 vYZeXg07d2MriTtBsOLjkI87d9Q8n3Xf4gKLB4OOASPJNdjfDeNcdEDjsgNBCcYOSCarS
	 bkr3aD5Piqg0QssjCtlOfP4x7DNpCzJxfOmbIcZoq6ktakwAoNIGzN4Xdp+HdXB8UrYta
	 ePFvSc4RUJI7NQfWz2MD8OYA1NytLZclESpIssWW2TkzA9pqem1XLT9OhPxdjImginhYR
	 mgpHvuYk0KEWGX/FcwwBuNt1E0uRKB4XRz1/C64ZL+BtmnYUX41ElIRYc3ETsfrwxFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794327181;
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
	bh=qTMsXiiNI9HAWqd1LdEVXQO/0BVl81HguLbyaBFDtxY=;
	b=E5SB0QQ41LiJFZ8Iv8UmCzBxl/tcQrqjHh2CBXeYOO5iMvhYZ220yyINor4TtIzGS1lh
	 H4pd6jufiopzi5YM4K5ShJMN16lu9S4lquIZXCwBNQ60OKl2XP6rK7Hp+kNYBH1ZZXvCk
	 +TKYbcvx3WJfAv7dTAOZ6vIkSVdt7s3hOTDZkqr4FxAts3pGd5hXgkqSCIWCh7AcSLKiv
	 5+eV4qZoTyGs/OjM6CkoxS5flcpy1dFqQadYiVjObwafVLWcI1nw84+RG0qElL616gqFn
	 sv1UQ1iXrjTQvR6ID/7MZMAfWCR3lB410Cneb/AnOqXiM3dim44zIkrtjsfr5mE9Fsg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794327181;
	bh=qTMsXiiNI9HAWqd1LdEVXQO/0BVl81HguLbyaBFDtxY=;
	h=From:To:CC:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MYOrotn4nu3Cydw9UcZygHlbS/v49yZ2k7jJZI46wbzpaDp+SUVAzKtBHO8fnH10O
	 RcbCIgXT64t9pU/Ds69EG9VWrCb5A7WMkpmYBvf9EDKJgmRXEXMUT5fGnXI6XcjXlK
	 s3kSEB0Q7WYP4dhlQSiGWphwC3bSjolhoOeh3ff5wXyNUAX3jZwOWJ0I1NGz+f9eq1
	 kIVhLKF4FMRs4SDChDt3MAHNH1HikTJ1zWPZd9emASmh24aUMHiEo0XTn01Gd3Jy9M
	 fJ4wvnp5YZvVKw4HrYn7ti5TWDPsNnQWlcd+T1kj5E9nVjrjlL2UjZZXckoGgoG8eP
	 vSk9NDsQZSAUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 525B781345;
	Tue, 10 Nov 2026 16:13:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60D38AF2
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52CD6401B9
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQw5gDOhR9tp for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 16:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 67D0240188
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:c207::3"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c207::3;
 helo=mrwpr03cu001.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=XFvvtBTR
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67D0240188
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hH5kc/fpB0U/ccWZD5AuQ6cwguBAnaxYJ/bf8cD9xoo=;
 b=XFvvtBTR5moc4Zp9U2skKlcMZOLshqxb+ksE3VaL6VDLf3IPJIjYGFRdSl00JWYQLkmhr3Xli6UKiAceKPHT54KD57CYCKibavwS1xfJJy49kIin0lj9mK/m3erxkeqbeHMd5IIFifFyh9HHzGmtAleghPn4EQ1h/48bM5TBLH4=
Received: from AM9P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::6)
 by GV2PR02MB303654.eurprd02.prod.outlook.com (2603:10a6:150:37a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 16:12:48 +0000
Received: from AM2PEPF00070CF7.eurprd02.prod.outlook.com
 (2603:10a6:20b:21f:cafe::a8) by AM9P195CA0001.outlook.office365.com
 (2603:10a6:20b:21f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 16:12:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF00070CF7.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 16:12:48 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 10 Nov
 2026 17:12:46 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 10 Nov 2026 17:12:46 +0100
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 59C1521CC;
 Tue, 10 Nov 2026 17:12:46 +0100 (CET)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id 3F140305D283; Tue, 10 Nov 2026 17:12:46 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
CC: <buildroot@buildroot.org>
In-Reply-To: <20261102152258.1948796-4-angelo.compagnucci@gmail.com>
References: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
 <20261102152258.1948796-4-angelo.compagnucci@gmail.com>
Date: Tue, 10 Nov 2026 17:12:33 +0100
Message-ID: <179432715367.3490013.1453549328027081397.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=823;
 i=kanak.shilledar@axis.com; h=from:subject:message-id;
 bh=vHE5BwqKlYSFNpN2q6W0xT+wUtZ/27o9+00Ch/EZin4=;
 b=owGbwMvMwCV2JPnG7+2HZqUznlZLYsj67FRbI3Z2pwy3QazatZDnlt6dHx8rql4U2/3CUNTVd
 UnqhZtuHaUsDGJcDLJiiiznjLZH70/+pztH2ukSzBxWJpAhDFycAjCRlZsY/go9OzllcSRjUHXp
 3wDOJRu2b7zjMoXNYPO5R9xFZjdOqhgyMtyZo6qtXPMxZk1PSYW4zAwH/dkrWSxf7Pj9cXJZu/K
 CBDYA
X-Developer-Key: i=kanak.shilledar@axis.com; a=openpgp;
 fpr=CDB0F1C8EAD5B522C7B3A77928221FF065DB55F9
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF7:EE_|GV2PR02MB303654:EE_
X-MS-Office365-Filtering-Correlation-Id: abb52abe-902b-4bd1-a911-08df3f45765a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|11063799006|4143699003|56012099006|18002099003|22082099003|10067099003|261102123227099003|261026140227099003|261022105027099003|261021121427099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: 0jSP0PptGUNE1BxopL37zCO3umL6I+4d3v1TGj8IQqottJIu51/2bMP6Nr/ZbwmdoUZKLryF8Vyf74TxazJnJPeoy+PGxzG0iglBlIzx/l0QAH98WpYCLyA6M46UW2/L7wQLPPAMPC6LZ/80NEdLvjlh4P6O5/6zRQRMq8JNGqqR0Wq5BLPj8tx7hO1avJMV5rOeh+ETWXgRfjAamYxaIPyLuBXspcl0c/PW2Lh9Q7GtfR5Q1gNWtD3EmX6mpC7++iEtM83eZr6ZlvlOsT2E5bcCrMvfos6bQtWevPf8R5eimK3RWYeHWcMkNAZ3akyaumWpUqP+wWMQsZ/3izkLDI7on/+rkW54HJN1LKVVryYKlrqopCJ4DoEJbqU+Ms/AhPgkMvzbmp7lumOlbC2HD1sZqkqT8Q7o4dl3XFxnLVsbZ8cwciakk4z40KbpZ52UaP8huTdGv9BBXvnSn2T7dGVMK5Yjv2nY8mlF9DaU/sejyZLqVxwBCOS3lchHCK9Lp+uX+FYiwx1OHBvsIFTH5UAueO4N+W0TMfr0IjGsaFnkFlY32yUoudzKXEvLZHsNYbpO01uFi13a/47fuPnjSkIM8AADSucqMLXxXYI8BD6lwomChrWXGhT9pG71PWyvLKcbEFQdJ6ADUduvlil/VZJJH8R+UsC6kdWyYpbUiCH+cALBeo90c/SR9iPLVuoFbs+fX1J91DPAsxJEPENPAQ==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003)(261102123227099003)(261026140227099003)(261022105027099003)(261021121427099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V+HhJEF6P1VtoZdmwwgWmbZBUMB9rMXUczI3qVY7nPiXjFFtUrU1bM06/+absdnWvtcyi+dIrMdb4Y04hSCkcmHh80nnAYlyed+iPBVAaM2FdMyP3UdHuZ4cKgHT6mRbNeSMRdxkYEWzG1sskUxqTpJJxLFzHI5mtuT2XmESAgcbCxt7Wi2XcAOuRLimMc4I0+B0AsDWnkmPjbCJ0O1r0OtkEQ5vAUmfFFvppKzt4srvnxmSJNPwU3FiIdi9pj0+yJ8hZz5tDGT8R4bS1+QxwLoV37PZnLYRXFBGuSHhfdodgMUpcfjel/SHHMFVCb4F+HXlbXvdUIFdD5XZuAm7PXOMwY27/ooz2QvoAGrmpTqo/PDhYG/l30eEEQxbwCm3E0QNKaBnStkf0vwIBv7Qu6n+rd/S6ryQfgdqzdi03WdHen1HGiQL3CwAP+2nTKFX
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:12:48.0473 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abb52abe-902b-4bd1-a911-08df3f45765a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB303654
Subject: Re: [Buildroot] [PATCH v2 4/6] configs/sipeed_lichee_rv*: bump
 u-boot to current top of d1-wip
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 16:22:56 +0100, Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:
> This is now based on U-Boot 2024.01-rc1, as in the nezha defconfig.
> The D1 boards are still not supported by mainline U-Boot.
> 
> This U-Boot runs "usb start" as preboot command, to support a USB
> keyboard, scanning the four USB buses for about 5 seconds, and its
> distro boot command scans all the boot devices: both must be disabled
> to have a simple and fast boot. Add a config fragment emptying the
> preboot command (USB can still be started by hand) and booting
> extlinux.conf directly from the first partition of the SD card.
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
