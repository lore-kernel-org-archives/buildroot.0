From: Barry Kauler <bkauler@gmail.com>
Date: Fri, 18 Mar 2011 20:37:36 +0800
Subject: [Buildroot] [buildroot] libdrm tries to compile before cairo
In-Reply-To: <AANLkTi=jMePwkivpVNHvqvP6SYS5GCtL0YMkNGnPb84m@mail.gmail.com>
References: <AANLkTinJmH7Jsb25KJY6WN5YZaHHKqRJO0ctNA3NmKog@mail.gmail.com>
	<AANLkTi=jMePwkivpVNHvqvP6SYS5GCtL0YMkNGnPb84m@mail.gmail.com>
Message-ID: <AANLkTi=M4XBRAqPRat9vfDJ0WgcA=PFWzFGG8KpnGeQm@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3/18/11, bruce bushby <bruce.bushby@gmail.com> wrote:
> Hi Barry
>
> I'm also new...so can't really offer anything beyond my recent experience.
> Could you past your "LIBDRM_DEPENDENCIES" line?
>
> I had some troubles adding "zeromq" until I added:
> ZEROMQ_DEPENDENCIES = e2fsprogs host-pkg-config host-e2fsprogs
>
> I suspect I don't need the "host-e2fsprogs" ..... it was only when I added
> "e2fsprogs" that everything worked.
>
> If you "de-select" libdrm and allow the build to finish and then run "make
> libdrm" ... does it then compile?
>
> My problem with zeromq complained that it couldn't find "uuid-dev" ....even
> though I had selected "uuid"....turned out "e2fsprogs" provides
> "uuid-dev"...just
> wondering if something similar applies to "cairo.h"
>

Bruce,
Thanks for the response. I have not really understood how Buildroot
works -- I have used T2-project many times, and that cross-compiles in
a true virtual environment -- but not Buildroot.

In Buildroot, libdrm does check if cairo is there and thinks it is,
but it isn't -- Buildroot actually checks my host environment and see
cairo is installed. That is a very confusing situation.

I can't de-select libdrm as it is a dependency of something else. I
will have to roll the package choices right back until it can be
deselected.

Regards,
Barry Kauler

>
>
>
>
>
>
>
>
>
>
>
> On Fri, Mar 18, 2011 at 10:40 AM, Barry Kauler <bkauler@gmail.com> wrote:
>
>> Hi, I am a first-time user of Buildroot. It has been chugging along
>> nicely, but libdrm has failed to compile.
>>
>> It reports that 'cairo.h' is missing. Which it is, cairo has not yet
>> been compiled in the target.
>>
>> So, using my own reasoning, I added "cairo" onto LIBDRM_DEPENDENCIES
>> variable in file 'libdrm.mk'. I also deleted
>> output/build/libdrm-2.4.19.
>>
>> However, running 'make' again, it tries to compile libdrm again, and
>> fails.
>>
>> How do I make it compile cairo (and its deps) before libdrm?
>>
>> Regards,
>> Barry Kauler
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
