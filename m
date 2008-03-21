From: Christian SCHWARZ <christian.schwarz@st.com>
Date: Fri, 21 Mar 2008 09:05:25 +0100
Subject: [Buildroot] zImage corruption
In-Reply-To: <47E2B60B.70106@carallon.com>
References: <47E2B60B.70106@carallon.com>
Message-ID: <47E36C45.5060507@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Will,

I have similar troubles related to the rootfs created by buildroot, also 
on a custom ARM11 target. In my case, the Linux kernel is not able to 
start init (errors either -2, -8 or -14). In my case I had to replace 
the bin/ and etc/ directories with ones created outside in an (older) 
busybox directory.
The image sizes created by a "make" in buildroot vary greatly, sometimes 
there are 3 - 4 MB of space left in the image, sometimes only a few 
hundred kB.

cheers,
Christian


Will Wagner wrote:
> Hi All,
> 
> I have been happily using buildroot for a while (thanks all its a great 
> tool).
> 
> However I have started seeing a problem where the linux zImage being 
> built gets corrupted and does not boot.
> 
> I am building a custom arm device using initramfs. If I checkout from 
> clean and build it all works great and get a working zImage that is 
> ~7.5MB. However if I then run make again I get a zImage file that is 
> ~6.5MB and does not boot.
> 
> I have compared the root filesystems before and after calling make again 
> and can see no difference. I have also tried doing a dirclean on the 
> kernel and rebuilding and this still leads to a corrupt zImage.
> 
> Has anyone seen this before? Can anyone suggest what could be going on?
> 
> I can supply more config info if needed.
> 
> Thanks,
> Will
