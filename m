Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAF5C636CC
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 19:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A63A41867;
	Tue, 31 Jan 2023 19:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A63A41867
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zWnnh69pErzr; Tue, 31 Jan 2023 19:33:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 240AA4185D;
	Tue, 31 Jan 2023 19:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 240AA4185D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDF851BF34E
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 19:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A49EE813D7
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 19:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A49EE813D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28mYHssm70V1 for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 19:32:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF47F812E9
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF47F812E9
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 19:32:56 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id n2so11000239pfo.3
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 11:32:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N9epQvFb/vbKNVzh8c4vgmGh0V+fUjxm3AANbzjhhXw=;
 b=t1NUlwBndv5lJb6N+KGRYLaitMmvgdzHBdhO9NBuDkYamdyfcyQofquH1uoycrPrU+
 sFu+8Gk9ltQFVABWxONxplDN9hp3meZCIYA9+hQLoFnxt/m2IvnBpMGbw2cIepgmCOL2
 pln9hHxIYIY4WKumG3R07NR3WApPI6vFqQcKKv38gCp8Fgbqx3BTXukaX021Fejy4SAk
 9oKebD8pTjvmiyFHtcLuxo3Rjh/T7PE0bASir2ACVHnIP6kzrWdQ5+8T7LLYXSIAIbpU
 SJ/ZOretRPyXUJZkUJlyVTT213EWEaxTdiX3hvsE5k6ED+0hDQhLAQi22PX5aHAwiDZF
 BQLw==
X-Gm-Message-State: AO0yUKUqjxyJun3+lNBfqRHQqgXAihRiTTVKiuwha8hKi8+0bIk5E7Tj
 C19TCgb+HqfBX2fkyCZrpsotKX0Gbe3jIe3MnyIjc3FE
X-Google-Smtp-Source: AK7set+AEGUfatn9SWfP77LsxCLHNbpwb2QT9YDGVVGtM03RJmH4trQCAcQSkJmWqB01SIz7vV+Fu5Ui+IxUksDNKk4=
X-Received: by 2002:a62:158f:0:b0:58d:a84a:190b with SMTP id
 137-20020a62158f000000b0058da84a190bmr52575pfv.48.1675193575834; Tue, 31 Jan
 2023 11:32:55 -0800 (PST)
MIME-Version: 1.0
From: Ramon Crichlow <rcrichlow9000@gmail.com>
Date: Tue, 31 Jan 2023 13:32:44 -0600
Message-ID: <CACHw65JEOTp4HhvXMUURSoD-ce5Topa1Z0VNvHWjw8HaBaE-aA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=N9epQvFb/vbKNVzh8c4vgmGh0V+fUjxm3AANbzjhhXw=;
 b=P74nIzVoN/WCegh+KlZFbPSHC1x8EJuJ0sW+/4mW0e3mVOlHaVN/a0fmVQx/QWSYJu
 Jq4US+4o+K8wR4yxvKIY377Cq9l1gSYfbdcb9hAPLBUxeo6pv/08FrkDsXbt7uycKQcx
 r9b+n4G3MMT4xyYFQXQxl/jmAgil5t3tCquw1zJZG3G5qWO0+Otwp0EPwqD2WlkC9qQM
 PFOryhd3p3uGIZ5pwrB/q7gSrX+Hg5c8H4E8k8N+cIyj4HjQqEW0EnaNupvwcuUXjzfq
 fGBCemC/DtyxmOfL/HGEaGv3pmz4pO7snZlncJilsAeKJNg7RCAzKIpBGg1ZcANP8Bis
 CG+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=P74nIzVo
Subject: [Buildroot] Development flow to track .config
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
Content-Type: multipart/mixed; boundary="===============4222691611895782767=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4222691611895782767==
Content-Type: multipart/alternative; boundary="00000000000004884905f394669a"

--00000000000004884905f394669a
Content-Type: text/plain; charset="UTF-8"

What would be best practice for saving changes to the top level .config
file using a private git repo?

The issue is that since .config is listed in .gitignore , git will not
track changes to .config.  Secondly if make [config file] is run, changes
will be lost.

Assume that

# make abc_defconfig

was used to initially create .config

Is the following flow best practice?  If not please suggest a better one.

1.  Make a change to .config using make menuconfig
2.  Diff the change between .config and .config.old
3.  Edit abc_defconfig to mirror the changes in step 2
4.  Commit abc_defconfig

Regards,
Ramon

--00000000000004884905f394669a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What would be best practice for saving changes to the top =
level .config file using a private git repo?<div><br></div><div>The issue i=
s that since .config is listed in .gitignore , git will not track changes t=
o .config.=C2=A0 Secondly if make [config file] is run, changes will be los=
t.<br></div><div><br></div><div>Assume that=C2=A0=C2=A0</div><div><br></div=
><div># make abc_defconfig=C2=A0</div><div><br></div><div>was used to initi=
ally create .config</div><div><br></div><div>Is the following flow best pra=
ctice?=C2=A0 If not please suggest a better one.<br></div><div><br></div><d=
iv>1.=C2=A0 Make a change to .config using make menuconfig</div><div>2.=C2=
=A0 Diff the change between .config and .config.old</div><div>3.=C2=A0 Edit=
 abc_defconfig to mirror the changes in step 2</div><div>4.=C2=A0 Commit ab=
c_defconfig</div><div><br></div><div>Regards,=C2=A0</div><div>Ramon</div></=
div>

--00000000000004884905f394669a--

--===============4222691611895782767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4222691611895782767==--
