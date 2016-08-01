From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Aug 2016 23:39:19 +0200
Subject: [Buildroot] [PATCH] i2c-tools: depend on BUSYBOX_SHOW_OTHERS
In-Reply-To: <20160801232427.14d92770@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 1 Aug 2016 23:24:27 +0200")
References: <1469973369-5445-1-git-send-email-bgolaszewski@baylibre.com>
 <20160801232427.14d92770@free-electrons.com>
Message-ID: <87h9b4np88.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sun, 31 Jul 2016 15:56:09 +0200, Bartosz Golaszewski wrote:
 >> As of version 1.25.0 busybox by default includes a nearly complete
 >> implementation of i2c-tools. Hide the upstream version unless the
 >> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS option is selected.
 >> 
 >> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
 >> ---
 >> package/i2c-tools/Config.in | 1 +
 >> 1 file changed, 1 insertion(+)

 > Applied to master, thanks. However, I noticed that the Busybox symlinks
 > are installed in usr/sbin, while the full-blown i2c-tools binaries are
 > installed in usr/bin. Perhaps we should install the i2c-tools binaries
 > in usr/sbin, to follow what Busybox does, and have i2c-tools add
 > busybox to its DEPENDENCIES when busybox is enabled, so that it
 > overwrites the Busybox symlinks?

 > Peter?

Yes, I think that would be a good idea. E.G. Debian also install them
into usr/sbin:

https://packages.debian.org/stretch/amd64/i2c-tools/filelist

-- 
Venlig hilsen,
Peter Korsgaard 
