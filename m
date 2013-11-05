From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 05 Nov 2013 18:48:10 +0100
Subject: [Buildroot] Speeding up builds
In-Reply-To: <CAE9DZUT64x1L4jSzmD84GDwRxftajOSrjLS+O0v-u25w8EkyHw@mail.gmail.com>
References: <CAE9DZUT-G8g5cwWamULZ2ppUSOHjNf1O35diTno-uZj1_tCggA@mail.gmail.com>
 <20131105002042.704dabfe@skate> <87mwljohj5.fsf@dell.be.48ers.dk>
 <CAE9DZUT64x1L4jSzmD84GDwRxftajOSrjLS+O0v-u25w8EkyHw@mail.gmail.com>
Message-ID: <154ec9a4-5a4b-42c6-8f73-9bcf40236cc0@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dallas,

Please don't top-post...

Dallas Clement <dallas.a.clement@gmail.com> wrote:
>Apart from makefile -j during C file compilation, it seems that building is
>very serialized.  A lot of time is spent in ./configure script execution,
>and quite a bit in installation of files.  All of this appears to be very
>serial in nature.  I realize there is not much that can be done about
>autoconf / automake to avoid this serialization.
>
>It would be great if buildroot could build multiple packages in parallel.
>That way, multiple cores could at least be performing activities like
>./configure which tend to be serial.   Has there ever been any discussion
>about this?

Yes, definitely. There is at least one unsolved problem though. Some packages have optional dependencies: if the dependency is present when the package is built, it is used, otherwise it isn't (but compilation happily proceeds). This means that the package order is relevant in this case, and the end result will differ if the order is swapped due to parallel building. Expressing all these potential dependencies is unrealistic.

Have a look in the recent buildroot mailing list archives for the patches from Fabio Porcedda and the discussion around it. He has been working on this topic.

Best regards,
Thomas
