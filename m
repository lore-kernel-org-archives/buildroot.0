From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 20:57:31 +0100
Subject: [Buildroot] [PATCH] package/erlang: patch the tarball
In-Reply-To: <20200210165824.22245-1-johan.oudinet@gmail.com>
References: <20200210165824.22245-1-johan.oudinet@gmail.com>
Message-ID: <20200219205731.1894861d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Feb 2020 17:58:24 +0100
Johan Oudinet <johan.oudinet@gmail.com> wrote:

> Remove the lib/ssl/src/deps directory before configuring the package.
> Otherwise, during the compilation of the ssl app, it may fails by
> looking for logger.hrl in the wrong location (bootstrap/lib/kernel
> instead of lib/kernel).
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/erlang/erlang.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Thanks for this work! A link to the autobuilder failure fixed by this
commit was missing in your commit log, so I added it and applied to
master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
