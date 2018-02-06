From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Feb 2018 10:20:46 +0100
Subject: [Buildroot] [PATCH 4/5] support/docker: use a fixed Debian
 snapshot
In-Reply-To: <2fc6c71c-c2f5-9c90-e111-de25bde185eb@mind.be>
References: <cover.1517755438.git.yann.morin.1998@free.fr>
 <fc8ae732b7c23135bfc826ba28a49045c2dddd76.1517755438.git.yann.morin.1998@free.fr>
 <2fc6c71c-c2f5-9c90-e111-de25bde185eb@mind.be>
Message-ID: <20180206092046.GA28439@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-02-06 09:52 +0100, Arnout Vandecappelle spake thusly:
> On 04-02-18 15:44, Yann E. MORIN wrote:
> > Since we're now using a specific base image tag, we need to also use a
> > specific, stable repository to get additional packages from for this
> > image.
[--SNIP--]
> > diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
> > new file mode 100644
> > index 0000000000..789fb8fc17
> > --- /dev/null
> > +++ b/support/docker/apt-sources.list
> > @@ -0,0 +1,4 @@
> > +# Latest just before 20171210T000000Z:
> > +deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch main
> 
>  AFAIU, snapshot should resolve any date to the latest available snapshot, so
> http://snapshot.debian.org/archive/debian/20171210T000000Z/ should work as well
> here. It should redirect to exactly the same URLs.

Yeah, I knew about the latest-prior-to-given-date rule, but see below...

> Note thought that this
> doesn't work for the top-level, only for a specific release (because they are
> snapshotted at different times). So just clicking on the URL above won't work,
> but if you put dists/stretch after iti

For me, I even got http 500, and apt-get update would also fail from
time to time (about once for three).

That is indeed something I should have mentioned in the commit log.

> it redirects to
> http://snapshot.debian.org/archive/debian/20171209T220346Z/dists/stretch/

nd what's even weird ios that it now works, even for the debian-security
suite, which is not tagged at the same date:
    http://snapshot.debian.org/archive/debian-security/20171209T224618Z/dists/stretch/updates/

>  Anyway, OK for now, but something to keep in mind when it is bumped.

Yeah, I also would have preferred it, but as I said, it was sometimes
failing for me... :-/

Thanks for the feedback! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
