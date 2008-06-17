From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Jun 2008 15:45:04 +0200
Subject: [Buildroot] svn
	commit:	trunk/buildroot/toolchain/external-toolchain
In-Reply-To: <20080617104754.GA25850@cloud.net.au> (Hamish Moffatt's message
	of "Tue\, 17 Jun 2008 20\:47\:54 +1000")
References: <20080616122246.C821B3C987@busybox.net>
	<20080617042319.GA17083@cloud.net.au>
	<87ej6wwmxw.fsf@macbook.be.48ers.dk>
	<20080617104754.GA25850@cloud.net.au>
Message-ID: <87fxrcmazj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 Hamish> I've set this to "$(BR2_STAGING_DIR)/usr" here, which might
 Hamish> be a good default?
 >> 
 >> You think so? I wouldn't expect having buildroot install package stuff
 >> together with the (potentially read only) external toolchain would be
 >> a common setup.

 Hamish> Well I've got one board ("tools", in
 Hamish> local/tools/tools.config) to build the toolchain which I then
 Hamish> use as external toolchain to build several other boards (all
 Hamish> armeb-linux-uclibcgnu). So my toolchain lives in the staging
 Hamish> directory in the same tree.

So they all put libraries / headers in the same staging_dir? Doesn't
that give problems with packages detecting optional stuff at compile
time that might not be available for a specific variant (E.G. one
variant has expat, and another doesn't - Some configure script checks
for expat and finds it in staging_dir even though it isn't going to be
there at runtime).

The same with the packages offering different versions.

I think a more common setup would be to install the toolchain
somewhere common (/opt/<whatever>) and then have multiple boards using
the same toolchain/c library but potentially different set of
packages(-versions) and their own staging_dir.

-- 
Bye, Peter Korsgaard
