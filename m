From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 16 Jan 2020 17:52:07 +0100
Subject: [Buildroot] [PATCH] infra: add the transient download mechanism
In-Reply-To: <20200116153541.GI22540@scaer>
References: <20200115203753.12110-1-yann.morin.1998@free.fr>
 <534f269547ead6d86e7a571978b54d79cd24cd0d.camel@orolia.com>
 <20200116103120.7b41295a@windsurf>
 <CAOf5uwmX0vdPFW9s9fC64Q7DFvQGCWdSqZy4GjEPrryy8Sa9ZA@mail.gmail.com>
 <20200116110306.5c91286b@windsurf>
 <CAOf5uw=m8DVBh_o0WLyR2__7OkhkXMVv-VX7JJ2Rm7WyJs1csw@mail.gmail.com>
 <20200116153541.GI22540@scaer>
Message-ID: <CAOf5uw=XRC2fEKqaexAq+85Uy++iL_2MpU3R7-u3PWPs2Zm25w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Thu, Jan 16, 2020 at 4:35 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Michael, All,
>
> On 2020-01-16 11:15 +0100, Michael Nazzareno Trimarchi spake thusly:
> > On Thu, Jan 16, 2020 at 11:03 AM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> > > > We are using a similar setup of Nicolas. Right now we have
> > > > CI and reproducible build using external tools. What I would like to solve
> > > > with buildroot is:
> > > >
> > > > - make the build reproducible
> > > > - implement topic build on custom patch using CI
> > > > - make tagging and branching easy
> > > Could you give more details, because these items are quite vague/fuzzy,
> > > and I don't understand from a very practical point of view what you
> > > mean. Could you describe some example workflow, what would be your
> > > expectation of Buildroot's behavior, etc.
>
> I have to admit that, like Thomas, I do not completely understand what
> you're doing or trying to achieve...
>
> > Suppose you have this manifest
> [--SNIP--]
> > This one describe the project and we have override part for the
> > project in the manifest. For each version we can tag
> > and each repo and create a snapshot manifest of the project.
> > Manifest will have revison set to revision="refs/tags/<some tag>"
> >
> > If I need to emit a release starting from some tag I can branch it and
> > apply patch on top of this branch and everything
> > can be stored as a separed manifest. Using jenkins trigger on topic
> > upload on gerrit we can easily build a version with some
> > patchset applied and if we want to re-build some version we can just
> > use the right tagged manifest
>
> I don't understand the problem that using repo solves.
>
> repo's manifest identifies packages, where they are from, and what
> version to use for each. That is exactly what the _VERSION and _SITE do
> in a .mk file to begin with...

Yes, definitely you can manage in the same way but having one point
as a manifest file where I can manage only project I change during the
product life avoid
me to change those when I create a specific tag. repo let me to tag
in automatic way and let buildroot to be tagged only on project that
I download from outside. I'm not saying here that the direction you are taken
is wrong but not all the companies will use it.
BTW my way to write english is terrible, I like having a desk and discuss
face to face. Make more sense to me to discuss in Fossdem if you will be there

Michael

>
> Using repo and a manifest only seem interesting when one wants to have
> their packages in the same directory structure as Buildroot, and use
> _SITE_METHOD = local. But in that case, a repo manifest is very akin to
> git submodules.
>
> And in that case, there is no need to be able to uses branches as
> _VERSION, since the packages sources jsut 'follow' the branch buildroot
> is on, and that repo checked out...
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



--
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
