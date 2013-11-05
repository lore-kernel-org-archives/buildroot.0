From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Tue, 5 Nov 2013 11:29:22 -0600
Subject: [Buildroot] Speeding up builds
In-Reply-To: <87mwljohj5.fsf@dell.be.48ers.dk>
References: <CAE9DZUT-G8g5cwWamULZ2ppUSOHjNf1O35diTno-uZj1_tCggA@mail.gmail.com>
 <20131105002042.704dabfe@skate> <87mwljohj5.fsf@dell.be.48ers.dk>
Message-ID: <CAE9DZUT64x1L4jSzmD84GDwRxftajOSrjLS+O0v-u25w8EkyHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apart from makefile -j during C file compilation, it seems that building is
very serialized.  A lot of time is spent in ./configure script execution,
and quite a bit in installation of files.  All of this appears to be very
serial in nature.  I realize there is not much that can be done about
autoconf / automake to avoid this serialization.

It would be great if buildroot could build multiple packages in parallel.
That way, multiple cores could at least be performing activities like
./configure which tend to be serial.   Has there ever been any discussion
about this?


On Mon, Nov 4, 2013 at 5:48 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> writes:
>
>  > Dear Dallas Clement,
>  > On Mon, 4 Nov 2013 13:00:54 -0600, Dallas Clement wrote:
>
>  >> I'm just looking for some tips on how to speed up my build times.  My
>  >> rootfs contains many packages with lots of dependencies.  Even with 8
>  >> fast Xeon cores, 64GB of RAM, SSDs, and SAS drives, my builds are
>  >> taking 1 hour and 50 minutes.
>
> ~2h sounds quite long indeed. I don't use as many packages as you, but a
> fairly big config (123 packages, including Qt and Gstreamer1) takes <
> 20mins on a pretty normal quad haswell (E3-1240) / 32G RAM / SSDs.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131105/f96ec5c0/attachment.html>
