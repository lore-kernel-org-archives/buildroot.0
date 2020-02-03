From: rscr <rafacrespiramon@gmail.com>
Date: Mon, 3 Feb 2020 06:51:18 -0600 (CST)
Subject: [Buildroot] QtWebEngine on RPI 0 W
In-Reply-To: <20200130132047.5d82cab0@gmx.net>
References: <1579861270269-0.post@n4.nabble.com>
 <20200125172550.45366ce5@gmx.net> <1580197267384-0.post@n4.nabble.com>
 <20200128085828.5959e493@gmx.net> <20200128104326.030b51d9@gmx.net>
 <1580384329954-0.post@n4.nabble.com> <20200130132047.5d82cab0@gmx.net>
Message-ID: <1580734278053-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter, 

I have fixed the issue:

- Using the buildroot toolchain with gcc 5.x
- Increasing swap in my Ubuntu host until 10 GB
(https://chromium.googlesource.com/chromium/src/+/master/docs/linux/build_instructions.md#System-requirements) 
- Using BR2_JLEVEL = 2

Now QtWebEngine is built with the image. 

I just have to test if I can run a Qt app with WebEngineView


>Your provided defconfig states:
>
>BR2_TOOLCHAIN_EXTERNAL_PATH="/home/ibercomp/rcr/tools/toolchains/sourceforge/rpi0w/cross-pi-gcc->6.3.0-0"
>
>So you are still not using a buildroot provided toolchain (I suspect from
the path your use
<one from the https://sourceforge.net/projects/raspberry-pi-cross-compilers/
project)?

On the meanwhile, I was trying with some other toolchain because of the
&quot;Virtual exahusted memory&quot; failure I got with the buildroot one.


>BR2_PACKAGE_QT5WEBENGINE is not enabled in the given defconfig, wrong
defconfig?

At first attempt of building an image with a new toolchain, I decided not to
add the QtWebEngine. I just was trying to test if the new toolchain was
worked...and did not.

Kind Regards, 

Rafa







--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
