From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:32:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11vnc: fix CVE-2020-29074
In-Reply-To: <20201203201013.585769-1-fontaine.fabrice@gmail.com>
References: <20201203201013.585769-1-fontaine.fabrice@gmail.com>
Message-ID: <20201205213259.3803f1bf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Dec 2020 21:10:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> scan.c in x11vnc 0.9.16 uses IPC_CREAT|0777 in shmget calls, which
> allows access by actors other than the current user.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ared-memory-segments-to-current-user.patch | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch

You have forgotten to update X11VNC_IGNORE_CVES, so I did that when
applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
