Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876EBCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E6F407CF;
	Sat, 10 Oct 2026 16:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6x5N1mZczdU; Sat, 10 Oct 2026 16:41:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 51AC840794
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791650508;
	b=FsT9MBA3SY3R032DhiGdl0uesIV98j4awN8d69bEhUBjvg3wcclJl34BT9B7l39d8FD9
	 K6/eiHM75auWqwmAx9T2U6Niy82EThIub/nzNMTO4OiXBS6lo8UJ8NHgoEO1vsTJyeFh9
	 r6dNa+8QWL2bgsfcOKCAgxNpDDsebL834plcyNV06HkVHMOI4bHNQRpZcfAArEiqO8ocU
	 hFm0UEeu7fop1Tj9k8skieF+FqneEcQyzNkwyYmRSGgShxMg/OKf3af1g9Zz199hH1xBk
	 lJZT5tPnZlbdhkKONpGyOQcSmXOfl5hGHsxS9um7lKM97xgOc+IERrdsM+c+Y5gZ3CQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791650508;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=f1CaeC1Tm/W28GokcJfg+4+syiHMSGX3MQzzVwMgvt4=;
	b=E9NLcbabiLwLt96fE5QLGMfdox7V1Inl9KvhseLIvvTDjK+fWgAXRca2Smvr+BnPdpq7
	 rIKDFhTDgDedhycq2thHwZaJA06LyyQ+b8bPKJpPpjyi8qAUi4jWYLtkM0Rgl/q9AKGAw
	 DsoqWxMix5psSAv1dqOTYmuPUXhvbltddBIxSa62jppzx5ndyFgJmDOUG1bOtxA1AQ2Yo
	 uDuVV4ONVOwXTo7wRKOslIUfQ3xQpcBygyqYrHpCUYn87DZBmMw+33NTLviEmnkrpqP1/
	 1REvjfu+ieWi0HdaMHqxq8OV4VCLC6qTwgZlYbQuL2VfatleVOJLvmN5aidSv84ehVw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791650508;
	bh=f1CaeC1Tm/W28GokcJfg+4+syiHMSGX3MQzzVwMgvt4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ityb17O+8f+FJiVefrqCBzOeKbc+I5MHd+zxVKP6jb3seajoSFtEoQvhejBlKmoQd
	 79hyvjlm5ZwmaIwf3k5cdCuV/ZigRLrgHJPUG5UAnQa/fZrT/okLxJZnnyC67ubHIZ
	 AZRstexQRxTxlhoIQwHP8fzwqH3iUzRI/m26fol2ajnoKNDtZxq93Htge1M5Etsl8J
	 ESWIEyKr3LZnNxwmykBYBo+ur3Kl7L1TPGSwnxwfmFNyaumDlG2mTzn+RePMrnUIE8
	 gm+YBnQ7Tzsfbwm4N/SuiEo98GIaonNNDvPMiwXOL4vZznmUsqCAjsLlEteAo2WyhT
	 CFXjZZwAqyImw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51AC840794;
	Sat, 10 Oct 2026 16:41:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9E29156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F43940794
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3LK0_VtSbZx for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:41:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C969C40791
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791650506;
 b=Eydb9DOoD5OsLZELZrbDu9XRZBntPXpgkgbs1h/ngYzPl39HukxKs74pb8WAWsmG27bx
 DkyelEGyjXT9veTlY4N55QcBaSHPvIWTLZqE+OJKHwbgGOJAb7lL1dByJH8ZmxZLZ1MSt
 8EYuoEr3DsUOKie7HJ975oeZ4Kxj4zlXBk29dnXi90aCP3H0sHPSBjfBmX5m0T3TYSfJC
 SwZi1MX4L/vDL9KmaXcRCrscXEWgemI3c9cBQpcSCNuIobcCIN1NlK0acrrS5t5J8s9Np
 vz6eufeL7KI5R1n4U56Z0FwkQEiOQWmepRvbi3CdRqAepgYqKfV+W3JRN+/rvlLA8hA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791650506;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=mGzTVysLItZeoYxpYHuhlivbD31uDWVOTz7lyWlIWqc=;
 b=gssKIyfiLoteBHVtCcuqMa5G+095NW6VUNy74bqpCILhHlBsVql118EzU9AEUIAwczEw
 67gBPrxoWW07fdBxotKYKwVE8kmpDfTm++IAUjpllpaB2UjtIQfiRcwert1/C0pht2wQr
 EItbefFQ4osPSdNlEx/eeJeW23rnyrHRVTOGLnm5n7tV0k6WyNgLb/3WbvaaLunA3ONi7
 ksXDYpo6dRt6kDq4qC5g4TBLEcpAocGcvCIm8HS1Fc5D5bljDQPQbJah4u+DqfFH/PcjJ
 OMQxSt7f6JSymlTKNKzPsFB1MKKM8yiPZNuEdmuA2zBTZgbjenylhPFw10flnT3Hn3Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b="OD/KofdQ"; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C969C40791
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:41:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D45ECB979F9D; Sat, 10 Oct 2026 18:41:39 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com,
 brandon.maier@collins.com, fiona.klute@gmx.de, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Date: Sat, 10 Oct 2026 18:41:35 +0200
Message-ID: <179165034772.175184.3716951951450862394.b4-ty@rnout.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260315154343.3144013-1-neal.frager@amd.com>
References: <20260315154343.3144013-1-neal.frager@amd.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v5 1/3] board/zynqmp/post-image.sh: add
 custom hardware support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 Mar 2026 15:43:41 +0000, Neal Frager via buildroot wrote:
> By switching to the LINUX_DTBS variable, the post-image.sh script can now
> work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
> or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
> the transition users will make when migrating from a zynqmp evaluation board
> to a zynqmp custom platform.
>
> To keep the example post-image script as simple as possible, it assumes that
> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
> filename that u-boot will use for booting. Users are free to implement their
> own post-image scripts for use cases with multiple DTBs.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

 Applied series to master, thanks!

 Even though Luca voiced some concerns, I think this is an improvement over the
current situation. It maybe doesn't work in all cases but it's a good start.
Users doing weird stuff are going to have to build their own post-build
scripts.

 Regarding the spaces: within Buildroot we use things like $(firstword ...)
which does pretty much the same thing, so I think it's fine.

 Regards,
 Arnout

> ---
> V1->V2:
> - removed unnecessary $BINARIES_DIR from symlink source
> V2->V3:
> - ignore anything after the first space char of LINUX_DTBS
> V3->V4:
> - use make print-vars to get LINUX_DTBS variable
> V4->V5:
> - fixed shellcheck issue
> ---
>  board/zynqmp/post-image.sh | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
> index f44b66342d..67b0be65b7 100755
> --- a/board/zynqmp/post-image.sh
> +++ b/board/zynqmp/post-image.sh
> @@ -2,13 +2,9 @@
>  
>  # By default U-Boot loads DTB from a file named "system.dtb", so
>  # let's use a symlink with that name that points to the *first*
> -# devicetree listed in the config.
> -
> -FIRST_DT=$(sed -nr \
> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
> -               "${BR2_CONFIG}")
> -
> -[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
> +# devicetree in the LINUX_DTBS list.
> +LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
> +ln -fs "$(basename "${LINUX_DTBS%% *}")" "${BINARIES_DIR}/system.dtb"
>  
>  BOARD_DIR="$(dirname "$0")"
>  
> -- 
> 2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
