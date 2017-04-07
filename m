From: Robert Smigielski <ptdropper@gmail.com>
Date: Fri, 7 Apr 2017 15:42:11 -0400
Subject: [Buildroot] issue with Linux ARM start_kernel
In-Reply-To: <87inmgrpal.fsf@dell.be.48ers.dk>
References: <CABWt4evkoeQ6deMoLCWSuaZaxKzuR4=_BLEp8g4MKh1KELzjrQ@mail.gmail.com>
 <87inmgrpal.fsf@dell.be.48ers.dk>
Message-ID: <CABWt4esN__Xx53vrRbJZVcQ7Nvc1hAC5ta3LjeAkfz_jBDDY5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 7, 2017 at 3:27 PM, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Robert" == Robert Smigielski <ptdropper@gmail.com> writes:
>
>  > Hi everyone,
>  > I am a long time Linux device driver writer (about 16 years) and now
> for 3
>  > years creating BSP's using Buildroot.
>
>  > When I build using "make clean" then "make" - without NetworkManager in
> the
>  > .config the board boots and runs for days. Great.
>  > When I build using "make clean", reconfigure Buildroot to enable my
> custom
>  > added NetworkManager=y, the build succeeds, the image is loaded on the
>  > board, and I get the problem:
>
>  > "Uncompressing Linux... done, booting the kernel."
>
> From this and the description about loading uImage with a bdi, I take it
> that your filesystem is an initramfs embedded in the uImage?
>
> Yes the file system is embedded in the uImage.


> It would be interesting to check if your problem relates to the uImage
> growing to a specific size (E.G. add some data files to the working
> build instead).
>
> What address are you loading the uImage to? It sounds like the
> decompressor perhaps ends up overwriting itself.
>

I load the uImage to address 0x2000000 and uboot reports loading it from
0x2000040.
The working uImage is approximately 14.7 MB and the non working uImage is
15.4 MB
The address 0x2000000 is a legacy value that has just been used in the past.

Since I am not familiar with the details of this part of the process can I
change the address to a larger value or to a smaller value? Which one makes
sense?

>
> --
> Bye, Peter Korsgaard
>



-- 
Robert Smigielski
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170407/53861da9/attachment.html>
