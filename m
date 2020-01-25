From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 25 Jan 2020 15:20:06 -0700
Subject: [Buildroot] [PATCH v2 1/1] package/gensio: new package
In-Reply-To: <87sgk3u6ry.fsf@dell.be.48ers.dk>
References: <20200125054617.66028-1-james.hilliard1@gmail.com>
 <87sgk3u6ry.fsf@dell.be.48ers.dk>
Message-ID: <CADvTj4pexA1xb3MHvBfArPCoDitaCRsfkxm7Tk-H4HfboDtQ4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 25, 2020 at 4:14 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
>  > A library to abstract stream I/O like serial port, TCP, telnet, UDP,
>  > SSL, IPMI SOL, etc.
>
>  > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>  > ---
>  > Changes v1 -> v2:
>  >   - fix openssl path
>  >   - fix licenses
>  >   - fix config description format
>  > ---
>  >  DEVELOPERS                 |  1 +
>  >  package/Config.in          |  1 +
>  >  package/gensio/Config.in   |  8 ++++++++
>  >  package/gensio/gensio.hash |  7 +++++++
>  >  package/gensio/gensio.mk   | 29 +++++++++++++++++++++++++++++
>  >  5 files changed, 46 insertions(+)
>  >  create mode 100644 package/gensio/Config.in
>  >  create mode 100644 package/gensio/gensio.hash
>  >  create mode 100644 package/gensio/gensio.mk
>
> ..
>
>  > +++ b/package/gensio/gensio.mk
>  > @@ -0,0 +1,29 @@
>  > +################################################################################
>  > +#
>  > +# gensio
>  > +#
>  > +################################################################################
>  > +
>  > +GENSIO_VERSION = 1.3.3
>  > +GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
>  > +GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
>  > +GENSIO_LICENSE_FILES = COPYING.LIB COPYING
>  > +GENSIO_INSTALL_STAGING = YES
>  > +
>  > +GENSIO_CONF_OPTS += \
>
> Don't use += for the initial assignment.
>
>  > +    --without-openipmi \
>  > +    --without-swig \
>  > +    --without-python \
>  > +    --with-openssl=$(STAGING_DIR)/usr
>
> This deserves a comment explaining why we need to do this
> unconditionally of it openssl is enabled or not.
>
> Committed with these fixes, thanks.
Is the ser2net bump(https://patchwork.ozlabs.org/patch/1226210/) that
depended on this good now as well?
>
> --
> Bye, Peter Korsgaard
