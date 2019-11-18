From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 18 Nov 2019 08:34:20 +0100
Subject: [Buildroot] [PATCH] package/libupnp18: bump to version 1.8.5
In-Reply-To: <20191114095808.38abb979@windsurf>
References: <20191104140151.14746-1-joerg.krause@embedded.rocks>
 <20191114095808.38abb979@windsurf>
Message-ID: <ca996524cb84475dd852dc4b61b8ff32797fa955.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2019-11-14 at 09:58 +0100, Thomas Petazzoni wrote:
> Hello J?rg,
> 
> On Mon,  4 Nov 2019 15:01:50 +0100
> J?rg Krause <joerg.krause@embedded.rocks> wrote:
> 
> > Drop patches included in new version. No need for autoreconf
> > anymore.
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> >  ...-configure.ac-fix-build-with-openssl.patch | 51 -------------
> > ------
> >  ...tach-detached-thread-the-result-is-u.patch | 39 --------------
> >  package/libupnp18/libupnp18.hash              |  6 +--
> >  package/libupnp18/libupnp18.mk                |  4 +-
> >  4 files changed, 4 insertions(+), 96 deletions(-)
> >  delete mode 100644 package/libupnp18/0001-configure.ac-fix-build-
> > with-openssl.patch
> >  delete mode 100644 package/libupnp18/0002-Do-not-try-to-detach-
> > detached-thread-the-result-is-u.patch
> 
> This version bump broke the build of the gerbera package:
> 
>   http://autobuild.buildroot.net/?reason=gerbera%
> 
> Reverting libupnp18 to 1.8.4 fixes the gerbera build issue.
> 
> Could you have a look ?

The issue has been fixed upstream [1] and meanwhile Fabrice Fontaine
submitted a patch [2].

[1] https://github.com/gerbera/gerbera/commit/1476d7a90673a870091044fcc0307f5bcaeb24be
[2] https://patchwork.ozlabs.org/patch/1196425/

J?rg
