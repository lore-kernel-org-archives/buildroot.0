Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDDBC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 14:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B767822C8;
	Sun, 16 Feb 2025 14:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoMJfbnld57L; Sun, 16 Feb 2025 14:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 901F4822ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 901F4822ED;
	Sun, 16 Feb 2025 14:14:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBE42DE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6977412CF
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T36WQqHSEk5z for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 14:14:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D918841295
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D918841295
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D918841295
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:14:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.121]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvLB-1ttC4K2gFh-00NbOX; Sun, 16
 Feb 2025 15:14:09 +0100
Date: Sun, 16 Feb 2025 15:14:08 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20250216151408.710943bf@gmx.net>
In-Reply-To: <Z7HdD63RHkaM8X8t@waldemar-brodkorb.de>
References: <Z7HdD63RHkaM8X8t@waldemar-brodkorb.de>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:jMN0bquFWA9CCtexaVG/pT/OoAklhHwxcLQNGLY6P4q0gLVERUq
 ovdu+wu4f71UGqu+aTX7x3FD1p7LajJPZUipf3PoULaH4KQSXSljf1+2iaqF+gcycz2GCFs
 1hGlOE0z8VIaF4MW70oNGiDTyKSNxuKucbgL9+tGtw+2zBO8SXbNXIaDTdtNJ6kY3ZHVYEe
 3bJrfvrT6vGODFUFo5HsA==
UI-OutboundReport: notjunk:1;M01:P0:oiOY3UAEVh0=;KLtCrPfpTD8BfPbompm5Fkj3tYW
 YXbmjg25gGxI531WrDm9q9+d+6Jr6pFZbX1YUV8NgAwzdkKrXXgZzm+6116IaAE/7zkjnL+tI
 43R45mBebt7fN69vtBYub1s+JR3xXVXIWLNDx/NhA/HXd1xbSZ+S7sc0e6HHtuOrWKEfa5rBY
 pKa8cndXYlEWmv7nH+47yEz+3NzKMPLIpHivfkkkEyPyE9DSb0V4vy/9othG1jtHAoZTIey/B
 K8Df8YGiXbnavFjUOfMZ/u80TrRN+CdPJMH1xdAhDKS7RFaZvCAtO2cHG2cXzEQG22OQXRxH8
 tlA/TlIoi4b/p3+WyzBPeZ6oqllLX/h04koqF9GZ8V8F0mkFgUfUsb056EAg6QjQRQjV179Bv
 Uz6HZPtkC/KGWLYh04tpStRJorN6IK7ih1Ttrl/VTTrh/p/MUZ4+dYU8H/xeEFkKWDVmiu79g
 RCieWRyYwXBHTGrItuzkXmr1tAzNtGgnEz+7wGxqtNI04eUVZbOnKPbgqabD145YUSLeTslXz
 +eq1JFh1x1cOyol5LONbt/otIe1rPWzvtpYMJz7pQ233H8FaIIZwQ906D+ahJO5Lvk84Ur6qB
 i60oOV/Fz3UjmH42jKesb4Y5qHmwiVWlNWTCozqo7EvDiNS7qaBX1PV8uoqOM5IceUvCOS4PD
 KWqSMBAQ5WnEGeNlmBhx5F738rtRQ4C2zPnRxCAtv6/+pjdaxWHhsbn/Doi0ev8NHj3PWdaFI
 tLpafKz3me53PKw2NvE437MsdJEm34/F4+BiPQSzpCWVzD9EAhXl3rTJkMwWgUa2pHfXuVmvp
 j8ZTxWBU2tLyzAJCICJPE4/t3dESbNE0RT4enjJDf1owfcRfzYhp9mR4fvNIrfJA6IxpnCRnj
 UA9SM8Pf8ZldAupNe4foE1+IFd8y8WBHygClcLlA7qfVX/eDZnWW4cfjpnUZ5Rdip1hsCmLbD
 xrPzFWEmXpCSfbm7SCEOKoMMSM5ErJFPHOHERPW0ogMEFETkx7eKcQ8SE2weqZT94C83LnAGJ
 quSmrK79ArG9WkUoAXrN9rPAreECFVPW7YanKuBVxn0xsaBI3Ws2AFc2hKxhc1/3QefAwYgXb
 iXysxisnYdlniBQDGSheyMaGhbbKYJNWR0F1ANRnzrzfUiFqn5R94GBmgy/nqRra12gWNg5/Q
 59QzRXdOh3JYBwM7Cs1TGMAVIRheaCCJz6C5j3PSukP79/EwomzNlkSG69ROMPNerGiqo9tZP
 SOpmYMGASVY4AiGvDZx5sJHYwWfPxaSv3PNbRxKuIUseDNg+MfDU3yvZw61eNB592iGpVTNAl
 A4FEdYU+0ihyjRCskucDAgyNHUVDpwnmLMXp+meH5RUe8QO4wnoL8BBqzVxuVPiyCLeH4MKQC
 PRAyYtRCDde14UZHG1QYKAG5+P6KiqYsY/KssapDbJ144v/Q4aDZ/KbgF4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1739715249; x=1740320049; i=ps.report@gmx.net;
 bh=6IAgHFUMc6AXa2QDxFRFNDybSY+/ERglNtHKz7Ve+vs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ass6YSnHVLXZZ573U4JcnHkuXHbnvchqIVLtwO7MNziSI8WoJPueewEMzh5gHnfN
 57gEPdufQ3R6iO/vNqDAu7BbgEmbisSYviAP9XaQ/PxBQUeYhv3vY3ch1ktrKGAE4
 AVvYY5IPBGO85mhU6EW2dDVs5q0VosrmnX+XH7HDaxd3zTZ3/RqPLTXacvl6358y9
 Sxb+hrByExS7KzMgSdQxP/JFgx0I4J74fO2G+bU2OiXmthfHaJfYKc/g3eprBzzwD
 /AEJ4M7x/sb8Nwzz5sRiiWDD+B3g2jSJsJs5iBWcDGZpoIG1DzDBKPdp0E84qFup6
 O+wpQPZOcPCAMKje0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=ass6YSnH
