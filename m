From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Aug 2018 18:36:44 +0200
Subject: [Buildroot] [PATCH 2/3] docs/manual: expand on why using a
 branch name is not supported
In-Reply-To: <7f01fc03df91561ce5163e1e300d36f2c642f913.1533400367.git.yann.morin.1998@free.fr>
References: <cover.1533400367.git.yann.morin.1998@free.fr>
 <7f01fc03df91561ce5163e1e300d36f2c642f913.1533400367.git.yann.morin.1998@free.fr>
Message-ID: <20180804183644.63b7ec0c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Aug 2018 18:33:04 +0200, Yann E. MORIN wrote:

> ++
> +.Note:
> +Using a branch name as +FOO_VERSION+ is not supported, because it does
> +not and can not work as people would expect it should:
> ++
> +  1. Due to local caching, Buildroot will not re-fetch the repository,
> +     so people that expect to be able to follow the remote repository
> +     will be quite surprised and disapointed;

disappointed with two "p"

> +  2. if the user removes the local cache, then the build is no longer
> +     reproducible, because the remote repository may change any time
> +     between two builds, and people will be quite surprised and
> +     disapointed.

Ditto here.

But in fact more importantly than removing the local cache, it means
that between two developers building the same Buildroot configuration,
they won't be building the same state of the source code. I think this
is more important than a user voluntarily removing stuff from its local
cache.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
