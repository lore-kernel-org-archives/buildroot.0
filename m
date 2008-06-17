From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Jun 2008 09:16:43 +0200
Subject: [Buildroot] svn
	commit:	trunk/buildroot/toolchain/external-toolchain
In-Reply-To: <20080617042319.GA17083@cloud.net.au> (Hamish Moffatt's message
	of "Tue\, 17 Jun 2008 14\:23\:19 +1000")
References: <20080616122246.C821B3C987@busybox.net>
	<20080617042319.GA17083@cloud.net.au>
Message-ID: <87ej6wwmxw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 Hamish> On Mon, Jun 16, 2008 at 05:22:46AM -0700, jacmet at uclibc.org wrote:
 >> config BR2_TOOLCHAIN_EXTERNAL_PATH
 >> string "External toolchain path"
 >> -	default ""
 >> +	default "/path/to/staging_dir/usr"
 >> help
 >> Path to where the external toolchain is installed.

 Hamish> I've set this to "$(BR2_STAGING_DIR)/usr" here, which might
 Hamish> be a good default?

You think so? I wouldn't expect having buildroot install package stuff
together with the (potentially read only) external toolchain would be
a common setup.

 >> config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 >> string "External toolchain prefix"
 >> -	default ""
 >> +	default "$(ARCH)-linux"
 >> help
 >> This the the external toolchain prefix. For example:
 >> armeb-unknown-linux-gnu, mipsel-unknown-linux-gnu, etc.

 Hamish> Probably not a useful default, given that all the examples
 Hamish> have -gnu etc after them? Mine is armeb-linux-uclibcgnu here;
 Hamish> again you can probably construct something like
 Hamish> "$(ARCH)-$(BR2_GNU_TARGET_SUFFIX)".

Don't you have an armeb-linux symlink? For the stuff I compile (arm,
i386, ppc) there's symlinks from the arm-linux-uclibc-<whatever> to
arm-linux-<whatever>.

-- 
Bye, Peter Korsgaard
