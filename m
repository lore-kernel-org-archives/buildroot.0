From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 22:49:42 +0100
Subject: [Buildroot] [PATCH] package/thrift: force boost libdir to
 staging/usr/lib/
In-Reply-To: <1424734147-26811-1-git-send-email-romain.naour@openwide.fr>
References: <1424734147-26811-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150308224942.1d258c2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 24 Feb 2015 00:29:07 +0100, Romain Naour wrote:
> Libtool append the sysroot path (lt_sysroot) with the libdir value found in
> the libstdc++.la file only with bfin toolchain.
> 
> Path/to/sysroot/opt/uClinux/bfin-linux-uclibc/lib/gcc/bfin-linux-uclibc/4.3.5/libstdc++.so
> 
> The issue disappears when --with-boost=$(STAGING_DIR) is removed.
> So instead of using --with-boost=$(STAGING_DIR), use
> --with-boost-libdir=$(STAGING_DIR)/usr/lib to give the path to boost's
> libraries.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ae2/ae274693b953dd569c3ff63c532e2fc9553b5002/
> 
> And many more
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

The proposed solution is a little bit of a hack, but libtool is just a
pain, and the solution you propose is not invasive at all, so I applied
this.

Thanks a lot for spending on this long standing issue!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
