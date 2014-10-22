From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 22 Oct 2014 10:41:17 +0100
Subject: [Buildroot] [PATCH] bash: fix linking for static builds with
 uClibc toolchains
In-Reply-To: <54477A59.1050000@mind.be>
References: <1413897705-47811-1-git-send-email-Vincent.Riera@imgtec.com>
 <5446C703.7070501@mind.be> <54477614.1040209@imgtec.com>
 <54477A59.1050000@mind.be>
Message-ID: <54477BBD.8010907@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On 10/22/2014 10:35 AM, Arnout Vandecappelle wrote:
> On 22/10/14 11:17, Vicente Olivert Riera wrote:
>> Dear Arnout Vandecappelle,
>>
>> On 10/21/2014 09:50 PM, Arnout Vandecappelle wrote:
>>>    Also, does musl allow redefining getenv?
>>
>> Well, I did a test with a static build using the musl toolchain and it worked
>> fine. So, yes, it seems that musl is ok with the getenv redefinition.
>
>   Perhaps it's a good idea to mention this analysis explicitly in comments.
> Something like:
>
> # bash wants to redefine the getenv() function. To check whether this is
> # possible, AC_TRY_RUN is used which is not possible in cross-compilation.
> # On uClibc, redefining getenv is not possible; on glibc and musl it is.
>
>
>   Regards,
>   Arnout
>
> [snip]
>

Done: http://patchwork.ozlabs.org/patch/401979/

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
