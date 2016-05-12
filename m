From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 12 May 2016 15:58:53 +0200
Subject: [Buildroot] [PATCH] libpjsip: disable parallel build
In-Reply-To: <20160512155024.7fe37f68@free-electrons.com>
References: <1463057293-2833-1-git-send-email-luca@lucaceresoli.net>
 <20160512155024.7fe37f68@free-electrons.com>
Message-ID: <57348C1D.1070400@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On 12/05/2016 15:50, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 12 May 2016 14:48:13 +0200, Luca Ceresoli wrote:
>> The libpjsip package has build issues on the autobuilders that look
>> like parallel build issues. These issues seem to be extremely hard to
>> reproduce, so let's disable parallel build and see if this fixes the
>> issue.
>>
>> The suspect error message is:
>>   ...-ld: cannot find -lpjsua
>>   collect2: error: ld returned 1 exit status
>>
>> Some of the failures:
>>   http://autobuild.buildroot.org/results/d6b/d6bff569bc9238cdf07970e11b5535d570be59bf
>>   http://autobuild.buildroot.org/results/f72/f721d5390bc61274c224bfe3a675ee194172ac91
>>   http://autobuild.buildroot.org/results/b45/b45262971a7d7ce0604d124734223abca190c11e
>>   http://autobuild.buildroot.org/results/75e/75ee45b746ab8b80eb84297e2e4babbace1b5608
>>   http://autobuild.buildroot.org/results/873/873771fbcc859578ed40a3c81b69ac3a388ae585
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> ---
> 
> I also hate to apply such patches without really knowing what's going
> on. But I've applied it nonetheless, so that we can see if it actually
> solves the problem or not. If it does, then we can think of a better
> solution, or at least reporting the build issue upstreaming to the
> pjsip developers.
> 
> So, applied to master! Please monitor the autobuilders in the next
> hours/days to see if the issue is resolved or not.

I'm doing it almost daily since weeks now, why should I stop? ;)

Thanks for having applied it.
-- 
Luca
