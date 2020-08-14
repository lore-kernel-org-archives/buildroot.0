From: Andreas Hilse <andreas.hilse@googlemail.com>
Date: Fri, 14 Aug 2020 11:10:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to version 2.1.2
In-Reply-To: <20200813102505.2120931f@windsurf.home>
References: <20200812160843.24064-1-andreas.hilse@googlemail.com>
 <20200813102505.2120931f@windsurf.home>
Message-ID: <CANabuZfeN8HarJVQy1mAS0tf=943=KmvdUOmT=4RZHEUgw++9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> > - fixes: sysklogd 1.6 klogd with newer glibcs: kernel messages are logged to user facility
>
> I'd like to understand how disruptive/important this issue is. I.e,
> should we have this sysklogd version bump be considered as a bug fix?

You would only notice it when you changed the default syslog.conf to
filter user.* messages to somewhere else than /var/log/messages.
But yes, in our case I would see this as a bug fix as we suddenly saw
kernel messages written to our user.log after switching from buildroot
2016.08 to 2020.02.

> I think the license change should also be mentioned in the commit log,
> but that can be added when applying.
Ok.

Best regards
Andreas
