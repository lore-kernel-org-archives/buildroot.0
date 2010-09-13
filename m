From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 13 Sep 2010 14:32:38 +0000 (UTC)
Subject: [Buildroot] gdb and external toolchain
References: <4C8E2777.7030202@carallon.com>
Message-ID: <i6lcm5$cas$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-09-13, William Wagner <will_wagner@carallon.com> wrote:

> I'm using an external toolchain and want to get gdbserver onto my 
> target. I've seen the patch by Thomas that says that gdb host and 
> gdbserver should be provided by the external toolchain and I have set
> crosstools-ng to build them both.

As long as they're built from compatible versions of GDB source, it
doens't matter who provides what.  I use gdbserver built by Buildroot
and gdb built by crosstool-ng.

> The question I have is is there any mechanism to copy the gdbserver 
> executable built with crosstools into the target directory. I can't
> find anything that should be doing this. I can just copy the file
> over manually but was thinking I should add support for this to
> buildroot.  Any suggestions on how to do this?

Add gdbserver to the files copied in toolchain/external-toolchain/ext-tool.mk?

-- 
Grant
