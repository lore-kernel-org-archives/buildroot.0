From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Aug 2017 16:09:06 +0200
Subject: [Buildroot] [PATCHv2] fs/squashfs: honour the number of
 parallel jobs
In-Reply-To: <CANn-YGRT2J1GuHu0efq6OhGCoJ9v0PyzmrcSRTfXkRoKyQkD-g@mail.gmail.com>
References: <20170806154102.24807-1-yann.morin.1998@free.fr>
 <CANn-YGRT2J1GuHu0efq6OhGCoJ9v0PyzmrcSRTfXkRoKyQkD-g@mail.gmail.com>
Message-ID: <7f6220fd-6c9d-72a7-8364-d76b3065f18f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-08-17 16:33, Clayton Shotwell wrote:
> Yann,
> 
> On Sun, Aug 6, 2017 at 10:41 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>
>> By default, mksquashfs uses all the CPUs available, like us with
>> BR2_JLEVEL=0.
> 
> This ends up using the number of CPUs available plus 1. I tested this on my
> machine and it worked. I do still see the extended attributes issue
> that I posted
> in https://bugs.busybox.net/show_bug.cgi?id=10141.
> 
>> However, by setting BR21_JLEVEL to non-zero, a user volutarily limits
>> the number of jobbs allowed to run concurrently (for various reasons,
>> like this is not a priority task on the machine; or like the
>> autobuilders, to spread the load accross multiple runs without
>> overloading the machine).
>>
>> So, propagate tthe parallelisn settings down to mksquashfs, to repect
>> the user's will.
>>
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> 
> Tested-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

 Thanks. I'm not sure if I should apply this to next or to master. It doesn't
really fix anything, so I'm inclined to put it in next...

 For the real mksquashfs issue, do we have a way to find out what goes wrong
exactly? From what I've read, it's not even clear if it's mksquashfs or fakeroot
that is at fault...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
