From: Renaud AUBIN <root@renaud.io>
Date: Tue, 01 Dec 2015 22:59:42 +0100
Subject: [Buildroot] [PATCH 1/1] Update the libhttpparser package
In-Reply-To: <20151201175059.2c0444b8@free-electrons.com>
References: <1448972119-12298-1-git-send-email-root@renaud.io>
 <20151201175059.2c0444b8@free-electrons.com>
Message-ID: <162282d6c1d8466ba41790767b763800@renaud.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Le 2015-12-01 17:50, Thomas Petazzoni a ?crit?:
> Renaud,
> 
> On Tue, 01 Dec 2015 13:15:19 +0100, Renaud AUBIN wrote:
>> The http-parser repository has been transfered from joyent to nodejs.
>> Bump version to 2.6.0.
>> 
>> Signed-off-by: Renaud AUBIN <root@renaud.io>
> 
> The commit title for packages should always look like:
> 
> 	<package>: <description>
> 
> So in the case of this commit, it should be:
> 
> 	libhttpparser: bump to version 2.6.0
> 
> Also, when you send a new version of a patch, it should be titled
> [PATCHv2] and include a changelog of what has changed since the
> previous iteration of the patch. See the Buildroot manual for details
> about this, and "git help format-patch" for details on how to do it.
> 

OK, no excuse on that since the manual is complete on that.
Sorry (^^)

>> diff --git 
>> a/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch 
>> b/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch
>> index 29fe04d..df16656 100644
>> --- 
>> a/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch
>> +++ 
>> b/package/libhttpparser/0001-Use-f-option-when-calling-ln-at-install-time.patch
>> @@ -1,4 +1,4 @@
>> -From d9dfeca8736318eaad5cd4554cbae059469decde Mon Sep 17 00:00:00 
>> 2001
>> +From 384917321c45e492b0ca7aaa94d4b15324aef95d Mon Sep 17 00:00:00 
>> 2001
>>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>  Date: Fri, 28 Aug 2015 19:02:11 +0200
>>  Subject: [PATCH] Use -f option when calling ln at install time
>> @@ -6,29 +6,30 @@ Subject: [PATCH] Use -f option when calling ln at 
>> install time
>>  This allows "make install; make install" to work properly.
> 
> Since you're using libhttpparser, could you submit this patch to the
> upstream project, so that we can hopefully get rid of it in the future 
> ?
> 

Existing upstream PR on this:
https://github.com/nodejs/http-parser/pull/243
https://github.com/nodejs/http-parser/pull/272

+ an issue / proposal on CMake usage instead of the existing plain old 
Makefile (but with no PR, I wouldn't count on this one).
So... Wait and see...

> Finally, if you have some time, could you submit a patch to add a hash
> file to this package, since it's fetched from github ?
> 
> I've fixed the commit title, and applied to the next branch (soon to be
> merged into master).
> 

No problem, I'll monitor master.

> Thanks,
> 
> Thomas

Thanks for your thoroughful explanation (obv. + the great work on 
buildroot!)

Renaud
