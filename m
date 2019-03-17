From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 16:23:04 +0100
Subject: [Buildroot] [PATCH-for-master 1/2] package/meson: don't install
 cross-compilation.conf during target-finalize
In-Reply-To: <20190225211147.14947-2-patrickdepinguin@gmail.com>
References: <20190225211147.14947-1-patrickdepinguin@gmail.com>
 <20190225211147.14947-2-patrickdepinguin@gmail.com>
Message-ID: <20190317162304.3410801f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Feb 2019 22:11:46 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
> Both files have a similar concept, they describe some flags/paths needed for
> compilation using respective build systems. One difference is that the meson
> file is added for external compilation, from the SDK, while the cmake file
> is used internally in Buildroot.
> 
> The 'problem' of using TARGET_FINALIZE_HOOKS for the meson file, is that it
> installs a 'host' file from target-finalize, which is conceptually incorrect
> and breaks the invariant that only TARGET_DIR is changed on a subsequent
> 'make' when everything was already built (i.e. only target-finalize is run).

In fact, I don't quite get what this commit is fixing. I don't really
understand what you call the "invariant that only TARGET_DIR is changed
on a subsequent make when everything was already built".

The current situation is not ideal because we create a file in
$(HOST_DIR) from target-finalize, but the proposed situation is also
not ideal because we create a file in $(HOST_DIR) from the staging
installation of a package. So I'd need to understand why the second
option has some advantages over the first, and that is currently
unclear.

Is it just for consistency for how the corresponding cmake file is
created ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
