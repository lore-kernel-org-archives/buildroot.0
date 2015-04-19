From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 15:02:18 +0200
Subject: [Buildroot] [PATCH v3 1/2] python-sip: new package
In-Reply-To: <1429430633-12267-1-git-send-email-gwenj@trabucayre.com>
References: <1429430633-12267-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150419150218.03a68880@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Sun, 19 Apr 2015 10:03:52 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Based on http://lists.busybox.net/pipermail/buildroot/2013-October/080830.html
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Cc: Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
> ---
> Changes v2 -> v3:
>  * bump version.
>  * suppress patch, --sysroot is enough.
>  * use qmake for configuration instead of sed.
>  * corrects LICENSE variable
>  * add depends on Qt
> Changes v1 -> v2:
>  * renames patch.
>  * add depends on BR2_INSTALL_LIBSTDCPP.
>  * add hash file.
>  * add license informations.
> ---
>  package/Config.in                  |  1 +
>  package/python-sip/Config.in       | 12 ++++++++++
>  package/python-sip/python-sip.hash |  4 ++++
>  package/python-sip/python-sip.mk   | 45 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 62 insertions(+)
>  create mode 100644 package/python-sip/Config.in
>  create mode 100644 package/python-sip/python-sip.hash
>  create mode 100644 package/python-sip/python-sip.mk

I've applied, but after doing a certain amount of changes:

    [Thomas:
     - fix license information: it is a "or" between the SIP license,
       GPLv2 and GPLv3
     - the target version of python-sip does *not* need the host version
       of python-sip, it can build perfectly fine without it. python-qt
       will need host-python-sip, but there's no need to have this
       dependency between python-sip and host-python-sip.
     - add support for Python 3, since the package could also be enabled
       for Python 3.
     - add <pkg>_BUILD_CMDS for host and target variants, so that the
       build does not take place when doing the installation.
     - use HOST_MAKE_ENV and TARGET_MAKE_ENV where appropriate.
     - fix indentation.
     - propagate the thread and mmu dependencies from Qt.
     - extend the Config.in help text.]

See the final result at
http://git.buildroot.net/buildroot/commit/?id=72578e1883c98cea00d5f0cdac8d49ee6f93f532.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
