From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 29 May 2020 07:31:03 +0200
Subject: [Buildroot] make graph-size on Ubuntu 20.04,
 buildroot 2020.05-rc2
In-Reply-To: <CADJjDh9Ra-mLLY8JiRg84FyXbyg3zJmz52hyzgcfEx4tcBG7XA@mail.gmail.com>
References: <CADJjDh9gqQzv_owicJduiXkRJqCsgjRP6DjwnLPZK6A4Gd-YOA@mail.gmail.com>
 <20200528224500.595b5ffc@windsurf.home>
 <CADJjDh8P5ACNk4FA6sQAgpovvfp-2suWtXmV_ZLCXVreAC4v0A@mail.gmail.com>
 <20200528225438.4ffbf1c8@windsurf.home>
 <CADJjDh9Ra-mLLY8JiRg84FyXbyg3zJmz52hyzgcfEx4tcBG7XA@mail.gmail.com>
Message-ID: <CAB0FRsscsRqahxLRAPd7O5U0R_=mCbbKApt=ijGP-3kc9kAxUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeu. 28 mai 2020 ? 23:31, Todd Sampson <sampsonats@gmail.com> a ?crit :

> dfr at cmake:~/m9k2/buildroot$ ll /usr/bin/python
> lrwxrwxrwx 1 root root 7 Apr 15 06:45 /usr/bin/python -> python2*
>
> I set the link back to python3 and now it works!
>
>
On Ubuntu 20.04, the packet `python-is-python3` does this job.

Fran?ois


> Thanks!!
>
> On Thu, May 28, 2020 at 4:54 PM Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> wrote:
>
>> Hello,
>>
>> Please use Reply-All when replying, to keep the mailing list in Cc,
>> thanks.
>>
>> On Thu, 28 May 2020 16:49:11 -0400
>> Todd Sampson <sampsonats@gmail.com> wrote:
>>
>> > dfr at cmake:~/m9k2/buildroot$ sudo apt install python3-matplotlib
>> > [sudo] password for dfr:
>> > Reading package lists... Done
>> > Building dependency tree
>> > Reading state information... Done
>> > python3-matplotlib is already the newest version (3.1.2-1ubuntu4).
>> > 0 upgraded, 0 newly installed, 0 to remove and 84 not upgraded.
>> > dfr at cmake:~/m9k2/buildroot$ make graph-size
>> > *You need python-matplotlib to generate the size graph*
>> > make[1]: *** [Makefile:904: graph-size] Error 1
>> > make: *** [Makefile:84: _all] Error 2
>>
>> Then this means that your /usr/bin/python is pointing to
>> /usr/bin/python2. The script being "make graph-size",
>> support/scripts/size-stats, simply uses "/usr/bin/env python", which it
>> assumes is your default interpreter, which should have matplotlib
>> installed.
>>
>> Is is the standard Ubuntu 20.04 behavior to have python point to
>> python2, but no longer provide python-matplotlib. This looks odd. Have
>> you changed your /usr/bin/python perhaps ?
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200529/2e9de752/attachment.html>
