Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDBBFA3740
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 02:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4952481382;
	Tue,  1 Nov 2022 02:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4952481382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f9hVITlYppZf; Tue,  1 Nov 2022 02:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 543728124F;
	Tue,  1 Nov 2022 02:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 543728124F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8558A1BF36E
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 02:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6069060BFF
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 02:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6069060BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NayK5Rjf9Qqg for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 02:19:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F148560A98
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp3.osuosl.org (Postfix) with ESMTP id F148560A98
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 02:19:17 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPSA
 id pgrzoFPUMD3PwpgrzofxLm; Tue, 01 Nov 2022 03:19:15 +0100
Message-ID: <29ee559b-0663-da71-97f2-a1955c293382@benettiengineering.com>
Date: Tue, 1 Nov 2022 03:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221018234617.225947-1-giulio.benetti@benettiengineering.com>
 <20221031132519.4e5ebc69@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221031132519.4e5ebc69@windsurf>
X-CMAE-Envelope: MS4xfB7yKZY2VQ9v9+Zr1NS42xVVh1m4r1F9VugRiO668TNq5UJ+RShEuiAGz3ho6hk9eS2Q565PaZfj75tJgff0xdmfzNZhgE8sGaZgJU4pvm0TinoTdbaL
 ZguU0ulfR8rGfS7wkYGM+mpkd5gyykiR78S3hO+7DJHdhJLQRF4VE6Is+tQYtjlXduGr2nk7VZhucwt4hbP/qVF6EcIEiJyHyQPoZ6QgUjGzBODNwkvPS7WR
 Q+ghGmgm9gzC4OX9rRYTp8Rcr3mvqS5LaiDInwRYGuYgVz+IBmIM7VnHqS3ZpbkYp0TCutfP3n/ettzSvM98Khj0+nkV72vpXTH3dHjL6pQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1667269155; bh=tDifOdoud7xQVOnSyRlGDNfudqA0nO1fVJtj3YS+oqM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=kO1PLZmKwJCjdnom7AfvoIbjFKiyy1eJT0ixzUbXeg/xRbvm0dzPXJ7/A+V0pcPxf
 XVox6bZcL6v0HtYaWa11XDZwtTaSi+wc28RP87xFf02JhQHSTT+0dC6C8RZyoKrCzB
 4sUEQjejshnaLDBnoy1B5DZ3hscEMs3tt0gSIJzfmfBt/JdMxWE3N0rjty/RCAL7Yw
 TNtaJdWPpRJa5ayW7JjEVap6g+RrjeCk4EziOPJTLsNSaoR1o/3v7yRnH2ayTNZB+s
 YcCpkZiGUcek6OCQwePaH8bOfpdpK4KitzcIjZDoQWXR9s+boGlPCV1WvoaWt2tbTL
 PoZFOBq+WmwwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=kO1PLZmK
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 31/10/22 13:25, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Wed, 19 Oct 2022 01:46:17 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> At the moment all APIs folders are copied to target increasing the size of
>> rootfs of ~190MB. Allow to select which API folders we want to copy to
>> target to shrink rootfs down.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Thanks for proposing this.
> 
> Practically speaking, could you describe which folders are needed in a
> typical scenario you've had?

One scenario I'm facing right now is:
drwxr-xr-x   4 giuliobenetti giuliobenetti 16384 ott 26 01:26 4.5
drwxr-xr-x 145 giuliobenetti giuliobenetti 12288 ott 26 01:20 gac
drwxr-xr-x   2 giuliobenetti giuliobenetti  4096 ott 26 01:22 lldb

And the total is 95MB big.
gac/ is ~56MB and that's mandatory in my case.
4.5/ is ~36MB
lldb/ is only 5K

While copying all directories is ~195MB so I was wrong, we don't save
~190MB, but anyway we save almost 100MB that for size costraint systems
and most of all for production programming save time. The latter is why
I need it most of all.

> Here, I have these ones:
> 
> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:58 2.0-api
> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:58 3.5-api
> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:56 4.0
> drwxr-xr-x   2 thomas thomas 12288 oct.  25 22:58 4.0-api
> drwxr-xr-x   4 thomas thomas 16384 oct.  25 22:58 4.5
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.5.1-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.5.2-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.5-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.6.1-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.6.2-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.6-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.7.1-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.7.2-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.7-api
> drwxr-xr-x   3 thomas thomas 12288 oct.  25 22:58 4.8-api
> drwxr-xr-x 145 thomas thomas 12288 oct.  25 22:56 gac
> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:56 lldb
> drwxr-xr-x   3 thomas thomas  4096 oct.  25 22:56 mono-configuration-crypto
> drwxr-xr-x   2 thomas thomas  4096 oct.  25 22:56 monodoc
> drwxr-xr-x   3 thomas thomas  4096 oct.  25 22:56 msbuild
> drwxr-xr-x   6 thomas thomas  4096 oct.  25 22:56 xbuild
> drwxr-xr-x   4 thomas thomas  4096 oct.  25 22:56 xbuild-frameworks
> 
>> +config BR2_PACKAGE_MONO_SPECIFY_FOLDERS_TO_INSTALL
>> +	bool "Specify folders to install to target"
>> +	help
>> +	  Allow to specify which Mono folder to install to target
> 
> I don't really have a very good suggestion, but I don't like the name
> of the option. We rarely have option names that are "sentences", i.e
> "specify folders to install" is a sentence.
> 
> Should we instead have a single string option
> BR2_PACKAGE_MONO_INSTALL_LIB_DIRS, which is empty by default. When
> empty, it means all folders are installed. Otherwise, only the
> specified folders are installed.

Yes, I can do like that.

> The other obvious question is whether this shouldn't simply be left as
> something to do in a post-build script. Even though I admit that
> reducing 190 MB down to something reasonable can be seen as something
> that is almost mandatory.

~100MB after recalculating. Anyway it's a bit odd to create ad hoc
script to remove 29 folders an keep only 3. Usually I expect a mono user
to write an application using only 1 API version.

> Or alternatively, do we have a better way, where we could automate this
> selection of which folders are needed?

In the beginning I thought that mono provided such possibility in its
build system but it's not like that, check:
https://github.com/mono/reference-assemblies/blob/680013abda911528f6befca67eed5669d80c85d5/Makefile

That is why I've ended up with this solution. Honestly I wanted to avoid
to even install these dll files to host/ but it's not possible.
Otherwise I have to patch the Makefile and in the end having 100M on
host I don't think is a problem.

-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
