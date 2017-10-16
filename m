From: Ismael Luceno <ismael@iodev.co.uk>
Date: Mon, 16 Oct 2017 16:53:20 -0300
Subject: [Buildroot] [PATCH v2] axel: bump to version 2.15
In-Reply-To: <20171016212352.4707159c@windsurf.lan>
References: <20171016191127.14704-1-ismael@iodev.co.uk>
 <20171016212352.4707159c@windsurf.lan>
Message-ID: <20171016195318.GA2965@pirotess.bf.iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/Oct/2017 21:23, Thomas Petazzoni wrote:
<...>
> > +AXEL_CFLAGS = -D_POSIX_C_SOURCE=200112L
> > +AXEL_CONF_OPTS = \
> > +	ac_cv_prog_cc_c99=-std=c99 \
> > +	CFLAGS="$(TARGET_CFLAGS) $(AXEL_CFLAGS)"
> 
> Why do you need these? It should be explained in the commit log, or
> perhaps even better with a short comment.

ac_cv_prog_cc_c99 is needed because autoconf's C99 check requires
wchar_t.

The define is to build against uClibc, it will be fixed upstream with
the next release.

I'll send another version of the patch.
