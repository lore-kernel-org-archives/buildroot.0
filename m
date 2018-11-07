From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 7 Nov 2018 20:06:10 +0100
Subject: [Buildroot] [PATCH 2/3] graph-depends: split off
 get_version/get_depends into pkgutil.py
In-Reply-To: <20181107180753.GA4702@scaer>
References: <20170203205745.14488-1-patrickdepinguin@gmail.com>
 <20170203205745.14488-4-patrickdepinguin@gmail.com>
 <20181107180753.GA4702@scaer>
Message-ID: <CAAXf6LVC==B0Rb7-ZpDh=k2VyF4UJZYaamQ0hhhZzpS6z=Syrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,
El mi?., 7 nov. 2018 a las 19:07, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas DS, All,
>
> On 2017-02-03 21:57 +0100, Thomas De Schampheleire spake thusly:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > Functions to obtain the version and dependencies of a package from Python
> > can be useful for several scripts. Extract this logic out of graph-depends
> > into pkgutil.py.
>
> Coming back to this script, because I'm rewriting the way graph-depends
> gets the dependency tree. When you said "useful for several scripts,"
> did you expect it to be useful to scripts that are not in Buildroot
> (e.g. user-local scripts)?

Yes, exactly. We are using the logic from pkgutil from another python
script and want to avoid code duplication.
This particular script is not something that upstream accepts, i.e.
generating opkg files for specific packages (and for that, we need to
know the dependencies and versions of each package).

Best regards,
Thomas
