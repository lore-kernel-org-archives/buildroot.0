From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 18 Jul 2017 11:40:19 +0100
Subject: [Buildroot] [PATCH v6 1/4] infra: add support for MIPS NaN
In-Reply-To: <20170717141111.7c200c1d@windsurf>
References: <20170628151713.10746-1-Vincent.Riera@imgtec.com>
 <20170716164000.415ca6f3@windsurf> <20170717113412.6306d69a@windsurf>
 <aea83bb8-c45f-527b-3c38-71b98f50cc50@imgtec.com>
 <20170717141111.7c200c1d@windsurf>
Message-ID: <ea6a0b91-c500-463a-5744-08d5554dd957@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 17/07/17 13:11, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 17 Jul 2017 13:03:05 +0100, Vicente Olivert Riera wrote:
> 
>>> Is it because the gcc of this external toolchain is too old ?  
>>
>> Yes, the -mnan= option was introduced in gcc 4.9.0 by this commit:
>>
>> 0bd32132d471995f3e333138363d1d928a9dde60
>>
>> The gcc of that external toolchain is 4.8.2.
> 
> OK, that explains it.
> 
>>> What can we do about this ?  
>>
>> I guess we could use an option called BR2_GCC_SUPPORTS_MNAN in order to
>> avoid adding the -mnan option to the CFLAGS and to the tc-wrapper if the
>> external toolchain hasn't selected that option. For internal toolchain,
>> since the oldest gcc version we support is 4.9.4, then it should be
>> always selected.
> 
> Sounds good to me. I guess those older gcc versions (4.8 and before)
> anyway only supported the legacy NaN encoding, and therefore behave as
> if -mnan=legacy is passed, correct?

Correct.

> You might also want to check if the same problem will happen (or not)
> for the FP32 mode, and the DSP/MSA options :)

I'll check it out, yes.

Thanks,

Vincent

> Thanks!
> 
> Thomas
> 
