Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3A8C433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 13:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B242083E89;
	Thu, 13 Oct 2022 13:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B242083E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YXIEkAk59VQa; Thu, 13 Oct 2022 13:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECACC83E7E;
	Thu, 13 Oct 2022 13:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECACC83E7E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 315A51BF425
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 13:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BF78403B7
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 13:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BF78403B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXK1lgsbcso2 for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 13:06:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB8D540390
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB8D540390
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 13:06:19 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 129so1503706pgc.5
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 06:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HEhtrL20T3cgOnubX4KLj0IvjZgccO1UOirdIZY6q7g=;
 b=3rrkI8X05jUU8rEe8pQWHVcENcbw2IMr45ZZkbx3AnqBlDkBV5X4Uy/rnM74NbberI
 clAJdrE7K2JTD5Qj2BMYRT6fOXT2InbCDTV3PmVnltzuQ/Y3nEI36nmJFYTUERK6QN39
 hSfxJ1vkagGvwxOvx7iRXtf1a6PwQ82xA8s97g21I1k86juxgRBasCbK1pQNohZexSXm
 tS8dsR0aDRvZ4falYC4jT9+zvBHD3eaUaJElyRskOsEeEXqgKypXDfDl9f+8gnzPGzPi
 fJUyloyOqbStbM2nkxAI8P2paX3qUzpyFHXZkCE5WmUPephso0zj2I+xg7m5HQPvLNEw
 1qoQ==
X-Gm-Message-State: ACrzQf1ba/MHkyu9emiUykp76MfmUpz1hwiuR6EuO0TyTn6XHtcc64HJ
 Gywns2tGcyTl4vQhrH63hA8KO+X8zTR7HRu0/4oYKb2Zur0=
X-Google-Smtp-Source: AMsMyM5HA+RgqfxJLU7erP6c1PP5DQ0d0R8LpVPe1/QFAqmzfdI/JOJn9TJjJNyn6wBuAfRfyx+Vsu9tNdTeUPt/XJ8=
X-Received: by 2002:a05:6a00:a21:b0:562:99d6:c30a with SMTP id
 p33-20020a056a000a2100b0056299d6c30amr35461061pfh.35.1665666378550; Thu, 13
 Oct 2022 06:06:18 -0700 (PDT)
MIME-Version: 1.0
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Thu, 13 Oct 2022 15:06:07 +0200
Message-ID: <CAMdwsN--va3eFthe39JypnPWJtkXKJdN_HdMChHS8d=RoneJbQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HEhtrL20T3cgOnubX4KLj0IvjZgccO1UOirdIZY6q7g=;
 b=MeE1h9yhBlP1aQZG/lq/sPXxsb+VcZG2mbdIlPzErXJ1p6ZphIIg+S1NCDqx5/WHW4
 4ibJqS1xyADg0WnmCowU886XUzbSISTbBMKLcLAOTfbaa8oRb/yMih7lvW81qZ4fXF3s
 +3770uzKzC016LVEyXSmyG84OMyGPASU9ao8L4qc/VVsFgPs2zhZ2uJNaee9KlRTQ281
 Q8lVTsZOUoH0bYwOPr5svv1NOKjYtOrih9kWQ1fU75WN5Puv6w5nJlqn3j3Nt70S1Jqx
 rAvwBRhUfqkaWEirAci+blX00hu8cHcW8rzYFeVscQn7IiHNdTWzmVOLQg2QY36vka7A
 apcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MeE1h9yh
Subject: [Buildroot] Changing configuration options of package in another one
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I'm in a bit of a peculiar situation for which I'm not sure what the
correct solution is.
I'm trying to implement the qt6 remote objects package, this has a
dependency on host-qt6remoteobjects because it needs a host tool from
it to build the target package, however, to build the host package it
needs qt6base network enabled in the host qt6 build, this is by
default turned off as it's not a necessity for the host tools needed
to build the target package.

So to make it work I've added an enable for the network module to
HOST_QT6BASE_CONF_OPTS but this seems like a bit of a dirty solution,
what should I do here? Manipulate the qt6 host build it in the remote
objects package? Or maybe turn on the network module for the qt6 host
build whenever the target qt6 network module gets enabled?

Best regards,
Jesse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
