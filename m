From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Jan 2014 13:19:05 +0000
Subject: [Buildroot] [PATCH] libnfc-llcp: rename to libllcp and bump
	version
In-Reply-To: <52CF8D87.20000@mind.be>
References: <1389287265-1498-1-git-send-email-Vincent.Riera@imgtec.com>
 <52CF8D87.20000@mind.be>
Message-ID: <52CFF349.1080103@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/10/2014 06:04 AM, Arnout Vandecappelle wrote:
> On 09/01/14 18:07, Vicente Olivert Riera wrote:
>> This package has been renamed upstream to libllcp.
>
>   This is not sufficient reason to rename the package in buildroot as
> well. Renaming makes it difficult for people to follow buildroot
> upstream with their configurations.

The real reason to do this is because doing a version bump you will fix 
a compilation error due to libnfc-llcp not being compatible with libnfc. 
So, when you try to do a version bump, you notice that upstream has 
renamed the package, so..., why not do it altogether?

>   Also, if any existing symbol is removed (or renamed), entries have to
> be added to Config.in.legacy. This makes is slightly easier for users to
> maintain buildroot configurations, but it's still annoying so renaming
> of symbols should be done with care.

You are writing a comment for the first version patch. The last one is 
the V3 patch which already modifies Config.in.legacy to do this.

>
>   It _is_ an option to still rename it in the menu. I'm not entirely
> sure what should be done with the alphabetical ordering in that case -
> probably follow the visible name, not the internal name.
>
>   Regards,
>   Arnout
>
>> Also, the current
>> package we have in Buildroot fails to compile due to a version bump of
>> it's main dependence, libnfc. A version bump is required because this
>> package has been adapted upstream to work with libnfc-1.7.0-rc6.
>>
>> Signed-off-by: Vicente Olivert Riera<Vincent.Riera@imgtec.com>
>> ---
>>   package/Config.in                          |    2 +-
>>   package/{libnfc-llcp => libllcp}/Config.in |    6 +++---
>>   package/libllcp/libllcp.mk                 |   15 +++++++++++++++
>>   package/libnfc-llcp/libnfc-llcp.mk         |   15 ---------------
>>   4 files changed, 19 insertions(+), 19 deletions(-)
>>   rename package/{libnfc-llcp => libllcp}/Config.in (56%)
>>   create mode 100644 package/libllcp/libllcp.mk
>>   delete mode 100644 package/libnfc-llcp/libnfc-llcp.mk
>
>


-- 
Vincent
