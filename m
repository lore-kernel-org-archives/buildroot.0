From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 5 May 2016 11:33:13 -0300
Subject: [Buildroot] Xorg crash
In-Reply-To: <1274ad69-0abb-26b0-b623-67de78c0274f@brickedbrain.com>
References: <1274ad69-0abb-26b0-b623-67de78c0274f@brickedbrain.com>
Message-ID: <572B59A9.2070602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/05/16 11:19, Luca Ellero wrote:

> Hi,
> I'm trying to get a minimal Xorg with Buildroot 2016.02 on Raspberry Pi
> 2, but the Xserver crashes as soon I launch dillo web-browser.
> I get the same crash if I launch fluxbox (or openbox or matchbox).
> I tried even on a iMX6 custom board but the same problem happens.
> The strange thing is that if I use only xterm and twm everything works
> correctly.
>
> I get:
>
> (EE) Segmentation fault at address 0x0
> (EE) Fatal server error:
> (EE) Caught signal 11 (Segmentation fault). Server aborting
> (EE)
> (EE) Please consult the The X.Org Foundation support
>       at http://wiki.x.org for help.
> (EE) Please also check the log file at "/var/log/Xorg.0.log" for
> additional information.
> (EE)
> (EE) Server terminated with error (1). Closing log file.
>
> In attachment you can find the Xorg log and configuration file.
> Could someone please explain me what is going wrong.
>
> Thanks
> Regards
> Luca

Hi.
Try using BR2_OPTIMIZE_2=y and rebuild everything - the X server is 
notoriously fragile when optimizing for size with certain toolchain 
combinations/architectures.
Regards.
