From: Sebastian <bastisoft@arcor.de>
Date: Wed, 24 Mar 2010 13:46:00 +0100
Subject: [Buildroot] Xorg configuration for XGI chip
In-Reply-To: <4BA8E694.3080809@terawatt.fr>
References: <4BA3A72B.3010009@terawatt.fr> <4BA3AAC2.9050400@gmail.com>
	<4BA8E694.3080809@terawatt.fr>
Message-ID: <4BAA0988.9050708@arcor.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> I tried with latest snapshot. I still have problems to launch a X server.
> With vesa and fbdev X drivers, it's OK, I can launch X server but only 
> with depth 8, and resolution 800x600 for vesa and 600x480 for fbdev 
> (framebuffer limit?). The problem is that I need depth 16 and 1024x600 
> resolution.

You could check if the video BIOS allows higher resolutions for the 
framebuffer. But you probably won't get widescreen this way.

About the compiling and loading issues, I have no idea.

> With SIS driver built in Buildroot, everything seems ok, no errors, but 
> I only get a black screen. I tried a lot of options of the driver which 
> seems to be useful but with no results.

Newer versions of the Xorg server won't display the black-and-white 
pattern anymore, but instead a black screen. Try to run some application 
from the same console device and watch the screen, like in:

# Xorg &
# DISPLAY=:0.0 xclock &

maybe the server is up and running, but you don't think it is?

> I don't know how to resolve this problem. I need a working displaying in 
> 1024x600x16 mode but this chip doesn't seems to be very used with Linux.

I had some fun with SiS chipsets (SiS 315) myself, so I'm avoiding it. 
Probably it isn't an option for you...

> So if somebody has the begin of an idea to solve this, I accept everything.

Try to post a full Xorg.0.log using the SiS driver, as it seems to be 
the best working one for now.

I do not know if the driver supports full modesetting (i.e. widescreen 
resolutions not offered by the video BIOS).

Best regards,
Sebastian
