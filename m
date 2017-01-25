From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:46:54 +1300
Subject: [Buildroot] [PATCH v2] udpxy: new package
In-Reply-To: <1483371929-13907-8-git-send-email-david.bachelart@bbright.com>
References: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
 <1483371929-13907-8-git-send-email-david.bachelart@bbright.com>
Message-ID: <20170125234654.5cc128df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Jan 2017 16:45:29 +0100, David Bachelart wrote:
> Signed-off-by: David Bachelart <david.bachelart@bbright.com>
> ---
> Changes v1 -> v2:
>   - Fix url in mk file (trailing slash)
> ---
>  package/Config.in        |  1 +
>  package/udpxy/Config.in  |  8 ++++++++
>  package/udpxy/udpxy.hash |  4 ++++
>  package/udpxy/udpxy.mk   | 24 ++++++++++++++++++++++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/udpxy/Config.in
>  create mode 100644 package/udpxy/udpxy.hash
>  create mode 100644 package/udpxy/udpxy.mk

Thanks for the patch. I've applied to Buildroot, with the following
changes:

    [Thomas:
     - keep only sha256 hash, not needed to have md5 and sha1 when sha256 is
       provided
     - add BR2_USE_MMU dependency, since the program uses fork()
     - remove UDPXY_MAKE_OPTS, and use the appropriate options during the
       build and install steps directly
     - use TARGET_MAKE_ENV in the build and install steps]

Also, I've committed a change to the DEVELOPERS file that adds you as a
contact for this package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
