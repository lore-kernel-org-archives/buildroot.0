Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52294606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qV+IX3Iv
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 280EA60771;
	Fri,  6 Nov 2026 19:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyxPBRUdxUmW; Fri,  6 Nov 2026 19:34:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1F746607AD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793993674;
	b=FsreSMuA/1Mk1Hx1tQDpHjFciggYqMpxwFhbXFO2/CodScn4V3LCLATPeriGlBVeifOF
	 jEMojCjdFbhm9CtARbXiNjoAwks7zRAfgnKjwe2IY9bsgtfYWxOfaLquSaGzUbFV84sOx
	 BC18+wwsMYINcA9ua+tqmifd/08ggia1HvnqXLSFP9R3jHHhlNBs2sl/oyqXIWvT6NaUi
	 vX5t8CTcz/BvEh9Z71Y8GCMmOTcnK+xJZx2o/NuU9WTI+ySE7ptGrypf4DT662ofV5MPD
	 f8M1ffb27/JN8eTcmD7ZX+mMCBh4N+l+kpx4J7hOj1NCtInA4r2gohaqkv/OsSuca6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793993674;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
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
	bh=y5bcX+eBE3IY+YiHIEbBWUXoApSlcpFfzFIYtE2SDrw=;
	b=H1DweK34D2eT7MSlp5ErXF5rdEY8ETDMFllexxt+iI+9VBKZhxiLgRtdo+jI6UM3CHlE
	 6a5Vx1YWfTADnO3lVX+9H5R1hZBe74lsKMY0i5Da2xjGRF7uieFdJ0dmKmODF9snkoYly
	 MLlK6qrHFeWrSOoJpx2yxym5n+ktAmVB52iB0nKeK19XHzGX6ZnO1SbpYuuF8pqxOsCKO
	 lXi5JkPSlSTOMhchvHgyVlSYbRnx8zqYc1cQATxVzClsGp718z5wqGHwYmFleJibKIgca
	 LEjDslfVAmJNuyJ5X5oAWoR/6Gi/XkOqLK/ldpVwVgkZboAAsoNK0j52POgbosmXUgg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793993674;
	bh=y5bcX+eBE3IY+YiHIEbBWUXoApSlcpFfzFIYtE2SDrw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qV+IX3Iv+AjpyegDufaahid4OtRdCK0mlUu68MM4M0VKaCeJlUznlqyhL/vhq639/
	 xJ9auwuuc3CgKaRubrUFeJzcOtVg3OgJxbWPSKfXt20XTLrhsfLnnn07MxQbRAu7p0
	 TdDpVqUzhrbgRBRDb0khiplizVCIU4DVRiysUlAWJ+hsJqQ9/P9esSKwJUDZHhZUQk
	 r93VmTVArr9VT40iAhFyeyqep/Lyh1YVpD58B5g+DyE+Ic12grg/5JOgr2KWAbVgRP
	 2c501/OXH0hPyCqinpPGs9VQvYPPC5xPp0pQflgE4jV+FMtCPbRnvH1WInfxDneA2B
	 ePflaNrpRawjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F746607AD;
	Fri,  6 Nov 2026 19:34:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 317252AC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 174AE403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPkCbW3yOlVz for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:34:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org ABB57403D8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c405::5;
 helo=typpr03cu001.outbound.protection.outlook.com;
 envelope-from=gustavo.nihei@espressif.com; receiver=<UNKNOWN> 
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABB57403D8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:34:31 +0000 (UTC)
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com (2603:1096:301:bb::12)
 by KL1PR0401MB6364.apcprd04.prod.outlook.com (2603:1096:820:c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 19:34:24 +0000
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e]) by PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e%3]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 19:34:23 +0000
To: buildroot@buildroot.org
Cc: anton@espressif.com, giulio.benetti@benettiengineering.com,
 gustavo.nihei@espressif.com, romain.naour@gmail.com,
 thomas.petazzoni@bootlin.com
