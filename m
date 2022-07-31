Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB813C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 22:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA220418D0;
	Sun, 31 Jul 2022 22:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA220418D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JwDQT_FRCLvr; Sun, 31 Jul 2022 22:59:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F5C418D1;
	Sun, 31 Jul 2022 22:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4F5C418D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6029B1BF20B
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 22:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A74360899
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 22:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A74360899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKKvDPGbttM2 for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 22:59:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D024460804
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D024460804
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 22:59:19 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bp15so17354910ejb.6
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 15:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=pXmbvfn6LY0gX//T3oP0185vBpsAeBTXDCW9bJDJ/rI=;
 b=jXg5edsRo1f4u7iRcygkwEEsfh3dISlFUaLze7nS6fXNg8VjJsz1BMBzZb1/+hdBuQ
 tt347eTG6TKtFOcK3ouvg5RDrnB2uCVizUMQx0bH2vN6Y/9FgTrsEamBzLZB19bzq+kI
 SFl54Rg4BtcxjJaJxBKeIYJRclMij36gxodgob99Jq/owrWzulUtfBGEkkD5uvLLbt5T
 Grq9lcAqbRgui2W2LUsW8saPPzplDGflYH+IHl9rmLSKGHw291AUTcW76h+73Hq9PJEG
 CEjM5wZ/7/Z4IhXbOZZutLrIbP0DV6vKxyOYVNkRREDBvVsjyG22IRi1W7j5PLVfhnXd
 Pwwg==
X-Gm-Message-State: ACgBeo38NPBGHR/jozT3D2hpBR4YcCJRs6Mih6KiqfrPx6lxGctJOZdu
 wJjgOW0zuGWMagLKeKISmahFZACPsz0BbQ==
X-Google-Smtp-Source: AA6agR4DnX7EINYNf2HQkkhagP+gQ9Oyn4ZoRaeFl8f24tufcg4pqUaUAQLK5mA7kFhBWXW7mHBJlA==
X-Received: by 2002:a17:907:94c7:b0:730:5378:c1e2 with SMTP id
 dn7-20020a17090794c700b007305378c1e2mr5494715ejc.212.1659308357626; 
 Sun, 31 Jul 2022 15:59:17 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 t11-20020a056402240b00b0043bd2a79311sm5975307eda.37.2022.07.31.15.59.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jul 2022 15:59:16 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id bp15so17354867ejb.6
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 15:59:16 -0700 (PDT)
X-Received: by 2002:a17:907:a049:b0:72b:1432:5c4 with SMTP id
 gz9-20020a170907a04900b0072b143205c4mr11107934ejc.263.1659308356359; Sun, 31
 Jul 2022 15:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220724234718.676572-1-christian@paral.in>
 <20220726191133.26dba919@windsurf>
 <CA+h8R2rq1GonYRs0o=BN_gcJnJwYCVosjY9FEeZs-3os97Kt8w@mail.gmail.com>
 <20220729114251.217a4104@windsurf>
In-Reply-To: <20220729114251.217a4104@windsurf>
Date: Sun, 31 Jul 2022 15:59:04 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oqDaH0sOKmRxsH3YBnnKB7W4hMe2oR0hD4z=RYik41Tw@mail.gmail.com>
Message-ID: <CA+h8R2oqDaH0sOKmRxsH3YBnnKB7W4hMe2oR0hD4z=RYik41Tw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=pXmbvfn6LY0gX//T3oP0185vBpsAeBTXDCW9bJDJ/rI=;
 b=SGckh0z3CGlCJmaLY43dPkiorxuw8mr0zB7eTsGBb09x/pePsQHD64TIQwGOyjmbTZ
 aMKO1PFzvTUEOZnPn1/g43Y5JFUW+g6rt08nHavPTUuHh7EU5DWwiS+rJJMTdamswXG/
 9GqeHNXWX4yfzvBKL35YD/zqPtkII1HoK9TqK6RcGUdndBReJhrsG2NS3YD4/uH3msX5
 nTt+ty/R7368uWB0aaW0WEtXTYxQtHmaJDUH5t86fIIehXfhPu5kZlKK8XlprwDxyU+e
 NJKRI/OR+OdgXm23Tdv3cO8xfKLBxUmrm2vIXAvoA5b73aw6vVur4hw3b8hmr7YUzzT6
 0dZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=SGckh0z3
Subject: Re: [Buildroot] [RFC PATCH v1 1/1] package/android-tools: update to
 version 5.1.1.r38
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,

On Fri, Jul 29, 2022 at 2:42 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> I have no idea how this is maintained. It's probably a bit crappy as
> this is forked from the Android code base. So far, we were using the
> android-tools packaged in Ubuntu, therefore available on Launchpad.
>
> This other Github repository you're pointing to perhaps uses a
> different version scheme.

https://github.com/nmeum/android-tools

I have a WIP patch to switch to this and it works, kind of, but it
ended up being more effort than it was worth for me to switch at this
point.

Currently the patch I submitted originally at the beginning of this
email thread works fine for the purposes I'm using it for (adb &
fastboot).

I suppose if you wanted to use the other android tools, though, or a
more recent fastboot, or depended on one of the many flags that the
newer fastboot offers, it would be best to switch to the other
package.

The android-tools in Gentoo uses the fork linked above.

Let's merge first the upgrade to the latest ubuntu android-tools
version, and later I can finish & submit the patch to use the Cmake
version.

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
