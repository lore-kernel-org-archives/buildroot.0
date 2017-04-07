From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Apr 2017 21:27:46 +0200
Subject: [Buildroot] issue with Linux ARM start_kernel
In-Reply-To: <CABWt4evkoeQ6deMoLCWSuaZaxKzuR4=_BLEp8g4MKh1KELzjrQ@mail.gmail.com>
 (Robert Smigielski's message of "Fri, 7 Apr 2017 10:49:16 -0400")
References: <CABWt4evkoeQ6deMoLCWSuaZaxKzuR4=_BLEp8g4MKh1KELzjrQ@mail.gmail.com>
Message-ID: <87inmgrpal.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robert" == Robert Smigielski <ptdropper@gmail.com> writes:

 > Hi everyone,
 > I am a long time Linux device driver writer (about 16 years) and now for 3
 > years creating BSP's using Buildroot.

 > When I build using "make clean" then "make" - without NetworkManager in the
 > .config the board boots and runs for days. Great.
 > When I build using "make clean", reconfigure Buildroot to enable my custom
 > added NetworkManager=y, the build succeeds, the image is loaded on the
 > board, and I get the problem:

 > "Uncompressing Linux... done, booting the kernel."

From this and the description about loading uImage with a bdi, I take it
that your filesystem is an initramfs embedded in the uImage?

It would be interesting to check if your problem relates to the uImage
growing to a specific size (E.G. add some data files to the working
build instead).

What address are you loading the uImage to? It sounds like the
decompressor perhaps ends up overwriting itself.

-- 
Bye, Peter Korsgaard
