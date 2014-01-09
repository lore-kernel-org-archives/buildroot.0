From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jan 2014 07:26:26 +0800
Subject: [Buildroot] make clean (did not really clean)
In-Reply-To: <CAPFcPT+R7f7+iJokS2cm-bFqtcsETy03FTKvSaSuft9HuZC57w@mail.gmail.com>
References: <CAPFcPT+R7f7+iJokS2cm-bFqtcsETy03FTKvSaSuft9HuZC57w@mail.gmail.com>
Message-ID: <20140110072626.0532ebf2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mau Z,

On Thu, 9 Jan 2014 14:40:20 +0200, Mau Z wrote:

> I just want to share some information (maybe known to all):
> 
> I did several experiments in order to build a Linux image (with build-root
> 13.05).
> In one of them I have added udev to the image. later on I have removed udev
> from the image.
> But, actually I was not removed whatever I did, it was still there on the
> next boot (I could see it in dmesg).
> 
> make clean
> delete every thing from the target

No, "make clean" does not only removes the target stuff. It removes
*everything* that was built, i.e everything that was in output/.

> The only thing that helped was "make distclean"
> Warning about "make distclean" :  it deletes ALL files which where not part
> of the build-root distribution (This is it's design). So, one should copy
> text files and config files to a temporary location before issuing "make
> distclean".

This is not expected. "make clean" should clearly be sufficient.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
