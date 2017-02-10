From: Andreas Naumann <dev@andin.de>
Date: Fri, 10 Feb 2017 11:47:03 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-02-09
In-Reply-To: <20170210112606.1f17fd02@free-electrons.com>
References: <20170210072859.4656F20BAB@mail.free-electrons.com>
 <CALdGskLbBc1Vx9Ju8ZhUJvRa5r6q83=N-qukFygmS-eZz79i8Q@mail.gmail.com>
 <20170210093759.33285cd1@free-electrons.com>
 <A9140E91EDA627489354A41A7EE118CA33CCBD@sv08ultra002.ultratronik.de>
 <20170210112606.1f17fd02@free-electrons.com>
Message-ID: <2a83fc74-f8c8-639f-74bc-d5032d270b2d@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 10.02.2017 um 11:26 schrieb Thomas Petazzoni:
> Hello,
>
> On Fri, 10 Feb 2017 09:52:09 +0000, Naumann Andreas wrote:
>
>> I've actually sent a patch for this earlier in '[Buildroot] [PATCH v4
>> 10/10] poppler: Compile with -std=c++11'. Unfortunately I forgot it
>> in v5. Is this enough or do you want me to resend it?
>
> OK, I found it again in patchwork:
>
>   http://patchwork.ozlabs.org/patch/708239/
>
> But this patch has an issue: if a package needs C++11 support then it
> needs to have a BR2_TOOLCHAIN_GCC_AT_LEAST_XYZ dependency.
>
> But this raises an even more fundamental issue: there is *nothing* in
> poppler that indicates it can depend on Qt5. There is some logic for
> Qt4, but nothing for Qt5.

Ok, I see that we have some local patch that makes this explicit. I 
guess in the given failure it must have been by chance that qt5 was 
built before poppler and popplers configure automatically detected this.

>
> So: the dependency on Qt5 should be made explicit, and should take care
> of the fact that Qt5 needs C++11 support, and therefore a reasonably
> recent C++ compiler.
>
> Could you work on this?
>
> Alternatively, if you don't care/use Qt5 support in Poppler, you can
> also just pass the appropriate --disable-<foo> option to
> unconditionally disable Qt5 support.

Quite the opposite. I'll try to come up with something in the afternoon.


regards,
Andreas

>
> Thanks!
>
> Thomas
>
