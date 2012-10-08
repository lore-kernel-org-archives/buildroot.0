From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Oct 2012 11:01:13 +0200
Subject: [Buildroot] [PATCH v3] sylpheed: Fix includedir
In-Reply-To: <1349649599-12615-1-git-send-email-gvaxon@gmail.com>
References: <1349649599-12615-1-git-send-email-gvaxon@gmail.com>
Message-ID: <20121008110113.3032157c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Valentine Barshak,

On Mon,  8 Oct 2012 02:39:59 +0400, Valentine Barshak wrote:
> The sylpheed headers are installed to $(DESTDIR)$(includedir),
> while DESTDIR is $(TARGET_DIR) and includedir is set to
> $(STAGING_DIR)/usr/include in the SYLPHEED_CONF_OPT.
> Thus, the full staging directory path is created in the
> target root filesystem, which is wrong.
> 
> The includedir was set to staging include because sylpheed
> incorrectly adds includedir to its include path, and does
> not cross-compile with the default includedir set to
> /usr/include.
> 
> This removes includedir setting and also removes it from
> include paths in Makefiles to prevent using host headers
> from /usr/include. The same approach is used in the OE.
> 
> Signed-off-by: Valentine Barshak <gvaxon@gmail.com>

If you have the time, it would be great to submit a patch to the
upstream project in order to fix this problem.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
