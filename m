From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 2 Jul 2015 07:46:12 +0000
Subject: [Buildroot] [PATCH 1/2] package/gcc: fix ARC failure to build
 in 2 phases.
In-Reply-To: <20150629174920.10f52a00@free-electrons.com>
References: <1435582227-26345-1-git-send-email-talz@ezchip.com>
 <20150629162906.415e456f@free-electrons.com>
 <AM3PR02MB11407402CE0DA7E56F56AAE6BBAA0@AM3PR02MB1140.eurprd02.prod.outlook.com>
 <20150629174920.10f52a00@free-electrons.com>
Message-ID: <1435823172.2966.25.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Tal,

On Mon, 2015-06-29 at 17:49 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 29 Jun 2015 15:39:12 +0000, Tal Zilcer wrote:
> 
> > We have one source tree for both build phases of GCC.
> > First phase must have this patch while second phase must NOT have 
> > it.
> > it doesn't seems reasonable to have two GCC source trees because of 
> > this patch.
> 
> Ah right. I think there's probably a way to write the change so that 
> it
> does not try to use these object files during the initial gcc build.
> This is really what the real fix is.
> 
> > > In any case, I don't think it's worth the effort making that 
> > > conditional, just register the post-rsync hook unconditionally.
> > It is only to explain our intentions, do you prefer a comment or 
> > just to add the RSYNC hook?
> 
> For now, we can just add the rsync hook, but...
> 
> > > BTW, this problem should have been sorted out by the ARC 
> > > developers, maybe you should ping them about this?
> > Adding Alexey to this correspondence
> 
> ... I'd like to hear from Alexey about this, since I reported this
> issue a while ago now.

Please pardon my late reply was super busy with internal activities.

As for known problem of gmon that includes libc headers unfortunately
nothing has been done on that front. That's because we have a
workaround with disabling libgmon in Buildroot.

I'll ping our gcc guy but I don't think things will change soon here
again because it doesn't look as a blocker.

So probably rsync hook is a way to go for now.

-Alexey
