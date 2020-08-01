From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 1 Aug 2020 13:09:59 +0200
Subject: [Buildroot] Cannot get build to use start_x.elf and fixup_x.dat
 Raspberry Pi 3
In-Reply-To: <20200801080648.GA32736@scaer>
References: <CAOnXkYsPPXA5K2gX0nAU58hdoBB6yEt+ov5J7KCa2iF5MLTv_Q@mail.gmail.com>
 <20200801080648.GA32736@scaer>
Message-ID: <20200801130959.7ca4ac6a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vijay,

On Sat, 1 Aug 2020 10:06:48 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Vijay, All,
> 
> On 2020-07-31 18:01 -0700, Vijay spake thusly:
> > I'm fairly new to buildroot and cannot find a solution to this problem
> > I'm having. Everything works well for me and I'm able to create the SD
> > card images to run on my Pi 3. However, I'm trying to get the extended
> > ("x") firmware to boot. In the Target Packages > Hardware Handling >
> > Firmware section, I'm selecting the extended option. Buildroot is
> > building all the different variations of the start.elf (including
> > start_x.elf, start_cd.elf) but only using the start.elf file in the
> > final image instead of the start_x.elf file (same with fixup.dat). So
> > basically whether I select the "default" option on that screen or
> > "extended," the resulting boot image is the same. If I manually copy
> > the start_x.elf and fixup_x.dat files as start.elf and fixup.dat the
> > I get the extended functionality - specifically the camera working.
> > I hope all that?makes sense. Please let me know if you need any
> > further information. Any help is greatly appreciated.  
> 
> The corret files are copied to the unqualified names, and the
> unqualified names are loaded at boot; see the comment in config.txt

And do not forget to re-build the rpi-firmware package (not done automatically
by buildroot, see [1], [2]) after changing the options:

	make rpi-firmware-rebuild
	make

Regards,
Peter

[1] https://buildroot.org/downloads/manual/manual.html#full-rebuild
[2] https://buildroot.org/downloads/manual/manual.html#rebuild-pkg

> 
> Also, see commit 1bdc0334f, which fixed that recently on master. It was
> backported to 2020.05.x, but not to the LTS 2020.02...
> 
> Regards,
> Yann E. MORIN.
> 
