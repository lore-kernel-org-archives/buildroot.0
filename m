Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFB6FA3741
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 02:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9583A40876;
	Tue,  1 Nov 2022 02:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9583A40876
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZfWqgqFKYazY; Tue,  1 Nov 2022 02:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DC6040880;
	Tue,  1 Nov 2022 02:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DC6040880
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48CA91BF36E
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 02:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22F1540880
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 02:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22F1540880
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5D9y6ND7VMJP for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 02:27:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A28640876
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A28640876
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 02:27:32 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPSA
 id pgzyoFUfjD3Pwpgzyog0K9; Tue, 01 Nov 2022 03:27:30 +0100
Message-ID: <1e71c677-05cf-89b1-419f-df8e0f73ae63@benettiengineering.com>
Date: Tue, 1 Nov 2022 03:27:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221018234617.225947-1-giulio.benetti@benettiengineering.com>
 <20221031132519.4e5ebc69@windsurf> <20221031125405.GC1058960@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221031125405.GC1058960@scaer>
X-CMAE-Envelope: MS4xfKTVnvnvZO1OKYGaf9GpAcRYpMXwW0EoLfp/DnKEvZjCPl4o95M+Mo6+beBvYmNTw278BehGLlguKJbN13jRbQWAT7veJbpiBAzaTgppU3Ym8STfIU9u
 kTWUEvv5akoyh2TufAOkkqBATffiK5hn3Mj5IwX93YlFcHaTjEJzwD30WoQLc7NnYq9obA7nnNhk1hKGyYl1gC2H4qd7IfCWIkjuwreWMKloBJkhIMrmQvv0
 2N4ktk3QXIpY0KQ0SmAO9f8GKZsdvS06SX9HgEPlJlvW+oSQGZDZFdvvOv4t/fvVONbqBKzFKXGQiAdtdxItcOV7BjCrt4TCB1ksBMXV4s8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1667269650; bh=zR3yJv03Zlt6B/gQ1u7V+3e9b4t08Rh3M+UC4Zb1b3I=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=EKv4zhtTxtnV0uej8fqojWiYGHeIV9xDyptTMIYhaqenYDaZADJwnDYD7/jrx1FlG
 MN4hq4B+xL5Cj/79SVsAE93zDJ3X1bxkQm/e5BlEe6AR1o9klSF+Qq41YWYD50PP48
 gyqBJcomLoSeJwL4UYPqRf0fmQVSxEJtQPLOPOPiHlMi181FMA3inQ4ce/wN2iKkfO
 cFkfvsUD6PhQKzJbNWs7MrvN0ltAhXJPk5IluDcaDunGigIkW4r+bLjhZemt7jtjwh
 SLEftaCggo16tG8Fw7SE+6pI1+eIijj9FmMuNZQi7DGMw4xR/xlzGKziDsrwsXUeKZ
 CUPizDT5R5Idg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=EKv4zhtT
Subject: Re: [Buildroot] [PATCH] package/mono: allow to select which folders
 to install to target
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 31/10/22 13:54, Yann E. MORIN wrote:
> Giulio, Thomas, All,
> 
> On 2022-10-31 13:25 +0100, Thomas Petazzoni via buildroot spake thusly:
>> On Wed, 19 Oct 2022 01:46:17 +0200
>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>> At the moment all APIs folders are copied to target increasing the size of
>>> rootfs of ~190MB. Allow to select which API folders we want to copy to
>>> target to shrink rootfs down.
>>>
>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Practically speaking, could you describe which folders are needed in a
>> typical scenario you've had?
> 
> Yes, can you provide a rationale for when only a subset of APIs is
> needed?

I've answered on previous e-mail. I've realized only now that I could
answer to your e-mail for both.

>> Here, I have these ones:
>>
>> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:58 2.0-api
>> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:58 3.5-api
>> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:56 4.0
>> drwxr-xr-x   2 thomas thomas 12288 oct.  25 22:58 4.0-api
>> drwxr-xr-x   4 thomas thomas 16384 oct.  25 22:58 4.5
>> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.5.1-api
>> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.5.2-api
>> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.5-api
>> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.6.1-api
>> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.6.2-api
>> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.6-api
>> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.7.1-api
>> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.7.2-api
>> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.7-api
>> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.8-api
>> drwxr-xr-x 145 thomas thomas 12288 oct.  25 22:56 gac
>> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:56 lldb
>> drwxr-xr-x   3 thomas thomas  4096 oct.  25 22:56 mono-configuration-crypto
>> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:56 monodoc
>> drwxr-xr-x   3 thomas thomas  4096 oct.  25 22:56 msbuild
>> drwxr-xr-x   6 thomas thomas  4096 oct.  25 22:56 xbuild
>> drwxr-xr-x   4 thomas thomas  4096 oct.  25 22:56 xbuild-frameworks
> 
> It looks like we have three sets of directories here;
>    - version-based dirs: from 2.0-api up to 4.8-api
>    - gac/: big number of subdirs in there...
>    - the rest
> 
> Your change trat them all on the same level, but are they all really
> superfluous? Is there a set that absolutely needs to be there, or can we
> really do with just one (or even none, see below)?
> 
> Note: can we unconditionally get rid of monodoc/? Of msbuild/? Of lldb/?

To tell the truth I'm not expert in this. I know that my customer's
application only needed the files in those folders.
So I can't find at the moment something that clarifies this, that's why
I've given a very open solution. Of course this can give problems in
runtime. But the mono application should fail immediately if someone
skip some folder.

>>> +config BR2_PACKAGE_MONO_SPECIFY_FOLDERS_TO_INSTALL
>>> +	bool "Specify folders to install to target"
>>> +	help
>>> +	  Allow to specify which Mono folder to install to target
>>
>> I don't really have a very good suggestion, but I don't like the name
>> of the option. We rarely have option names that are "sentences", i.e
>> "specify folders to install" is a sentence.
>>
>> Should we instead have a single string option
>> BR2_PACKAGE_MONO_INSTALL_LIB_DIRS, which is empty by default. When
>> empty, it means all folders are installed. Otherwise, only the
>> specified folders are installed.
> 
> Agreed. I expect that having no API level installed would yield a
> non-working system, so:
> 
>      config BR2_PACKAGE_MONO_API_VERSIONS
>          string "API versions to install"
>          help
>            Keep empty to install all.

Ok, I go with that then!

>> The other obvious question is whether this shouldn't simply be left as
>> something to do in a post-build script. Even though I admit that
>> reducing 190 MB down to something reasonable can be seen as something
>> that is almost mandatory.
>>
>> Or alternatively, do we have a better way, where we could automate this
>> selection of which folders are needed?
> 
> I would prefer we avoid carrying the list of versionned APIs (and the
> rest, see above).

Yes I agree, otherwise the list would be pretty long.

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
