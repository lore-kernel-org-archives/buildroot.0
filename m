From: Rico Bachmann <bachmann@tofwerk.com>
Date: Tue, 11 Oct 2011 16:29:42 +0200
Subject: [Buildroot] [PATCH 2/2] add libfcgi to buildroot
References: <add libfcgi to buildroot>
 <1317285917-2134-1-git-send-email-bachmann@tofwerk.com>
 <20110929115849.73cbefaa@skate> <201110012259.10267.arnout@mind.be>
Message-ID: <op.v26yjsdz705kjs@rico>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 01.10.2011, 22:59 Uhr, schrieb Arnout Vandecappelle
<arnout@mind.be>:

> 3. Create the patch relative to the build directory:
> cd output/build
> diff -rup fcgi-2.4.0.orig fcgi-2.4.0 > \
>   ../../package/fcgi/fcgi-2.4.0-add-lm.patch
>

When I try to create my patch with this command I got a fault, file or
folder not found, when I
delete the backslash after the '>' it works fine. But my patch still have
no effect if i try to build the
package with buildroot and use the patch automatically.

If I use my patch manual it works fine:

       commands:
       cd /buildroot/output/build
       patch -p0 < ../../package/fcgi/fcgi-2.4.0-add-lm.patch

       output:
       patching file fcgi-2.4.0/cgi-fcgi/Makefile.in
       patching file fcgi-2.4.0/examples/Makefile.in

After that I can build the package (of course only without a make
fcgi-dirclean)

Here is the output form buildroot while using the patch:

       >>> fcgi 2.4.0 Patching packages/fcgi
       for file in config.guess config.cub; do for i $(find
/buildroot/output/build/fcgi-2.4.0 -name $file);
       do cp package/gnuconfig/$file $i;
       done; done

After that, the build still failed.
