From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 2 Dec 2011 15:42:15 -0800
Subject: [Buildroot] USB FAT drive in Linux on MPC8321
In-Reply-To: <1322867345.1778.YahooMailNeo@web161206.mail.bf1.yahoo.com>
References: <CALo-6+i-OXWXHxpmsH4tab9RBhT5qoWOcpSbfR84nbt9GaAn4Q@mail.gmail.com>
 <1322867345.1778.YahooMailNeo@web161206.mail.bf1.yahoo.com>
Message-ID: <CALo-6+gHTU218ZVcSvN4XSs08Oh2tJnZgXr1i3kd85SVygrXUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tim:

I'm having trouble finding a msdos setting in the make xconfig in
Linux-2.6.35.12. I did find vfat and it is enabled, but looking near
it, I dont see anything reminiscent of msdos idiosyncracies.

Can you give me an additional hint, please?

Charles

On Fri, Dec 2, 2011 at 3:09 PM, Tim Judd <tjudd2k@yahoo.com> wrote:
> Debian is taking advantage of "Long File Name" support in DOS.? Your MPC8321
> is doing only the 8.3 legacy dos naming convention.
>
> Enabling LFN support in your msdos driver is what's missing.
>
>
>
>
> If opportunity doesn't knock, build a door.
> "I can" is a way of life.
> More and Bigger is not always Better.
> The road to success is always uphill.
> Life isn't about finding yourself, it's about creating yourself.
> ________________________________
> From: Charles Krinke <charles.krinke@gmail.com>
> To: buildroot <buildroot@busybox.net>
> Sent: Friday, December 2, 2011 3:37 PM
> Subject: [Buildroot] USB FAT drive in Linux on MPC8321
>
> Gentlemen:
>
> I seem to be having a file name issue with USB drives with my MPC8321
> target. This isnt a buildroot issue so much as a plea for help in
> understanding how I can gain sanity back into this FAT USB disk issue.
>
> To illustrate, here is an ls from my debian laptop followed by an ls
> of the same USB drive from the MPC8321 target illustrating the issues.
>
> I do have the module vfat in the build, so it is something more then vfat.ko
>
> ls /media/801C-A3AB/
> 1q.bmp
> 2q.bmp
> 4.bmp
> 5.bmp
> Logic Setup 1.1.5.1 (32-bit).exe
> SdlcSerialAnalyser.dll
> startup
> TEES2009.pdf
> CD00264885.pdf
> TEMP
> CHKSER
> TempATCControllerFirmwarePDP.doc
> CHKUSB
> TESTCLOC
> CK
>
> 1q? ? ~1.bmp
> 2q? ? ~1.bmp
> 4? ? ~1.bmp
> 5? ? ~1.bmp
> logics~1.exe
> sdlcse~1.dll
> startup
> tees2009.pdf
> temp
> testcloc
>
> --
> Charles Krinke
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>



-- 
Charles Krinke
