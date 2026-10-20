Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B877606A327
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 09:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KPIzPRlh
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00AA281028;
	Tue, 20 Oct 2026 09:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLoIz97Q2nIk; Tue, 20 Oct 2026 09:41:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0BE5081053
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792489280;
	b=XeduY5c/Z6jkAbiPbXNzI7bdg+L7n94JjXWQsVcA/3JfGbMnpmHlhvrFDn13n+n4kAtu
	 0uAqk3aWtR/NwQgUBmZ/ZtH0RLNqth81beC0SV2yFXS3H745BXdyEZK59iEQWhwSDd9u/
	 /Mrh/Ctvmctr7oM8IWvx2GwRIC0vRF9rnCW8MqNzsVV+kxk54AAuo0rYhQ5H03laz7EX2
	 YUL667DFkpa511A26GqXptOvzSPHrcLmw7+3qN/5xgmxTCNb3GjNKNKLHKXLCdlJsatdw
	 E9vAb/UQgYmwN88k4cnvupywMs7vxGnIRFJHaQwxpCIKHId4y+Qz759mP+P/4s97kLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792489280;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GF5dXLERJJd2yUwt8YBcpQA9n91Ru1yvt7wEEu/bAeU=;
	b=SrNwBwCJg+P8FNsSexDg3aAvxx/fcDI6ba0mndfIrNkj5t6O7jYntqqoKEfIjmd5uMEX
	 tsNfX3efl0rybWJyR8hWxJRNVGys840uOXowhHuXmiPzxZcr0MzFA1qCTH1Ud+/YdMJQP
	 g32Lx9ys9EraHHoMabfdqZmEA4oH7gg6Hh9wCZAccXsTQEf84ZtvieAL8SPqxXTNsVi7i
	 0ME+xQILuMb0zywctY2esYY59nEL0dOkkphNg5Fn7mSvsG8d71QGK0ivscEu1nUtv0a40
	 wLVLAsHtAniFiVFmLqehpXU0o5uoI2dFRM7m4w/XsIITv93ZbM3SCulNFTpwVvzznuA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792489280;
	bh=GF5dXLERJJd2yUwt8YBcpQA9n91Ru1yvt7wEEu/bAeU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KPIzPRlhCkUR5zhxRE8FXFw92m97T4SBaZMbCCSImDk5Tgjfa03PfvF2yqATmiuKe
	 rhrzvSs0vUM1LkGhPzsu9MaonKP2gIRTLPKGL+jJtUnsCkM7Q5mPt0XuLtC8O1J30s
	 vEs2c14MkuZhRLK8lCcapk106591N9Qul7BOscEV/nFHGSmtpoNB94cDDYylCju+6U
	 QA+3d+eAXMGGwrq4RGSAnsAqzc90gbTFPbrGSYohTDi8Fvg/anv8ojBO/5+PgfBaAM
	 /zVvaaKKpkQlBn/p4S1CsSVj2ENKb4U9YUCAJS4NgYvC/m1865N4y46WJOJkoYQT2V
	 6gEd0gMJ53syA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BE5081053;
	Tue, 20 Oct 2026 09:41:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A69B71DE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 985FA60822
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dG26wKYAbM-e for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 09:41:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 102E56066B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792489277;
 b=Qmxo8M+UgFE7uhBRoVyxjrtRRiXIPyyh9FljbxqBXuJXFOCXds0QCb2L8ManQxGpYm1e
 mU795fxREOFRJfq4F0qXJQ8uHE26g+g0nCB5TRiMHxv5OCKwtUCuzd94+5IEXVyFHbSHF
 GDOpjoCx1XyGRQxDNEcQgE5j4YJrr2zMCxBmzgbHTGBfMVXFalptsgj2yHJ7fTwqlGEKh
 B+ymy7G2O0Hrjo8T48H4tgQ/e861+zzgcd7RxHXnOh2+BOAYLhfrhMbvDVRTbg9ChQ0eV
 PWlCfvJKG9TisL+cqWbwQ6R/6NfI656t4jp6CvLUY2MiudxTSgNcvaV+yfXYMdytFrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792489277;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=j6/gagB+3dwJ9jakF+DW2jH2PFIH3JowRzsgy/iXjuY=;
 b=V3UBO270/AwhZt6JhbU0tCg3vsgH6+vc/k5FSHDyNdQCJq2y9Yp+P8aAKL+4CNRi0CDM
 ioIGqd6mziMnnDGT/K8kVXDWDPhuOI2h4OEjwNGIhLx7/NCGFbiPh4taMYoU55C5Uw5bq
 S2C0ZSkFdvyNoYJcRoCDHGcb+hMX/KkXZb28r5nOYKCDtyMo9lSvN5b2GxgsJ567kYiDT
 wHX2gFgkl2nV7euXFtryJu/NHkCMjdsuw53i28SGaaJHnoxWclh9fgqYlQ6Cczc5aLW9k
 RlXQQAAnqphmWhVb3MmA/DXfsTMKTH1z4TEbwO0b/hlT1qm7nHJrBAMDO8TdM8SwFsA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VCJZ1j8o; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 102E56066B
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:41:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DF1ABC62200;
 Tue, 20 Oct 2026 09:42:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6E83360393;
 Tue, 20 Oct 2026 09:41:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C8CFC103289A8; 
 Tue, 20 Oct 2026 11:41:12 +0200 (CEST)
Date: Tue, 20 Oct 2026 11:41:10 +0200
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Fiona Klute <fiona.klute@gmx.de>, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Message-ID: <atc21F3HlI1kt7nt@windsurf>
References: <20261020-qcom-modem-userspace-v1-0-da720723d9ef@oss.qualcomm.com>
 <20261020-qcom-modem-userspace-v1-1-da720723d9ef@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020-qcom-modem-userspace-v1-1-da720723d9ef@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/qrtr: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 10:07:45AM +0200, Igor Opaniuk via buildroot wrote:

> +QRTR_VERSION = 1.2
> +QRTR_SITE = $(call github,linux-msm,qrtr,v$(QRTR_VERSION))
> +QRTR_LICENSE = BSD-3-Clause
> +QRTR_LICENSE_FILES = LICENSE lib/qmi.c

Both files carry the BSD-3-Clause license text, so I'm not sure why
adding lib/qmi.c was useful. Also, using a source file that has a
chance of being regularly modified for other reasons than the license
terms is a bit annoying, as it means we have to update its hash in our
hash file everytime there's a change to this file, even if not related
to licensing term changes.

So I've dropped the usage of lib/qmi.c as a license file. Let me know
if that is a problem.

> +QRTR_INSTALL_STAGING = YES
> +QRTR_CONF_OPTS = -Dqrtr-ns=disabled -Dsystemd-service=disabled

Curious: why isn't the systemd service enabled when
BR2_INIT_SYSTEMD=y?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
