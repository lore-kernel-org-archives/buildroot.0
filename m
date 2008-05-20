From: Jason Valenzuela <jvalenzuela@dspfl.com>
Date: Tue, 20 May 2008 13:45:53 -0400
Subject: [Buildroot] Bootloaders
In-Reply-To: <326f33790805191734n68a95ee2m758c4266aeb4d02e@mail.gmail.com>
References: <4831FE20.6050508@dspfl.com>
	<326f33790805191734n68a95ee2m758c4266aeb4d02e@mail.gmail.com>
Message-ID: <48330E51.6050505@dspfl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arun Reddy wrote:

> I am new to Buildroot as well. I have successfully created an x86 target 
> with Grub as the bootloader. I was wondering if the error you're getting 
> says something about not being able to resolve the debian ftp site? Are 
> you able to even download grub from the correct repository first? I just 
> want to know if it's a compiling problem or a problem with retrieving 
> grub. If it's the latter than the problem lies within the actual 
> Makefile, in that the repository is broken and you need to change the 
> path for your development system to go grab it from.

Ok so the buildroot make process it trying to pull a .diff from the 
debian site that doesn't exist. I found that this is a known problem in 
buildroot's bug tracking system. I tried two things, first I found the 
actual .diff elsewhere, downloaded it into the dl directory and tried a 
make. That crashes with complaints about uClibc being built without 
large file support. Enabling large file support in uClibc's make 
menuconfig also doesn't build.

Next I tried to modify the grub.mk so that it downloads a slightly newer 
.diff from the debian site. Was a real long shot and of course didn't 
work either.

So now I'm trying to simply build grub on my host system and see if I 
can go from there.


Jason Valenzuela
