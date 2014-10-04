From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 19:36:59 +0200
Subject: [Buildroot] [PATCH 2/2] package/leafnode2: New package
In-Reply-To: <1411898532-15625-2-git-send-email-bernd.kuhls@t-online.de>
References: <1411898532-15625-1-git-send-email-bernd.kuhls@t-online.de>
 <1411898532-15625-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141004193659.70a27eee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 28 Sep 2014 12:02:12 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                                  |    1 +
>  package/leafnode2/Config.in                        |    9 ++++++
>  .../leafnode2/leafnode2-0001-cross_makefile.patch  |   15 +++++++++
>  package/leafnode2/leafnode2.mk                     |   33 ++++++++++++++++++++
>  4 files changed, 58 insertions(+)
>  create mode 100644 package/leafnode2/Config.in
>  create mode 100644 package/leafnode2/leafnode2-0001-cross_makefile.patch
>  create mode 100644 package/leafnode2/leafnode2.mk

Applied, after doing quite a few changes:

    [Thomas:
      - Rewrap help text in Config.in
      - Improve cross-compilation patch to not call the 'amiroot' program
        on the host, while it is compiled for the target.
      - Use CONF_OPTS instead of CONF_OPT.
      - Use a pre-build hook rather than re-implementing the BUILD_CMDS
        entirely.
      - Also include COPYING file in license files.
      - License is LGPLv2.1, not LGPLv2.1+: only one file is LGPLv2.1+,
        the rest doesn't have any "or later" specification, so we assume
        it's only LGPLv2.1.]

If you could work with upstream to get proper cross-compilation
support, it would be great.

Also, it seems like the documentation recommends using a separate
non-root user to run leafnode2. Maybe leafnode2.mk should create such a
user?

In addition, maybe we should write somewhere in the help text that
leafnode2 only works through inetd, and mention the inetd line needed
to get it running? We generally like to have some minimal information
in Buildroot to get started with a given package.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
