Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4F6CA1016
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 07:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22CF2844DD;
	Thu, 11 Sep 2025 07:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4kMdaQc7VnJ; Thu, 11 Sep 2025 07:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 862138440C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 862138440C;
	Thu, 11 Sep 2025 07:32:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60DCD234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 07:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52E4240911
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 07:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IfvUHkAPh36q for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 07:32:31 +0000 (UTC)
X-Greylist: delayed 306 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 11 Sep 2025 07:32:30 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E780408C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E780408C6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.73;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E780408C6
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 07:32:30 +0000 (UTC)
Received: from [192.168.0.66] ([88.171.60.104]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1My3Mv-1uDHaH19qh-016j1h; Thu, 11 Sep 2025 09:27:22 +0200
Message-ID: <5d9e384c-27d1-4e2d-9976-04570b37b793@green-communications.fr>
Date: Thu, 11 Sep 2025 09:27:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-22-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Autocrypt: addr=Nicolas.Cavallari@green-communications.fr; keydata=
 xsFNBFKGRC0BEAC+nMoqcTXudlSZXH9EwSbOQuiIXTAxeVSX7WXxUvH5gqBamTSgBN+G7rvD
 UtTCSAbKkTG01rBZbbhwRl2vM0oi8Hg5sOvJ6OskKzIU4MWMzi0qNaKk2RPSE2wI7xo4N/M4
 aiJcmqhmzwLrr4FvuvTNDC+mX43/uFFQeWs4DiIRhwthO7WQmzvmmpwZIGBQxgfaveEZgzVR
 HMVVMTS1tlJntMgeb1JgYWMDUbZTRbigegrM08hrG5deK08uD9djGI9Mdu9WR1S4PCVXMVqI
 WROX4AQTCl9pgQEtnxnYeB4VvA9iInYpsg9gSR6QhZxluK0A4OFQF2HfqIwT0Z4K4xFl+9v/
 EcZRK3d5Lry9GEinFCf2H6tRDFRxxK3m3/D2UAR601Y/buIK0sCMNwcpc5yYHmBSyAxM2j2s
 29gEnhDMQbLn93cHSERaRk3lExJM7vtTxBMSPm+7DrOmIF358IHQXqrY1xYl4eBG+R2aGS30
 pH5cGycCL+VxWg8K9pSF5w4XT+XvRsaAmkvQ1GApkTjOhjDDXzWxX5w1DMKW8io3GM28lf8z
 mE156/FOlG6SQBHZZjJ22+5TiZRKO5HK+bJav8L/NeqavmZ9evNLVpr1BYiG1Ph769laSpbi
 Zt3Dar8hc+IQvR9ig7tWPbSmha95gMJP35Kwy45M+u97hAZOBwARAQABzUROaWNvbGFzIENh
 dmFsbGFyaSAobWFpbCkgPG5pY29sYXMuY2F2YWxsYXJpQGdyZWVuLWNvbW11bmljYXRpb25z
 LmZyPsLBlQQTAQgAPwIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQTEcT9CxhYiex4F
 Htv4pX245AdyAgUCZvF3TwUJHdE0ogAKCRD4pX245AdyAlq5D/9+BfuYe3tXms6xJyxBe7PJ
 guDeQL5p5a/kTT3cwesRt61sA8t+iRAVuEH5kBREAPbcX7iXMtqQ5OXfWSD6pk5uBSi/vnj6
 kAlbReP9qYBq70XecEccqXP/N4MBsV8nulmyWyx37ARkqOgRPPgyCQkijpV8oHA+SMxHDyYi
 WGoOY5HdztaLCU5rpTe4+izjmLcyzPiAfNowv9DSVwU8TRsqIRoxzm4sxkU1Pe3AN0OuTiH7
 aIjirRpaXbD56YtF9ExPEoEpUvAWkWCcnCstTovqh0LasALc7l3prG+88n0nKf2yRh5rfBhm
 tQHGBiZiLholIiv4PJi9K4hM8nvzSjJnBhQwLQsedzjeXse7h0vSZGNYB9mJN1fuYOOZI7Go
 PdHddyuARe/zezU5h+tz7l6glaHpOztiHPaCgWldRpH/JqIrvDVZjBj9u719+N7J21K5BFDA
 h0PSoEjMuQU8pQJmjTuzJZzYv6Nyp/a+p6I4i4UWRNpM+B8wVl8G0HcHur7SO5MOG+YBtz3N
 MqZUZjTjoeLCJM4A48EvUiTI6igyN6KcAINjbO1eLgaBEJO9j5CLNS/n6krHxd97rRC0KB4L
 ZVghxYw9xcBNOwkLW6LmIDwuTzB8J+X3K5IKRPIPffNLHLh340A5U1Oj5jilvoaCO8rn7RVU
 /FlfmP6l6WH1T87BTQRShkQtARAAsdhjcnSDMT+Y0m9MnQ13dAe8TLW/79f7SjDN0V5L/oxM
 EhlTX9/1Qc9iTUv6ZCVwo9xK6EPvB7jXEHdwyW2Lc5PNgAYPIhIPpPemC1+HuZDQxjpHAELD
 8uMann0Jgogl9lyYPGDkWa9L0Aurd9AuCeMBX8MIiBMxKhwHrhnpU2T/DaPBwP0EcKrXd/Gr
 TNcS/C55odNsqBQ4/vYdJAVz25byMlppMAxEendO2oiUump3oyvpk9BmHBWTIGyA2xsIQKu/
 +sm12m16FqH8ppMw27te1dlMTaa+akmi59l/XFPgdARQ3UNXbNLm+pf86POtVdGhVrX8KfDJ
 r2H17IpS7jC++pp4TAagfEeaqtD5erHrRHg8UqxDYnRxB8gJbqTgFQu1MxHYyNodeDw1oJG6
 wGd0XEVswCPr1Fmeht/QRNJ1wZzB6i8/oo5X/TgYJiMGFYTPz5t6aWFp7yJZHBzLuE1JcMlN
 bcdFn60QSGI5R9RgCqcHXtxxvUXjYLIuelQl+OdPmV49Wjzknu0l9Uw3CmRGlG6vQKlWOsUz
 z32o3x+zPkLw+ciz6tNEQ6s45MUmGl2Fr+OOaYD4jc8PlRTvqj0IwVnXwCIQ28sh4FbJwsoU
 xrcINmEmYCpSIZEKR2Y7YnlVmW4fb3b3xez3pjb/jDBNDt5Dw4IFwcqT8zpIkXcAEQEAAcLB
 fAQYAQgAJgIbDBYhBMRxP0LGFiJ7HgUe2/ilfbjkB3ICBQJm8Xc4BQkd0TSLAAoJEPilfbjk
 B3ICue8P/0mjR9Hyx2MPhyNhRRsCeFpqZMUSPeBh7o8+2MShWIHLt1XurDJod4oJqIEoFZYQ
 9zzGD23up5oS84WQCb5G0EXy7tdpLLKImrKqa8xt1sLj0popUCH+A2w7B/kAOyU4HbNE2ZBx
 jX3ir1ecFIqskaOegl4ulv7As1hCvp1JxbCehgAnKphHV6yast16lhfvwt3TKUA0WmtzrA5F
 mqnIxNSQY5gWxIfGmXXceQelZ6MhZm/SYFQyDrBh+XmIhNrg3r4/rKaLSeDbeJks2Dd7ArnD
 T5n4gq87tOHQBS15Riw7uqfkUPuzkGrf6wI/L1SitHgqFkQ1fXq+fU6OwckaTvgVe82+s5oL
 xnMEywFi1zReL/r50afTnz0YWNGJ+svUGeu8/sl7Zgh++NDHpTQCqe0Xu6Q+6H9SRiSmyS1G
 sZhjWwFjk6s/RjmPhZcJ0LCYSKRSYXMgg8Pm6Z/woLFWQRt/4wc3ZvzI2zTgBgEyeu+o86cZ
 KTFSx1sD0GSkFa+SRcOMdr5L/qQ8vuFeV7LYOUFw1LIPEToJtv+K6RdTQ7avzLBWZOrmqE2r
 RppToNOj/ihnpeDsnAmdJG3/8TInGXPgWP8cEJ892///fl4Ejm1KePuro3M0qENUtY5Z6LSt
 XMjIkcCihY9vSksnm5C7d6wGxy2/Mju8s0J1tRaXkjbj
In-Reply-To: <20250910213241.1529448-22-thomas.petazzoni@bootlin.com>
X-Provags-ID: V03:K1:WohtRwvzhT7UTtiufmg9C1T8DG2CNs8Lxynip6vsGOm0orBAMLi
 51MnRrY06kQlD8K0CHZ7vSc661OEC2ITWTZ9ZdeRSO/9j4hXK5wZ9ndfI178JkeHArzQDDU
 xons+mVShjQdyfyQt9slQQ7PmTVqF3eQIYdS/8d7nk3sCZ1p5Di01zgbMeQwR++Qz4qbGFl
 JmYYFbIirlbIddzPun28A==
UI-OutboundReport: notjunk:1;M01:P0:HSAHcrRp7lw=;MuOAdIb5XZLUFvF4GseT+lWaKcZ
 Wcrc3oNSSvcpv87TtdKxhgCLVzDi+bwWnxUZYFeM9/dyyKceN/6T7EaE6g5w+cr8XNm74KjbS
 nq77637E+yPcOQNFLfOSOX1rzuw8t+9NT5n2GbFDGOCc1HIFtpA0cswdaCWXBayN4eaQ8UIFE
 yts5xeIpsRB04syhKlrkuKVS84aKu5zzRY6gVHf07OnEDGMn2dFDjauMVYpoZcytkx/kFNIu2
 VaM3B0Sdkc8fRCNI0aPxUpEebxBSLPDmMb3Gfncu1skYAmd6sBHI3GmJWnVAnG3ykvwnpw0BD
 s7320Q4NkisEgl6GLI7BBqOE7+Nsv4Zxpw98GsbkIq04gZtHif3lbjfGVxsaBwsZ0PVC4WbVf
 dYxEeCMymZv4mbfRzInFy6I1ZeOjJE8n4JYPIARd4qdM1EGTCXnFT08qZkoQyO4BzXqK5Jk6t
 zRZpQ3uQM9CyHwtderLUxSxg5DiTG7s7BuAVYcFzSX+ZDBPppAca8SoAnYHul6z1D4Wlma6lE
 weZCYvz8CzPVPC/zNM4ZY0e2AAmdhk7hxwog5q7PfKDOEuM1DSH28K7yV6PpK0dROgjTySx1k
 mwZlreuifYp8NE2sRCGhWXBACBJd4tNKZ0RfQSEO3eviyEinrtrlZrgd0+HwNTIZu1cMlRka8
 x5pw8TE+X1gnwtHhooXWPF17eseza1amH5WXHrMqIbmTqW09+oVUGngvpwhcusor2d3JJvS+j
 FbdcWdVsQdEgJ3c/uyhQJKjhRnrPyu5ftYzLhCPb0b1jtmR5PhTGjdx1oQYtKcoECOaPCj0ed
 l3Zj3XOLC7ydbRlF8ZKj+E8KGiInAAVk66WJx+5bZ6FMcTj3eAazPeePmJXhYTW+2Euc2V+a9
 c4NHkyxQP08IMnU1b1WpRmbaqg4xeLok03+322fkVtpURZRZaWm1FAKTsUbxaCfrzB4L4ukIn
 yWVjgokn/2OeVs8oUrKLQ3VwOafgzkVFkjnuVClcgba6aGNJQ/fQloXJAB0DZ/knOq9nEXbyQ
 fxwLrisPpTHa7Pkoq6j63YsQMgj86flgFQyRdlX7r2PFXF+gE4Ob0qgCFHF85Jyq07vF+7/A3
 QGsjuvP7UEth0zn0Jw045BoRSk1Rrxq9bEQqozk06wBQV6amdrlYK8Df0cuISNkIrlIUYapTm
 VbY4Z3ssl0E9cVuwGmgdnU6UyY+a7bCNam0QcgvsAO0mScYQ59SSO4ETmFavagK+PlOkX+YUk
 5F5UNyXOKDX1bN5uT2563MfFg78lkdIWEFTFpN9/jJh/YsF4xtlUtm37pHsDJeruWPaQAl1VK
 lapMXQHCwqrhF+1WJthC4mlK2oCvYRQP2ybyKCj6bZQA+RW1oFzGVcEVQMXHAySJtlOG3QKWZ
 Ob9U3dBLnYeXK3Xz45Haud+CDd1TUd/9kdoSOdZ3Vf7j9R63kP5nIZIk7ZLGroYMg84t8D5BO
 aoXpbJHmDmZ8jSp59RWJBgbI4MvfILoxvTd7OUJYF84BV0M0smQVGQ70rqNSx4b75KUQHgfkr
 JsPYw88uZjiMCsL46TYFomoHMjJ7zBQqVCDXPUVmEzj2T5U24JK/JzHjjFJrW+8hC4DuaoBDN
 aev1NHU4ZnV5sF1f68ip0dp7TsXEJIvw/nic4v5xxcsWRHi8VEGOnqq1tcd3n6/8wjEfjSbjb
 i0NZtzXCiLrzvZwEBLJo9jfu2dxdkL1ZvDSqan+zEY1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: Re: [Buildroot] [PATCH 21/23] package/xscreensaver: remove package
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

On 10/09/2025 23:32, Thomas Petazzoni via buildroot wrote:
> As we're about to remove libgtk2, we must remove xscreensaver as it
> depends on libgtk2.

The latest version (6.12) on https://www.jwz.org/xscreensaver/ depends on gtk3. 
I noticed it because the version I have on Debian (6.09) already depends on gtk3.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
