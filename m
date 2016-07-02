From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:32:50 +0200
Subject: [Buildroot] [PATCH v1 1/1] package: Add hid-replay package
In-Reply-To: <1467462242-35261-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1467462242-35261-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <20160702153250.63050235@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 15:24:02 +0300, Andy Shevchenko wrote:

> diff --git a/package/hid-replay/hid-replay.mk b/package/hid-replay/hid-replay.mk
> new file mode 100644
> index 0000000..0e021de
> --- /dev/null
> +++ b/package/hid-replay/hid-replay.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# hid-replay
> +#
> +################################################################################
> +
> +HID_REPLAY_VERSION = master

This is not good as it leads to non-reproducible builds: depending on
when a user starts the build, he will get a different result because
master might have evolved. Please use either a tag, or a full commit id.

> +HID_REPLAY_SITE = https://github.com/bentiss/hid-replay.git

Please use the github macro.

Also, please add a hash file, since the tarballs provided by github,
and used by our github macro.

Could you take those comments into account and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
