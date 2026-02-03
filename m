Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD07E8B367
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94FD160901;
	Tue,  3 Feb 2026 21:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5l-8wund2307; Tue,  3 Feb 2026 21:41:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B3C260904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770154889;
	bh=E1DrXrXfYPsINr3i5a/9F7B+EcWOfMRUsJ1mgpsftOk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o/oRooKrmT857AgD0Yj/svFB8URdK9lgu8wst88L27unCIGKr466bS8th0MKdZo8E
	 hSpzQdtyp4/gEUIywIE5GOL+GExjkt9/yXI8ScXDJbJiMHYpr7uDvGDlNjmn3xKGlj
	 ylgxqkOFM8pMslfBKo32sm7XjaTFitdARM451fqQv4bTNhlg5vptMFFbMw1ZeF37FW
	 Ho+NsuBdIXRJghSEB3eIjXToCYiTww+Sb2Y6Ih9QVRk0vO03MGdxiUNTnHrWuoVv6I
	 ZyBVzBoDPi/JJx5SIJDXFoN5lu8j2+qIXbUDUz6EofzPypvZEN2u62OxlgfYGxywBu
	 ZtXRmLS2ZxBnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B3C260904;
	Tue,  3 Feb 2026 21:41:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23317F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1061160904
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhlMvVSJJByf for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:41:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E4CA60901
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E4CA60901
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E4CA60901
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:41:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 021E01A2BCC
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:41:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C5CCF60728;
 Tue,  3 Feb 2026 21:41:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0882D119A8888; Tue,  3 Feb 2026 22:41:23 +0100 (CET)
Date: Tue, 3 Feb 2026 22:41:23 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aYJrd88o0JXZ0fA4@windsurf>
References: <20260103094508.1212757-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260103094508.1212757-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770154884; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=J9Byd/O7CwppuA28UKu6jMu0Z3iuEDzXdHK6b67bXSY=;
 b=FaKPmYvFOSOlFhVrIZI6+Z/AnaELTcK/1D8tP1hIIrgyurYDAB5ONYmFqupZESEkIkaREL
 MEMm+tcbEdk9WmDZIIWCmnMD9rO2UJApRZ3SeCkdwZRMl/qDz6xOikrELZff6+xAPG5DtD
 kudkfLjjWc9cN3gQgZpwKwlGf6o7ojotm0hv44Sk1+VWy1sHPQW7X3V8AObiYB475v7yIa
 opUjsxcQIZ4iPZAhAhK2YfcjUHIJiDcDfTZd42/hltLxjUE+MqV0LlGpJF8cOgFZwRgtvi
 2tYGgtEZplVJF1i+DROnJbVxL3abj9hgNucDkJPkGRp1HHzn0tySen/a6CuCJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FaKPmYvF
Subject: Re: [Buildroot] [PATCH 1/3] package/spandsp: fix build with gcc-14.x
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

On Sat, Jan 03, 2026 at 10:45:06AM +0100, Bernd Kuhls wrote:
> Added upstream patch to fix build error.
> The build error does not occur with gcc-13.x.
> 
> The first build error of this kind was recorded 2024-08-23:
> https://autobuild.buildroot.net/results/492/4927e93e40ec8bcda107f4bc3d8aa83024deb674/
> 
> Fixes:
> https://autobuild.buildroot.net/results/48a/48af80bdda62ca70d73bc01e0939f548c3736c0d/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
