Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D16AC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 07:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 110D360E35;
	Thu,  9 Jun 2022 07:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JnXiRE7di5Bb; Thu,  9 Jun 2022 07:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 426D9605E0;
	Thu,  9 Jun 2022 07:43:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A816B1BF2B7
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 07:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96DC1605E0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 07:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yras5faHwkJG for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 07:43:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64155600D4
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 07:43:50 +0000 (UTC)
Received: from [192.168.0.66] ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2m7Q-1nc0Za35zg-0132ig; Thu, 09 Jun 2022 09:43:46 +0200
Message-ID: <7d84a5b2-6c37-a1c6-4956-f4ced28aa284@green-communications.fr>
Date: Thu, 9 Jun 2022 09:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220608120028.2768210-1-angelo@amarulasolutions.com>
 <20220608120028.2768210-2-angelo@amarulasolutions.com>
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
In-Reply-To: <20220608120028.2768210-2-angelo@amarulasolutions.com>
X-Provags-ID: V03:K1:79azXcXQZ+zfaLd3qxShmI3CCIZIzBZNeCzlzzbSvigM7SEpp/g
 c2qA8qkyiFdUKxUz9PTwq637KurxY4LThaMOthZXaBnVhwEww77Hy7LXhKfyrh3Sss09va1
 cwaBEQgg5Y24PE2DtUH9OKPHrYY5s+vgp5CU7Q3yezen7wU6vSt8Fu8IfT8hVRYU3Qi8Mng
 OXb4A5/G2QoOqabo+YR5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NOYnDn0IXh4=:HNkfas9BWzKENDVfxRIuUu
 qbAdaM51XdYq+lmghP8uEaEhOdmmUi6krJbIZBimh7yq+B5XtR81RlQ79gfazJTptrcBkHUqE
 G4wfqsCF30DiV2TQjm0HUV+oZJhc5F06U9dQ57ZAwhNzk8cdbRtHhrVK0YnULcsx/ALeC0Dho
 4JuWaFaW7NukpEbxGJeVecXMvHtM6sJxuAlC8DBrkttMWwmOZeNlYbwPvYSuuHXNMsC81rAfY
 1nRGTwcruEKCcmBgA1wOE3wSvlgOcDU0fD87XlnlpF22iMlG1jlHtdDchLkg1qx07W98+mk5x
 5zvlUA6WGjocoidhFyMG29dvMliCjlvho0imsfPK8RFUTW6jIkmAxrB3U8yyvAzxLnfA5m7XD
 V4t7PFx4rZENbmY+vEzt+2BQo7/VG+4OHq3WRZdMslqAMksn5KacC7IcuNOOQ2gPRxqNXun28
 I4/YwCdfsqvfTjf0fg3GlyMYk8BracqbLQ0PBQzjup7yL8nAOdfFbIdLRhfbAR5BhmTc3LzWZ
 SLIaO3WFuo4bwBL748ezhgT5Rv98U/hzp61FeJlzBF6wBD7H0g9Qg4Ye4aABrJo/TwXaSbuom
 IfcIUYcBP+Ug0v7eClle1x5uJpU24BNvcOeY/jFJ31TOaBUZHGl6VgRl3wpvdyWPvTgoHtf/B
 TlI2Wguws783qlRGRO4bj/m2EfGuvZ37pfcWk4LpSDL9VONUa/JXx554KZOCT46kp1dS5b0Mz
 i403v8FLp+Fspuh9nDj25/w54MALt9apyRVmC1KObUFNLx8dyJ2yUJsA+rQXV7XP4AB4JnK1q
 fxvnhX9
Subject: Re: [Buildroot] [PATCH v3 2/3] package/wpa_supplicant: adding
 ifupdown support
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
Cc: jagan@amarulasolutions.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/06/2022 14:00, Angelo Compagnucci wrote:
> Actually, configuring a wifi interface as per "interfaces" man:
> 
> auto wlan0
> iface wlan0 inet dhcp
> wpa-conf /etc/wpa_supplicant.conf
> 
> doesn't work on buildroot because the line wpa-conf is ignored due to
> the lack of a proper ifupdown script to handle the wpa_supplicant
> initialization.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Reviewed-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
