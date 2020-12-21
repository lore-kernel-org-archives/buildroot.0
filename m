From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 10:26:47 +0100
Subject: [Buildroot] [PATCH] package/ncurses: don't attempt calling
 ldconfig in host-ncurses
In-Reply-To: <20201209145925.20850-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 9 Dec 2020 15:59:23 +0100")
References: <20201209145925.20850-1-patrickdepinguin@gmail.com>
Message-ID: <87czz3se5k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > The host-ncurses install step attempts to run ldconfig, causing a permission
 > failure:

 > cd /buildroot/output/host/lib && (ln -s -f libncurses.so.6.0 libncurses.so.6; ln -s -f libncurses.so.6 libncurses.so; )
 > test -z "" && /sbin/ldconfig
 > /sbin/ldconfig: Can't create temporary cache file /etc/ld.so.cache~: Permission denied
 > make[3]: [/buildroot/output/host/lib/libncurses.so.6.0] Error 1 (ignored)

 > The error is non-fatal and ignored, but confusing.

 > The ncurses makefiles already avoid calling ldconfig when DESTDIR is set
 > (target case) but for host-ncurses DESTDIR is empty and the output/host path
 > is passed via --prefix.

 > Pass an empty ac_cv_path_LDCONFIG to the configure step, so than ldconfig is
 > not called.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
