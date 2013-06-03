From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Jun 2013 20:36:00 +0200
Subject: [Buildroot] Why does boost require bzip2
In-Reply-To: <51ACDCD8.5080806@carallon.com> (Will Wagner's message of "Mon,
 03 Jun 2013 19:13:44 +0100")
References: <51ACDCD8.5080806@carallon.com>
Message-ID: <87wqqbghyn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Hello,
 Will> Does anyone know why the boost package requires bzip2? I am
 Will> wanting to build a very small rootfs and require only a single
 Will> boost library, I want to avoid the overhead of having the bzip2
 Will> library in my target fs.

It has been there since the boost package was added:

commit f64a740f360439bbab6526b8a08588a57ea8fd52
Author: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date:   Thu Oct 13 12:39:12 2011 +0200

    boost: New package added. Version 1.47
    
    [Peter: Config.in tweaks]
    Signed-off-by: Allan W. Nielsen <a@awn.dk>
    Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

But I don't know enough about boost to know if it really is needed.

I must say that libbz2 is probably not your biggest concern compared to
the size of libstdc++ and the template heavy boost code:

-rwxr-xr-x 1 peko peko 73K Jun  3 20:28 output/target/usr/lib/libbz2.so.1.0.6
-rwxr-xr-x 1 peko peko 624K 2013-06-03 19:42 output/target/usr/lib/libstdc++.so.6.0.16

 Will> If I change the boost package it still manages to build all the
 Will> libraries so I can't work out which libraries need bzip2.

Perhaps it used to be a dependency of something, and isn't anymore? We
have relatively recently (February) bumped the boost version to 1.53.0.

 Will> (I also have a build failure when trying to build the boost
 Will> context library, it is failing because my arm target doesn't
 Will> support the assembler, I'll look into that error separately).

Thanks!

-- 
Bye, Peter Korsgaard
