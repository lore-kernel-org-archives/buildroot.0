Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058CEC7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 17:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5394760F03;
	Sun, 11 Jun 2023 17:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5394760F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hyNkjgb81Wkn; Sun, 11 Jun 2023 17:22:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DA5860E34;
	Sun, 11 Jun 2023 17:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DA5860E34
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FDE81BF27E
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 17:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79A2C4029F
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 17:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79A2C4029F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZUEBs_l8P-y for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 17:21:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C8D640131
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C8D640131
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 17:21:58 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.109.39])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8OlGqAc3BgE4H8OlGqvzcA; Sun, 11 Jun 2023 19:21:55 +0200
Message-ID: <bcb20fef-472e-c905-c366-8d88e6a265c9@benettiengineering.com>
Date: Sun, 11 Jun 2023 19:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230312160909.921651-1-giulio.benetti@benettiengineering.com>
 <20230312190334.03a06df7@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230312190334.03a06df7@windsurf>
X-CMAE-Envelope: MS4xfCa3d3iHV1lE966F5OoovIVTGf/JC3gWQRBjyvGrQmz2iPGE/JCVkbLLkvJHmuJSyKb1/s2A7DuRwsBPnbyZhD1t6BJfjYWsWKSBnZMyrZDZCP0csAg3
 1MoNQyxtxhIQ5MUvdx6m7Jg5ddjv2dbSlCv2orusKQ/abS5GrKo5A5f7i80iZm6wAvUZwssdaKvFaQP8irpjGahTPPhzSvsQc5Q+lVisLZ63KQtS7ovu1GHX
 InpiltjZscYu8Vx3EafUkZuMIViUZL52D/cL+KYurisLZg668uoIoVXEutKSVIiZwyxtt5uREvyWu2mxyxPxFA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1686504115; bh=xrXNfvTkkAQ9Pvj8+u54y4pSnluyl+h6pXouaIXDJVI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=LnGreXc0OoWTrmrdajudz9V6Eb12UVOh5zEtQZiN64pi/TlFy4oFttwlJw1/eUyfD
 TmMsUc4DoCSg0a9qDlhPI75uVnKlECFbg8aOdfqbrgolqdrRWdg/rOAYV2lSrb/IEL
 wih6LSO3EydW6ufEFWWmyktVicSgMCb3WrQykb0qaasEJ2/+FOesCy6b6uK7rTlj25
 T0M3GgMN93Qpl8rSWsFB9M4qZEQ7/SBCireFr2M6crmAkJ5xK18LReLxUQwiXi7ub+
 KBioZXev1oy1Ur1njCv4Aswy+uG4nS0tvX+7CRGMQgxTqFRckZfzei5ZlIKvDt77wZ
 IwQVoHxwWhxQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=LnGreXc0
Subject: Re: [Buildroot] [PATH for-next] package/rtl8192eu: bump to version
 2023-03-12 on branch 5.11.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, All,

On 12/03/23 19:03, Thomas Petazzoni via buildroot wrote:
> On Sun, 12 Mar 2023 17:09:09 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Drop local patch that has been upstreamed.

Now this patch:
Fixes:
http://autobuild.buildroot.net/results/12962f0f6cb5b20547b00fcfc3882a0c6e50dd32/

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   ...02-Fix-conflicting-get_ra-on-PowerPC.patch | 124 ------------------
>>   package/rtl8192eu/rtl8192eu.hash              |   2 +-
>>   package/rtl8192eu/rtl8192eu.mk                |   2 +-
>>   3 files changed, 2 insertions(+), 126 deletions(-)
>>   delete mode 100644 package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch
> 
> In fact, I will not apply. I will wait for next to be merged back into
> master for this, as there is a conflict.
> 
> Thanks!
> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
