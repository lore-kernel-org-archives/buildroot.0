From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 13 Nov 2013 10:07:25 +0100
Subject: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
In-Reply-To: <87txfh2r91.fsf@dell.be.48ers.dk>
References: <1384288305-4945-1-git-send-email-mlweber1@rockwellcollins.com>
 <9e8746c1-8e33-4c55-b4e2-b2b1e6181f86@email.android.com>
 <87txfh2r91.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWs9vXKEOQ7Pt2yteLnGHVsuNEJczVaR2AnwnCRwfbjyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 12, 2013 at 11:24 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> Hi,
>
>>> +if BR2_PACKAGE_OMNIORB
>>> +
>>> +config BR2_PACKAGE_OMNIORB_WITH_SERVICES
>>> +        bool "COS Naming Service"
>>> +        default y
>>> +        help
>>> +          omniORB COS Naming Service
>>> +endif
>>> +
>>> comment "omniORB needs a toolchain w/ C++"
>>> depends on !BR2_INSTALL_LIBSTDCPP
>
>> I think it makes more sense to keep this comment close to the config
>> option it applies to, thus moving the new cos option below it.  I know
>> that many packages do not follow this, but I'm planning on fixing
>> that...
>
> Careful, kconfig needs sub options to be directly under the main option,
> otherwise they don't get indented correctly in menuconfig, so your
> options are either:
>
> - Comment before main option
> - Comment after all the sub options
>

Yuk, that's a pity...
In this case my preference is to have the comment before the main
option (so as close as possible), rather than after all sub options.

What is your opinion?

Thanks,
Thomas
