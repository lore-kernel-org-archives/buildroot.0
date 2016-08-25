From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 15:19:52 +0200
Subject: [Buildroot] [next PATCH 1/2] micropython: bump version to v1.8.3
In-Reply-To: <20160825110104.12223-1-judge.packham@gmail.com>
References: <20160825110104.12223-1-judge.packham@gmail.com>
Message-ID: <20160825151952.58f0e3bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 23:01:03 +1200, Chris Packham wrote:
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/micropython/micropython.hash | 2 +-
>  package/micropython/micropython.mk   | 9 ++++++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)

Thanks, I've applied to next. One comment below, though.

> +# When building from a tarball we don't have some of the dependencies that are in
> +# the git repository as submodules
> +MICROPYTHON_MAKE_OPTS = MICROPY_PY_BTREE=0
> +MICROPYTHON_MAKE_OPTS += MICROPY_PY_USSL=0

You could also package the corresponding dependencies as separate
packages in Buildroot. For example, it seems like the SSL support uses
axtls, which is a separate library available at
http://axtls.sourceforge.net/.

I'm not sure what is the dependency for the MICROPY_BY_BTREE option
though.

Alternatively, you could use the brand new MICROPYTHON_GIT_SUBMODULES =
YES option, which would tell our download logic to also fetch
submodules. *But* when the submodules are in fact external libraries
that could be separately packaged in Buildroot, we will very much
prefer this solution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
