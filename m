Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBC1C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:06:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B52FE60C51
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B52FE60C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74B1C82B2F;
	Fri, 23 Jul 2021 22:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXgQc7lDTVH2; Fri, 23 Jul 2021 22:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C58A282B51;
	Fri, 23 Jul 2021 22:06:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8F21BF3EE
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 786F760709
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7EjhKqlN2_CB for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 22:06:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D1346063B
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 22:06:18 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id hq13so5734108ejc.7
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 15:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ACh0hLOD8h9/sxkEqgd4ESLJKvZBBehDlSJU4Fp5/+Q=;
 b=dNb+CejehJTYseoXi+pGXoBpD6iKUrUXeeGzFzc3W/SrnxJ7ZEd6cFuhdPhfRGnTmn
 /ijhf6UPbO9HA9jBbh53K0Q+Ubi2fN+YBJ8PSVDXzqxPFjbnKYGV4jqV0zM1KLc2OMnR
 iW/BMuuNq+3utev4cB5m5DG/rOEF9OfWL5pPEdyzcAeSE51SI39PlzuLqLNMuaNQxjRx
 ll/k+60sK5voE0I1gn0T+bB9UqhkUNec/Qn7MqBkvb2vrXVm64Zj8Q32DKrVMfox6TUi
 bAsrLSgniLYQ+QWd34JIHR2sl6SviZwR1X51aIdj4y6xYsADQp0+JeTNJcpFIlf7sJjE
 2BYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ACh0hLOD8h9/sxkEqgd4ESLJKvZBBehDlSJU4Fp5/+Q=;
 b=Ah5TUcsEDRyy7tsQBLHw7/5mLNqf3t0UgdwAN4M09VrPeoB9mWiQtIBLIuXXOu9MV0
 x9sZitrL23Hjd0jH/7OgRz0+jTQYcJJRpVS9ANADiG4ZsDabxRlf5ELUMxFrlRY8MqZX
 qqCpOhrSgYYhxSs0vdu6F3I5Fd+3ZENg4XoEulATVBm6XK6gSClgQRy7lMFg2mAnNG2Y
 DoYVIUbk22hRfUQrC0/RxQFJZnZvj5mVDcCqgOy6HBXms8G0rcksmQ6vRft0kxx+Si24
 w1TAxH7CJHargJ5IKix59aYvSRTcwbZIHQxouxs+fOIWlNxcKM4Bp2G2zybd7GwSbToT
 gQlg==
X-Gm-Message-State: AOAM532NavsioN3MlP6EFbHMOSdbIlh37RBOUsYTsxUCU9mjBFvtUsU6
 pNgU4FohRfTirwnbe27yHnhe3g==
X-Google-Smtp-Source: ABdhPJy3x3JHd+kwm8zU9Z3KwOhrlnjBu+9LPwxosTmhoR85gxCX9E08meVJPNnpwlmRWE95yCG6PA==
X-Received: by 2002:a17:906:3c0d:: with SMTP id
 h13mr6628476ejg.335.1627077976446; 
 Fri, 23 Jul 2021 15:06:16 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b19sm7187470edt.53.2021.07.23.15.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 15:06:15 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210710215532.1846823-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <7856f9ea-d826-c2b2-c776-2d442d9efce9@mind.be>
Date: Sat, 24 Jul 2021 00:06:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210710215532.1846823-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/python-idna: bump to version 3.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Sven Haardiek <sven.haardiek@iotec-gmbh.de>, Asaf Kahlon <asafka7@gmail.com>,
 =?UTF-8?Q?Manuel_V=c3=b6gele?= <develop@manuel-voegele.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

 Hi Fabrice,

On 10/07/2021 23:55, Fabrice Fontaine wrote:
> - Python 2 is not supported since version 3.0 so update all reverse
>   dependencies and remove python-coherence
> - License file name and its hash is updated due to:
>   https://github.com/kjd/idna/commit/e7338bce90683246c480ddebd55b7682371389ed
>   https://github.com/kjd/idna/commit/537aa99d4440b0f8a6178818350f27fcaab046ee
> 
> https://github.com/kjd/idna/blob/v3.2/HISTORY.rst
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 There were a bunch of conflicts due to the python-bcrypt update which partially
did the same changes.

 It would also have been nice to put the python-coherence removal in a separate
patch, because this was really tricky to review in one shot.

 But now it's just committed to master, thanks.

 Regards,
 Arnout

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
