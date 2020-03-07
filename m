From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 7 Mar 2020 22:28:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump to version 2.64.0
In-Reply-To: <20200307220648.7df62529@windsurf.home>
References: <20200306211458.54107-1-james.hilliard1@gmail.com>
 <20200307220648.7df62529@windsurf.home>
Message-ID: <20200307222843.6889675c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 7 Mar 2020 22:06:48 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri,  6 Mar 2020 14:14:58 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> >  ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
> > -LIBGLIB2_CONF_OPTS += -Dlibmount=true
> > +LIBGLIB2_CONF_OPTS += -Dlibmount=enabled
> >  LIBGLIB2_DEPENDENCIES += util-linux
> >  else
> > -LIBGLIB2_CONF_OPTS += -Dlibmount=false
> > +LIBGLIB2_CONF_OPTS += -Dlibmount=disabled
> >  endif
>
> Any reason for this change ? It is not explained in the commit log, and
> it's not obvious why it is needed.
>
> Could you give a few more details?

The option was changed from type boolean to type feature:

-- build/libglib2-2.62.4/meson_options.txt	2019-12-19 17:33:15.000000000 +0100
+++ build/libglib2-2.64.0/meson_options.txt	2020-02-27 17:12:52.000000000 +0100
@@ -30,8 +30,8 @@
        description : 'build with xattr support')

 option('libmount',
-       type : 'boolean',
-       value : true,
+       type : 'feature',
+       value : 'auto',
        description : 'build with libmount support')

 option('internal_pcre',

Regards,
Peter

>
> Thanks,
>
> Thomas
