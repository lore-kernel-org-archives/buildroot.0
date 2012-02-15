From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 15 Feb 2012 18:20:08 +0100
Subject: [Buildroot] opencv with glibc
In-Reply-To: <CAPeX=+ubBEJeR9s+gH8ACDpUToXLA_rDqDwL4NT44BZ-PsfFsA@mail.gmail.com>
References: <CAPeX=+tCiegGOeD2bi9+v8aOVrB=FjHo3XEAvp1b5tNfR85N-w@mail.gmail.com>
 <CAPeX=+ubBEJeR9s+gH8ACDpUToXLA_rDqDwL4NT44BZ-PsfFsA@mail.gmail.com>
Message-ID: <CAHXCMMKLFopuH8ubCnaY2_1oKkXf-wXHmzV_Fvo77NAutCKOcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,

Ozgun: you want to use a glibc toolchain, right?

your .config file say that, contrary to your logs:
>> CMake Error: your CXX compiler:
>> "/usr/src/br/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-g++"
>> was not found.?? Please set CMAKE_CXX_COMPILER to a valid compiler path or

before changing your configuration to build a ct-ng glibc toolchain,
did you run 'make clean', 'make distclean' ?
if yes, then there is a bug in BR that does not delete the
toolchainfile.cmake when calling clean/distclean target.

btw, removing the buildroot/output/toolchainfile.cmake  and running
make again should fix your issue.

regards,

Sam
