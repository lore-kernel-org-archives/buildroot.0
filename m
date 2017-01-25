From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 25 Jan 2017 22:05:42 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-01-24
In-Reply-To: <20170125073013.D171D20CD4@mail.free-electrons.com>
References: <20170125073013.D171D20CD4@mail.free-electrons.com>
Message-ID: <1485378342.7516.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2017-01-25 at 08:30 +0100, Thomas Petazzoni wrote:
> Hello,

[snip]

> Detail of failures
> ===================
> 
> ????????i586 |????????????????bctoolbox-0.4.0 | NOK | http://autobuil
> d.buildroot.net/results/4b4b00ad3b95ddacc9d5cc31c34e457ee55c9364

Unfortunately I cannot reproduce this issue. Is it a rpath issue? cmake
links a test program with host zlib:

[..]/i586-buildroot-linux-musl/bin/ld: warning: libc.so.6, needed by
/usr/lib32/libz.so.1, not found (try using -rpath or -rpath-link)
/usr/lib32/libz.so.1: undefined reference to `strcpy at GLIBC_2.0'

I have no idea how to fix it. bctoolbox' cmakelists.txt does set
CMAKE_INSTALL_RPATH=/usr/lib. Is this a problem?

Best regards,
J?rg Krause
