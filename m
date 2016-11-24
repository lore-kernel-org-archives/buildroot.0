From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Nov 2016 09:39:13 +0100
Subject: [Buildroot] [PATCH/next] toolchain-external: support gcc < 4.3
In-Reply-To: <20161124090108.4662368c@free-electrons.com>
References: <20161123111404.20661-1-arnout@mind.be>
 <20161123232132.66194af8@free-electrons.com>
 <31d9d115-a051-8c3d-efae-6225423ba481@mind.be>
 <20161124090108.4662368c@free-electrons.com>
Message-ID: <1c235f78-0f40-c1f5-1ca4-c6e2661f9e33@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-11-16 09:01, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 24 Nov 2016 00:38:33 +0100, Arnout Vandecappelle wrote:
>> On 23-11-16 23:21, Thomas Petazzoni wrote:
>> [snip]
>>>> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
>>>> index 3991bc1..72e7292 100644
>>>> --- a/toolchain/helpers.mk
>>>> +++ b/toolchain/helpers.mk
>>>> @@ -145,8 +145,7 @@ check_kernel_headers_version = \
>>>>  check_gcc_version = \
>>>>  	expected_version="$(strip $2)" ; \
>>>>  	if [ -z "$${expected_version}" ]; then \
>>>> -		printf "Internal error, gcc version unknown (no GCC_AT_LEAST_X_Y selected)\n"; \
>>>> -		exit 1 ; \
>>>> +		exit 0 ; \  
>>>
>>> Why?  
>>
>>  As stated in the commit log:
>>
>> When [BR2_TOOLCHAIN_GCC_AT_LEAST] is
>> empty, we don't do a version check at all in check_gcc_version.
>>
>>  Perhaps I should add to that "(previously we errored out)".
> 
> Well, we're still erroring out, but with a 0 exit code. So I must be
> missing something.

 0 is not an error, right?

 Too early in the morning?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
