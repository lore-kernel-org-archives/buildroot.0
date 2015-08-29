From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 18:17:41 +0200
Subject: [Buildroot] [PATCH 1/1] ibrdtn: new package
In-Reply-To: <1439038145-10822-1-git-send-email-tom_a_sparks@yahoo.com.au>
References: <1439038145-10822-1-git-send-email-tom_a_sparks@yahoo.com.au>
Message-ID: <20150829181741.05d171df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tom Sparks,

On Sat,  8 Aug 2015 22:49:05 +1000, Tom Sparks wrote:
> Signed-off-by: Tom Sparks <tom_a_sparks@yahoo.com.au>
> ---
>  package/ibrdtn/Config.in | 15 +++++++++++++++
>  package/ibrdtn/ibrdtn.mk | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 package/ibrdtn/Config.in
>  create mode 100644 package/ibrdtn/ibrdtn.mk

Applied to the next branch, after doing a number of changes:

    [Thomas:
      - Add missing include in package/Config.in to make the package
        appear in menuconfig.
      - Fix the comment dependencies: the comment should be shown either
        if C++ is not available *or* if threads are not supported.
      - Add a hash file.
      - Add missing dependency on host-pkgconf, since pkg-config is used
        to detect the availability of ibrcommon.
      - Remove the custom INSTALL_STAGING_OPTS and INSTALL_TARGET_OPTS:
        they are not needed since automake is used.
      - Make --with-compression conditional on whether zlib is available.
      - Add optional dependency on libglib2.
      - Add missing final newlines in .mk and Config.in files.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
