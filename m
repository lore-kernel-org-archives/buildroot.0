From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 23:14:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: Add support
 without gettext
In-Reply-To: <20190312222035.16834-1-vadim4j@gmail.com>
References: <20190312222035.16834-1-vadim4j@gmail.com>
Message-ID: <20190312231451.6dde5f3b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Wed, 13 Mar 2019 00:20:35 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> Add custom ecryptfs-common script which provides gettext wrapper as
> function which checks at runtime if there is gettext tool, if no - the
> "echo" will be used instead. Each script which uses gettext is
> patched with including this ecryptfs-common script.
> 
> The patch for ecryptfs-utils only inserts hard-coded (w/o using
> @prefix@/lib/@PACKAGE@ variables) path to the ecryptfs-common, it is
> very small and trivial, it allows to easy support new bumped version.
> 
> gettext package is now selected automatically only if NLS is enabled.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  ...cho-instead-of-gettext-if-it-does-not-exi.patch | 117 +++++++++++++++++++++
>  package/ecryptfs-utils/Config.in                   |   2 +-
>  package/ecryptfs-utils/ecryptfs-common             |  33 ++++++
>  package/ecryptfs-utils/ecryptfs-utils.mk           |   6 ++
>  4 files changed, 157 insertions(+), 1 deletion(-)
>  create mode 100644 package/ecryptfs-utils/0003-utils-Use-echo-instead-of-gettext-if-it-does-not-exi.patch
>  create mode 100755 package/ecryptfs-utils/ecryptfs-common

Thanks for this proposal. I would actually perfer if ecryptfs-common
was part of the ecryptfs-utils patch, and this patch be submitted
upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
