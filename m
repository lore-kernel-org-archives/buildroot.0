Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5468CA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF3804178C;
	Fri, 29 Aug 2025 08:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndsFCrWbSZ3b; Fri, 29 Aug 2025 08:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C0741792
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C0741792;
	Fri, 29 Aug 2025 08:44:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BF91D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89517614E3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igkopzoEZoS8 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C327561506
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C327561506
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C327561506
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:44:42 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1217842202; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 08:44:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uruiu-00BAP6-2m;
 Fri, 29 Aug 2025 10:44:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
References: <20250827222934.1249498-1-ju.o@free.fr>
Date: Fri, 29 Aug 2025 10:44:40 +0200
In-Reply-To: <20250827222934.1249498-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Thu, 28 Aug 2025 00:29:34 +0200")
Message-ID: <87o6ryjz47.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=addzvh9zME2aiZ2ZXyFcq8y8bXHd8AUtLMrUayCa8BCqJuBb8gSe9IgVuNoVbCIUiUdW9A8XSDBfGskp9rj2hSqpQTW3Z8gVu8RYFHCaN4aKrZsSIyXVEW9PjjgrYRgQkQRg7v8cbzvzqnjNf94kdKwRfZ7cSckKc03JL1elbWNtRO/U1JhPHG23HBkMyLjGmvPW8+11B7Np/XdE4s/t7Ct634prJRyDEcY4UwTsndOjpHtrvZ2LOow39iRzIBCoGm5XhCkBopYfuGYAck1BCi5x1BF8S3DwfTQ9/IDjwO/FMJRqBMPl/iPFUQFN0kfc8P6wOSBdRz/5zq4XN5rGNQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=m9DJeHOFh1OmOT0izqIAnyimW8xhovWBgCNhxG5Hafo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=addzvh9z
Subject: Re: [Buildroot] [PATCH next 1/1] package/acpica: bump to version
 20250807
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > For change log since 20241212, see:
 > https://github.com/acpica/acpica/blob/20250807/documents/changes.txt

 > License file hash is changed after a year update in upstream commit:
 > https://github.com/acpica/acpica/commit/53553c302b5fc57afe55dd3d96ce3aa861dea1df

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
