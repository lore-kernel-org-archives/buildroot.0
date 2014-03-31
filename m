From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 31 Mar 2014 09:58:07 +0100
Subject: [Buildroot] [PATCH] valgrind: Add support for MIPS architecture
In-Reply-To: <20140329164718.3b6af6c2@skate>
References: <1396025209-9495-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140329164718.3b6af6c2@skate>
Message-ID: <53392E1F.5010007@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/29/2014 03:47 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Fri, 28 Mar 2014 16:46:49 +0000, Vicente Olivert Riera wrote:
>> Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>   package/valgrind/Config.in |    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
>> index dacdd86..fd5649b 100644
>> --- a/package/valgrind/Config.in
>> +++ b/package/valgrind/Config.in
>> @@ -1,7 +1,8 @@
>>   config BR2_PACKAGE_VALGRIND
>>   	bool "valgrind"
>>   	depends on BR2_i386 || BR2_x86_64 || BR2_cortex_a8 || \
>> -		   BR2_cortex_a9 || BR2_powerpc
>> +		   BR2_cortex_a9 || BR2_powerpc || BR2_mips || \
>> +		   BR2_mipsel || BR2_mips64 || BR2_mips64el
>>   	help
>>   	  Tool for debugging and profiling Linux programs.
>
> This breaks the build on MIPS64:
>
>    http://autobuild.buildroot.org/results/213/21352bcbe1b309fef0f996c275cdfcda08619d96/build-end.log
>
> Thomas
>

Yeah, I sent a patch to upstream few weeks ago, and it was applied. I 
will send it to BR today.

Thanks for reminding me this problem.

-- 
Vincent
