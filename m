From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Jan 2020 16:35:41 +0100
Subject: [Buildroot] [PATCH] infra: add the transient download mechanism
In-Reply-To: <CAOf5uw=m8DVBh_o0WLyR2__7OkhkXMVv-VX7JJ2Rm7WyJs1csw@mail.gmail.com>
References: <20200115203753.12110-1-yann.morin.1998@free.fr>
 <534f269547ead6d86e7a571978b54d79cd24cd0d.camel@orolia.com>
 <20200116103120.7b41295a@windsurf>
 <CAOf5uwmX0vdPFW9s9fC64Q7DFvQGCWdSqZy4GjEPrryy8Sa9ZA@mail.gmail.com>
 <20200116110306.5c91286b@windsurf>
 <CAOf5uw=m8DVBh_o0WLyR2__7OkhkXMVv-VX7JJ2Rm7WyJs1csw@mail.gmail.com>
Message-ID: <20200116153541.GI22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2020-01-16 11:15 +0100, Michael Nazzareno Trimarchi spake thusly:
> On Thu, Jan 16, 2020 at 11:03 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > > We are using a similar setup of Nicolas. Right now we have
> > > CI and reproducible build using external tools. What I would like to solve
> > > with buildroot is:
> > >
> > > - make the build reproducible
> > > - implement topic build on custom patch using CI
> > > - make tagging and branching easy
> > Could you give more details, because these items are quite vague/fuzzy,
> > and I don't understand from a very practical point of view what you
> > mean. Could you describe some example workflow, what would be your
> > expectation of Buildroot's behavior, etc.

I have to admit that, like Thomas, I do not completely understand what
you're doing or trying to achieve...

> Suppose you have this manifest
[--SNIP--]
> This one describe the project and we have override part for the
> project in the manifest. For each version we can tag
> and each repo and create a snapshot manifest of the project.
> Manifest will have revison set to revision="refs/tags/<some tag>"
> 
> If I need to emit a release starting from some tag I can branch it and
> apply patch on top of this branch and everything
> can be stored as a separed manifest. Using jenkins trigger on topic
> upload on gerrit we can easily build a version with some
> patchset applied and if we want to re-build some version we can just
> use the right tagged manifest

I don't understand the problem that using repo solves.

repo's manifest identifies packages, where they are from, and what
version to use for each. That is exactly what the _VERSION and _SITE do
in a .mk file to begin with...

Using repo and a manifest only seem interesting when one wants to have
their packages in the same directory structure as Buildroot, and use
_SITE_METHOD = local. But in that case, a repo manifest is very akin to
git submodules.

And in that case, there is no need to be able to uses branches as
_VERSION, since the packages sources jsut 'follow' the branch buildroot
is on, and that repo checked out...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
