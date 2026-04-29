Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93975FF887E
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 22:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 504C283E50;
	Wed, 29 Apr 2026 22:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTpRIqQ8gfvR; Wed, 29 Apr 2026 22:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9069A84372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777501919;
	bh=H8iNnlU8vjpseh4S6Eaf87kwzzK6QaQuzVHki5T7dq0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=P3Hua06hfcY15qIRbg5aedM8AJDWSg/JefBN/cyGP84fvRAYqFy9qOFFn6Xc3qmiH
	 Lmdad+7ipQAFBmI0rIm/eN1hVdKVHgOXsfmwK1FiQ/h3smgNEfZ6hUjLWxEZo9yTnX
	 40CFnf59cfF8qhRs12iBn/Msw1AsTEWV4oVJH75ZVVtFiyAC13nrfTQElUCqHY3Kis
	 zpYC/dako8S+elZT70ZW1lxphonuASww4PIYNV5L1rEurwix6zSlNqSPqJVi6Hmrws
	 0R9jATVqjnrDbdVXkmW8k2t78s18irM1Q/b2Zv7s28aD4exEyhaYwo0lLVn1TvDBm2
	 7XF65gM9mJLyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9069A84372;
	Wed, 29 Apr 2026 22:31:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A01D9192
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 22:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 916496173E
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 22:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjKtSV6FlwJQ for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 22:31:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D6ED6173D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D6ED6173D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D6ED6173D
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 22:31:57 +0000 (UTC)
Received: from [192.168.1.108] (tmo-087-238.customers.d1-online.com
 [80.187.87.238])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7F5CD2C80CC9;
 Thu, 30 Apr 2026 00:31:54 +0200 (CEST)
Message-ID: <cbb86255-576f-4249-a9d7-e495c0f2a1a7@bubu1.eu>
Date: Thu, 30 Apr 2026 00:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20260418073313.37718-1-chakrabortyshubham66@gmail.com>
 <20260429130615.7679-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20260429130615.7679-1-chakrabortyshubham66@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777501914; bh=GkU5AhNYN+rO6Ft3nx6ePAp9C8umBbSncEbdg7Fmij8=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=U1Tl/ErLXf/95TMtJfqzjosGD2n3MLwCtr9BeyJZdhMVCo8rk75hnZvdJfTwoafGI
 6Iba309OT3qwrrVgNvZsfDe5LFMsZXtpy8OY70l6HmFm2LBMPmqZIbBTr86KJ29eid
 mhC+pPoLeBU5oFKhaAWf6i0hZBz+jRVxcQjr9JK5WDmE+Hnktfs/AORKNXDUveCydB
 c1C358GY2sh7FJO+y13+jTBYM0Z5HcGp6e/wIuv6lFDb9PHwb0WKPS2608kqeY9Dtr
 uGHuCxwFmoGmd0IvStDiw3y4cSSkqm2NACbCQOn8y70Jd77llEi73cnMoRToazEi5l
 Zya1d0w6O/Qfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=U1Tl/ErL
Subject: Re: [Buildroot] [PATCH v3] package/psmisc: bump to version 23.7
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 4/29/26 15:06, Shubham Chakraborty wrote:
> Changelog:
> - v23.6:
>    - buildsys: Fix DEJAGNU work-around (Debian #1015089)
>    - killall: Use kill if pidfd_send_signal fails (Debian #1015228)
>    - fuser: Do not mention nonexistent -reset option (#42)
>    - fuser: Use modern statn where possible
>    - pstree: Better AppArmor support (!30)
> - v23.7:
>    - Fix --disable-statx build option
>    - fuser: Add stat() fallback, ignore EACCES errors
>    - pstree: Fix assumption about root PID
>    - killall: Output formatting fixes
>    - Update gettext to 0.21
> 
> https://gitlab.com/psmisc/psmisc/-/tags/v23.6
> https://gitlab.com/psmisc/psmisc/-/tags/v23.7
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> 
> ---
Applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
