From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Fri, 31 Oct 2014 10:29:42 +0100
Subject: [Buildroot] [PATCH] inetutils: new package
In-Reply-To: <20141030125801.GO1759@tarshish>
References: <1414624048-37143-1-git-send-email-kaszak@gmail.com>
 <852735167.27218624.1414655605361.JavaMail.root@openwide.fr>
 <CABbD_XB2q_Vqn0cyJgHjeCPtLUrbC=rt7=VxLJhNwkX819Lu_A@mail.gmail.com>
 <20141030094018.GH1759@tarshish>
 <CABbD_XDXmwU5QgT0i=g=zs_13fBWPdv2Bn+WfFZMDU_YX8er+Q@mail.gmail.com>
 <20141030125801.GO1759@tarshish>
Message-ID: <CABbD_XDu4yyqHX=0JbMg-4WpLivg7K41X62F6+BMtPT6NVS-dA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Thu, Oct 30, 2014 at 1:58 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi K?roly,
>
> On Thu, Oct 30, 2014 at 10:50:00AM +0100, K?roly Kasza wrote:
> > Buildroot handles these "race conditions" with the <package>_DEPENDENCIES
> > variables.
> > I added Busybox as one (if selected), so Inetutils will always win over
> > Busybox (that is probably
> > unnecessary btw, Busybox should always be built before other packages -
> but
> > I'm not sure in cases, where
> > Busybox is built, but not the default init system nor shell).
> > The other packages who provide anything related to inetutils are not yet
> > added, but of course they can be added
> > to act as dependencies.
> > The question is, why do anybody want to compile and use different
> > implementations of one program? I mean what
> > could be the use case?
>
> You assume that the user is doing a deliberate choice when enabling
> net-tools
> or inetutils. This is often not the case. A user bringing up a networking
> device is very likely to enable both packages.

Well, "You become responsible forever for what you've tamed."
If you compile a Linux system from sources, you should know what you choose
to include.
Otherwise just use some precompiled distribution.
(You are of course right, that this is often not the case).


> The version that eventually
> lands in the target will now be determined by the build order, and that may
> change from one build to another.

Yes, it works like that.


> We generally want make build results as
> consistent as possible. So, at the very least, we should warn the user in a
> comment that depends on BR2_PACKAGE_NET_TOOLS. I'm not sure this is enough,
> though.

I don't think that would fit to the current Buildroot habits. In these
cases, where more than
one package provides the same tools, I tend to see the _DEPENDENCIES in .mk
files.
I think it is just decided by package maintainers which package's tool is
preferred over another.

I can make inetutils dependent on net-tools if net-tools is enabled, just
like I did with busybox.
However, what if the user wants it the other-way?
Debian solves this by introducing /etc/alternatives, but I think in
Buildroot it should just be
predefined which one to prefer.
Any suggestions?

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141031/2645174c/attachment.html>
