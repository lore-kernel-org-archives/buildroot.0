From: Steffen Schulz <pepe_ml@gmx.net>
Date: Thu, 7 May 2009 10:29:27 +0200
Subject: [Buildroot] X11 and buildroot..
In-Reply-To: <87y6tadzww.fsf@macbook.be.48ers.dk>
References: <20090506124243.GB2496@cbg.dyndns.org>
	<87y6tadzww.fsf@macbook.be.48ers.dk>
Message-ID: <20090507082927.GB16268@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Second attempt, seems my attachments were too big..


On 090506 at 17:30, Peter Korsgaard wrote:
> >>>>> "Steffen" == Steffen Schulz <pepe_ml@gmx.net> writes:
>  Steffen> is there any buildroot configuration that gives me a working
>  Steffen> X11 using the framebuffer?
> 
>  Steffen> I saw updates in the X11 area again for the current rc1, but
>  Steffen> I still fail to compile anything using X11.
> 
> Strange, it works here ..

That is good to hear. Care to send a sample .config?

>  Steffen> Currently, if I select tinyX and xserver, xfont-encodings
>  Steffen> will complain about missing mkfontscale. If I add that to
>  Steffen> the dependencies, it still complains since the binary is not
>  Steffen> copied to staging. Even then it seems some shared libraries
>  Steffen> are missing that ldd fails to tell me about.
> Hmm, maybe it needs it at build time, E.G. present on the host. Do you
> have it installed on your host? Send your .config and I'll give it a
> try, we should probably build it for the host as well.
 
I have mkfontscale on the host. And when I copy it from the build
directory to staging, it is used by xfont_encodings. But libs are
missing. I tried and failed so often with previous svn versions
that I did not investigate further.

My .config is very simple since I just wanted to see if the build is
getting somewhere. For X11, I activated TinyX and then xorg-server.
This pulls in several libraries and needs i18n, WCHAR etc.

The qtopia error is also at compile time. It might just work if I
enable that funny switch, but since it is not enabled it seems this is
not a common problem either.

I essentially need a minimal X using fbdev so that I can try to port
some apps(virt-manager and a ton of dependencies)..


/steffen
-- 
pepe at unixfan.net                            gpg --recv-key A04D7875
Key fingerprint: B805 57BE E4AF 0104 CC51  77A1 CE6F 8D46 A04D 7875
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br_config_x11.gz
Type: application/octet-stream
Size: 5840 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090507/d075cf21/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br_config_qtopia.gz
Type: application/octet-stream
Size: 4749 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090507/d075cf21/attachment-0001.obj>
