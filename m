Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BA5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 08:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4043A82983;
	Wed, 20 Apr 2022 08:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfeXxiPRFLij; Wed, 20 Apr 2022 08:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 470CA81D35;
	Wed, 20 Apr 2022 08:20:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F10531BF319
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 08:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD6FE41915
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 08:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9V12LCPuvNZp for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 08:20:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBD3C418FA
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 08:20:36 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id 11so1323668edw.0
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 01:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=YkvCdg/Blqiu68dQxRT8TuXsuoxv+609Q9yA6N4UrdY=;
 b=Abn3VNrzY8SgByyqqCJsXkRASs3SSr5s4bki2SY95FZ9ATIJoSDB/zOBHeyPhTcmc4
 jN+zitTAma427HhSz+avqEuPFtM2l3waruz0lpYjSRmmUM8mMBaUQf31dvXpO+dxgWo8
 KRmJbH81ddmP8lcxZjRBdCAgUj4dV/67p0Bh3zYzG8IkwcE8wjk+cYeFGC3DPIeN2RNq
 nnaNAHgwCHrm6NZZGAmRoDn7zIm2duA5X6Fwi14iY98cLYi6T16QYCLtbgm5OCa3UKYy
 SZElmMKroAuI+QdD/uuj3Qf/BKlOk3avLfzdnfxAbPzHMn24YtaZunM+lh5t0AZ+IAzc
 NHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YkvCdg/Blqiu68dQxRT8TuXsuoxv+609Q9yA6N4UrdY=;
 b=NhpOzqeEeV7TTaaARxBNKttQOSRIHZsxMV2b/Sg3KFb6nlBmVFqiunpnvY1wCw0Btq
 J04woC1iroMHdIq3atuVTdp10AMncYNBZVUfQQfeTTudrV+ktuAfLR4amdLfs+78jaGr
 Pb58teoaO1sQwh3K0RC6LQ5XcV3gkNuPyFJTLyQCdsz7odizqVRdYHwWu5JCVvT6AKJo
 o3Dyin+I9qxlR0rmHZA50ccCmMJQJ8AVkMLdxM21JFZqUvMD2bry6CkU0xGKJy6Bye08
 qI+b8wKO7RxmpHASUpIbL03ShThlGpBlvop0i5/HIfampDMcWp7zi6d/w7pGeXRzKZFA
 yRyw==
X-Gm-Message-State: AOAM530hTjxb6p0JUpB1y76mZlthzZ01v7w32P4Su/9EcTC1Hbsd42uw
 r6v047l1bTVF9ZpLF/h721misFSkopcp3317u5+k08HiJMY=
X-Google-Smtp-Source: ABdhPJyTTOu514ozn0sasG5CMlLSwRKwNSeNHKLIrzFAhcyPZVsucUyQhoYpQYcjV7lBlF+oLuxeoqdti+sYRN3It58=
X-Received: by 2002:a05:6402:11c7:b0:423:f7f1:e718 with SMTP id
 j7-20020a05640211c700b00423f7f1e718mr9897136edw.279.1650442834740; Wed, 20
 Apr 2022 01:20:34 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 20 Apr 2022 10:17:09 +0200
Message-ID: <CAGm1_ksV-zHnC7jMsy7SFD+xBGsQbKNn+mvSDYnr2_2nkVATFA@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] config.in: full stop at the end of the help text
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

should a full stop at the end of a help text in the Config.in [1] be a
requirement?

Which term is more preferable: "full stop" or "period"?

[1] https://nightly.buildroot.org/manual.html#writing-rules-config-in

Regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
