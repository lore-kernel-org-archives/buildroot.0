From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 16 Dec 2008 11:37:56 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <20081215234234.575aca77@surf>
References: <20081215220738.6F7173C6BA@busybox.net>
	<20081215234234.575aca77@surf>
Message-ID: <20081216003756.GA19127@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 15, 2008 at 11:42:34PM +0100, Thomas Petazzoni wrote:
> Le Mon, 15 Dec 2008 14:07:38 -0800 (PST),
> tpetazzoni at uclibc.org a ?crit :
> 
> > TARGET_PATH didn't contain $(STAGING_DIR)/usr/bin, which means that
> > programs installed in $(STAGING_DIR)/usr/bin were not considered for
> > execution during Buildroot build process. This was a problem with host
> > automake/autoconf/libtool, which could not be found.
> 
> BTW, I'm quite confused by the fact that we install host binaries and
> target binaries in $(STAGING_DIR). It means that during the build, we
> have target binaries considered for execution because they are in
> $(STAGING_DIR)/usr/bin, which is the the PATH during Buildroot
> execution.
> 
> Is there any reason for this ?
> 
> I would really find it cleaner to have a separate installation
> directory for host tools (like toolchain_build_ARCH/bin which contains
> a symlink to sed).

Yes it's a mess. There's host binaries like the compiler etc, and some
target binaries provided by various library packages eg openssl,
libjpeg.. 

We need to clean up the Python build situation too (eg build a proper
host Python for use in building target Python), but installing all of
that into the existing $(STAGING_DIR) will just make it worse.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
