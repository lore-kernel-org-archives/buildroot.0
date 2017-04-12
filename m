From: Adam Baxter <voltagex@voltagex.org>
Date: Wed, 12 Apr 2017 21:57:22 +1000
Subject: [Buildroot] Problem with new external tree syntax?
In-Reply-To: <CAChFQ9R0w3gpqXeTjfVfYvHdnhE4aFcE1nPYTcZgw0deRWRsoQ@mail.gmail.com>
References: <CAChFQ9R0w3gpqXeTjfVfYvHdnhE4aFcE1nPYTcZgw0deRWRsoQ@mail.gmail.com>
Message-ID: <CAChFQ9QK4q8Yd6uhaFt820aXRr8Jbe2s7zmcH1wB7jEZxGw8pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Solved!

Thanks to kos_tom on IRC.

Turns out I didn't quite read the manual correctly. See
https://buildroot.org/downloads/manual/manual.html#_layout_of_a_br2_external_tree

external.desc was set correctly, but the variable name in this case would
be $(BR2_EXTERNAL_SKELETON_X86_64_PATH), not what I'd already set.

Then, running make skeleton_defconfig && make busybox works correctly.

Regards,
Adam
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170412/f906f47c/attachment.html>
