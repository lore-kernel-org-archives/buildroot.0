Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF6BCA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 10:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1187340653;
	Sat, 10 Oct 2026 10:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQ2fuqSHCiwi; Sat, 10 Oct 2026 10:24:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 03853407D1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791627894;
	b=J4RXcZjIPp9/NfsxMZEXCGrsjDc/2a3L6MT2q7dTLQ/HOnO/POlTzJoeTAPYK5L50Eqi
	 DGMSojVdWugz0Iprv3By0R/TRk0i4lSlSVD/KIewSjhz8TmkB4NN64XKaKoANyAGLCPcp
	 cJh7bFgZZVz5ZWad2xx97CZH34FAPUvHgySaeyFc5gh2mjof5OoxS2m274kFPTq89kKqo
	 Ua75Opa4fQ0pHT2jqGNc3jigwFpgMqKMCBZvWSwvLazb6GAlrs0B8h/J32VcK45NoS9vg
	 ZAHfIjmSSBI+uirZFnu3pNM017wPA9aRBQNDc8F06gtzYsStyEqWg8Z51pshhL3ym5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791627894;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=d+HPX0CD5osxeQLg0SUvHjQV5VUF4Tp+d+mZqX1Leis=;
	b=COCU8Kcc/U0oQTSINVuenEmKuaBHueKkwupG3wm6JPzJUcBkPivIVr3A+Hlfq94efa0d
	 sbgIqPFcJV8FJTiHILHJ/gvs0/Je+h+emXeNpskstPNDhqYg0VzG42J3mpoJutTacPpZo
	 5eWOTpBRHoPHirXMXRCrbMbxJyDzlYwB2cqliVbjNIEja9CQVsMMB1I/B8ooHANaFiUa9
	 dIIrGb22jdn4sNSbAuIDmUOZRd+/pytCv89gPZDDLWidLLiTbDRkngosXOSer47we4bz2
	 NSJ+ll30VAKUR34Hrq0EEsTGl0eKiXpuMz8RS0yzbPxR+Fgi5RdhGbzCnsdg8ctEKbQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791627894;
	bh=d+HPX0CD5osxeQLg0SUvHjQV5VUF4Tp+d+mZqX1Leis=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TER2KaSCGk8mN/4rTBctRBw75XpKUuYKa7FfDfF6QoTtvC82odsmlKB+PSH+RaWD3
	 BUyMk/oNa/+5OO2XRMviMes+5diQayox+J/oCtdbX4ZoBHX03UjWwkGva6rhTRej4T
	 I1XWmAuKQtdsW65CfXfx0ik8d5svxbqA1QpBfBbpq6SgUr82/nfl2YyQ4+MCuXZZ5o
	 dL3Ma6LqszT6doOrajhxxmhVKv0s5x7GxJlcWNaVceJe3haix+MTm0elBmlMGQvmxD
	 Q5UTgJaIIMVfbE6lxhj9r2sRwMcyHq55cMD4//HXyrJRPPsl2uHKuPTJ9OOF2T4zuX
	 FNJTYAhe9Qwtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03853407D1;
	Sat, 10 Oct 2026 10:24:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC3B8235
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE3226061A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HM25h4fFPu7 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 10:24:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3D29660600
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791627891;
 b=kA5F3j85Db904rHJQedlEE2DsaBzv4aUfxEkNuOjkEKYPEV+SuZc0E3OFHlS6I2UUwWV
 Zj478bpSBNGp2Jb76N2DQ6AEkKTZCHEBLEgdhcs6cjwGLxXBfXvewgyhAWsj/U6SCxzcA
 OELH5ca/HK2QcKwPvuPwgiBljS8mLWupY/BwH8KaWw1yMNRAF6nlPydnWquhM69Fyp5ez
 Gi1F1zS3BtTm3c5NptxJCB+ROIgTSnWOVrS9fG5wixskPO3R5NE6+2VO5GZi8yw2EMBQv
 tvQJKdGbzmlkN8eseKutTfHV4L6NcSENgvjPdJLd9q6HBJ3LM0LbfeUc0SgyzeWRXfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791627891;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=3j2ea2ONVSdIBejveXFDkwMCkXxAQzg3OvlVWSGzips=;
 b=fDbWi/WQO+A8p7gJKufVPvjA7hac+ng9cKQOYaw5lOrgnTGy4fXJG3fEOgI+GhKdyADX
 Psij7cKgfviIxj/wIC04yHxCc0SaRawskfQi/8t+xcHm19MLN2gwsmnLkEihNgDsZqrLJ
 z8oHeMqdNkY0Idm+KRLilIXuSdY0Mb5S96RdjlLv2nY+1HuFF1rtC2e35AYgTh5vYuoza
 WSZH9YA++MWLD9MPZ34BWx53xi3QxcjozP/EZM0t6doExPnO6f80wcqaMWBTTK0nMLXZR
 IixC91+BbEaowpdxX5WpBo2c/rw+TWrEJqqQ8N+TKib+AEkFVzH1goeHp/0NWdw5D6w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GKHhcyfO; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D29660600
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:24:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1A1204E411CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:24:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8CDDC6075C;
 Sat, 10 Oct 2026 10:24:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD77C11D701F5; 
 Sat, 10 Oct 2026 12:24:45 +0200 (CEST)
Date: Sat, 10 Oct 2026 12:24:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>, 
 Sen Hastings <sen@hastings.org>
Message-ID: <asoSaOS2bqCsgFog@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-52-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-52-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 51/84] package/systemd: Fix build with
 OpenSSL 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 06, 2026 at 06:20:32PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Norbert Lange <nolange79@gmail.com>
> Cc: Sen Hastings <sen@hastings.org>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
