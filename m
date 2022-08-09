Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AF1C25B0C
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 15:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37FAA60F45;
	Tue,  9 Aug 2022 15:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37FAA60F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3hKKe0l_-RU1; Tue,  9 Aug 2022 15:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3F8B60AE2;
	Tue,  9 Aug 2022 15:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3F8B60AE2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E13F1BF36E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 15:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E75D68141D
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 15:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E75D68141D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzYMUqUZmi41 for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 15:57:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6698A8141A
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6698A8141A
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 15:57:38 +0000 (UTC)
Received: from [192.168.0.243] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MpUEO-1ncH1G3qnc-00pqb4; Tue, 09 Aug 2022 17:57:34 +0200
Message-ID: <c471e49b-5842-78e7-dd11-5d1371396775@green-communications.fr>
Date: Tue, 9 Aug 2022 17:57:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220808150641.19475-1-nicolas.cavallari@green-communications.fr>
 <20220808224145.2705f093@windsurf>
Content-Language: fr, en-US
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <20220808224145.2705f093@windsurf>
X-Provags-ID: V03:K1:jD/PPV1A28WJAtbP76iFWnXzqye1HHTIYUkHyDC3YK50djOVwp5
 kvPVnFn3AlPS0LBy+6k7hStvdPawCgbuG3MwdISJHgUFKoQMsOGVUJ0ltCGckupmNHol5Hi
 HcjpdEFYaETbjWl+b5VwJEzfDTRn4CVuELQbBxdYZ5uG70J+gcOzhffYdQU8dnqvciLpqsS
 MnevyBbYzHgkxniQFhfBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ppnDSxJfcD4=:dBIwPCuByCPCVdGBl9gtyl
 hle9v2Wevq5cyrGbPRlAMFLf3g4DoqTF5P3tszssKXuT5MfzDj6aW+s9eP41vLUqFsGGIctCN
 Bod7h01l73X2Pilb3urqHwTHxyxREeo4MQ+5QXD6hq+Ui26GQp3aBYIVa1pb6UFEWipRtuv0t
 T1VliJadX99LqVi9s3SB39qgtfpzXSZlO6mjt93tGT+zG9V6erRhA/SWtG1B7UC1T605fe89G
 vlhiBkDlYMl/x7Sp9zPy0A8NiPg6hXOuyk/oEXsFLe7gpQv55d2N2PCu7Ij8ey+uOBxU/MT9R
 xNgmvH1YXXC7gUKR+2hfB0FnRpN4+WCHBBhXioMNcPg4KW11DpLQOy9fBAZpqVP+zjkDEls3w
 JKR3xraDCp9pr+pdqyM6xUuTIZtQ1yZWfn8xQ4FVhNtiwloFf/0Caysqwtr4D0BYvM+WWahK/
 8SQVonxmDDS0YehYV/ZHa35jsGbgmEN2zQLfjCUP6aIGSr+33lshWJCamMe4MbtX71sc3nd7U
 dSbkrKnvF5eRbnLhUhy0CflKaMDato5cRKHj1AAhT9FWlIwH0DVAnd7zS1oxsiAT+cPbqrHkL
 Q+zTlRScNoEPE/Ntbo6V8CGmvi66kktTfl4Cfb/jscnXq/fGhmTE7gpVlD24+qG8KxR86MtaQ
 oLhBtXQiLX8q5+wEudRr3jm5/0ZZQvVwd22jNEDMSHNWflo4jLs3fOkyc4Ho/Gs3R0Vcu92WF
 huDF8zi1Htb52CrR2qCiQ13ItGHlq1XhRZBexT/WosFbZ11ckM88YpbD45bhWf8IopgARONe0
 FEGlHsp
Subject: Re: [Buildroot] [PATCH 1/2] package/libgit2: depends on native
 64bit atomics
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/08/2022 22:41, Thomas Petazzoni wrote:
> Hello Nicolas,
> 
> On Mon,  8 Aug 2022 17:06:40 +0200
> Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:
> 
>> libgit2 does not know about libatomic_ops.
>>
>> This wasn't a problem before because it is a shared library, so the
>> missing symbols were simply added as undefined, and no project currently
>> depend on libgit2 to expose the problem.
>>
>> The next version of libgit2 can also build a binary, which will expose
>> the problem.
>>
>> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> 
> Which build failure do you have exactly? Indeed when building for
> SPARC, what I see are calls to __atomic_compare_exchange_4,
> __atomic_fetch_add_4, __atomic_fetch_sub_4.
> 
> Is this what you are referring to?
> 
> If yes, then these are not sync builtins
> (https://gcc.gnu.org/onlinedocs/gcc/_005f_005fsync-Builtins.html), but
> atomic builtins
> (https://gcc.gnu.org/onlinedocs/gcc/_005f_005fatomic-Builtins.html).
> 
> The Buildroot options BR2_TOOLCHAIN_HAS_SYNC_xyz are for sync builtins.
> 
> The Buildroot option BR2_TOOLCHAIN_HAS_ATOMIC is for atomic builtins.
> 
> So, your package needs to:
> 
> 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> 
> and then in its .mk file, so something like this:
> 
> ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> ... make sure your package links against libatomic.so by passing -latomic in LDFLAGS
> endif
> 
> Note that libatomic.so is distinct from libatomic_ops.so. libatomic.so
> is provided together with the gcc runtime, and implements the atomic
> builtins on architecture where they are not implemented directly by the
> compiler (a runtime library is needed).

It's a bit more complicated than that and i probably mixed things up.

libgit2 can use sync builtins or atomic builtins depending on the gcc 
version.

But if we assume that the new gcc minimum version is 4.9, then I can 
probably just ignore the sync builtins.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
