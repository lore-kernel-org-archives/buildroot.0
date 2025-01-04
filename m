Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6871FE77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 12:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 312C4605C6;
	Sat,  4 Jan 2025 12:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zpo8LpuEMZL; Sat,  4 Jan 2025 12:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C83C60698
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C83C60698;
	Sat,  4 Jan 2025 12:07:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56C79F27
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 12:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3700860742
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 12:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id au6FXrkgbp9g for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 12:07:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2422260698
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2422260698
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2422260698
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 12:07:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A62D678035B;
 Sat,  4 Jan 2025 13:07:29 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43466])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jan 2025 13:07:29 +0100
MIME-Version: 1.0
Date: Sat, 04 Jan 2025 13:07:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250103214754.856971-1-romain.naour@smile.fr>
References: <20250103214754.856971-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <15fe7f1eaa73d50552ca91723daf7450@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735992450;
 bh=o72Klr1PVwrye5TsseQbuL77czl2v0+c9JMPrvJ4xB0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UagtCVDE/iTEPrJbmSgWMpX/EioBJIr5C5my7brNcYXLfUZ1RQJfNVuPKMrf1QJMf
 DhColOcHB8I0qZB/QbbnJSJaXpoEDQoPHYEJZfA2gEnkr2twjlTsTy2svsDrAzKcB6
 T6npmH59BBWNbzBmZN09WLEDlBJDc+VmlbXhsM26oCZjYPaKfLwX4AMZp7TiHthYfB
 4qhaRzgXYAH028o5vytG4QoqDyN7wFCn4tu5M8DC4/iwKOWT4kxS9FJTLi0rlh3R9z
 yQ2uU7Ot8pGik+/rVloQsJyZGZfYImjaalu39VybXQ5LgjlROX4wCiAmy70XcHeQ1P
 AFk5O6sLVPWiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UagtCVDE
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 9.2.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/01/2025 22:47, Romain Naour wrote:
> Changes log:
> https://wiki.qemu.org/ChangeLog/9.2
> 
> Remove upstream patches:
> 0003-target-arm-Add-new-MMU-indexes-for-AArch32-Secure-PL.patch
> 0002-Revert-target-arm-Fix-usage-of-MMU-indexes-when-EL3-.patch
> 
> Rebase remaining patch to apply with fuzz factor 0:
> 0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
> 
> Rename --disable-sanitizers to --disable-{asan, ubsan} following
> upstream changes:
> https://gitlab.com/qemu-project/qemu/-/commit/cb771ac1f59ced0aba5acedacfd4e92a9d0727b6
> 
> Qemu defconfigs were runtime tested on Gitlab-CI:
> https://gitlab.com/kubu93/buildroot/-/pipelines/1609609766/
> 
> Runtime tests using host-qemu was locally tested:
>   TestXvisor, TestFwts
> 
> Cc: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> Due to quota constraint, some qemu defconfigs were removed from
> the Gitlab-CI pipeline and tested locally:
> 
> qemu_aarch64_ebbr_defconfig
> qemu_aarch64_sbsa_defconfig
> qemu_arm_ebbr_defconfig
> qemu_arm_vexpress_tz_defconfig
> qemu_riscv64_virt_efi_defconfig
> qemu_s390x_defconfig

Applied to master. Thanks for the extensive testing!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
