From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 17 Jun 2008 20:47:54 +1000
Subject: [Buildroot] svn
	commit:	trunk/buildroot/toolchain/external-toolchain
In-Reply-To: <87ej6wwmxw.fsf@macbook.be.48ers.dk>
References: <20080616122246.C821B3C987@busybox.net>
	<20080617042319.GA17083@cloud.net.au>
	<87ej6wwmxw.fsf@macbook.be.48ers.dk>
Message-ID: <20080617104754.GA25850@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 17, 2008 at 09:16:43AM +0200, Peter Korsgaard wrote:
>  Hamish> On Mon, Jun 16, 2008 at 05:22:46AM -0700, jacmet at uclibc.org wrote:
>  >> config BR2_TOOLCHAIN_EXTERNAL_PATH
>  >> string "External toolchain path"
>  >> -	default ""
>  >> +	default "/path/to/staging_dir/usr"
>  >> help
>  >> Path to where the external toolchain is installed.
> 
>  Hamish> I've set this to "$(BR2_STAGING_DIR)/usr" here, which might
>  Hamish> be a good default?
> 
> You think so? I wouldn't expect having buildroot install package stuff
> together with the (potentially read only) external toolchain would be
> a common setup.

Well I've got one board ("tools", in local/tools/tools.config) to build
the toolchain which I then use as external toolchain to build several
other boards (all armeb-linux-uclibcgnu). So my toolchain lives in the
staging directory in the same tree.

This makes for a nice path-independent setup too.. other developers at
my company can check out the tree and build everything (including the
toolchain first) into any path they like.

So if this isn't a common approach then maybe it isn't a good default
after all.

> Don't you have an armeb-linux symlink? For the stuff I compile (arm,
> i386, ppc) there's symlinks from the arm-linux-uclibc-<whatever> to
> arm-linux-<whatever>.

Probably, I'll have to check tomorrow.

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
