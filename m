From: Luca Ceresoli <list@lucaceresoli.net>
Date: Wed, 12 Jan 2011 14:51:09 +0100
Subject: [Buildroot]
	=?utf-8?q?=5BPATCH_1/2=5D_liberation=3A_add_support_f?=
	=?utf-8?q?or_custom_target_directory?=
Message-ID: <LEWX59$4533F784E6DAC4CB1531E0AED3C460A7@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel Nystr?m wrote:
> > In other words, which use case is this solving ? If it's a general font
> > location problem, maybe this should not be a Liberation-specific option.
> 
> In my opinion, letting default installation directory keep using font
> named subdir but still configurable would cover most cases.

I think Thomas is right: a unique setting should be used to override
the font install dir.

It might look like this in menuconfig:

      *** X libraries and helper libraries ***
  ()  Force all fonts to be installed here {*}
  [*] DejaVu (Free fonts)  --->
  [ ] Liberation (Free fonts) 
      *** X Window managers ***

{*} if this is empty, each font .mk will install in the default directory,
as liberation does in current head;
otherwise all fonts will be copied in the directory specified.

How about this?

Luca
