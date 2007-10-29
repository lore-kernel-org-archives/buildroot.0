From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 29 Oct 2007 18:33:13 +0100
Subject: [Buildroot] Several issues with building multiple
	"projects"	for same architecture
In-Reply-To: <d83696340710290855s5e4e4f44y7b5777bfeacf4ec2@mail.gmail.com>
References: <d83696340710290855s5e4e4f44y7b5777bfeacf4ec2@mail.gmail.com>
Message-ID: <20071029173313.GA29762@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 29, 2007 at 10:55:49AM -0500, Jonathan Nalley wrote:
>I am using the buildroot to build for several different boards, some of them
>have the same CPU architecture (PPC405GP/EP).  I have noticed some issues
>with the "project" concept in the buildroot.  Since the builds are for the
>same architecture the toolchain is created under "build_powerpc".
>Everything works fine for the first board, but for subsequent builds for
>different "project" names things are missing under
>"project_build_powerpc/PROJECT_NAME/root".  Specifically:
>
>/root/lib/libgcc_s.so
>/root/usr/lib/libstdc++.so
>/root/usr/sbin/ethtool
>
>This is because the make files that install those files check for:
>
>$(GCC_BUILD_DIR2)/.libs_installed
>
>and
>
>$(ETHTOOL_DIR)/.installed

I've fixed at least the ethtool case several weeks ago in
f93f6bf4f9ae7c8c248fba2fc72ab42325975b63

As you can see, the project idea was never really integrated properly
:-/
