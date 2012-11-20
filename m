From: Richard Braun <rbraun@sceen.net>
Date: Tue, 20 Nov 2012 18:38:29 +0100
Subject: [Buildroot] [PATCH] toolchain-crosstool-ng: install
 libthread_db if appropriate
In-Reply-To: <201211201836.50589.yann.morin.1998@free.fr>
References: <1353430797-26819-1-git-send-email-rbraun@sceen.net>
 <201211201836.50589.yann.morin.1998@free.fr>
Message-ID: <20121120173829.GA30968@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 20, 2012 at 06:36:50PM +0100, Yann E. MORIN wrote:
> > +ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
> > +CTNG_LIBS_LIB += libthread_db.so
> 
> Shouldn't that be:
>     CTNG_LIBS_USR_LIB += libthread_db.so

I don't think so, at least I've always seen libthread_db installed in
/lib, and it does work this way.

-- 
Richard Braun
