From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 22:37:50 +0100
Subject: [Buildroot] [PATCH 1/3] package/python-semantic-version: new
 package
In-Reply-To: <20210211051252.966385-1-james.hilliard1@gmail.com>
References: <20210211051252.966385-1-james.hilliard1@gmail.com>
Message-ID: <20210316223750.782a3864@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Wed, 10 Feb 2021 22:12:50 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-semantic-version.hash                   |  5 +++++
>  .../python-semantic-version.mk                     | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/python-semantic-version/python-semantic-version.hash
>  create mode 100644 package/python-semantic-version/python-semantic-version.mk

I have applied the series to master, after splitting PATCH 3/3 into one
patch doing the host-python-toml addition, and another patch for
host-python-setuptools-rust.

One word of caution though: host-python-setuptools-rust has host-rustc
in its dependencies, so packages that will use
host-python-setuptools-rust will have to be careful in their Config.in
dependencies to depend on the appropriate BR2_PACKAGE_HOST_RUSTC_*
options. Indeed host-rustc and Rust support for the target is not
available for all CPU architectures.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
