From: Assaf Inbal <shmuelzon@gmail.com>
Date: Tue, 13 Aug 2013 12:16:13 +0200
Subject: [Buildroot] [PATCH 12/12] orbit: New package
In-Reply-To: <20130813115310.2522cd9f@skate>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-12-git-send-email-shmuelzon@gmail.com>
 <20130813115310.2522cd9f@skate>
Message-ID: <CADwac6Bj9pmesPbGmm1fxw362_eo=OsaGjDpXRbv46-H=0jn2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas,

Thanks for taking the time to do this.

 * Remove the wsapi build-time dependency, since there is apparently no
>    build-time dependency for orbit (it's just some Lua code that gets
>    copied to the target)
>
Yes, you are correct.

>  * Remove the 'rings' run-time dependency since I couldn't find an
>    indication that it was needed for Orbit.
>
You're right again, it's actually WSAPI that needs Rings and Orbit needs
WSAPI.

> Also, I've noticed that Orbit appears to use Xavante, though you
> haven't selected it. I wasn't sure on this one, so I left as it was,
> but it'd be good to check this.
>
As far as I understand it (though I never actually tried a different web
server), WSAPI provides an abstraction layer on top of a web server, and
Orbit uses that abstraction. So, there shouldn't be any dependency on
Xavante directly, just a web server that WSAPI supports. But, WSAPI should
be the one to enforce this.
 Good day,
Assaf
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130813/811d9544/attachment-0001.html>
