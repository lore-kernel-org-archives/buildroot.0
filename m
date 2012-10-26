From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Fri, 26 Oct 2012 17:18:23 +0200
Subject: [Buildroot] QT application display problem
In-Reply-To: <1351263719950-33619.post@n4.nabble.com>
References: <1351263719950-33619.post@n4.nabble.com>
Message-ID: <508AA9BF.8000704@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/26/2012 05:01 PM, herve Bourricaud wrote:
> Hello,
>
> I'am an electronician , trying to use linux ;-)
> I'am almost new to buildroot and linux...
>
> So please tell me if here is not the right place for this kind of questions.
>
> I'am trying to port a QT application to a new board using an AT91SAM9263
> I use buildroot to generate toolchain (GCC 4.6.3 + uclibc) and rootfs
> I prefer generate AT91loader/U-BOOT/kernel directly in each git tree using
> the same compiler !
>
> attach to this board there is 4.3 inch LCD
> I test frame buffer using QT framebuffer test application or fb-test-app
> (https://github.com/prpplague/fb-test-app)
> and it's work OK
>
> THe problem is whith my QT application
> the colors displayed  are really bad !
> and text 'contour' is really not clear like if another color was around text
> (sorry for my english here ;-)
>
> the only thing I've seen are warnings when compiling QT
> something like "invalid cast, use -Wcast-align "
>
> any advice is welcome !
>   herv?.
>
>
>
>
> --
> View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/QT-application-display-problem-tp33619.html
> Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Hi Herv?,

probably you have some misconfiguration with the color depth of you 
framebuffer, and in your qt config. You can check your framebuffer 
settings probably at the kernel boot command line, and you can check the 
QT color depth setting in the
Location:
   ?     -> Package Selection for the target
   ?       -> Graphic libraries and applications (graphic/text)
   ?         -> Qt (BR2_PACKAGE_QT [=y])
   ?           -> Gui Module (BR2_PACKAGE_QT_GUI_MODULE [=y])
   ?             -> Pixel depths

in your Buildroot menuconfig. Otherwise it's strange it's good with the 
testapp. Did you compiled this framebuffer test app yourself?
