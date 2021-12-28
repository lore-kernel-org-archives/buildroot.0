Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27C7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80CA14067C;
	Tue, 28 Dec 2021 21:27:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MdBZ6jEiHTPv; Tue, 28 Dec 2021 21:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD17A4035D;
	Tue, 28 Dec 2021 21:27:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C25651BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B108660B2E
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dou8JdQ9bO2M for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:27:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A154660B1D
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:27:35 +0000 (UTC)
Received: from [192.168.0.175] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M2Nm2-1n0ge23SRi-003wmg; Tue, 28 Dec 2021 22:27:32 +0100
Message-ID: <3e2a86be-e5d5-a4e4-1be8-e263c20b0a5f@green-communications.fr>
Date: Tue, 28 Dec 2021 22:26:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: fr
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Markus Mayer <mmayer@broadcom.com>
References: <20210928195533.1736944-1-mmayer@broadcom.com>
 <20210928195533.1736944-2-mmayer@broadcom.com>
 <20211228221804.6b965558@windsurf>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <20211228221804.6b965558@windsurf>
X-Provags-ID: V03:K1:k/h1NBsDqki5g6BAtiMVpWpKN0/7uhfCTBqTY/+aIVNnOSk03qd
 bmGQVkYcq76f9Yn8WH4LtSIVZv7lIUw2r+VtYRlx8Locjxm9h5BjdkAsm+ohGyko+WHiJ68
 qi6IiF5GLJsMnCdEXbzpW4+EsxX2zRza8kpCJaRdRaHUKA8oQ2GTl/Q1Fth01GBn349qohm
 z6QcGrpNYD+6nf5HksHPQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FYVqJR1UaEk=:PRqRJHeERGfEyemE/NcmwS
 qaARn6vGmAPaxdMsRge3qRklk/wfefMMBfSoqecNaH0tUanLPEJiJ4zLd5ieMsP85bW0/dNpA
 f6wDSrMKlznYHINzvYTK3nb0C3HaXX5EJA83ARDPAqIigp9zGm0ZjJ+PjJ7XaPJukaJ2CfhyR
 C/UHE+tIxpQ/5ceICDonmjw6S05H5vA6d6Qs3VA5Ygb8O0/cR1gCxHno5184AxwkAGslJDF9/
 5+Z0g+X9qexKlZErho8URADpKAYBprVaLW7PZVMlAYO1NVDTVliMLE7wLMXkd0NbTh+/rH7t7
 vhWzszZjOtkMAjhuj/6DIJkygeQYnCJQVZNTl4qIgN+L0ZgPoz8Jp9sdNasUMRUQfD6czPoo4
 F+Yg65P8YYrIcsiurK2uyJH+UK7oj2GGK68c7iSSx6YWg+u+jKZ4dtWPZhmm5xtdC3bDPNgKE
 yHDDyy3E6NCTNg+STQaibHNbcN3PDJ6CSx7/I6CGJts6Pe9G1KIaK1GqI58MC9rMSzsLcYNAS
 TY3sTEWFdRBagfG2+tiRs5aP4F5NPtQJ9D9DTWNQj9RfWAVISSrlQgrIuJ/3BS3HEhaDwDJwu
 kHhCloGpAVzTG8bn1Gwi5BldEObzQ1uMLPWcN3i0UfrkB8LRULX1wA5XfL5YoT+unVd2gWSjQ
 e3AhByTXK9SXDXhu0XFi8TzH8VTMcPU5pMsgVjre6V7CAMlSvwSfMPff5mg3MjtR+JvYV5kim
 3sxBt4RAosgbU3GaAumj2hLXDhtzjPHSKDtpXm28FYmn1HTxP2uV1uBZ5P5xaLc7uh6N9otFG
 tnMkWhc
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: set HOST*_NOCCACHE variables
 only if unset
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
Cc: Markus Mayer via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/12/2021 22:18, Thomas Petazzoni wrote:
> On Tue, 28 Sep 2021 12:55:33 -0700
> Markus Mayer via buildroot <buildroot@buildroot.org> wrote:
> 
>> Set HOSTCC_NOCCACHE and HOSTCXX_NOCCACHE only if they are not set. This
>> allows recursive calls to "make" to work as intended in the presence of
>> ccache.
>>
>> Without guarding these variables, a recursive invocation of make would
>> re-define
> 
> What is the use-case for a recursive invocation of make, reparsing the
> Buildroot Makefile?

The cover text mentions it: calling make legal-info inside a post-build 
script (or package, actually) to somehow include the result in the image.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
