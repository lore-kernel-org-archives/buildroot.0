From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Mon, 23 Sep 2019 08:45:39 -0700
Subject: [Buildroot] switching hardware-specific parts of .config?
Message-ID: <15a50c1f-a2bb-253b-aad4-50ba6a8782b4@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a .config that currently targets a particular architecture/board. 
What's the best way to switch just the hardware parts of it to target a 
different board from a different architecture, leaving options like 
package selection or rootfs format unaffected?

I imagine I could:

  * Maintain two separate config files. This would require me to
    remember that when I change e.g. package selection in one, I need to
    make the corresponding change in the other.
  * Maintain three config file fragments (2x hardware, 1x "other"). When
    I make changes, this would require me to manually split the ultimate
    .config back in to hardware and "other" fragments.
  * Create a tool to rewrite the single .config, e.g. replacing options
    like BR2_arm=y. This would require the rewriting tool to know the
    full set of options it needs to replace. I already do essentially
    this with toolchain options (so you can point at a different
    toolchain and have your config rewritten to match), so it's not
    crazy... but it might not be as easy as with BR2_TOOLCHAIN_*.

Any recommendations? Thanks!

-- 
Hollis Blanchard
Mentor Graphics Emulation Division

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190923/8930b446/attachment.html>
