From: mike <wtf62@rovoreed.com>
Date: Sat, 30 Dec 2006 19:57:17 +0000
Subject: [Buildroot] i2c undefines
Message-ID: <1167508638.10282.35.camel@glynys>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to rebuild some applications that I used to have running with
an old version of buildroot, but now I'm getting undefined symbols, and
it's all stuff to do with i2c_smbus_* library routines.

e.g.

sensor.o: In function `main':/home/mike/work/sensor/sensor.c:77:
undefined reference to `i2c_smbus_read_byte_data'
:/home/mike/work/sensor/sensor.c:84: undefined reference to
`i2c_smbus_write_block_data'
:/home/mike/work/sensor/sensor.c:99: undefined reference to
`i2c_smbus_write_byte'
:/home/mike/work/sensor/sensor.c:111: undefined reference to
`i2c_smbus_read_word_data'

The linux kernel header file i2c.h supplied with a pukka kernel is
different to the one I find in
build_arch/staging_dir/include/linux/i2c.h

So what's going on here ? Why is the i2c.h header in the staging_dir
hierarchy different to the real i2c.h header ?

Mike
