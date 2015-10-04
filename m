From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 18:35:15 +0200
Subject: [Buildroot] [PATCH] squashfs: Add lz4 hc compression
In-Reply-To: <CAO8h3eGcP2kKFDWaa3iUUzYOhF=5Jw+jzNci1o2=C=0GQY5QSg@mail.gmail.com>
 ("Matthias \=\?utf-8\?Q\?Wei\=C3\=9Fer\=22's\?\= message of "Sun, 4 Oct 2015
 18:05:15 +0200")
References: <1439279901-4337-1-git-send-email-m.weisser.m@gmail.com>
 <87lhbk871v.fsf@dell.be.48ers.dk>
 <CAO8h3eGcP2kKFDWaa3iUUzYOhF=5Jw+jzNci1o2=C=0GQY5QSg@mail.gmail.com>
Message-ID: <87si5qlhh8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthias" == Matthias Wei?er <m.weisser.m@gmail.com> writes:

Hi,

>> Is there ever any use case for enabling lz4 WITHOUT the high compression
 >> option? The only drawback is somewhat slower filesystem creation, right?
 >> Perhaps we can just adjust the existing lz4 option to use -Xhc?

 > I also thought about that. But didn't want to change anything existing.
 >> From my point of view there is no reason not to use the high
 > compression mode. Actually the Linux kernel does exactly this
 > when LZ4 compression is activated. The compression speed is
 > still in the range of zlib compression and therefore not that slow.

Indeed. Ok, then I think we should just adjust the existing lz4 option
to use the hc mode.

Committed with that fixed, thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
