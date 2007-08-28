From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 28 Aug 2007 14:30:26 +0200
Subject: [Buildroot] User-space packages - Staging_Dir or Target_Dir
In-Reply-To: <b6838d3a0708280435tc49ecfbs563b3aedf3d5b57c@mail.gmail.com>
References: <b6838d3a0708280435tc49ecfbs563b3aedf3d5b57c@mail.gmail.com>
Message-ID: <20070828123026.GC24891@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 28, 2007 at 07:35:03AM -0400, Daniel Frey wrote:
>Do I need to explicitly copy what I install into the staging dir into the
>root dir in order for the new libraries to be included in the resulting
>image?

I handle it like this:
staging_dir contains non-stripped stuff.
If a file is needed on the target, it has to be copied to the target.
That copy (in target_dir) is then (eventually) stripped.
This provides for easy debugging in the staging_dir since those contain
debug-info.
>
>I have seen this done in the xml2 makefile and I wasn't sure if it was
>needed for every package.

It is not needed for every package.
Think about tcpdump/libpcap. Consider how you don't want libpcap on your
target if the only app that is using it is tcpdump anyway. You would
rather link tcpdump against libpcap.a and only install tcpdump to the
target.

See?
