From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 16:13:03 +0200
Subject: [Buildroot] [PATCH 1/1] attr: bump to version 2.4.47
In-Reply-To: <CAEBucnA0ZwDr35-9wr7jA3Gu-6pR_xpy6iXQo_EqGCnKdE4aZw@mail.gmail.com>
References: <1369738614-31476-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20130528130703.694786e2@skate>
 <CAEBucnA0ZwDr35-9wr7jA3Gu-6pR_xpy6iXQo_EqGCnKdE4aZw@mail.gmail.com>
Message-ID: <20130528161303.126e7e64@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Tue, 28 May 2013 09:02:56 -0500, Spenser Gilliland wrote:

> I investigated this issue a while ago for fun and I don't think that
> patch ever worked.  Many (maybe all) of the autobuild failures on acl
> were because there was no static library of attr to link against.

Are you insinuating that my patch was not correct? :-) Come on, this
never happens to me!

If you look at 5ad2879a8bca386fa5c256a4286ccc928601cc1a, the purpose of
the patch was not really to fix *other* libraries linking against the
static version of attr, but rather fix the attr build process *itself*
which was crashing when BR2_PREFER_STATIC_LIB=y.

See
http://autobuild.buildroot.org/results/58a3d4113172813183d43fddc1248b35bd0c4994/build-end.log

That said, if other packages were still not able to link statically
against attr after that patch, then clearly it means that the patch was
not sufficient.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
