From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 17:37:49 +0100
Subject: [Buildroot] as: unrecognized option '--64'
In-Reply-To: <CAKradHu116Zh8Rh-iWk9a=UL6SrtBz48-syBD=5uOJaZpWdRTw@mail.gmail.com>
References: <CAKradHu116Zh8Rh-iWk9a=UL6SrtBz48-syBD=5uOJaZpWdRTw@mail.gmail.com>
Message-ID: <20160119173749.70bff526@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Jan 2016 17:26:53 +0100, Alejandro Blasco wrote:

> /home/alejandro/Desktop/linux/buildroot/output/host/usr/bin/ccache
> /usr/bin/g++ -c   -O2
> -I/home/alejandro/Desktop/linux/buildroot/output/host/usr/include
> -DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE  -fno-exceptions -fno-rtti
> -fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings
> -Wcast-qual -Wmissing-format-attribute -Woverloaded-virtual -pedantic
> -Wno-long-long -Wno-variadic-macros
> -Wno-overlength-strings   -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild
> -I../../gcc -I../../gcc/build
> -I../../gcc/../include  -I../../gcc/../libcpp/include  \
> -o build/genconstants.o ../../gcc/genconstants.c
> /home/alejandro/Desktop/linux/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/bin/as:
> unrecognized option '--64'
> Makefile:2436: recipe for target 'build/version.o' failed

Thanks for the report. Could you:

 *) Disable ccache support

 *) Use uClibc-ng instead of uClibc snapshot, since we actually test
    uClibc-ng support, but not uClibc snapshot support

 *) Make sure you don't have anything weird in your PATH.

(Those are just basic sanity checks since I don't know specifically
where this error is coming from).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
