From: =?UTF-8?B?Q8OpZHJpYyBDaMOpcGllZA==?= <cedric.chepied@gmail.com>
Date: Sun, 09 Feb 2014 14:39:31 +0100
Subject: [Buildroot] [PATCH] ZNC: new package
In-Reply-To: <20140128195259.73158fe4@skate>
References: <1388876370-3441-1-git-send-email-cedric.chepied@gmail.com>
 <20140128195259.73158fe4@skate>
Message-ID: <52f78515.2f24b40a.5600.ffffd4a7@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

At Tue, 28 Jan 2014 19:52:59 +0100,
Thomas Petazzoni wrote:
> Looking at the configure.ac from ZNC, it seems like the OpenSSL and
> Perl support is optional, and can be disabled using --disable-openssl
> and --disable-perl. It would probably be a good idea to use these to
> make these dependencies optional.

When I try to enable perl, configure fails. It uses the perl executable to
generate LDFLAGS but it does that with "my" executable (/usr/bin/perl) and then
tries to link with /usr/lib/perl5/core_perl/CORE/libperl.so which of course
fails.

For python, configure programs can use ./output/host/usr/bin/python2.7 but I
can't find the same for perl. I only find perl compiled for my target.

How can I fix this?

Regards,
-- 
C?dric Ch?pied
<cedric.chepied@gmail.com>
