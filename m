From: Kyle Hayes <kyle@greenmonitor.com>
Date: Fri, 14 Jan 2011 14:07:03 -0800
Subject: [Buildroot] ssh-keygen seg fault
In-Reply-To: <AANLkTimU=1_RZohLaLaNZDsfYek3Xr8TbWPZUaCDk6ne@mail.gmail.com>
References: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
	<20110114090752.5f01ade5@surf>
	<469243A17FE74439A7BBB6F327046F20@beraninstruments.com.local>
	<20110114104016.252e7f90@surf>
	<AANLkTi=kVHeatBJ1G2wZsX1ww-FOV0qb5Vtf5rxXNneL@mail.gmail.com>
	<20110114181920.59ba8b8b@surf>
	<AANLkTimU=1_RZohLaLaNZDsfYek3Xr8TbWPZUaCDk6ne@mail.gmail.com>
Message-ID: <AANLkTikV_Omj2Vzv61tDGFOGSHK_H8H_9=wMbhb3BMBt@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I know, bad form to post a response to yourself.  I don't think I hit
a bug in Buildroot with the Linux version changing.  It was a user bug
:-)


On Fri, Jan 14, 2011 at 11:29 AM, Kyle Hayes <kyle@greenmonitor.com> wrote:
> OK, now back to this...
> [snip]
>
> I was looking for clues in the fact that my previous custom kernel was
> built for a 586, not a 486. ?I checked in my old .config files and the
> 586 options, NOT Pentium was checked. ?This support AMD K6-2
> processors etc. ?I changed Buildroot's configuration to select the
> i386 processor family and Pentium processors as there was not an
> option that matched the kernel exactly. ?I tried to build the system
> and then installed it. ?The kernel failed to boot saying that it was
> the wrong processor version?!
>
> I checked the .config file for the kernel and found that Pentium-Pro
> was selected! Huh? ?I ran make menuconfig in the kernel build
> directory and reset everything back the way I thought it should be and
> rebuilt. ?That worked. ?I'm still confused as to how the kernel came
> to be configured for the wrong processor. ?I now have a fully working
> base system. ?At least as far as I have tested it. ?I have not tested
> logging into dropbear remotely.
>
> I will now start undoing my changes and test to find out where things
> go wrong. ?I will first make the selected Buildroot CPU type = i486
> and see what that does to the kernel CPU type. ?I will then set it
> back to Pentium to see if that is where the Pentium-Pro selection came
> from.

I did a make clean between changes and that wipes the kernel config
file.  Luckily I saved it...

Off to build another kernel with the right CPU and settings.

Best,
Kyle



> Best,
> Kyle
>
