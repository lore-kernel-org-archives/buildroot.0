From: Chuck Tuffli <ctuffli@gmail.com>
Date: Mon, 11 Feb 2019 16:20:44 -0800
Subject: [Buildroot] PC post-build.sh issue
Message-ID: <CAKAYmMKFmVTyZau57e-WPUeriPrUAQ_W7w9Ypd8gKf6rQeh6ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been using buildroot to generate a BIOS-based disk image for an
x86_64 system and seem to need to change the file:
   board/pc/post-build.sh
to copy from the i386-pc directory instead of the i387-pc directory.
I.e. the last line in the else clause is:
    cp -f "$HOST_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
Is this an indication I've mis-configured something else or is 'i387' a typo?

--chuck
