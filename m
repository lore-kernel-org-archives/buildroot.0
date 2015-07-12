From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 14:41:12 +0200
Subject: [Buildroot] [PATCH 7/7] qpid-proton: new package
In-Reply-To: <1436624110-20428-7-git-send-email-luca@lucaceresoli.net>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
 <1436624110-20428-7-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150712144112.6df1bb94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Sat, 11 Jul 2015 16:15:10 +0200, Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/Config.in                                  |  1 +
>  ...fix-C-compiler-detection-with-_ARG1-_ARG2.patch | 52 ++++++++++++++++++++++
>  package/qpid-proton/Config.in                      | 17 +++++++
>  package/qpid-proton/qpid-proton.hash               |  2 +
>  package/qpid-proton/qpid-proton.mk                 | 28 ++++++++++++
>  5 files changed, 100 insertions(+)
>  create mode 100644 package/qpid-proton/0001-proton-c-fix-C-compiler-detection-with-_ARG1-_ARG2.patch
>  create mode 100644 package/qpid-proton/Config.in
>  create mode 100644 package/qpid-proton/qpid-proton.hash
>  create mode 100644 package/qpid-proton/qpid-proton.mk

Applied after doing a bunch of fixes:

    [Thomas:
       - Do not define QPID_PROTON_VERSION_MAJOR, and use proto-* instead,
         as suggested by Arnout.
       - Use QPID_PROTO_VERSION in QPID_PROTON_SITE, as suggested by
         Arnout
       - Remove useless comma in the openssl test, as suggested by Arnout
       - Change the post install target hook to remove the
         /usr/share/proton-*/ directory entirely, and not just the
         examples, since it only contains some license and documentation
         files.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
