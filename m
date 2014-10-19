From: Maarten ter Huurne <maarten@treewalker.org>
Date: Sun, 19 Oct 2014 02:49:36 +0200
Subject: [Buildroot] [PATCH] freetype: Add config option for bzip2
	compressed font support
In-Reply-To: <5442672B.1000500@mind.be>
References: <1413599958-24524-1-git-send-email-maarten@treewalker.org>
 <5442672B.1000500@mind.be>
Message-ID: <3620793.9UjUVpDraY@hyperion>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 18 October 2014 15:12:11 Arnout Vandecappelle wrote:
> On 18/10/14 04:39, Maarten ter Huurne wrote:
> > If bzip2 is available, it might still be preferable to not include
> > support for bzip2 compressed fonts, for example to reduce the number
> > of libraries loaded when running a GUI application.
> 
>  I don't agree with this. The impact will be really small, both for memory
> size and for load time - especially because any application using
> freetype will most likely load much larger GUI libraries. If you're
> working at such details, you'll unavoidably have to do some manual hacks
> to get it even better. So I don't think it makes sense to add a config
> option for it - we try to keep the number of config options in check.
> 
>  So unless you can show me a use case where it makes a real impact, it's a
> NACK.

The menu we're using (GMenu2X) uses FreeType via SDL_ttf, not via a large 
GUI toolkit. Dropping the libbzip2 dependency reduces the number of 
libraries loaded from 12 to 11. I haven't benchmarked how many milliseconds 
of a difference that makes in startup time.

Note that the only place where bzip2 compression is actually supported by 
FreeType is when opening PCF files. Disabling the feature has no effect on 
support for other font formats such as TTF.

Bye,
		Maarten
