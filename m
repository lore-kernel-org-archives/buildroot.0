From: Steven Noonan <steven@uplinklabs.net>
Date: Sun, 27 Dec 2015 02:44:51 -0800
Subject: [Buildroot] [PATCHv2] toolchain: granular choice for stack
	protector
In-Reply-To: <20151227102655.GB3483@free.fr>
References: <1451173326-3424-1-git-send-email-yann.morin.1998@free.fr>
 <20151227111936.5283ba73@free-electrons.com>
 <20151227102655.GB3483@free.fr>
Message-ID: <CAKbGBLgU3woN+OEPF3tDUO7xs1XdUrFk2i10qdY1x=wF-EBZdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 27, 2015 at 2:26 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2015-12-27 11:19 +0100, Thomas Petazzoni spake thusly:
>> On Sun, 27 Dec 2015 00:42:06 +0100, Yann E. MORIN wrote:
>> > -config BR2_ENABLE_SSP
>> > +choice
>> >     bool "build code with Stack Smashing Protection"
>> > -   depends on BR2_TOOLCHAIN_HAS_SSP
>> > +   default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
>> > +   default BR2_SSP_STRONG if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>>
>> I don't understand this part. Why would we now defalut on
>> BR2_SSP_STRONG if gcc >= 4.9 ?
>
> Hmmm... I did not think too much about that. I just "updated" the patch
> and kept its meaning as-is.
>
>> I think we should keep the default of not having SSP enabled.
>
> Yes, makes sense. At best, the change in the default should have been in
> another patch.

I could be wrong, but I *think* BuildRoot used to default to SSP on.
If not, I don't know why I would have changed the default. I'm not a
particularly big fan of SSP to begin with, so I'd have no incentive to
default it enabled.

> I'll fix and respin.
>
> Regards,
> Yann E. MORIN.
