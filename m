From: Eric Malkowski <eric@bvwireless.net>
Date: Mon, 12 Nov 2007 13:36:39 -0500 (EST)
Subject: [Buildroot] My tweeks/fixes to get a mostly default system working
 w/ 2.6.23.1 kernel
Message-ID: <60190.74.94.141.114.1194892599.squirrel@bvwireless.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Where is your tree located?

I checked branches, tags etc. in svn and couldn't see per developer trees
or anything that looked obvious to me...

In looking at the trunk I see this in package/makefile.in:

# XXX: FIXME: We would need to grab MALLOC_GLIBC_COMPAT from the
uClibc.config
# Including it doesn't seem wise, grepping is ugly.. Suggestions?
# Does malloc return live pointer for malloc(0) ?
ifeq ($(MALLOC_GLIBC_COMPAT),y)
BR2_AC_CV_FUNC_MALLOC_0_NONNULL=ac_cv_func_malloc_0_nonnull=yes \
				gl_cv_func_malloc_0_nonnull=yes \
				ac_cv_func_realloc_0_nonnull=yes
else
BR2_AC_CV_FUNC_MALLOC_0_NONNULL=ac_cv_func_malloc_0_nonnull=no \
				gl_cv_func_malloc_0_nonnull=no \
				ac_cv_func_realloc_0_nonnull=no
endif

I have MALLOC_GLIBC_COMPAT=y in my uclibc config yet these options don't
seem to make it into my TARGET_CONFIGURE_OPTS or TARGET_CONFIGURE_ARGS.

perhaps your tree does something better...  if so I'll snag it once I know
where your tree is.  So far only quagga ran into this problem.

Thanks for the reply.

-Eric
