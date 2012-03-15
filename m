From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Mar 2012 00:54:10 +0100
Subject: [Buildroot] BR2012.rc1 :: problem to build a new package
In-Reply-To: <CAPEB33x+aVFQoFgN8FXUDWsdqux4Kgf6cPnpMnxN3eRLedGB2g@mail.gmail.com>
References: <CAPEB33x+aVFQoFgN8FXUDWsdqux4Kgf6cPnpMnxN3eRLedGB2g@mail.gmail.com>
Message-ID: <201203160054.10741.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 15 March 2012 14:45:58 MERCADIER Johann wrote:
> Hi all,
> 
>    I try to add my 1st package to BR.
>    I primarily succeed compiling the program manually and once it had been
> added to the rootfs. I could use it normally wihtout bug til now.
>    Then as I would like to add this functionality to build root through the
> menuconfig option. This part seems ok
>    The next one is to built a .mk file and here start the troubles!

 That should be pretty easy with the AUTOTARGETS infrastructure.

>    This program require freetype2 and fontconfig. 

 So you should have the line
<PKG>_DEPENDENCIES += freetype fontconfig
in your .mk file.

 Normally configure should pick it up automatically then.

 Make sure that the Config.in also has the lines
	select BR2_PACKAGE_FREETYPE
	select BR2_PACKAGE_FONTCONFIG

 
>    On my system pkg-config
> can find it at the following places:
> ./workdone/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig/freetype2.pc
> ./output/target/usr/lib/pkgconfig/freetype2.pc
> ./output/build/freetype-2.4.8/builds/unix/freetype2.pc
> 
>   But it cannot find any .pc file for fontconfig and then quit with an
> error.

 After the fontconfig package is built, you should have a fontconfig.pc
next to the freetype2.pc.


[snip]
>   I wish to learn to do some good work and not a kind of scrappy job even
> if it works. So advices are welcome!

 As soon as you have something that works more or less, post it and
we'll give feedback!SO-0809-Leuven-M.S.G

 Preferably, use git send-email to send the patch.  That makes sure all the
tabs and line breaks are properly conserved, and that the commit message
and authorship is correct.  Also add your Signed-off-by line to the commit
message (see http://kerneltrap.org/files/Jeremy/DCO.txt).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
