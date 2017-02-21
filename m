From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Feb 2017 22:03:23 +0100
Subject: [Buildroot] [PATCH v2] sslh: new package
In-Reply-To: <20170221211823.4137d10f@free-electrons.com>
References: <1485423636-8104-1-git-send-email-david.bachelart@bbright.com>
 <20170221211823.4137d10f@free-electrons.com>
Message-ID: <20170221210323.GB3347@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, David, All,

On 2017-02-21 21:18 +0100, Thomas Petazzoni spake thusly:
> On Thu, 26 Jan 2017 10:40:36 +0100, David Bachelart wrote:
> > Signed-off-by: David Bachelart <david.bachelart@bbright.com>
> > ---
> > Changes v1 -> v2:
> >   - rewrite patch (suggested by Thomas Petazzoni). sslh version is 
> >     extracted from git, but this version is corrupted if we use git 
> >     as VCS for buildroot. This new patch is a more flexible way to 
> >     handle this : the version is now extracted from git only if the
> >     sslh directory is handled by git
> >   - fix comment in Config.in file (suggested by Thomas Petazzoni)
> >   - rewrite init script (suggested by Thomas Petazzoni)
> >   - remove sslh.default file (suggested by Thomas Petazzoni)
> >   - fix sslh.mk file (suggested by Thomas Petazzoni)
> >     - indentation
> >     - version now includes "v" prefix
> >     - fix license
> >     - use install target of upstream makefile
> >   - register myself as developer for sslh in DEVELOPERS file
> > ---
> >  DEVELOPERS                                         |  1 +
> >  package/Config.in                                  |  1 +
> >  ...ion-while-building-sslh-in-a-larger-git-t.patch | 43 +++++++++++++++++++
> >  package/sslh/Config.in                             | 14 +++++++
> >  package/sslh/S35sslh                               | 48 ++++++++++++++++++++++
> >  package/sslh/sslh.hash                             |  4 ++
> >  package/sslh/sslh.mk                               | 28 +++++++++++++
> >  7 files changed, 139 insertions(+)
> >  create mode 100644 package/sslh/0001-secure-version-while-building-sslh-in-a-larger-git-t.patch
> >  create mode 100644 package/sslh/Config.in
> >  create mode 100644 package/sslh/S35sslh
> >  create mode 100644 package/sslh/sslh.hash
> >  create mode 100644 package/sslh/sslh.mk
> 
> This package is causing some build failures:
> 
>   http://autobuild.buildroot.net/?reason=sslh-v1.18
> 
> Could you investigate and provide a fix for this issue ?

The issue is caused by a UTF-* non-breaj sapce U+c2a0 on line 28 of the
script genver.sh. This should be replaced by an ASCII U+20 space.

It is usually invisible in most editors. I can see it because my vim has
a plugin that highlights such troll characters.

Patch incoming...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
