From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 22:35:17 +0100
Subject: [Buildroot] [PATCHv2 1/2] support/dependencies: add a check for
 python3
In-Reply-To: <20190312223525.17360-1-romain.naour@gmail.com>
References: <20190312223525.17360-1-romain.naour@gmail.com>
Message-ID: <20190315223517.70eb1824@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Mar 2019 23:35:24 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Since version 2.29, glibc requires python 3.4 or later to build the GNU C Library [1].
> 
> We add a new check to verify the version of python3 interpreter installed on the host.
> If no suitable python3 interpreter is found, define BR2_PYTHON3_HOST_DEPENDENCY to add
> host-python3 in package dependencies when needed.
> 
> [1] https://www.sourceware.org/ml/libc-alpha/2019-01/msg00723.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, with one change (see below). Thanks!

> +# Set this to either 3.4 or higher, depending on the highest minimum
> +# version required by any of the packages bundled in Buildroot. If a
> +# package is bumped or a new one added, and it requires a higher
> +# version, our package infra will catch it and whine.

Yann complained about this comment, and particularly the last sentence.
In fact to me, even the first sentence doesn't make much sense. So I
dropped the entire paragraph when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
