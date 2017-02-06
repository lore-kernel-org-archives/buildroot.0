From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 6 Feb 2017 16:18:15 -0500
Subject: [Buildroot] [V2 1/1] ntp: security bump to verserion 4.2.8p9
In-Reply-To: <91082fe8-697b-f4c9-a154-e74ab462a138@mind.be>
References: <20170206141225.2311-1-aduskett@codeblue.com>
 <20170206155817.5e945678@free-electrons.com>
 <1486393216.2005.19.camel@codeblue.com>
 <20170206160232.7513524b@free-electrons.com>
 <91082fe8-697b-f4c9-a154-e74ab462a138@mind.be>
Message-ID: <CAFSsvmqWkJqiUOnCtJh0eJmtqqVJdCZ1wh8uBVSy4bAZbcPFuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After doing some digging into the source code, it looks like there
are two new files: include/libssl_compat.h and libssl_compat.c

These files are now referenced in quite a few places, all of which
would take quite a bit of time to unwind.

I would suggest leaving openssl as a dependency unless somebody else
wants to take a crack at cleaning it up.

On Mon, Feb 6, 2017 at 10:23 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 06-02-17 16:02, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Mon, 6 Feb 2017 15:00:16 +0000, Adam Duskett wrote:
>>
>>> That's the million dollar question!  As far as I can tell, it's a
>>> real decision from upstream, as many of the files now include
>>> libssl_compat.h, however if you want, I can try to play around
>>> with them and see if they are 100% mandatory or not.
>>
>> That would be useful, yes.
>
>  It's really weird that they introduce such a dependency in a p8 -> p9 bump...
>
>  Regards,
>  Arnout
>
Oh I agree! But it looks like that's exactly what has happened, even if
by accident!

> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

Adam
