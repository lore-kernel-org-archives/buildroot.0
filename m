Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FF2CD3437
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 04:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 994D2822C5;
	Tue, 19 Sep 2023 04:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 994D2822C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gn30QjBCMEJ6; Tue, 19 Sep 2023 04:42:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED3DC822C9;
	Tue, 19 Sep 2023 04:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED3DC822C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 628801BF23B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 04:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AE6F61077
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 04:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AE6F61077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhxdIQPdKARf for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 04:42:39 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70A8161038
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 04:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70A8161038
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([213.147.166.97]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3siA-1riE9X07aC-00zpku; Tue, 19
 Sep 2023 06:42:31 +0200
Message-ID: <37f6d34b-589e-4570-88d7-28aa967d45b5@gmx.at>
Date: Tue, 19 Sep 2023 06:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230916154940.746749-1-fontaine.fabrice@gmail.com>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <20230916154940.746749-1-fontaine.fabrice@gmail.com>
X-Provags-ID: V03:K1:Y4PCh/OkBttj4QVQLzbBf/MuK9yqkIA78bHZMB2PASlr1h0Vs5s
 x+qRqIPh6FrdxRFmMXz7VAr8VW3D1AZXhw4Bxx39TJGXUQwRpyD1RXTqoYwFBgPAC/9O1s6
 H1BMfrAM+uo+eRkjCrMv20zStD9ysDLJoJsu7tR9dfxpZaWHwmJ/V8wgT1Uev+V8ClgAc6W
 GCOtfqPmN1cwGiAnMtYhw==
UI-OutboundReport: notjunk:1;M01:P0:IGG35wTGlWI=;P/M+04KQDlK53LLSrXgCRbaHhPB
 dZ3X7VHbPLGmiAS24GzeIc/3idZoP0/REp+W0nDSe+CXn/4IyW2LvtLrCQ7VBkVyDrX//IN7V
 1NkK9+fGreykqCRBwNOt+B9ALshF/vCNG4ML/7iMtNp14QQtKFe016AWDM4gJpDzZe2nLsINL
 x/VKymS8FLsQ1CaxprNofWEIkwmn3DOs2IYcktsMMI1P2WcbiJCKbhu0voV3UZ45/o+T/8vnF
 CHsNuB4G5Oykye7LiofYPqngNvzpuv3p/UgdTwAIVkj34cU/2oJ6LB+01nU13J7VaUT/jegOE
 WQCOWq6F1GjTSuBrgTgDajEhWRMlJ3eCEgQlQjwtjkYKl0Q2iMMW3WW6NZ5vGiDyDM5xnl/3/
 FvLVzWI5+5YRN4TfLiNkYwkFOeuaH5+yjio1KUV5YaLohAAkohiNdPsN72676nmAtzuxjvLNW
 +e8aL+/6SLjRniMuZTiVEtp4F+TwiDp3zUpHvykz/qlbuT7BUWVWZIvmtoLpnJrcS+49fBCuL
 pfKJ/bjXSieAozrGp1aUiEIsSd8eKNykU2YQnr08WWqQ+yU3VYY7jHSKdo08REfN4m48s+fPi
 HEYRBt+61TWvg+g8QV5SvPg1XE+7Wtjmi7tZRFB9iK9mtb9acRC+T6nPEEbtwhx65VJb3KcmB
 RF9N/L+K0hRrAEUcN47UeadJePae73CWZIhuXQQ5FpO9MJSGygOsG72wcYW6UGtKsZBwcmiDE
 6853uEtJ9aTXOYPTaD/yZmSZs6lPo9AtO8y865CTK97kG1OTqEJvGTcrkGdZXaTMxK8N3CNip
 T+LZQlWrJLaXR1LhUSLBj/xGAOUqyLAJIBmkMq5ZF1JptG43KdJxgCAoqqdAf2UTNVMcyPFFt
 Ylf7LpMKqLRNcGTqRy+1EpIR/R06gK/b+we7IAau98kqEIZ+pBtWwWlbNAS+QqZ1V7jbQXsbT
 CYQZ/og+0vaoSOanx5VqrLUmsRo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1695098551; x=1695703351; i=dalang@gmx.at;
 bh=5QLGmuzGMY5B30BYEoChqLKONlVoicjKUj23nWIsF8E=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Ceh5Sfx5CWYZliu2QW1Y13ulvEYTQEb+tqkFl3fMlDAypZIsyn0fm6NwRH5mce+P9caAzV17rmu
 1o7HtqQkaSslPefmLeCr22eIcL3BUyEYK6G9gbxbrYiU5JtjxVIH2aJf2xqdKE7hZBRtIHRsHL7/Z
 diIcf7iloi4aqiK4L2jcEUXfGbzqGp0gkg32mSgbmMwpEX2VSc62iCEGanFklFSXaB4P7S6GFkzh3
 uksfaro/MsGuSqZ33+tlqg+Jusix0NDiaylQfdO0qLEYRwHGKYiyBhz4KCYUfyuaheAYu5vsfIkDU
 iK+/yGRUzA/bxAb8Fz2l3bDrI9G5uvOot5tA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=Ceh5Sfx5
Subject: Re: [Buildroot] [PATCH 1/1] package/at-spi2-core: propagate dynamic
 library dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Simon Dawson <spdawson@gmail.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 16.09.23 17:49, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of at-spi2-core to
> version 2.48.0 in commit d1757fdfb0010d29f20cd68cb6e16f019e236424:
>
> Makefile:576: *** dbus is in the dependency chain of at-spi2-core that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Thanks for looking into this.
I'm not sure adding this dependency is the best approach,
as it would require propagating it to everything that uses libgtk3,
which you didn't do, if I understand this patch correctly.

I would like to propose another solution, that would fix the problem:
Some weeks ago I send in a patch [0] to at-spi2-core that makes it possible
to deselect the runtime module needed by GTK2. This module is always compiled
as library and seems to be the only thing that would force "depends on !BR2_STATIC_LIBS".

So my proposal would be to only add the "depends..." if LIBGTK2 is selected and
use the patch to exclude the runtime module. With this we only need to propagate
it to LIBGTK2.

Version 2.50 was released in the mean time, which contains the mentioned patch.
For stable branches the patch is needed.

>
> Fixes:
>  - http://autobuild.buildroot.org/results/511a682abd233ba90543044fd9102dc08c762f78
>

Please add, if okay with Bernd, see [1]:

Reported-by: Bernd Kuhls <bernd@kuhls.net>

Regards
Daniel

[0]: https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/520a7b16b0093a965542a3880b2e3b276fbe06d8
[1]: http://lists.busybox.net/pipermail/buildroot/2023-June/669401.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
