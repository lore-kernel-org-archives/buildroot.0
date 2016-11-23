From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 09:24:36 +0100
Subject: [Buildroot] [PATCH] Makefile: fix ignored trace at
 target-finalize
In-Reply-To: <20161122205333.9735-1-gael.portay@savoirfairelinux.com>
References: <20161122205333.9735-1-gael.portay@savoirfairelinux.com>
Message-ID: <20161123092436.270ba426@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 15:53:33 -0500, Ga?l PORTAY wrote:
> Make may throw an error (but ignored) trace when cleaning up the
> rootfs.
> 
> The target-finalize rule intends to remove the folder
> `$(TARGET_DIR)/usr/share' but this directory may still contain items
> (such as the `udhcpc' helper script) and causes the rmdir to fail.
> 
> The stderr output is redirected to /dev/null but it returns and error
> which is escaped by the leading `-'; but make reports an ignored-error.

Ah, what is the problem with that? Just the fact that there is this
"Error 1 (ignored)" message?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
