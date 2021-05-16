From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 13:38:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/bullet: needs wchar
In-Reply-To: <CAPi7W80Q9pBVCdGLmv61Pyh6wfToUQAHfLL5zLM4f+kSxgfWrw@mail.gmail.com>
References: <20210514211801.2261810-1-fontaine.fabrice@gmail.com>
 <20210515171550.GV2506@scaer> <20210515171657.GW2506@scaer>
 <CAPi7W80Q9pBVCdGLmv61Pyh6wfToUQAHfLL5zLM4f+kSxgfWrw@mail.gmail.com>
Message-ID: <20210516113854.GA2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-15 19:31 +0200, Fabrice Fontaine spake thusly:
> Le sam. 15 mai 2021 ? 19:17, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
> > On 2021-05-15 19:15 +0200, Yann E. MORIN spake thusly:
> > > On 2021-05-14 23:18 +0200, Fabrice Fontaine spake thusly:
> > > > bullet needs wchar since bump to version 3.09 in commit
> > > > 28b4947ed8f53c4edfbf8fef9304dc76480c01ca:
> > > >
> > > > /home/giuliobenetti/autobuild/run/instance-0/output-1/build/bullet-3.09/examples/ThirdPartyLibs/Gwen/Structures.h:42:14: error: 'wstring' in namespace 'std' does not name a type
> > > >    42 | typedef std::wstring UnicodeString;
> > > >       |              ^~~~~~~
> > > wstring is only ever used in tests and examples, and it seems we can
> > > disable both. Tests are already disabled, and it should be possible to
> > > disable exampels as well with -DBUILD_BULLET2_DEMOS=OFF
> > I mean, of course, if other wchar related stuff are not used in the
> > core...
> We're enabling demos since commit 5f154799b6ed772a0c028072996e110fac131508
> because upstream recommends to avoid changing any options, see:
> https://patchwork.ozlabs.org/project/buildroot/patch/20210430060545.1243461-1-fontaine.fabrice at gmail.com/

That's weord that upstream provides options to enable/disable parts of
the tree, but recomends not using them (because doing so breaks the
build)...

Oh well...

Thanks for the feedback! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
