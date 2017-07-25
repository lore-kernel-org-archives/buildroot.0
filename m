From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jul 2017 22:42:41 +0200
Subject: [Buildroot] [PATCH] linux: Fix URL for release candidate
	versions
In-Reply-To: <20170725202131.jmubvr27xrllhwp5@sapphire.tkos.co.il>
References: <CAHbBuxpYiGXzfB_xUwNzUFkhDcCc9qi1sySP_aN2Co5S5vvOjg@mail.gmail.com>
 <20170725202131.jmubvr27xrllhwp5@sapphire.tkos.co.il>
Message-ID: <dab97786-d9af-e052-6567-057ffa12fdc8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-07-17 22:21, Baruch Siach wrote:
> Hi Luis,
> 
> On Tue, Jul 25, 2017 at 10:28:48AM -0400, Luis Araneda wrote:
>> On Tue, Jul 25, 2017 at 4:37 AM, Baruch Siach <baruch@tkos.co.il> wrote:
>>> On Mon, Jul 24, 2017 at 11:14:01PM -0400, Luis Araneda wrote:
[snip]
>>>> -LINUX_SITE := $(LINUX_SITE)/testing
>>>> +LINUX_SITE := https://git.kernel.org/torvalds/t
>>>> +LINUX_SOURCE = linux-$(LINUX_VERSION).tar.gz
>>>
>>> Why do you need to add this? It should be the default value.
>>>
>>>>  endif # -rc
>>>>  endif
>>
>> I didn't fully understand what you mean, but I will try to answer the ones
> 
> What I meant to say is that <PKG>_SOURCE defaults to 
> <pkg>-$(<PKG>_VERSION).tar.gz (see package/pkg-generic.mk). So the 
> LINUX_SOURCE assignment seems to be redundant.

 LINUX_SOURCE is set a few lines higher so is no longer the default.

 However, I think this warrants a little refactoring. The condition for release
candidates should go before all the rest, so LINUX_SOURCE is set only for non-rc
kernels.


 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
