From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 8 Oct 2018 18:07:07 +0200
Subject: [Buildroot] [PATCH 1/1] brltty: fix build on mips64el
In-Reply-To: <87bm84eoln.fsf@home.blind.guru>
References: <20180930183408.4248-1-fontaine.fabrice@gmail.com>
 <87bm84g8cf.fsf@home.blind.guru>
 <CAPi7W82H5K4nsu5A6wPwwuGdnTXAJJ3Jh5wUrkGRj93==6cBhw@mail.gmail.com>
 <87bm84eoln.fsf@home.blind.guru>
Message-ID: <b0c02711-71e9-a1f2-2db5-ff5b2af1388e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 8/10/18 12:09, Mario Lang wrote:
> Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
> 
>> Dear Mario,
>> Le lun. 8 oct. 2018 ? 10:18, Mario Lang <mlang@blind.guru> a ?crit :
>>
>>> Hi.
>>>
>>> Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>>>
>>>> Bump to version 5.6 has reintroduced the issue fixed by patch 854093 on
>>>> version 5.5.
>>>>
>>>> Indeed, third patch was merged upstream but it was then reverted:
>>>>
>>> https://github.com/brltty/brltty/commit/9e7d62c869d3c1cbe12dda8b0291a4692c193416
>>>>
>>>> Moreover, since commit 3a2e3f6fa5ef0a210ffeba5ed05c79965d0cc3c7, MKOBJ
>>>> was renamed into MKREL. So, instead of patching again brltty, overwrite
>>>> LD to set the correct emulation depending on MIPS architecture as
>>>> already done in linux-tool-perf.mk.in.
>>>
>>> Thanks Fabrice.  ack and +1.
>>>
>> Thanks for your review, however after the feedback from Arnout on first
>> patch iteration (https://patchwork.ozlabs.org/patch/972614/),

 That was actually the second iteration (and this patch is the third iteration,
but I replied to the second iteration a week after you already posted the third
iteration...)

>> I've also
>> sent a PR to brltty: https://github.com/brltty/brltty/pull/149.
>> Both solutions seems good to me.
> 
> As I have mentioned previously in this thread, switching to GCC
> unconditionally break compilation on OS X.
> So PR 149 is likely not to be accepted.

 No, Fabrice's patch is different from the one that was reverted: it will only
use the compiler with the -shared option if the compiler is GCC. Where it breaks
on MacOS is when you try to call the non-GCC compiler with the -shared option.

 PR 149 looks good to me. Since upstream is not terribly reactive, Fabrice,
could you generate the appropriate Buildroot patch based on that PR?

 Regards,
 Arnout


> IMO, the right way forward is to commit your patch to buildroot, as it
> fixes a problem specific to mips.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
