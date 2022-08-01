Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16DAC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DB8C60BDA;
	Mon,  1 Aug 2022 17:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DB8C60BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZoEtveYqftEg; Mon,  1 Aug 2022 17:40:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7054E60BA9;
	Mon,  1 Aug 2022 17:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7054E60BA9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1A1C1BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC52081B14
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC52081B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d__0UR97s9Xa for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:40:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96ECD81B10
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96ECD81B10
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:40:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 87D9C240006;
 Mon,  1 Aug 2022 17:40:28 +0000 (UTC)
Date: Mon, 1 Aug 2022 19:40:27 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220801194027.4765a372@windsurf>
In-Reply-To: <20220727192948.18653-2-guillaume.bressaix@gmail.com>
References: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
 <20220727192948.18653-2-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659375630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DVvx1VRvEYQBoZs8cFJrjMUjX/a5HNzELpIQyPSu9Yg=;
 b=inku+u+qhvNeqe+cseGhR54TukvAa2qdOCt0ohZKJ2o2O6BraMRcuzDyjDbLQaAo6p9Fhm
 pgbwpCCIDzyT+C66NcQekMJtnFwA3HnOdfN1zSaC/iORZ5tOJm0sT8YAozUM3nYy0JP8xE
 CYA/0UFu3tGPUx/YU5m4elxjx/FareYkhHPl54VBhVpSBFMOSqJgZqZrWBAvH2zX6OQu3T
 B6NuF4eqMNR0OfjNfHlw7afX4H45PyY6yoGODZqCzdADtMlKHbaIA0QU+UXh+eV7FpyZod
 8A3MbVRzYBS3jNaYvW2G/MMqOh10SoPnToEB2OKtCnUxPm+7OraSXvavdUE7jA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=inku+u+q
Subject: Re: [Buildroot] [PATCH v5 2/4] package/python-beniget: new
 host-only package
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
Cc: jmfriedt@femto-st.fr, gwen@trabucayre.com,
 Jagan Teki <jagan@amarulasolutions.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 21:29:46 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> Generated with scanpypi and converted to host.
> 
> It is a dependency of python-pythran.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/python-beniget/python-beniget.hash |  5 +++++
>  package/python-beniget/python-beniget.mk   | 15 +++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 package/python-beniget/python-beniget.hash
>  create mode 100644 package/python-beniget/python-beniget.mk

Applied to master with an entry in the DEVELOPERS file pointing to
Guillaume, assuming he is willing to maintain this package. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
