From: Shawn J. Goff <shawn7400@gmail.com>
Date: Thu, 21 Mar 2013 13:01:08 -0400
Subject: [Buildroot] Trouble linking libroxml
In-Reply-To: <CAGiDA6+wP_PEqQ0SvLO6EUng0fkH2FH-hFvPyBYcNLa1yaTHXg@mail.gmail.com>
References: <CAGiDA6+wP_PEqQ0SvLO6EUng0fkH2FH-hFvPyBYcNLa1yaTHXg@mail.gmail.com>
Message-ID: <CAGiDA6J3Ncm8=i6Gp+BEDcoHrXXjEQGQwD4aSLdbeJjexVVeRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 19, 2013 at 6:21 PM, Shawn J. Goff <shawn7400@gmail.com> wrote:
> I'm trying to link use libroxml, but I'm getting errors like this:
>
>     undefined reference to `roxml_load_buf(char*)'
>
> The compiler line looks like this:
>
>     arm-unknown-linux-gnueabi-g++   main.o debug.o modem.o mutex.o
> qmodem.o serial.o util.o -lusb -lrt -lpthread -lm -lcurl -lroxml -o
> modem-monitor
>
> libroxml.so is built and in the target and the sysroot, and
> arm-unknown-linux-gnueabi-nm shows the symbol is present.
>
>
> Is there anything else I might be missing?

kos_tom helped me in the chat room. g++ mangles its symbol names, so
when you link a C library, you have to tell the compiler to treat the
symbols as C symbols instead of c++ symobls. More details are here:
http://stackoverflow.com/questions/67894/why-do-we-need-extern-c-include-foo-h-in-c
.
