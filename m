From: Andreas Naumann <dev@andin.de>
Date: Mon, 13 Mar 2017 11:43:49 +0100
Subject: [Buildroot] [PATCH] fakeroot: bump version to 1.21-2
In-Reply-To: <CAGduivwqAtheOrr_J0XWXR-9rjWNwPC9Y0dFCqKyBua+bir0ww@mail.gmail.com>
References: <20161004115320.647-1-maxime.hadjinlian@gmail.com>
 <20161004163555.7c8af28f@free-electrons.com>
 <CAGduivwqAtheOrr_J0XWXR-9rjWNwPC9Y0dFCqKyBua+bir0ww@mail.gmail.com>
Message-ID: <d5b7097f-1af5-1130-21b2-fb3c1278a646@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have another reason to bump to 1.21, but experience the same 
difficulties in getting the configure step right. What would be a 
sensible way to avoid depending on autoconf/automake?

Background: I experience file ownership issues when doing a 'cp -a' 
inside fakeroot 1.20.2. I tracked it down to the bump commit (from 
1.18.4). Not sure what is causing it, but I just tried 1.21 and all is 
well again.


regards,
Andreas

Am 04.10.2016 um 16:39 schrieb Maxime Hadjinlian:
> On Tue, Oct 4, 2016 at 4:35 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Tue,  4 Oct 2016 13:53:20 +0200, Maxime Hadjinlian wrote:
>>
>>> In this version, the configure and Makefile are not provided so we need
>>> to generate them using the 'bootstrap' script included in the source.
>>
>> This is super annoying.
>>
>> First, your patch is wrong because the bootstrap script most likely
>> needs autoconf and automake, possibly libtool as well, and you haven't
>> added these to the fakeroot dependencies.
>>
>> But above all, it means that you would now be adding the build of
>> autoconf and automake to *every* Buildroot build (since essentially
>> host-fakeroot is always built). This is really annoying.
>>
>> So I'd prefer if we just took the Debian patch that works around the
>> original problem.
> OK, will resend.
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
