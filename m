From: David Laight <David.Laight@ACULAB.COM>
Date: Wed, 23 Jun 2021 10:08:59 +0000
Subject: [Buildroot] busybox stty writing to stderr
Message-ID: <20a28845b54b472b89b78d2b57a308fd@AcuMS.aculab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is with the previous release - so might have been changed.

If I run 'stty -a' on a serial console I get an error
message "stty: standard input\n" written to stderr.

If I redirect stdout I get the error message
"stty: standard input: Inappropriate ioctl for device\n"

Both are written between the write of "speed 115200 baud;"
and " line = 0\n".

I suspect they are related to TIOCGWINSZ failing.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
