From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Aug 2015 22:56:00 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libserial: bump to version
 0.6.0rc2
In-Reply-To: <1438295004-5934-1-git-send-email-joerg.krause@embedded.rocks>
References: <1438295004-5934-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150823225600.37bad21a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 31 Jul 2015 00:23:24 +0200, J?rg Krause wrote:
> Also:
>   * Update patch #1
>   * Remove patch #2, fixed upstream
>   * add new dependency to boost
>   * use hashes from sourceforge
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes in v2:
>   * Fix selecting package boost (Thomas Petazzoni)
> ---
>  .../libserial/0001-disable-python-bindings.patch    | 21 +++++++++++----------
>  .../libserial/0002-add-missing-header-include.patch | 15 ---------------
>  package/libserial/Config.in                         |  8 ++++++--
>  package/libserial/libserial.hash                    |  5 +++--
>  package/libserial/libserial.mk                      |  3 ++-
>  5 files changed, 22 insertions(+), 30 deletions(-)
>  delete mode 100644 package/libserial/0002-add-missing-header-include.patch

Applied to next after doing the following changes:

    [Thomas:
     - add locally calculated sha256 hash
     - show the Config.in comment about toolchain dependencies only when
       BR2_PACKAGE_BOOST_ARCH_SUPPORTS is set.]
    
Also, the SourceForge page of libserial indicates that the project has
now moved to Github: https://github.com/crayzeewulf/libserial/. If you
have the time to 1/ send a Buildroot patch to use Github as the
upstream rather than SourceForge and 2/ upstream a patch to make the
Python binding optional, it would be great.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
