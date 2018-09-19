From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 19 Sep 2018 17:04:18 +0200
Subject: [Buildroot] [PATCH 2/8] libsepol: bump to version 2.8
In-Reply-To: <CANQCQpagx-3u4mPF=am23GY=D+YUmxgmXuiFe_-5do8ReSfX_A@mail.gmail.com>
References: <20180916184606.27835-1-fontaine.fabrice@gmail.com>
 <20180916184606.27835-2-fontaine.fabrice@gmail.com>
 <CANQCQpagx-3u4mPF=am23GY=D+YUmxgmXuiFe_-5do8ReSfX_A@mail.gmail.com>
Message-ID: <20180919150418.GB14081@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Sep 19, 2018 at 09:24:28AM -0500, Matthew Weber wrote:
> Fabrice,
> 
> On Sun, Sep 16, 2018 at 1:46 PM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > - Remove first patch (already in version):
> >   https://github.com/SELinuxProject/selinux/commit/f8532f17731c82df9956aa1c92f7fb08bd65bf05
> > - Update second and third patch
> > - Pass SHLIBDIR=/usr/lib because by default it is set to /lib and LIBDIR is set to
> >   $(PREFIX)/lib (with PREFIX=/usr)
> > - Add hash for license file
> 
> Thank you for this bump!
> 
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...-follow-standard-semantics-for-DESTD.patch | 109 ------------------
> >  ...y.patch => 0001-support-static-only.patch} |  16 +--
> >  ...ve.patch => 0002-revert-ln-relative.patch} |  10 +-
> >  package/libsepol/libsepol.hash                |   5 +-
> >  package/libsepol/libsepol.mk                  |  10 +-
> >  5 files changed, 25 insertions(+), 125 deletions(-)
> >  delete mode 100644 package/libsepol/0001-libsepol-build-follow-standard-semantics-for-DESTD.patch
> >  rename package/libsepol/{0002-support-static-only.patch => 0001-support-static-only.patch} (68%)
> >  rename package/libsepol/{0003-revert-ln-relative.patch => 0002-revert-ln-relative.patch} (68%)
> >
> > diff --git a/package/libsepol/0001-libsepol-build-follow-standard-semantics-for-DESTD.patch b/package/libsepol/0001-libsepol-build-follow-standard-semantics-for-DESTD.patch
> > deleted file mode 100644
> > index 1daf7206d3..0000000000
> > --- a/package/libsepol/0001-libsepol-build-follow-standard-semantics-for-DESTD.patch
> > +++ /dev/null
> > @@ -1,109 +0,0 @@
> > -libsepol: build: follow standard semantics for DESTDIR and PREFIX
> 
> When building libsepol as a host package, it looks like the
> prefix/destdir stuff isn't quite right with this update.  I get the
> following attempt of host-libsepol installing the library in my host
> system.
> 
> 2018-09-19T09:18:57 test -d /lib || install -m 755 -d /lib
> 2018-09-19T09:18:57 install -m 755 libsepol.so.1 /lib
> 2018-09-19T09:18:57 install: cannot create regular file
> '/lib/libsepol.so.1': Permission denied
> 2018-09-19T09:18:57 Makefile:87: recipe for target 'install' failed
> 2018-09-19T09:18:57 make[3]: *** [install] Error 1
> 2018-09-19T09:18:57 Makefile:10: recipe for target 'install' failed
> 2018-09-19T09:18:57 make[2]: *** [install] Error 2
> 2018-09-19T09:18:57 package/pkg-generic.mk:233: recipe for target
> '/home/gitlab-runner/builds/target_build/build/host-libsepol-2.8/.stamp_host_installed'
> failed
> 
> Matt

I think that DESTDIR should be provided in the installation step here.

Best regards
Marcus Folkesson
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180919/1d5c6c07/attachment.asc>
