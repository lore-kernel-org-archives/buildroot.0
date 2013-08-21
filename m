From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 21 Aug 2013 09:08:55 +0200
Subject: [Buildroot] [PATCH 3/5] Makefile: test before search for kernel
 modules
In-Reply-To: <1376996584-4462-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1376996584-4462-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1376996584-4462-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52146787.1050501@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> The 'find $(TARGET_DIR)/lib/modules' used to find and strip kernel
> modules fails when no kernel modules have been installed. While the
> '|| true' prevents the entire build from failing, there are still some
> error messages displayed, which is not nice.
>
> Instead, test if the directory exists before doing the find. We also
> remove the '|| true' in order to really abort the build if a
> problematic error occurs.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
