From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 1 Aug 2013 17:40:13 +0200
Subject: [Buildroot] host-gettext build failure (emacs dependency?)
In-Reply-To: <20130801163125.142e2fce@skate>
References: <CAAXf6LVsJ6uZbeiRPHcru+Q0J8J2+Xn5ixsTCe4LNZpOm1e67Q@mail.gmail.com>
 <20130801163125.142e2fce@skate>
Message-ID: <CAAXf6LVG43YTPSAHzwsuo1ut-xx-BPXFpTQk205ANqXU=iH5Ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 1, 2013 at 4:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 1 Aug 2013 15:58:06 +0200, Thomas De Schampheleire wrote:
>
>> But more generally, I wonder why host-gettext needs/uses emacs at all.
>> The target gettext already disables several things:
>> GETTEXT_CONF_OPT += \
>>         --disable-libasprintf \
>>         --disable-acl \
>>         --disable-openmp \
>>         --disable-rpath \
>>         --disable-java \
>>         --disable-native-java \
>>         --disable-csharp \
>>         --disable-relocatable \
>>         --without-emacs
>>
>> but the host-gettext seems to be full. Do we really need e.g. emacs
>> support for host-gettext? What about csharp, java, native-java?
>
> Hum:
>
> HOST_GETTEXT_CONF_OPT = \
>         --disable-libasprintf \
>         --disable-acl \
>         --disable-openmp \
>         --disable-rpath \
>         --disable-java \
>         --disable-native-java \
>         --disable-csharp \
>         --disable-relocatable \
>         --without-emacs
>
> So we also disable Emacs support and lots of other stuff.
>
> I guess you don't have 0d4133edfedd8ca641db39d3eec9dc7146c8fa4e, which
> has been merged post 2013.05.

Aha!
Thanks for the pointer. This was indeed observed on a 2013.05 release.
I'll backport the patch...

Thanks again,
Thomas
