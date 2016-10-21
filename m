From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Fri, 21 Oct 2016 11:56:21 +0000
Subject: [Buildroot] [PATCH][autobuild] autobuild-run: introduce
 "--tc-cfg-uri" option for toolchain configs URI
In-Reply-To: <20161021133452.0508e5c5@free-electrons.com>
References: <1477045454-8660-1-git-send-email-vzakhar@synopsys.com>
 <20161021133452.0508e5c5@free-electrons.com>
Message-ID: <1477050979.28679.16.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Yes, we wan't to use?

On Fri, 2016-10-21 at 13:34 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 21 Oct 2016 13:24:14 +0300, Vlad Zakharov wrote:
> > 
> > This commit introduces "--tc-cfg-uri" option (short "-t").
> > Described option is used to pass URI of file that contain
> > toolchains configurations to be used in autobuilds.
> > 
> > Default value refers to standard buildroot autobuild toolchain
> > configuration file:
> > http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv
> > 
> > Such update allows users to add their own toolchain configurations
> > to use in buildroot autobuilds.
> > 
> > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> 
> I am not sure I like this approach very much. It means people can start
> using a non-default set of toolchains, and then submit results to
> autobuild.buildroot.org. Such results would possibly not be
> reproducible by others because we may not have access to those
> toolchains.
> 

Of course people can misuse the script and run autobuilds with mysterious external toolchain and nobody except
themselves will be able to reproduce such builds. However if people use internal buildroot toolchain information of how
toolchain has been configured is always accessible in ".config" file that is provided with other build results.?

> Is this intended to run tests only the ARC architecture builds on your
> autobuilder?
> 

In our case we want at least to run more autobuilds with internal up-to-date toolchain to get relevant visibility of
what is happening with ARC latest tools. Suggested approach will give us flexible way to set up such configurations.?
In default configs there is only one configuration for arc that uses internal tools.?
?

> Thomas
-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
