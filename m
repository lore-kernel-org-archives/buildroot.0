From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Oct 2016 13:34:52 +0200
Subject: [Buildroot] [PATCH][autobuild] autobuild-run: introduce
 "--tc-cfg-uri" option for toolchain configs URI
In-Reply-To: <1477045454-8660-1-git-send-email-vzakhar@synopsys.com>
References: <1477045454-8660-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20161021133452.0508e5c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Oct 2016 13:24:14 +0300, Vlad Zakharov wrote:
> This commit introduces "--tc-cfg-uri" option (short "-t").
> Described option is used to pass URI of file that contain
> toolchains configurations to be used in autobuilds.
> 
> Default value refers to standard buildroot autobuild toolchain
> configuration file:
> http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv
> 
> Such update allows users to add their own toolchain configurations
> to use in buildroot autobuilds.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

I am not sure I like this approach very much. It means people can start
using a non-default set of toolchains, and then submit results to
autobuild.buildroot.org. Such results would possibly not be
reproducible by others because we may not have access to those
toolchains.

Is this intended to run tests only the ARC architecture builds on your
autobuilder?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
