From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 21 Apr 2014 09:18:41 -0400
Subject: [Buildroot] [PATCH] syslinux: install helper programs to the
	host
In-Reply-To: <20140420115741.1cb6a1b2@skate>
References: <1394996670-8037-1-git-send-email-fhunleth@troodon-software.com>
 <20140420115741.1cb6a1b2@skate>
Message-ID: <CA+-urNQ8ME28j_cCfhYu=poEot8yFpEXexHce4iieV0rAbaeRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


On Sun, Apr 20, 2014 at 5:57 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Frank Hunleth,
>
> On Sun, 16 Mar 2014 15:04:30 -0400, Frank Hunleth wrote:
> > Even though syslinux is built for the target, it does create helper
> > programs intended to be run on the host such as syslinux and extlinux.
> > This change installs these helper programs to the host so that they may be
> > called by post image creation scripts.
> >
> > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> > ---
> >  boot/syslinux/syslinux.mk | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
>
> I've applied your patch, and removed the code that implements the
> host-syslinux variant (which BTW was originally added by Arnout in
> 9baaa5b4a39145f4cc64c6bba1a6aa8cec48f00a).

Thanks!

>
> Frank, syslinux upstream is now at version 6.x. Since you're using
> syslinux, could you take care of updating the package in Buildroot to
> match the latest upstream version?

I looked into this some last night and got as far as porting two new
prerequisite packages for 6.x and then debugging issues with building
the new EFI code. I personally don't use EFI, and without more digging
into it I wasn't sure how to turn off its compilation.

It looks like it will take a little longer to make progress on this,
and I'm not sure when I'll have time again. In the mean time, if there
are any other interested syslinux users on this list, feel free to
contact me and I'll try to explain where I'm at with my partial work.

Frank


-- 
Frank Hunleth
Troodon Software LLC
Embedded Software Development
http://troodon-software.com/
