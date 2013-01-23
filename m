From: Willy Lambert <lambert.willy@gmail.com>
Date: Wed, 23 Jan 2013 18:08:04 +0100
Subject: [Buildroot] Boost integration
In-Reply-To: <87ham73n37.fsf@dell.be.48ers.dk>
References: <CAKvQZ_1g6_KHpdyYQ6H-pk6T5gx-qsW6SvaF7XBb2JJCSf7cLg@mail.gmail.com>
 <201301222220.14854.yann.morin.1998@free.fr>
 <CAKvQZ_0f+7B8N5Fp0O6tDUxYYeuUd+wD-92-ec-hvR8KzfjDoA@mail.gmail.com>
 <CAKvQZ_2XrayYK1DuVAUCDQkoeOHqv6iB2QT0b-pKy_y7AXv2bA@mail.gmail.com>
 <87libk2s6i.fsf@dell.be.48ers.dk>
 <CAKvQZ_2aGiOzea_GmPjW3x+chDSRTicmFB3+MDh8fsCgROZ8oA@mail.gmail.com>
 <87ham73n37.fsf@dell.be.48ers.dk>
Message-ID: <CAKvQZ_1fD8ujBzcAhReQLwgwfkLZFyB0KXM-VB+_q6-=d1j-HA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/1/23 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Willy" == Willy Lambert <lambert.willy@gmail.com> writes:
>
> Hi,
>
>  >> It's just a backup in case upstream is down/disappears.
>
>  Willy> Ok, then the current link to boost sourceforge seems broken, does
>  Willy> anyone else has the same problem ?
>
> Why? It works here:
>
> make boost-source
>>>> boost 1.52.0 Downloading
> --2013-01-23 16:59:21--  http://downloads.sourceforge.net/project/boost/boost/1.52.0/boost_1_52_0.tar.bz2
> Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.34.181.59
> Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.34.181.59|:80... connected.
> HTTP request sent, awaiting response... 302 Found
> Location: http://switch.dl.sourceforge.net/project/boost/boost/1.52.0/boost_1_52_0.tar.bz2 [following]
> --2013-01-23 16:59:21--  http://switch.dl.sourceforge.net/project/boost/boost/1.52.0/boost_1_52_0.tar.bz2
> Resolving switch.dl.sourceforge.net (switch.dl.sourceforge.net)... 130.59.138.21, 2001:620:0:1b::21
> Connecting to switch.dl.sourceforge.net (switch.dl.sourceforge.net)|130.59.138.21|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 54421709 (52M) [application/x-bzip2]
> Saving to: `/var/lib/downloads/boost_1_52_0.tar.bz2.tmp'
>
> Doesn't that work for you?

It is working here, don't know what happened yesterday at home.

>
>  Willy> I can propose you a patch to be abble to select different version a
>  Willy> boost in config menus. But I'm not sure that the current mk can handle
>  Willy> other versions.
>
> We normally don't support multiple versions of a package (except for a
> few minor exceptions) as that very soon becomes a support headache. Why
> would you want more than 1 version?

Because I need boost for another framework, that is not supporting
latest boost versions for now. And mainlining lastest boost support
there is not an option (it is at best a parrallel work to do on my
side, but I can't be on all fires ^^). And even if it compiles, I
don't want to play with versionning incompatibilities beetwen boost
and my framework. I need the 1.42.0 version.

The idea is not necessarily to maintain all boost versions, but if the
same script can handle several one, it's a pity to just propose the
last one.
Said differently, I have written the part that allow to choose a
version on the model of config files that choose kernels. If you are
interested in them I'll send you a patch. If you think you are Ok with
editing the boost.mk by hand I'll keep my patch locally.


>
>  Willy> I personnaly put Boost in Packages->Librairies->Boost. It is currently
>  Willy> in a "Other" menu.Don't you think it would be a better place ?
>
> What would Libraries->Boost contain? Just the single boost package?

yes, but boost is a family of librairies. But anyway I don't really
care about that.

> --
> Bye, Peter Korsgaard
