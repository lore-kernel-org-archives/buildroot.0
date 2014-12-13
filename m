From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Dec 2014 22:37:59 +0100
Subject: [Buildroot] [PATCH v2] package/opkg: disable tests and manpages
In-Reply-To: <1418477307-17867-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 13 Dec 2014 14:28:27 +0100")
References: <1418477307-17867-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87a92rqlhk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Changeset f1d3e09 (Build shared libraries only as the default) broke the
 > opkg package.

 > opkg wants to link its testsuite statically with the internal libopkg.
 > But in a shared-only build, there is no static library.

 > Since for Buildroot we do not care about tests, just disable them.

 > Fixes numerous build failures;
 >     http://autobuild.buildroot.net/results/ddf/ddf4b38c1df73b00b76be71db3f1eb8b1d932c55/
 >     http://autobuild.buildroot.net/results/c1c/c1c9a21b6583c9ef3ddd32681bb13cf91a218e8c/
 >     http://autobuild.buildroot.net/results/284/284bf7d6f9cebf8633143ca1ce15154de941805f/
 >     ...

 > Disable manpages at the same time.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>

 > ---
 > Note: we could also easily patch the Makefiles to not require a static
 > link, and that works quite well, too. But upstream has changed quite a
 > lot in this respect, so that change would not be upstreamable. Better
 > just disable tests as we do not use them anyway.

 > ---
 > Changes v1 -> v2:
 >   - add patch description

Committed, thanks.

-- 
Bye, Peter Korsgaard
