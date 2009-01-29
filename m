From: Daniel Laird <danieljlaird@hotmail.com>
Date: Thu, 29 Jan 2009 18:48:28 +0000
Subject: [Buildroot] Updating toolchain config options to help
	external	toolchain support.
In-Reply-To: <1233252750.4147.34.camel@elrond.atmel.com>
References: <C13DBBE85AD6974B85C118C35890CA5F1AF39BD968@EU1RDCRDC1WX029.exi.nxp.com>
	<COL102-DS4F672F3105EE1F6476A4CDCC90@phx.gbl> 
	<1233252750.4147.34.camel@elrond.atmel.com>
Message-ID: <COL102-W584B4DF0925281F2B5E144DCC90@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I like this option, however I think this is too big a change to make before releasing.
I think we should move to this after the release.
 
In the mean time I will make the commits (with comments/feedback that has been provided)
 
And then we should look into this for the next release (a really good idea).Daniel Laird> Subject: Re: [Buildroot] Updating toolchain config options to help external toolchain support.> From: ulf.samuelsson at atmel.com> To: danieljlaird at hotmail.com> CC: buildroot at uclibc.org> Date: Thu, 29 Jan 2009 19:12:30 +0100> > > > After a lot a playing around I have made some changes to the toolchain> > configuration options.> > This now allows users of external binary toolchains to enable/disable the> > same set of features as those> > who are building a toolchain using buildroot or external source.> > However the number of changes mean that I would like to post the patch below> > for comments before commiting it.> > I have tested the external toolchain support side of things and checked the> > options are all ok but I have not built a new> > buildroot toolchain (never done this)> > perhaps someone can comment on patch below: If not I would like to commit by> > friday to enable a few days testing before final release.> > > > Many thanks> > Daniel Laird> > > > ?> > If you have an external toolchain which is built in a certain way, > then I think it makes more sense to have a file which > contains the settings of that toolchain:> > config BR2_EXTERNAL_TOOLCHAIN> defeds on ...> select BR2_WCHAR> select ?BR2_EXT_PTHREADS> select ?BR2_GCC_CROSS_CXX> select ...> > Why give the user an option to configure buildroot to> use the wrong parameters.> > As I mentioned before, I think the toolchain should be> built as as seaprate item, and then provide> its configuration in a file like above.> > Package disabled by the toolchain needs to > be replaced by a Comment during menuconfig.> > > BR> Ulf Samuelsson> 
_________________________________________________________________
Windows Live Messenger just got better .Video display pics, contact updates & more.
http://www.download.live.com/messenger
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090129/62390ef0/attachment.htm 
