From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 17:53:48 +0200
Subject: [Buildroot] Failed to build libexoxy with nvidia-driver
In-Reply-To: <20170829154054.GA3338@scaer>
References: <1503935622.673191.1087468320.18EAD29A@webmail.messagingengine.com>
 <d5446a67-383f-a813-58c2-2d51d6999181@mind.be>
 <20170829154054.GA3338@scaer>
Message-ID: <20170829175348.711eccb0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Aug 2017 17:40:54 +0200, Yann E. MORIN wrote:

> >  Perhaps we should add a check in the lib*gl* virtual packages that they install
> > a .pc file...  
> 
> Gut feelings only, but no. It is perfectly legit to be a provider of EGL
> (or whatever other GL stuff) and not provide a .pc file with that.
> 
> However, I can see the benefit for consistency. But then, it puts some
> burden on the packager which upstream do not provide a .pc file, to
> write their own... :-/

Not having a .pc file for EGL/OpenGLES, etc. will break lots and lots
of packages. So I think it is a good idea to force people submitting
OpenGL implementations to make sure a .pc file is installed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
