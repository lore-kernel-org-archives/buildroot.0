From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 22:27:31 +0200
Subject: [Buildroot] [PATCH 1/1] libgit2: New package.
In-Reply-To: <20180214111351.4801-2-nicolas.cavallari@green-communications.fr>
References: <20180214111351.4801-1-nicolas.cavallari@green-communications.fr>
 <20180214111351.4801-2-nicolas.cavallari@green-communications.fr>
Message-ID: <20180520222731.6757154c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Feb 2018 12:13:51 +0100, Nicolas Cavallari wrote:
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  DEVELOPERS                   |  3 +++
>  package/Config.in            |  1 +
>  package/libgit2/Config.in    |  9 +++++++++
>  package/libgit2/libgit2.hash |  3 +++
>  package/libgit2/libgit2.mk   | 25 +++++++++++++++++++++++++
>  5 files changed, 41 insertions(+)
>  create mode 100644 package/libgit2/Config.in
>  create mode 100644 package/libgit2/libgit2.hash
>  create mode 100644 package/libgit2/libgit2.mk

So, I've applied to next, but I had to change quite a few things that
were not really correct:

    [Thomas:
     - Do not select BR2_PACKAGE_ZLIB, because zlib is an optional
       dependency.
     - Handle optional dependencies in a more usual way in libgit2.mk:
       group the addition in _DEPENDENCIES and in _CONF_OPTS for a given
       library together.
     - libgit2 can optionally use libssh2, not libssh.
     - Add the optional dependency on zlib.
     - Always pass USE_ICONV=ON, the detection works perfectly fine, with
       both a C library providing iconv support built-in, and with
       libiconv. If neither provides iconv, it gets disabled automatically
       as expected.
     - Add libiconv as an optional dependency.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
