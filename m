From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Sep 2015 17:17:29 +0200
Subject: [Buildroot] EOVERFLOW fstat() error on cortex-A9 android when
 trying to load shared library
In-Reply-To: <CAF5aO=LiY_3XBn+HgA8-nwJk51GQkgGQqbnpmdQoyS64zxDTWA@mail.gmail.com>
References: <CAF5aO=Ko183BGatMakjXot=EsnXbaodOHZPRmnMa8nqH=vZkEw@mail.gmail.com>
 <55EDA03A.2070302@mind.be>
 <CAF5aO=LYm6GYVXv0gJW9fS3A8JXMAeZwnEokG0Htpac4SZuJVQ@mail.gmail.com>
 <CAF5aO=LiY_3XBn+HgA8-nwJk51GQkgGQqbnpmdQoyS64zxDTWA@mail.gmail.com>
Message-ID: <55EDAA89.20809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-09-15 16:53, Alex Potapenko wrote:
> Thank you for your response, Arnout!
> Unfortunately, that is not the reason here. I use Buildroot to build the
> toolchain only. And then use modified Optware build system to cross-compile the
> packages. armeabi feed is built with '
> -Wl,--dynamic-linker=/opt/lib/ld-uClibc.so.0' ld flag, so they know where the
> linker resides.

 Weird, since strace shows that it is looking inside /system and lc-uClibc.so
would never do that...

 Your kernel does have CONFIG_AEABI I hope?


 Could you try to build without the --dynamic-linker and install in / ? Just to
exclude that potential issue.


 Regards,
 Arnout

 PS Please don't top-post.

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
