From: Pradeeka Seneviratne <pradeeka@outlook.com>
Date: Tue, 9 Feb 2016 10:11:28 +0000
Subject: [Buildroot] Adding python-rpi-gpio package to ORxPi
Message-ID: <BLU181-W77E1669B366C3B89702E22D1D60@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm having an issue with adding python-rpi-gpio to ORxPi using BR2_EXTERNAL. 
Outernet ORxPi: https://github.com/Outernet-Project/orx-rpiRPi.GPIO: https://pypi.python.org/pypi/RPi.GPIO
I built the  source and built the image using $sudo make image B=rpi2Here is the log including python-rpi-gipo. But when I run the import RPi.GPIO AS GPIO it outputs ImportError:No module named RPi.GPIO


[7m>>> python-rpi-gpio 0.6.1 Downloading[27m
[7m>>> python-rpi-gpio 0.6.1 Extracting[27m
gzip -d -c /home/pradeeka/orx-rpi/buildroot/dl/RPi.GPIO-0.6.1.tar.gz | tar --strip-components=1 -C /home/pradeeka/orx-rpi/rpi/output/build/python-rpi-gpio-0.6.1   -xf -
[7m>>> python-rpi-gpio 0.6.1 Patching[27m
[7m>>> python-rpi-gpio 0.6.1 Configuring[27m
[7m>>> python-rpi-gpio 0.6.1 Building[27m
(cd /home/pradeeka/orx-rpi/rpi/output/build/python-rpi-gpio-0.6.1//; PATH="/home/pradeeka/orx-rpi/rpi/output/host/bin:/home/pradeeka/orx-rpi/rpi/output/host/sbin:/home/pradeeka/orx-rpi/rpi/output/host/usr/bin:/home/pradeeka/orx-rpi/rpi/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" CC="/home/pradeeka/orx-rpi/rpi/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os " LDFLAGS="" LDSHARED="/home/pradeeka/orx-rpi/rpi/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -shared" PYTHONPATH="/home/pradeeka/orx-rpi/rpi/output/target/usr/lib/python2.7/sysconfigdata/:/home/pradeeka/orx-rpi/rpi/output/target/usr/lib/python2.7/site-packages/" _python_sysroot=/home/pradeeka/orx-rpi/rpi/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot _python_prefix=/usr _python_exec_prefix=/usr  /home/pradeeka/orx-rpi/rpi/output/host/usr/bin/python setup.py build --executable=/usr/bin/python )
running build
running build_py
creating build
creating build/lib.linux-x86_64-2.7
creating build/lib.linux-x86_64-2.7/RPi
copying RPi/__init__.py -> build/lib.linux-x86_64-2.7/RPi
running build_ext
building 'RPi.GPIO' extension
creating build/temp.linux-x86_64-2.7
creating build/temp.linux-x86_64-2.7/source
/home/pradeeka/orx-rpi/rpi/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -I/home/pradeeka/orx-rpi/rpi/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/python2.7 -c source/py_gpio.c -o build/temp.linux-x86_64-2.7/source/py_gpio.o
/home/pradeeka/orx-rpi/rpi/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -I/home/pradeeka/orx-rpi/rpi/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/python2.7 -c source/c_gpio.c -o build/temp.linux-x86_64-2.7/source/c_gpio.o
/home/pradeeka/orx-rpi/rpi/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -I/home/pradeeka/orx-rpi/rpi/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/python2.7 -c source/cpuinfo.c -o build/temp.linux-x86_64-2.7/source/cpuinfo.o
/home/pradeeka/orx-rpi/rpi/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -I/home/pradeeka/orx-rpi/rpi/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/python2.7 -c source/event_gpio.c -o build/temp.linux-x86_64-2.7/source/event_gpio.o
/home/pradeeka/orx-rpi/rpi/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -I/home/pradeeka/orx-rpi/rpi/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/python2.7 -c source/soft_pwm.c -o build/temp.linux-x86_64-2.7/source/soft_pwm.o
/home/pradeeka/orx-rpi/rpi/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -I/home/pradeeka/orx-rpi/rpi/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/python2.7 -c source/py_pwm.c -o build/temp.linux-x86_64-2.7/source/py_pwm.o
/home/pradeeka/orx-rpi/rpi/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -I/home/pradeeka/orx-rpi/rpi/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/python2.7 -c source/common.c -o build/temp.linux-x86_64-2.7/source/common.o
/home/pradeeka/orx-rpi/rpi/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -I/home/pradeeka/orx-rpi/rpi/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/python2.7 -c source/constants.c -o build/temp.linux-x86_64-2.7/source/constants.o
/home/pradeeka/orx-rpi/rpi/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -shared -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os build/temp.linux-x86_64-2.7/source/py_gpio.o build/temp.linux-x86_64-2.7/source/c_gpio.o build/temp.linux-x86_64-2.7/source/cpuinfo.o build/temp.linux-x86_64-2.7/source/event_gpio.o build/temp.linux-x86_64-2.7/source/soft_pwm.o build/temp.linux-x86_64-2.7/source/py_pwm.o build/temp.linux-x86_64-2.7/source/common.o build/temp.linux-x86_64-2.7/source/constants.o -L/home/pradeeka/orx-rpi/rpi/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lpython2.7 -o build/lib.linux-x86_64-2.7/RPi/GPIO.so
[7m>>> python-rpi-gpio 0.6.1 Installing to target[27m
(cd /home/pradeeka/orx-rpi/rpi/output/build/python-rpi-gpio-0.6.1//; PATH="/home/pradeeka/orx-rpi/rpi/output/host/bin:/home/pradeeka/orx-rpi/rpi/output/host/sbin:/home/pradeeka/orx-rpi/rpi/output/host/usr/bin:/home/pradeeka/orx-rpi/rpi/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" CC="/home/pradeeka/orx-rpi/rpi/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os " LDFLAGS="" LDSHARED="/home/pradeeka/orx-rpi/rpi/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc -shared" PYTHONPATH="/home/pradeeka/orx-rpi/rpi/output/target/usr/lib/python2.7/sysconfigdata/:/home/pradeeka/orx-rpi/rpi/output/target/usr/lib/python2.7/site-packages/" _python_sysroot=/home/pradeeka/orx-rpi/rpi/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot _python_prefix=/usr _python_exec_prefix=/usr  /home/pradeeka/orx-rpi/rpi/output/host/usr/bin/python setup.py install --prefix=/home/pradeeka/orx-rpi/rpi/output/target/usr )
running install
running build
running build_py
running build_ext
running install_lib
creating /home/pradeeka/orx-rpi/rpi/output/target/usr/lib/python2.7/site-packages/RPi
copying build/lib.linux-x86_64-2.7/RPi/GPIO.so -> /home/pradeeka/orx-rpi/rpi/output/target/usr/lib/python2.7/site-packages/RPi
copying build/lib.linux-x86_64-2.7/RPi/__init__.py -> /home/pradeeka/orx-rpi/rpi/output/target/usr/lib/python2.7/site-packages/RPi
byte-compiling /home/pradeeka/orx-rpi/rpi/output/target/usr/lib/python2.7/site-packages/RPi/__init__.py to __init__.pyc
running install_egg_info
Writing /home/pradeeka/orx-rpi/rpi/output/target/usr/lib/python2.7/site-packages/RPi.GPIO-0.6.1-py2.7.egg-info

 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160209/0e0bd102/attachment.html>
