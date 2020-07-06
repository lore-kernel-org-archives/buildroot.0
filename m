From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Jul 2020 19:21:51 +0200
Subject: [Buildroot] [PATCH] package/dvb-apps: add hash file
In-Reply-To: <CANu7NGvssmqH8S9joP3-8hsgDNP6Q_1BP8PwR8s5Xx6knfWbnA@mail.gmail.com>
References: <20200704010533.1854-1-sergio.prado@e-labworks.com>
 <20200705145430.20cc4911@windsurf.home>
 <CANu7NGvssmqH8S9joP3-8hsgDNP6Q_1BP8PwR8s5Xx6knfWbnA@mail.gmail.com>
Message-ID: <20200706172151.GJ2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio, All,

On 2020-07-05 14:40 -0300, Sergio Prado spake thusly:
> > > diff --git a/package/dvb-apps/dvb-apps.hash b/package/dvb-apps/dvb-apps.hash
> > > new file mode 100644
> > > index 000000000000..a618cd7765d3
> > > --- /dev/null
> > > +++ b/package/dvb-apps/dvb-apps.hash
> > > @@ -0,0 +1,6 @@
> > > +# Locally computed:
> > > +sha256 ?099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645
> ?dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz
> >
> > Unfortunately, this doesn't work: it seems like our hashes for
> > Mercurial fetched packages are not reproducible:
> > ERROR: dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz has wrong sha256 hash:
> > ERROR: expected: 099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645
> > ERROR: got ? ? : 926208b7e711b4bab1a909ff9bf4e6ae54acdd30a46f5d5bd700ecb088fe1f57
> Indeed I removed? [8]sources.buildroot.net from the mirrors location and got the same error. What's?interesting is that I
> got the same hash as you. So the tar generated in our machines was exactly the same, but it is different from the one hosted in
> [9]sources.buildroot.net.

As I explained in my previous reply, is that the archive on s.b.o. was
generated before the hg backend was made reproducible. It now is.

[--SNIP--]
> I also notice that there is a path in the tar file metadata fetched from [12]sources.buildroot.net (the generated locally doesn't
> have this path).

Yes, see commit 76b51f90c0e; quoting:

    (The reason is that in the first case, a temporary file is created and
    then compressed, and gzip is adding the filename and its timestamp in
    the gzip header, while in the second case, there is no temporary file,
    and thus no timestamp and thus it is reproducible.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
