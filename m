From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 11:25:13 +0200
Subject: [Buildroot] [PATCH v2] libpam-tacplus: new package
In-Reply-To: <1440087386-10139-1-git-send-email-giovanni.zantedeschi@datacom.ind.br>
References: <1440087386-10139-1-git-send-email-giovanni.zantedeschi@datacom.ind.br>
Message-ID: <20150828112513.6a58891d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giovanni,

On Thu, 20 Aug 2015 13:16:26 -0300, giovanni.zantedeschi wrote:
> From: "Giovanni Zantedeschi" <giovanni.zantedeschi@datacom.ind.br>
> 
> Signed-off-by: Giovanni Zantedeschi <giovanni.zantedeschi@datacom.ind.br>
> ---
>  Changes v1 -> v2:
>    - Using Library instead of Lib (suggested by Ryan Barnett)
>    - Improved package description (suggested by Thomas Petazzoni)
>    - Added project site to description (suggested by Ryan Barnett)
>    - Changed download method (suggested by Ryan Barnett)
>    - Added dependency of linux-pam
>    - Using LIBPAM_TACPLUS_CONF_ENV instead of LIBPAM_TACPLUS_CONF_OPTS (suggested by Thomas Petazzoni)
> ---
>  package/Config.in                        |  1 +
>  package/libpam-tacplus/Config.in         | 10 ++++++++++
>  package/libpam-tacplus/libpam-tacplus.mk | 18 ++++++++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 package/libpam-tacplus/Config.in
>  create mode 100644 package/libpam-tacplus/libpam-tacplus.mk

Thanks for this new version! I've applied to the next branch, after
doing a few changes:

    [Thomas:
      - change the inclusion location in package/Config.in to be with the
        other linux-pam plugins.
      - fix indentation of the Config.in file.
      - fix build of the package when a toolchain without SSP support is
        used.
      - fix installation location of the PAM module: it was installed in
        /usr/lib/security, while all other PAM modules are in
        /lib/security.
      - adjust the ordering of the variables in the .mk file to be a bit
        more logical.
      - remove passing of $(TARGET_CONFIGURE_OPTS) in <pkg>_CONF_ENV as it
        is not needed: it is already done by the autotools-package
        infrastructure.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
