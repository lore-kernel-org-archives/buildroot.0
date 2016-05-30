From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 18:10:27 +0200
Subject: [Buildroot] [PATCH] package/lttng-babeltrace: fix static build
In-Reply-To: <20160529211418.4937-1-s.martin49@gmail.com> (Samuel Martin's
 message of "Sun, 29 May 2016 23:14:18 +0200")
References: <20160529211418.4937-1-s.martin49@gmail.com>
Message-ID: <87vb1v1q8c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > This change adds a patch fixing libuuid detection on static build.
 > Fixes:
 >   http://autobuild.buildroot.net/results/43b/43b98ddf9eb44152ed9ac4a98d887af14831d8da/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>


> diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
 > index 5de77fb..c59dd19 100644
 > --- a/package/lttng-babeltrace/lttng-babeltrace.mk
 > +++ b/package/lttng-babeltrace/lttng-babeltrace.mk
 > @@ -10,7 +10,9 @@ LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 >  LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (test code)
 >  LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 
 > -LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 > +LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
 > +
 > +LTTNG_BABELTRACE_AUTORECONF = YES

We normally add a comment why autoreconf is needed so we don't forget to
remove it when bumping the version / removing the patch, so I've added
one and committed, thanks.

-- 
Bye, Peter Korsgaard
