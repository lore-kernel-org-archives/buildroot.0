From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 19:42:42 +0200
Subject: [Buildroot] [PATCH] package/grantlee: disable for nios2 and
 microblaze
In-Reply-To: <1464446842-15225-1-git-send-email-romain.naour@gmail.com>
References: <1464446842-15225-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160528194242.0d42ebb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 May 2016 16:47:22 +0200, Romain Naour wrote:

> +	depends on !(BR2_microblaze || BR2_nios2) # https://sourceware.org/bugzilla/show_bug.cgi?id=20173

We normally write this as:

	# ....
	depends on !BR2_microblaze && !BR2_nios2

So I've changed it this way.

Also, you forgot to propagate the new dependency to the comment, so
I've done that.

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
