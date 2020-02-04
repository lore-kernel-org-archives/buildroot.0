From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 4 Feb 2020 15:49:31 +0100
Subject: [Buildroot] [PATCH v2] package/libnspr: remove
 BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
In-Reply-To: <b1fbe4c2-03eb-9c45-484d-043a2f7b60b4@mind.be>
References: <20200204095059.7315-1-giulio.benetti@benettiengineering.com>
 <20200204110416.074754d8@windsurf>
 <b1fbe4c2-03eb-9c45-484d-043a2f7b60b4@mind.be>
Message-ID: <df1d90eb-7105-7c87-d41b-2c7e33588f72@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All,

On 2/4/20 3:36 PM, Arnout Vandecappelle wrote:
> 
> 
> On 04/02/2020 11:04, Thomas Petazzoni wrote:
>> On Tue,  4 Feb 2020 10:50:59 +0100
>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>
>>> Since all architectures supported by Buildroot are supported by libnspr
>>> BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT makes no sense anymore, so let's remove
>>> it all around.
>>>
>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>
>> Arnout and I both agreed that we want to keep this blind option, so I'm
>> not sure I understand why you're sending this patch. Did we miss something?
> 
>   Actually, Giulio replied that in the other thread (but it should be part of the
> commit log here, maybe): adding architecture support is trivial (just a matter
> of defining the right sizes), so we should never need to re-add this option.
> Just fix libnspr.

Oops, again, sorry, I was on Mobile.

Anyway yes, to add support for new architecture in nspr it's enough add 
2 entries as you can see on my previous upstreamed patch:
https://hg.mozilla.org/projects/nspr/rev/ef5d8d008815e8367e684149f88b43f5ae53e1d7

But IMHO if a new architecture is added to Buildroot nspr will fail to 
build for it, but fix it(*at the moment at least*) is trivial.

Thank you Arnout for pointing.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>   Regards,
>   Arnout
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
