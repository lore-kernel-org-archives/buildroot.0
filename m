From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 6 May 2016 08:20:55 +0200
Subject: [Buildroot] Xorg crash
In-Reply-To: <1274ad69-0abb-26b0-b623-67de78c0274f@brickedbrain.com>
References: <1274ad69-0abb-26b0-b623-67de78c0274f@brickedbrain.com>
Message-ID: <20160506082055.1bfeec8e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Luca,

On Thu, 5 May 2016 16:19:29 +0200, Luca Ellero <luca.ellero@brickedbrain.com> wrote:

> Hi,
> I'm trying to get a minimal Xorg with Buildroot 2016.02 on Raspberry Pi 
> 2, but the Xserver crashes as soon I launch dillo web-browser.
> I get the same crash if I launch fluxbox (or openbox or matchbox).
> I tried even on a iMX6 custom board but the same problem happens.
> The strange thing is that if I use only xterm and twm everything works 
> correctly.
> 
> I configured the system with:
> 
> - Modular X.org (but same problem with KDrive/TinyX)
> - xf86-input-evdev
> - xf86-video-fbdev
> - twm
> - xterm
> - dillo
> 
> When I launch X with the following
> 
> # X :0 &
> # export DISPLAY=:0
> # twm &
> # xterm &
> 
> Xorg, twm and xterm are working fine.
> 
> But with this:
> 
> # X :0 &
> # export DISPLAY=:0
> # dillo &
> 
> I get:
> 
> (EE) Segmentation fault at address 0x0
> (EE) Fatal server error:
> (EE) Caught signal 11 (Segmentation fault). Server aborting
> (EE)
> (EE) Please consult the The X.Org Foundation support
> 	 at http://wiki.x.org for help.
> (EE) Please also check the log file at "/var/log/Xorg.0.log" for 
> additional information.
> (EE)
> (EE) Server terminated with error (1). Closing log file.
> 
> In attachment you can find the Xorg log and configuration file.
> Could someone please explain me what is going wrong.
> 

Known bug with gcc/xserver when compiled with '-Os', see [1] for the gcc bug report...

Try to build with other buildroot optimization option e.g. -O2/-O3...

Regards,
Peter

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63346


> Thanks
> Regards
> Luca
> 
> 
> 
