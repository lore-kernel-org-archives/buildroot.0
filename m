From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 22:04:11 +0100
Subject: [Buildroot] [PATCH] hidapi: new package
In-Reply-To: <1447692852-21669-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1447692852-21669-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151117220411.349143fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 16 Nov 2015 16:54:12 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/Config.in          |    1 +
>  package/hidapi/Config.in   |   20 ++++++++++++++++++++
>  package/hidapi/hidapi.hash |    2 ++
>  package/hidapi/hidapi.mk   |   27 +++++++++++++++++++++++++++
>  4 files changed, 50 insertions(+), 0 deletions(-)
>  create mode 100644 package/hidapi/Config.in
>  create mode 100644 package/hidapi/hidapi.hash
>  create mode 100644 package/hidapi/hidapi.mk

Applied to next, with a few changes:

    [Thomas:
     - use BR2_INIT_SYSTEMD instead of BR2_PACKAGE_SYSTEMD for the
       libgudev handling. This is consistent with what we do in libmbim,
       modem-manager and network-manager. Only udisks is diverging from
       this by using BR2_PACKAGE_SYSTEMD.
     - Fix the license info: it is GPLv3 *or* BSD-3c *or* the specific
       HIDAPI license. Added LICENSE-orig.txt to LICENSE_FILES.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
