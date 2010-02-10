From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 10 Feb 2010 07:26:06 +0100
Subject: [Buildroot] libglib2 build failure
In-Reply-To: <20100210004822.5cc69bd2@surf>
References: <20100210004822.5cc69bd2@surf>
Message-ID: <1265783166.2185.17.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mercredi 10 f?vrier 2010 ? 00:48 +0100, Thomas Petazzoni a ?crit :
> Hello,
> 
> While trying to compile libglib2, I get the following build failure. It
> is the infamous libtool problem, but libglib2 uses libtool 2.x, for
> which our buildroot-libtool.patch does not apply. It happens in an external toolchain configuration, and libglib2.0-dev is installed on the host.
> 
> libtool: relink:  /home/thomas/x-tools/arm-unknown-linux-uclibcgnueabi/bin/arm-linux-gcc -Os -pipe -Os  --sysroot /work/build/thomas/br-test1/staging/ -share
> d  .libs/gappinfo.o .libs/gasynchelper.o .libs/gasyncinitable.o .libs/gasyncresult.o .libs/gbufferedinputstream.o .libs/gbufferedoutputstream.o .libs/gcancel
> lable.o .libs/gcontenttype.o .libs/gdatainputstream.o .libs/gdataoutputstream.o .libs/gdrive.o .libs/gdummyfile.o .libs/gemblem.o .libs/gemblemedicon.o .libs
> /gfile.o .libs/gfileattribute.o .libs/gfileenumerator.o .libs/gfileicon.o .libs/gfileinfo.o .libs/gfileinputstream.o .libs/gfilemonitor.o .libs/gfilenamecomp
> leter.o .libs/gfileoutputstream.o .libs/gfileiostream.o .libs/gfilterinputstream.o .libs/gfilteroutputstream.o .libs/gicon.o .libs/ginetaddress.o .libs/ginet
> socketaddress.o .libs/ginitable.o .libs/ginputstream.o .libs/gioerror.o .libs/giomodule.o .libs/gioscheduler.o .libs/giostream.o .libs/gloadableicon.o .libs/
> gmount.o .libs/gmemoryinputstream.o .libs/gmemoryoutputstream.o .libs/gmountoperation.o .libs/gnativevolumemonitor.o .libs/gnetworkaddress.o .libs/gnetworkse
> rvice.o .libs/goutputstream.o .libs/gpollfilemonitor.o .libs/gresolver.o .libs/gseekable.o .libs/gsimpleasyncresult.o .libs/gsocket.o .libs/gsocketaddress.o
> .libs/gsocketaddressenumerator.o .libs/gsocketclient.o .libs/gsocketconnectable.o .libs/gsocketconnection.o .libs/gsocketcontrolmessage.o .libs/gsocketinputs
> tream.o .libs/gsocketlistener.o .libs/gsocketoutputstream.o .libs/gsocketservice.o .libs/gsrvtarget.o .libs/gtcpconnection.o .libs/gthreadedsocketservice.o .
> libs/gthemedicon.o .libs/gthreadedresolver.o .libs/gunionvolumemonitor.o .libs/gvfs.o .libs/gvolume.o .libs/gvolumemonitor.o .libs/gioenumtypes.o .libs/gioal
> iasdef.o .libs/gdesktopappinfo.o .libs/gunixconnection.o .libs/gunixfdmessage.o .libs/gunixmount.o .libs/gunixmounts.o .libs/gunixresolver.o .libs/gunixsocke
> taddress.o .libs/gunixvolume.o .libs/gunixvolumemonitor.o .libs/gunixinputstream.o .libs/gunixoutputstream.o .libs/glocaldirectorymonitor.o .libs/glocalfile.
> o .libs/glocalfileenumerator.o .libs/glocalfileinfo.o .libs/glocalfileinputstream.o .libs/glocalfilemonitor.o .libs/glocalfileoutputstream.o .libs/glocalfile
> iostream.o .libs/glocalvfs.o .libs/gio-marshal.o  -Wl,--whole-archive inotify/.libs/libinotify.a libasyncns/.libs/libasyncns.a xdgmime/.libs/libxdgmime.a -Wl
> ,--no-whole-archive  -Wl,-rpath -Wl,/work/build/thomas/br-test1/staging/usr/lib -L/work/build/thomas/br-test1/build/libglib2-2.22.4/glib/.libs -L/work/build/
> thomas/br-test1/target/usr/lib -L/usr/lib -L/work/build/thomas/br-test1/staging/usr/lib -lgobject-2.0 -lgmodule-2.0 -ldl -lglib-2.0 -lresolv -L/work/build/th
> omas/br-test1/target/work/build/thomas/br-test1/staging/usr/lib -lintl -liconv -lc    -Wl,-soname -Wl,libgio-2.0.so.0 -Wl,-version-script -Wl,.libs/libgio-2.
> 0.ver -o .libs/libgio-2.0.so.0.2200.4
> /usr/lib/libgobject-2.0.so: file not recognized: File format not recognized
> collect2: ld returned 1 exit status
> libtool: install: error: relink `libgio-2.0.la' with the above command before installing it
> make[7]: *** [install-libLTLIBRARIES] Error 1
> make[7]: Leaving directory
> `/work/build/thomas/br-test1/build/libglib2-2.22.4/gio'

I recompiled libglib2 2.22.4 recently with an external toolchain and
having libglib2-dev installed on my host, and I don't see the problem...

What if you set AUTORECONF=YES and LIBTOOL_PATCH=YES ?

Regards,

-- 
Lionel Landwerlin
