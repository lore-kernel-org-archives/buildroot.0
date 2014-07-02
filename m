From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Jul 2014 09:58:29 +0200
Subject: [Buildroot] [PATCH 1/1] libssh2: fix library search path issues
 when zlib support enabled
In-Reply-To: <53B3B9A5.9020803@mind.be>
References: <1403878684-11934-1-git-send-email-acoffignal@geral.com>
 <20140629163016.41256df2@free-electrons.com>
 <f8abef86a41446e6ac7848dfa49e9842@VMSMBX02.gpi.pri>
 <20140630140216.49d73fa4@free-electrons.com>
 <53B1590D.9040606@geral.com> <53B3A420.2090900@mind.be>
 <20140702092625.16c98f0d@free-electrons.com>
 <53B3B9A5.9020803@mind.be>
Message-ID: <20140702095829.79ba2c59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 02 Jul 2014 09:49:57 +0200, Arnout Vandecappelle wrote:

> > Alexandre, can you try to add LIBSSH2_AUTORECONF = YES to libssh2.mk,
> > in replacement to your fix?
> 
>  Don't bother, it won't help. This thing is defined in m4/lib-link.m4 (lines
> 154-155) within libssh2 itself. So we'll need to patch that file and _then_ run
> autoreconf.

So we need to patch that and send a fix upstream, no?

> > That being said, there are a number of packages for which we explicitly
> > pass a --with-<foo>=$(STAGING_DIR), so it's not completely crazy to do
> > the same for libssh2, no?
> 
>  Yes, but then it should be done for _all_ libraries used by libssh2, because it
> uses this $additional_libdir failure in a lot of places.

Indeed. Alexandre, could you have a look at this, either fixing the
root of the problem (best solution), or pass the --with-<foo> option
for all libraries that libssh2 can rely on?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
