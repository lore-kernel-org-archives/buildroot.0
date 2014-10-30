From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Thu, 30 Oct 2014 10:50:00 +0100
Subject: [Buildroot] [PATCH] inetutils: new package
In-Reply-To: <20141030094018.GH1759@tarshish>
References: <1414624048-37143-1-git-send-email-kaszak@gmail.com>
 <852735167.27218624.1414655605361.JavaMail.root@openwide.fr>
 <CABbD_XB2q_Vqn0cyJgHjeCPtLUrbC=rt7=VxLJhNwkX819Lu_A@mail.gmail.com>
 <20141030094018.GH1759@tarshish>
Message-ID: <CABbD_XDXmwU5QgT0i=g=zs_13fBWPdv2Bn+WfFZMDU_YX8er+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Buildroot handles these "race conditions" with the <package>_DEPENDENCIES
variables.
I added Busybox as one (if selected), so Inetutils will always win over
Busybox (that is probably
unnecessary btw, Busybox should always be built before other packages - but
I'm not sure in cases, where
Busybox is built, but not the default init system nor shell).
The other packages who provide anything related to inetutils are not yet
added, but of course they can be added
to act as dependencies.
The question is, why do anybody want to compile and use different
implementations of one program? I mean what
could be the use case?

Best regards,
Karoly


On Thu, Oct 30, 2014 at 10:40 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi K?roly,
>
> On Thu, Oct 30, 2014 at 10:37:49AM +0100, K?roly Kasza wrote:
> > indeed there are many programs in inetutils, that are also provided by
> > other packages.
> > I decided to split the package into 6 separate parts, so "one does not
> > simply" need to compile/carry everything :)
> > Inetutils is the GNU implementation of these, the user can choose
> whatever
> > fits best for him/her.
>
> But you should consider what happens when one selects both versions. Which
> one
> should "win"? We can't leave it to chance.
>
> baruch
>
> > My primary reason for adding Inetutils is telnet (and telnetd), which are
> > not provided by anything else, if
> > the user chooses not to use Busybox.
> >
> > On Thu, Oct 30, 2014 at 8:53 AM, Jeremy Rosen <jeremy.rosen@openwide.fr>
> > wrote:
> >
> > > ----- Mail original -----
> > > > GNU Inetutils is a collection of common network programs.
> > > > Clients included:
> > > > dnsdomainname, ftp, hostname, ifconfig, logger, ping, ping6, rcp,
> > > > rexec, rlogin, rsh, talk, telnet, tftp, traceroute, whois
> > >
> > > ifconfig and hostname are already in the package "net-tools" are they
> > > related ? is that a different provider for the package ?
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>



-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141030/b5d30d27/attachment.html>
