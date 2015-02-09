From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Feb 2015 22:48:11 +0100
Subject: [Buildroot] [PATCH 1/1] batctl: new package
In-Reply-To: <1423513338-3958-1-git-send-email-zettelmeyerj@goooglemail.com>
References: <1423513338-3958-1-git-send-email-zettelmeyerj@goooglemail.com>
Message-ID: <20150209224811.2919e067@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jens Zettelmeyer,

On Mon,  9 Feb 2015 20:22:18 +0000, Jens Zettelmeyer wrote:
> Signed-off-by: Jens Zettelmeyer <zettelmeyerj@goooglemail.com>
> ---
>  package/Config.in          |  1 +
>  package/batctl/Config.in   | 12 ++++++++++++
>  package/batctl/batctl.hash |  2 ++
>  package/batctl/batctl.mk   | 21 +++++++++++++++++++++
>  4 files changed, 36 insertions(+)
>  create mode 100644 package/batctl/Config.in
>  create mode 100644 package/batctl/batctl.hash
>  create mode 100644 package/batctl/batctl.mk

Thanks, I've applied your patch to the next branch, with a small number
of modifications:

    [Thomas:
     - remove trailing whitespace
     - remove "# libnl" comment in Config.in
     - remove BATCTL_SOURCE, which is not needed, since the default value
       is used
     - pass $(TARGET_CONFIGURE_OPTS) in the make environment, not as a
       make option, otherwise the CFLAGS += lines of batctl Makefile do
       not have any effect, and lead to not have the proper include path
       to the libnl header files.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
