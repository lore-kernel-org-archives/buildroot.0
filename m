From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 09:00:33 +0100
Subject: [Buildroot] PC post-build.sh issue
In-Reply-To: <CAKAYmMKFmVTyZau57e-WPUeriPrUAQ_W7w9Ypd8gKf6rQeh6ww@mail.gmail.com>
 (Chuck Tuffli's message of "Mon, 11 Feb 2019 16:20:44 -0800")
References: <CAKAYmMKFmVTyZau57e-WPUeriPrUAQ_W7w9Ypd8gKf6rQeh6ww@mail.gmail.com>
Message-ID: <87h8d9wi5a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chuck" == Chuck Tuffli <ctuffli@gmail.com> writes:

 > I've been using buildroot to generate a BIOS-based disk image for an
 > x86_64 system and seem to need to change the file:
 >    board/pc/post-build.sh
 > to copy from the i386-pc directory instead of the i387-pc directory.
 > I.e. the last line in the else clause is:
 >     cp -f "$HOST_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
 > Is this an indication I've mis-configured something else or is 'i387' a typo?

Heh, that indeed looks like a typo. It was introduced by commit
0b28397a9b (board/pc: ensure grub.cfg is copied to target filesystem)

Gr?goire?

-- 
Bye, Peter Korsgaard
