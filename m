From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Nov 2010 10:44:36 +0100
Subject: [Buildroot] [PATCH] linux: drop LDFLAGS override
In-Reply-To: <1289985078-3333-1-git-send-email-vapier@gentoo.org>
References: <1289985078-3333-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101117104436.3114edb1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Nov 2010 04:11:18 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> The current linux code overrides LDFLAGS that the kernel itself might
> be setting up.  Looking at the history, there doesn't seem to be any
> reason for this override.  It was added in ea8b1fa6a60705 without any
> logic.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

The code in linux/linux.mk was more or less loosely inspired from the
old Linux compilation code, which (I checked) already had this LDFLAGS
thing, from the very beginning (commit
453dca995ee437b2f6fc3e0a6e4e2b4317346dae from october 2007). Obviously,
I don't see why passing TARGET_LDFLAGS is needed, so:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
