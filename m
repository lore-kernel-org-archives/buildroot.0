Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AD6C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 776C743724;
	Fri,  5 Jan 2024 12:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 776C743724
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PjnMxva4ixOa; Fri,  5 Jan 2024 12:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90A444373D;
	Fri,  5 Jan 2024 12:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90A444373D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F37BD1BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9D7461497
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9D7461497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZGJGjcACjiu for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:54:31 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA536607B4
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA536607B4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D2952000E;
 Fri,  5 Jan 2024 12:54:29 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:53:55 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105135355.24bdc51d@windsurf>
In-Reply-To: <20240102224900.2534201-1-fontaine.fabrice@gmail.com>
References: <20240102224900.2534201-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6uxL+EJxZS3I8ynJYgBZCg5Ysj1NjeFzEe7NI4dbhng=;
 b=j+ym38Z5nRbPhE7qc60isKBMhPBAhI90BcMXAjUorsJfrihQaAywkjIhaozyfjjzgAFn7V
 RotW7isnw88MawjLC3mur1BrA2PWx6pJ+LarXeTzJVutn/T3yS9ZzU+DG//ANO+hLmMQYl
 tuc8O358LoGVMT2jNyYzHtvnFZfxfzVMK+N9jb8/jJuIK+3KkBSgkNMbWvQflb1zx7BWLx
 TqFaxmlMOdzEVlKE9dBDvdvWbUHhCJOlUIBmrxbmRnHJI0tTH+AmYZlkkvK524bGoR2I1I
 SUDFUUowtJyE+n9iFfIH/h0TnxHf3QOYFZxZvQyRjR1vOdZo6XWP4nOYEnIadg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j+ym38Z5
Subject: Re: [Buildroot] [PATCH 1/1] package/pugixml: bump to version 1.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 23:49:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of LICENSE.md (year updated with
> https://github.com/zeux/pugixml/commit/1a9a41b0f455fd94fd9e66bb8a987e807419cd3b)
> 
> https://github.com/zeux/pugixml/releases/tag/v1.14
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pugixml/pugixml.hash | 4 ++--
>  package/pugixml/pugixml.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
