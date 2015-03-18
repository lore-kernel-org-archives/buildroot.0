From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Mar 2015 23:42:12 +0100
Subject: [Buildroot] graphics
In-Reply-To: <CAKKWdtd-OY+ws4oVtFC6uXGaK38L7Bt=swwRfOVvsE0QqwJCcQ@mail.gmail.com>
References: <CAKKWdtd-OY+ws4oVtFC6uXGaK38L7Bt=swwRfOVvsE0QqwJCcQ@mail.gmail.com>
Message-ID: <5509FF44.7080007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/03/15 11:01, ali hagigat wrote:
> Buildroot has built a correct image for wandboard-quad and I can log
> in and see the output by the serial port, ttymxc0
> But i want to enable graphics for wandboard. Now getty listens for
> ttymxc0, how can i change it to use HDMI monitor and keyboard/mouse?
> I have enabled some X11 components and some drivers but i can only see
> the output on the serial console. HDMI monitor was not drived
> I will be much appreciate for any answer

 getty will only give you a console. If you want to get a console on HDMI, you
need CONFIG_VT and CONFIG_FB in the kernel, but I'm not sure if the latter is
even available for the Wandboard. If you have a framebuffer, you can start a
getty on tty1 instead of ttymxc0.

 But if it is X that you want, you should start it. For testing, you can just
type X after logging in on the console.

 I think we should start writing a FAQ on how to use X on buildroot...


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