Date: Fri,  6 Nov 2026 16:33:55 -0300
Message-ID: <20261106193355.2453141-1-gustavo.nihei@espressif.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928150149.963781-1-gustavo.nihei@espressif.com>
References: <20260928150149.963781-1-gustavo.nihei@espressif.com>
X-ClientProxiedBy: CP5P284CA0167.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:22a::12) To PUZPR04MB5419.apcprd04.prod.outlook.com
 (2603:1096:301:bb::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR04MB5419:EE_|KL1PR0401MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: 067419dd-9de7-4da7-206e-08df3c3cf5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|10070799003|1800799024|56012099006|261021123027099003|261026121527099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261102123227099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: OiPMkhMV6pLh0Pg9Q67RRlDu76yxvKskHzv467PhDTDNStcJoJXmfnGEvnR374yLZHY31mU2938r8H5oOmYvSgxOcLCmAHSE50cs3lmo630IK4R9LlwKWapipXjazz6vmGrKF4iwzVTzW0miCmnK804iOZ8rtZzi69bpBEnlmqW8+LManyGyFAyeCOgxJlBPXCOlLqlKEy6qaEx3E/+f6oF9mA/9iSRaAbe8EEXzMxBqYWAxdvPR+pQP5Fveam2VA+XzD/B4t3ohmUao53k92baRiIv1fOAD5TA6RLSjC2j5IEuH13MbHCG0QAPiZKODaqdISFyMxkEQfKXDqM6sgNIKP6sfVPuWUKgGszJttQvwm4QXYcnpnxNjpgERTM1WE0+4YHyGhCvb4PfSZby7nwUhH4+RGzKHD4WQhSQsVwsKgxLdx4D76XJSII6Zv3aRXnz2CVNIaur1SrFRdJsFgh7Cm1rTnZR/AmUtbdhlneKH4NC+TUgvzcct3/YiGAbteH+yLqa61T4Zzil3LVXOvSXX+TGbZ0B/TH0x4prKhauWKwxJpFxMfvIWo6VdV05H+STjzciAHr7GOo8GqMHY+sll3cAN8XoZZGca04VtRN+e639dFwbVtBEiujEnlZcp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR04MB5419.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(10070799003)(1800799024)(56012099006)(261021123027099003)(261026121527099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261102123227099003)(261028144727099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lk2qNlrtxHRMt5v/LTxMpPAuHDh65eqOQQO9pKLxWaJ+rlmLpfPz/FkIpBYr?=
 =?us-ascii?Q?XfxuQm2SaRge2z69PC/T8vgX97+JlCKTuGADdPtiDTxydmgX8OEweZ8NMFLz?=
 =?us-ascii?Q?IxzgZreD2zluIs7HuG9ttISLysbwo5/8O9Cv/+R/XxHXAxOdsd0b1CrKcEUo?=
 =?us-ascii?Q?2fBRUI+etmcRSot+uYrIqL6zc+tRipUrjsLX7fSGU+7oYc84Z36bGX0VUi7G?=
 =?us-ascii?Q?HEM7taUIYqvg9r9IbRhTRAAsiTDWzUHXiAjrIsCvU9SQFwcnRFoeBT7oGLme?=
 =?us-ascii?Q?FHSshaPPkRm7NQKEZHX9JxSVwtXNJwNtgaAH58aXPf9KqisbRcX7QHNaPIGQ?=
 =?us-ascii?Q?ivdnkEqpvPncT0tPPxMOJZnwKJjs4TN/bCNlX/uSE6V9IbdOr7lfZcHMXsQc?=
 =?us-ascii?Q?wDqa5kb1lYdxj7Imp7I7Qr7y2ndLkyGjiyAR4qUTgvaOVJe9CJCRTELpXlWZ?=
 =?us-ascii?Q?lBNF/d4ICvLgGYOUqP/Dv9oxEYlHUSEl86SJsiGuJ3AvV4iykPvSNQfE/xEd?=
 =?us-ascii?Q?NdOE6j/rVcGj+hh+HwVerFoaE0zHLaU7NTR5+NzygDj0Xx/lG8YqkhvU5ckp?=
 =?us-ascii?Q?gBZbEXLOrS9/aohnVjjOpMEPawGOYZa2BHs2sqDLiFXefF37eu61yoU0tRoc?=
 =?us-ascii?Q?346f1WNjwsupfGZ3RJuRqoruegnHL51SnGsutpw9FPQMdH0VyTtZO7SxWY7E?=
 =?us-ascii?Q?4yd5FCVKMjx8Y1+ai5oekKA9o901EX1LsRjefMT27A7BMMp4dBxUOdvHxJil?=
 =?us-ascii?Q?AImnZrrzJFTUus3Ooxu94wvtTiEoEHHmIiZSTkmA4GUB5SuGKdBGpjxrdlRv?=
 =?us-ascii?Q?wMPBgA+1qeRMKyUf1JkTrNqu0IrJK/GRDaZMRkAxo1sHhJ0XSIlGcaqcoYfq?=
 =?us-ascii?Q?3PqH+yhXTgqz25/gp2iVCVhaN6CoB1MWfA6aV5lm1PYkGWPtqBQpNeuN5BE9?=
 =?us-ascii?Q?K6f6jzcf1+mJ8Y/c6qkVlxA0pha3a/VDE+kLSlawy03TxzuDKI1nAyPvd8kq?=
 =?us-ascii?Q?SPNf15v6VeWIu+RALKbCqnCa3E+QM47luV04Q2sLfvA/IoVfj/u+ZddwlsHy?=
 =?us-ascii?Q?v/H4i2CG2G9AMwjcJy2cGA2FQ6HwYaxZ7hfVYgxXE35c24i/kuuCHU1LZB7x?=
 =?us-ascii?Q?QoaIp3SMs6LkeeCdfBUjmpoM9D+NfrjuKtg2IiSV4eq6L4tbHeyi+/Lz+lgs?=
 =?us-ascii?Q?f7stmnk6ame6FxVB5Z8cMzm1SaPF69toUagmrGwdlWjiLGc3TXpRF3HkHl12?=
 =?us-ascii?Q?F9ZLUi5FPonR//FQE+v5lY8TBYkdkHVpSfWdBSNUDa4AnZ1yHNVIu8toxSgz?=
 =?us-ascii?Q?yGZ22SnOnk0bqjh61IpaTBLHyF/95KlJ7aEcOEtMHwhhzIcvx5MoWYAdEzKj?=
 =?us-ascii?Q?URdLEdWQ3geYVZNinqQnxalzkOI5v5DtWFHuvY3NkvHAYAFKvsrGPnOYr/Pf?=
 =?us-ascii?Q?a2xalx9SN/EELtknDlZHKaj5vhxONKmeRXeBe0964i6RP0On/OgQRv/EFrZT?=
 =?us-ascii?Q?2efyJh3RqcKeixnzANO0WT8Q7oD2WsVE3SRnHbzOfkkaJTDYjoiVeRVJpMxL?=
 =?us-ascii?Q?Ah7dwrbM5TQw20BmRNfgxD0xjJZPGn7P5UD2aUzZApng2rxdl78gK81b0k1o?=
 =?us-ascii?Q?t81i+gV52vzge5UykAmOsXLzr1ARot5cejyaLGVKBbq8pvnql2VMEQEHzmcJ?=
 =?us-ascii?Q?c9l2n/pHZAdkK/7W30v2YXsiNpuXZ9nAURJRZtkShA3xSI7iLv3/q1QU6jRO?=
 =?us-ascii?Q?QaTVcqC4IywZaI095Dn+HZGizTzqVJCXIjVgHNGww+g/uD3LDuIjAAWdt/SX?=
X-MS-Exchange-AntiSpam-MessageData-1: hIxc6ZTudMqCVbqsJb31bLPXV9ir7boHD4g=
X-OriginatorOrg: espressif.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067419dd-9de7-4da7-206e-08df3c3cf5d2
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB5419.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 19:34:23.1655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5faf27fd-3557-4294-9545-8ea74a409f39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quV6rMb6DOfIIbqDhnkZrVU6VAYjxbM7acbnBKxQsZ8295+ABi6kZVpX5VSVNo4SR1UjzdEdka5rZDpXIsORwHXowIJllO1ZRJUpll9wEz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6364
Subject: Re: [Buildroot] [PATCH] toolchain/helpers.mk: copy only the
 multilib variant's dynamic loader
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Gustavo Henrique Nihei via buildroot <buildroot@buildroot.org>
Reply-To: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Sep 28, 2026 at 12:01:49PM -0300, Gustavo Henrique Nihei wrote:
> A multilib sysroot ships one dynamic loader per ABI under lib/.
> 92207bc03f ("toolchain: handle toolchains with multiple ld*.so.*
> files") replaced a flat "cp -a" with a recursive find and a plain
> cp, so each loader symlink is followed. Each loader lands in the
> rootfs as a full libc of another ABI.
>
> On a musl toolchain with rv32 ilp32, ilp32f and rv64 variants, that
> target directory is 17 MiB and contains three libc copies. Selecting
> only the matching loader name still leaves the loader as a second
> copy of libc, 15 MiB. The default rv64 variant fails earlier:
> copy_toolchain_lib_root stops on the dangling loaders of the variants
> that were not copied.
>
> Restore the flat search. Install only the selected variant's loader
> as a relative symlink, resolving an absolute target inside the
> sysroot. musl's own install creates one, pointing the loader at
> /usr/lib/.../libc.so. A loader that is a regular file in lib/ is
> copied as is: glibc installs it there even when the libraries live
> in another directory, such as lib64/<abi>. After the sysroot copy,
> drop loader symlinks in staging/lib that no longer resolve. That
> covers the case where lib/ is itself the selected variant. The same
> ilp32 target is then 14 MiB, with one loader symlink and one libc.
> The rv64 variant installs.
>
> Reported-by: Anton Maklakov <anton@espressif.com>
> Signed-off-by: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
> ---
> Link: https://lists.buildroot.org/pipermail/buildroot/2018-June/589607.html
> Backport to: 2025.02.x
> ---
>  toolchain/helpers.mk | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 21c710d0fb..37faa8e9ca 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -126,6 +126,28 @@ copy_toolchain_sysroot = \
>  				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
>  		fi ; \
>  	done ; \
> +	mkdir -p $(STAGING_DIR)/lib ; \
> +	SYSROOT_CANON=`readlink -f $${ARCH_SYSROOT_DIR}` ; \
> +	for LD_SO in $$(find $${ARCH_SYSROOT_DIR}/lib -maxdepth 1 -name 'ld*.so.*'); do \
> +		DEST=$(STAGING_DIR)/lib/`basename $${LD_SO}` ; \
> +		if [ ! -L $${LD_SO} ]; then \
> +			echo "Copying dynamic loader $${LD_SO} to $${DEST}" ; \
> +			cp $${LD_SO} $${DEST} ; \
> +			continue ; \
> +		fi ; \
> +		LINKTARGET=`readlink $${LD_SO}` ; \
> +		case "$${LINKTARGET}" in \
> +		/*) LINKTARGET=$${SYSROOT_CANON}$${LINKTARGET} ;; \
> +		*) LINKTARGET=`dirname $${LD_SO}`/$${LINKTARGET} ;; \
> +		esac ; \
> +		LINKTARGET=`readlink -m $${LINKTARGET}` ; \
> +		case "$${LINKTARGET}" in \
> +		$${SYSROOT_CANON}/$${ARCH_LIB_DIR}/*|$${SYSROOT_CANON}/usr/$${ARCH_LIB_DIR}/*) \
> +			LINKTARGET=../$${LINKTARGET$(SHARP_SIGN)$${SYSROOT_CANON}/} ; \
> +			echo "Symlinking $${DEST} -> $${LINKTARGET}" ; \
> +			ln -sfn $${LINKTARGET} $${DEST} ;; \
> +		esac ; \
> +	done ; \
>  	for link in $$(find $(STAGING_DIR) -type l); do \
>  		target=$$(readlink $${link}) ; \
>  		if [ "$${target}" == "$${target$(SHARP_SIGN)/}" ] ; then \
> @@ -144,8 +166,8 @@ copy_toolchain_sysroot = \
>  			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
>  		done ; \
>  	fi ; \
> -	if [[ ! $$(find $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]]; then \
> -		find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
> +	if [ -d $(STAGING_DIR)/lib ]; then \
> +		find $(STAGING_DIR)/lib -name 'ld*.so.*' -xtype l -delete ; \
>  	fi ; \
>  	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
>  		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \

Hi,

Gentle ping on this patch. Could someone take a look when time permits?

Thanks,
Gustavo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
