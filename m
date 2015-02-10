From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 10 Feb 2015 22:33:18 +0100
Subject: [Buildroot] getting X running
In-Reply-To: <20150210142938.3d715c88@free-electrons.com>
References: <C860A811EEF34E4793E67D45FD390387@JohanW7>
 <20150210142938.3d715c88@free-electrons.com>
Message-ID: <C38A85CB5FEC4109BAF0D0D300EEA72C@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----Oorspronkelijk bericht-----
Van: buildroot [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: dinsdag 10 februari 2015 14:30
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] getting X running

Dear Sagaert Johan,

On Tue, 10 Feb 2015 11:43:21 +0100, Sagaert Johan wrote:

> Not sure if X11 can run with uclibc, I enabled everything but when I try te run X and inspect the log.
> I found : [2048840.110] (EE) systemd-logind: failed to get session: 
> The name org.freedesktop.login1 was not provided by any .service files
> 
> If systemd is required, then I am at a dead end with uclibc, since systemd requires (e)glibc.

I don't think systemd is required to run the X server. However, maybe some more --disable-<something> options are needed when
building the X server, I don't know.

But anyway, if you are using the X.org (which is a big thing), then moving from uClibc to eglibc should not be a problem, as the
size difference between uClibc and eglibc is insignificant compared to the size of the X.org stack (and Webkit, that you mention
below).

> So if was wondering if I have to stop trying X running with uclibc, or if this indeed could work.
> My final target is running a webkit based app. showing some html5 pages.

What about giving up on X.org and instead use a Qt/Webkit application, using the framebuffer Qt implementation?

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot



------------------------------------------------------------------------------------------------------------------------------------
------------------

Dear Thomas

Yes, X is a full dish of spaghetti.

I found no conf_opt to disable systemd.
(Did a build with eglibc, but systemd itself seems to be broken here,,so dead end here too.)

I am wondering if webkit could be used on top of directfb instead of X.

I tried to build Qt5/webkit but no luck here either.
(Qt4.8/ webkit builds ok, but I don't know if it fully supports html5 & websockets)

snip.........
m /home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtGui/5.4.0/QtGui -isystem
/home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5 -isystem
/home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtGui -isystem
/home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtNetwork -isystem
/home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtSql -isystem
/home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtCore/5.4.0 -isystem
/home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtCore/5.4.0/QtCore -isystem
/home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtCore -I.moc -o .obj/css/MediaAllInOne.o
css/MediaAllInOne.cpp
{standard input}: Assembler messages:
{standard input}:153012: Warning: end of file not at end of a line; newline inserted
arm-buildroot-linux-gnueabi-g++: internal compiler error: Killed (program cc1plus)
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
make[3]: *** [.obj/inspector/InspectorAllInOne.o] Error 4
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory `/home/buildroot12git2/output/build/qt5webkit-5.4.0/Source/WebCore'
make[2]: *** [sub-Target-pri-make_first-ordered] Error 2
make[2]: Leaving directory `/home/buildroot12git2/output/build/qt5webkit-5.4.0/Source/WebCore'
make[1]: *** [sub-Source-WebCore-WebCore-pro-make_first-ordered] Error 2
make[1]: Leaving directory `/home/buildroot12git2/output/build/qt5webkit-5.4.0'
make: *** [/home/buildroot12git2/output/build/qt5webkit-5.4.0/.stamp_built] Error 2
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 68950 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150210/543abd31/attachment-0001.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 6253 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150210/543abd31/attachment-0001.bin>
