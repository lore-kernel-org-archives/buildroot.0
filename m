From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 9 Jul 2017 11:28:17 +0200
Subject: [Buildroot] [PATCH] package/linuxptp: remove incdefs.sh to
 avoid cross-compilation issues
In-Reply-To: <f0e2c860-ca4e-bf3d-f685-ffc2f9915a8a@jikos.cz>
References: <20170705141028.28194-1-romain.naour@smile.fr>
 <7b3079cb-f604-6ab2-3da7-448dacf9ef55@jikos.cz>
 <6827f8c2-c2dc-5727-1844-109bd321a498@smile.fr>
 <f0e2c860-ca4e-bf3d-f685-ffc2f9915a8a@jikos.cz>
Message-ID: <7f981b4f-8202-0df8-25aa-ba128b6d8e0b@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

Le 06/07/2017 ? 23:50, Petr Kulhavy a ?crit :
> Hi Romain,
> 
> On 06/07/17 19:06, Romain Naour wrote:
>>> What else was exactly failing in your case? Maybe there are some improvements I
>>> can propose to the package mainstream?
>> While looking at the issue I made some changes that make me believe that
>> CROSS_COMPILE was not defined while incdefs.sh was called.
>>
>> With Yann, we looked at the issue after I published this patch to the mailing
>> list. We fixed the build issue and I'll send a v2 shortly.
>>
>> But, we think that greping in a header is not a good practice.
>> To check if a define is available or not the build system should try to build a
>> small code including the header. A build system like autotools and CMake can be
>> used to do so.
>>
>> Maybe you can try to upstream a new build system ?
> I fully agree with you that this grep approach is very weak. I have already
> tried to propose changes that compile bits of code like autotools do.
> Unfortunately the owner of linuxptp almost religiuosly rejects the autotools
> approach. He is convinced that autotools are bad and can't see that the grep
> approach is not portable and cannot work reliably.
> He rather prefers to finetune the grep expressions, instead of accepting the
> de-facto industry standard.

Do you have a link to your discussion ?
I can understand that autotools maybe difficult to set up but reinvent the wheel
is also difficult :p
I would suggest to use cmake instead.

> 
> The only thing that seems to work is to point out concrete configurations and
> environments where the compilation fails and persistently report issues to him.
> I can take over this inconvenient job of a postman, but need a concrete input
> from you.

The issue seems to be fixed in the autobuilders [1] but we have to do some
changes in linuxptp.mk.

[1]
http://autobuild.buildroot.net/?reason=linuxptp-97c351cafd7327fd28047580c9e2528a6f7e742b

Best regards,
Romain

> 
> Thanks and regards
> Petr
> 
