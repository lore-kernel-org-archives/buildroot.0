Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D61C19F29
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 14:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF55F402D1;
	Wed,  3 Aug 2022 14:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF55F402D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NnmHOzojCflQ; Wed,  3 Aug 2022 14:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5871402E3;
	Wed,  3 Aug 2022 14:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5871402E3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00FCA1BF2A1
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 14:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD5B1813EB
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 14:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD5B1813EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id irqpGDnh10jE for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 14:55:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A81D7813DE
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A81D7813DE
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 14:55:46 +0000 (UTC)
Received: from [192.168.0.243] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MT7ip-1nrZbs1b3f-00UdSc; Wed, 03 Aug 2022 16:55:43 +0200
Message-ID: <6cb50305-a57f-e69b-72cb-b7b950cdfbee@green-communications.fr>
Date: Wed, 3 Aug 2022 16:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>, buildroot@busybox.net
References: <20220803093754.19637-1-guillaume.bressaix@gmail.com>
Content-Language: en-US, fr
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <20220803093754.19637-1-guillaume.bressaix@gmail.com>
X-Provags-ID: V03:K1:KD5CkEwJ6NMlc18Tjr9ezw+j/T2w357ZLsJRnXN5PmrXi6ZM0fV
 CdkfqscuPXpjcUfdu28kyiKtLMobdd94XLafkX9jfkO9K9V3kAktZyYWd+RAlpQ3eNH3Nyj
 P+umr6UKOOFdK0YMepn5oj/xNYdBQOL7JXgUaZqBJ8asLAev0+wLz9z4Ak6vKNzU9Z4MEu8
 OuLiE4wrnpYjG/dBnkrCw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cpYlNgEu1l4=:/CCQuiKZYrxg2z7lRuAC5k
 Nfntoft3CtCs+Zd2YxW16MXLjxsq1OEzOXElJLkRUFQmhRO5L3vt0w5jwD+BsKVW3I0ran6ZY
 MkkYIYQQux2rwHc9Uegny4Gv6XRqUzFsK7qQQjnTBat2OIliiUQyyMbc6y0He2Z1Imr0s/YCs
 2FaneNE8ZM/dl/TUbgSA/aWKzdjHZa3WCMBlRXZmH6dztiCBOU1clh8q5awM6MP0vkjwyt3aR
 mFL0v64GYWhMhyFP8ltq0uvzoCIolfLPVWcw9S9XqMJShoMY6v+sFkkGnyGFHRZn0kDNqTv2N
 1PpdXL4KoenPnqj7szt9fawRu53W6Lk2PW+B16WTLadK0bVTgV3VhXBHb+mQG7WiLlAziTOJF
 Yogic5Y/nWo1LNULdeOQ6d/oefYXPmeKpDtsEU4t1X8oycLYnmg7xdtfpxI8Ct1doVaGo/V9m
 LyMsnK1lsa6DQeBBRElpvEZA29oQxbaL+YzB10zlNGxPASxTF7QWME9o3kyyz0zJk7KNfsWXH
 SSkUYq0S/A+PheiIxbgO9l53dpIImQ1ckNHDmubWrkZfDJVrVRO0NP37YRaWdhxo8GGBLzodb
 oLUxjJVetKImNrhAoGh3bvdn9nKVPQg/2bmcqFnHCfUfIw6mM204QWC6Ro4GKFBseU4KFh9Rs
 2M2Ajlh8TjbIo7mdZLrjTBYHQBjPxiRjFTa9qwkQdFLPwizTVNqzlv4uJGh8iVsqj7ndLxNVe
 TqY7HUraP0lXcIvavEA9Xb/LtSfizNblbZnAnrc9YnGp9TLkAQ31nZ1vbQ54kyI5aawdxyRad
 vjQ6L4J
Subject: Re: [Buildroot] [RFC 1/1] package/python-scipy: bump version to
 1.9.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/08/2022 11:37, Guillaume W. Bres wrote:
> Scipy is moving to a Meson build infrastructure.
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
> I'm expecting meson to simplify things a lot for us.
> But we're not there yet..
> 
> I'm referring to this page, which is the only one available at the moment,
> on how to build the package with the new infra
> 
> https://scipy.github.io/devdocs/dev/contributor/meson.html
> 
> My current setup has pretty much everything figured out, but meson
> does not locate the fortran cross-compiler. Could anyone help me?
> 
> output/build/python-scipy-v1.9.0/meson.build:41:0: ERROR: 'fortran' compiler binary not defined in cross or native file
 >
> [...]
> 
> With my current setup, I am able to
> - fetch the git submoule like in the 1st tutorial
> - initiate the meson configure step
> - meson figures out pretty much everything correctly (gcc, etc..)
> - meson fails to locate "fortran" the gfortran cross-compiler.
> I have tried PYTHON_SCIPY_NINJA_ENV and PYTHON_SCIPY_CONF_ENV,
> but none of these have any effect.

The correct solution would probably be to add proper fortran support to
support/misc/cross-compilation.conf.in and package/pkg-meson.mk.

Alternatively, peeking at the meson source code (mesonbuild/env*.py), 
the environment variable is probably called FC.

Try:

PYTHON_SCIPY_CONF_ENV += FC=$(TARGET_FC)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
