From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Sep 2017 01:07:54 +0200
Subject: [Buildroot] Issue adding subprocess32 python package to
	buildroot
In-Reply-To: <CAP3D3ge8ZXFXuB4_V5eSxnKAN=5hKWwYcxT2xRqM6HUOp39pUg@mail.gmail.com>
References: <CAP3D3ge8ZXFXuB4_V5eSxnKAN=5hKWwYcxT2xRqM6HUOp39pUg@mail.gmail.com>
Message-ID: <24023e40-1023-93df-8406-c2a46703a7ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-09-17 16:18, Paul Gildea wrote:
> /media/vmpart/5.1.0_x86/buildroot/output/host/usr/bin/ccache /usr/bin/gcc -pthread -fno-strict-aliasing -O2 -I/media/vmpart/5.1.0_x86/buildroot/output/host/include -I/media/vmpart/5.1.0_x86/buildroot/output/host/usr/include -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -fPIC -I/media/vmpart/5.1.0_x86/buildroot/output/host/usr/include/python2.7 -c _posixsubprocess.c -o build/temp.linux-x86_64-2.7/_posixsubprocess.o

 You're using the host compiler to build a target package. You need to pass
CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" to setup.py in the build step.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
