From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Oct 2014 18:30:14 +0200
Subject: [Buildroot] [PATCH] libevent: use github call
In-Reply-To: <20141012181720.2b5dd0ee@free-electrons.com>
References: <1413129607-9134-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20141012181720.2b5dd0ee@free-electrons.com>
Message-ID: <CAGduivwSZEN-yMsGr2xpJZudy0PxcUhkxkOqmmpXLE4YGmBFtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all

On Sun, Oct 12, 2014 at 6:17 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> Sorry, but the title of your patch is wrong: it does *much* more than
> use the github call.
>
> The title of the commit should summarize the entirety of the patch, and
> then the rest of the description should go in the details of what the
> patch does.
Yes, forgot to amend my commit.
>
> On Sun, 12 Oct 2014 18:00:07 +0200, Maxime Hadjinlian wrote:
>> Add AUTORECONF as theses releases don't contains 'configure'
>> and such.
>>
>> Two patchs are added to make the autotools happy.
>> Theses patchs are already in upstream, waiting for a new release.
>
> Missing SoB line.
>
>> diff --git a/package/libevent/0001-Disable-building-tests-programs.patch b/package/libevent/0001-Disable-building-tests-programs.patch
>> new file mode 100644
>> index 0000000..65fd928
>> --- /dev/null
>> +++ b/package/libevent/0001-Disable-building-tests-programs.patch
>> @@ -0,0 +1,30 @@
>> +From a4fb64af00b76600f85416471a513c89dc89d769 Mon Sep 17 00:00:00 2001
>> +From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> +Date: Sun, 12 Oct 2014 17:12:22 +0200
>> +Subject: [PATCH 1/2] Disable building tests programs
>> +
>> +We are not really interested in building test programs.
>> +Moreover, these programs use fork() function that is not available on
>> +MMU-less architectures.
>> +
>> +Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>
> You are not the author of this patch, it was written by Gilles Tallis.
Sorry about that, some git am/rebase going awry. Will fix right away.
>
> Please use git format-patch -M to enable rename detection so we see
> that it's actually the other patch that has only be changed slightly
> and renamed.
>
>>  LIBEVENT_VERSION = 2.0.21
>> -LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
>> -LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
>> +LIBEVENT_SITE = $(call github,libevent,libevent,release-$(LIBEVENT_VERSION)-stable)
>>  LIBEVENT_INSTALL_STAGING = YES
>>  LIBEVENT_LICENSE = BSD-3c, OpenBSD
>>  LIBEVENT_LICENSE_FILES = LICENSE
>> +LIBEVENT_AUTORECONF = YES
>
> Why use the github function when a tarball is provided?
Only because we were using the github repository before, but we could
uses the tarball from the servers ? I don't know which is prefered ?
>
> Sorry, but patch unclear.
I'll respin right away.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
