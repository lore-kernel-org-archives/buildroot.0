From: =?UTF-8?Q?Andr=C3=A9_Erdmann?= <dywi@mailerd.de>
Date: Wed, 18 Mar 2015 17:03:54 +0100
Subject: [Buildroot] [PATCH v5 00/11] autobuild-run improvements
In-Reply-To: <20150315151009.2c61d5a1@free-electrons.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
 <20150315143448.72b386dc@free-electrons.com>
 <CAAXf6LVtbsFWBLooB2tN8OzjuR3VK7=QKLf0LdNHDpHz+zRtmg@mail.gmail.com>
 <20150315151009.2c61d5a1@free-electrons.com>
Message-ID: <CAGrucu26icYC5DSMTLf8LMufT8VD4tdpiNoe9gX_Zg2BAB_OEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2015-03-15 15:10 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Thomas De Schampheleire,
>
> On Sun, 15 Mar 2015 14:51:38 +0100, Thomas De Schampheleire wrote:
>
>> To understand better, some questions:
>> - you saw this situation once, with Python 2.6, but have been able to
>> successfully stop autobuild run with Ctrl-C with Python 2.6 on other
>> occasions?
>
> I just tried again, and same behavior. Here are the processes that
> remain:
>
> [...]
>
>> In my testing I have been using Python 2.7.
>> It could be that there is something different in Python 2.6, not sure.
>> I would need to look into this deeper, unless Andr? who seems to be
>> much more knowledgeable about Python has an idea?
>
> That would be nice :-)
>

I'll look into that - one thing to consider is that SIGINT of any form
gets also delivered to multiprocessing.Process instances, so putting a
"signal.signal(signal.SIGINT, signal.SIG_IGN)" before creating the
processes might help (line ~803; ugly workaround, actually). But I
doubt it's as easy as that..

-- 
Andr?
