From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 21 Oct 2016 12:04:09 +0000
Subject: [Buildroot] [PATCH][autobuild] autobuild-run: introduce
 "--tc-cfg-uri" option for toolchain configs URI
In-Reply-To: <1477050979.28679.16.camel@synopsys.com>
References: <1477045454-8660-1-git-send-email-vzakhar@synopsys.com>
 <20161021133452.0508e5c5@free-electrons.com>
 <1477050979.28679.16.camel@synopsys.com>
Message-ID: <1477051416.3325.11.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2016-10-21 at 11:56 +0000, Vlad Zakharov wrote:
> Hi Thomas,
> 
> Yes, we wan't to use?
> 
> On Fri, 2016-10-21 at 13:34 +0200, Thomas Petazzoni wrote:
> > 
> > Hello,
> > 
> > On Fri, 21 Oct 2016 13:24:14 +0300, Vlad Zakharov wrote:
> > > 
> > > 
> > > This commit introduces "--tc-cfg-uri" option (short "-t").
> > > Described option is used to pass URI of file that contain
> > > toolchains configurations to be used in autobuilds.
> > > 
> > > Default value refers to standard buildroot autobuild toolchain
> > > configuration file:
> > > http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv
> > > 
> > > Such update allows users to add their own toolchain configurations
> > > to use in buildroot autobuilds.
> > > 
> > > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> > 
> > I am not sure I like this approach very much. It means people can start
> > using a non-default set of toolchains, and then submit results to
> > autobuild.buildroot.org. Such results would possibly not be
> > reproducible by others because we may not have access to those
> > toolchains.

Well as long as you have control over stuff that gets added in your
autobuilder web-server through distribution of credentials
IMHO there should be no problems. In worst case one day somebody
will catch unexpected path to external toolchain in .config from
one report and that will be a reason to ask owner of corresponding
build server to not play that games.

Still I might be missing something.

-Alexey