Subject: Re: [Buildroot] postgresql issue
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Sun, 16 Feb 2025 13:41:51 +0100, Waldemar Brodkorb <wbx@openadk.org> wrote:

> Hi,
>
> I am using Buildroot master. I try to use Postgresql Server.
> I have locales enabled and building for a raspberry pi5.
>
> wbx@neon:~/buildroot$ grep LOCALE .config
> BR2_NEEDS_HOST_UTF8_LOCALE=y
> BR2_ENABLE_LOCALE=y
> # BR2_ENABLE_LOCALE_PURGE is not set
> BR2_GENERATE_LOCALE="en_US"
> # BR2_PACKAGE_SYSTEMD_LOCALED is not set
>
> Journalctl reports:
> Oct 08 15:42:34 buildroot systemd[1]: Starting PostgreSQL database server...
> Oct 08 15:42:35 buildroot postgres[268]: The files belonging to this database system will be owned by user "postgres".
> Oct 08 15:42:35 buildroot postgres[268]: This user must also own the server process.
> Oct 08 15:42:35 buildroot postgres[268]: initdb: error: invalid locale settings; check LANG and LC_* environment variables
> Oct 08 15:42:35 buildroot postgres[261]: pg_ctl: database system initialization failed
> Oct 08 15:42:35 buildroot systemd[1]: postgresql.service: Control process exited, code=exited, status=1/FAILURE
> Oct 08 15:42:35 buildroot systemd[1]: :5:185m:5:185mpostgresql.service: Failed with result 'exit-code'.
> Oct 08 15:42:35 buildroot systemd[1]: Failed to start PostgreSQL database server.
>
> Any idea? I have set the environment variable LANG to en_US.UTF-8.

Reminds me of an aged patch set

  [v1,1/3] package/glibc: install locale cmd independent of NLS (see [1])
  [v1,2/3] package/postgresql: needs locale command (see [2])
  [v1,3/3] package/postgresql: set locale for initdb to C (see [3])

...not sure if still appropriate...

Regards,
Peter

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20200920150659.7562-1-ps.report@gmx.net/
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20200920150659.7562-2-ps.report@gmx.net/
[3] https://patchwork.ozlabs.org/project/buildroot/patch/20200920150659.7562-3-ps.report@gmx.net/

>
> best regards
>  Waldemar
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
