Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB52D132B3
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 11:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0F5C606F2;
	Mon,  4 Nov 2024 11:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ilr_xWfYrGOr; Mon,  4 Nov 2024 11:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF0C606FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF0C606FA;
	Mon,  4 Nov 2024 11:30:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69D75723
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 11:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49A0A4023C
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 11:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATEM0OYHhAxH for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 11:30:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.133;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5EC0140258
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EC0140258
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EC0140258
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 11:30:49 +0000 (UTC)
Received: from [192.168.0.66] ([88.171.60.104]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N49xZ-1tq5rP3MVV-00sakB; Mon, 04 Nov 2024 12:30:26 +0100
Message-ID: <3e85727b-a279-4be9-88db-16ca10931553@green-communications.fr>
Date: Mon, 4 Nov 2024 12:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cherniaev Andrei <dungeonlords789@naver.com>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20241104074539.2369910-1-dungeonlords789@naver.com>
Content-Language: en-US
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Autocrypt: addr=Nicolas.Cavallari@green-communications.fr; keydata=
 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
In-Reply-To: <20241104074539.2369910-1-dungeonlords789@naver.com>
X-Provags-ID: V03:K1:CECdJ0T+v2qaBZCCHglFo9+c0ZUudrUpkA8TGXj3D6BfrUx99A0
 g2n1919szX1HqkMzE/7YUVw96gHahSLso/M1WgNMkLYxN0x/hj5gPNJR7m+kfl0akCU9eKR
 bo7V1lNRokl14xs1mAehqJDoO/dKGwR1cFW7WpCtFY6TASuVTn52sTmtmAJupwu/6Nlq82g
 Bbhwm4Ie3zo50VKcQvj+w==
UI-OutboundReport: notjunk:1;M01:P0:SsJAhHscPmU=;C57Sx60WBYmbXoILya5dSq0eIM0
 coNFnZAYtPzOrht+PlJpo1ahaplZ+4c/PiCSLrqHsF750+URZTp6VRJtlmcszk2JZ5db3fzRs
 TeGeipvL9W+yusFIM2cTtcY0YiNo8+h9rliIN/ZFReN+b3RevSIQiz4Ko+5XqP2TbXAgOVCkP
 ACdT1EAoc/y1a8OtQr/leX2FSZQWvPW/G39mNS5sXiixJlQuVG5QcuolkARCye0xqF3I9t7Ey
 ctY4U8dwE+XIErnhXmYiUa95Y77iSRTTKt5s6yZESYIu2i+Eiyelt7TywVtGnVZW01/3LE4wx
 aWLeZrYadhFf32L7Xs5fR+MVie2JHfB0NiW6cZW0CegCTZn2a3pTZTzanSNo9TnxCg0Pl9G2F
 BWVattM+0W7CE/4P3E2mcnbIv5vxm158jspgAKmpm9hReNcXNYtxoa3YzHdKMsP+pYLxYY4SK
 r33UJN7Ar8HYOeQGl/41Fmpz3o6JgjvwJf/GBg0TfVpa2L8Lq3FKc2lpIMQzy1yMl/K6+WOsv
 rtsCKybCiwiBLhtV2GLOB1U9KP7n3RxWUy+Jet8iuRLk+airM1KISOYtfL9bSnuARdyih2PG1
 2RLIxWMj11nOREqoVAFEsNQFM0sfJ8OkueKSrH1NQDiusHe/x8N/Nn2L+d2rtxVflqCGh3jIO
 fcd2Ugi7fMW+RgQY1q7T0HhpPJVUrZEAhQZAfb7hDuOslt99xjrPNkjytVf2HxWADTjPjxvHi
 efJfe/VxLxymO9V3Hrmg3ZYEDc+BN6XdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: use --clearcache
 instead of rm -rf
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/11/2024 08:45, Cherniaev Andrei wrote:
> I encountered a situation where build/ is not empty folder so when all files in build/ was removed by buildroot I was not able to use meson, example https://gitlab.com/buildroot.org/buildroot/-/issues/64

This is not really the correct fix.

meson needs a non-existing directory for the outputs. Buildroot assumes that 
"build/" does not exist and use it for builds. The problem with openh264 is that 
"build/" already exists in the source and contains various build system files.

The correct fix would be to not use "build/" for openh264 outputs. Either change 
it globally to a more unique name like "buildroot-build/" or add an option to 
configure it per-package.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
