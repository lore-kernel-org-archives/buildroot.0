From: Christian Stewart <christian@paral.in>
Date: Mon, 23 Sep 2019 17:03:58 -0700
Subject: [Buildroot] switching hardware-specific parts of .config?
In-Reply-To: <15a50c1f-a2bb-253b-aad4-50ba6a8782b4@mentor.com>
References: <15a50c1f-a2bb-253b-aad4-50ba6a8782b4@mentor.com>
Message-ID: <CA+h8R2ooCvLz5so5cnrcJBejGGoeEyxDLPiABzK8e21wbsn5-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hollis,


On Mon, Sep 23, 2019, 8:53 AM Hollis Blanchard <hollis_blanchard@mentor.com>
wrote:

> I have a .config that currently targets a particular architecture/board.
> What's the best way to switch just the hardware parts of it to target a
> different board from a different architecture, leaving options like package
> selection or rootfs format unaffected?
>
> I imagine I could:
>
>    - Maintain two separate config files. This would require me to
>    remember that when I change e.g. package selection in one, I need to make
>    the corresponding change in the other.
>    - Maintain three config file fragments (2x hardware, 1x "other"). When
>    I make changes, this would require me to manually split the ultimate
>    .config back in to hardware and "other" fragments.
>    - Create a tool to rewrite the single .config, e.g. replacing options
>    like BR2_arm=y. This would require the rewriting tool to know the full set
>    of options it needs to replace. I already do essentially this with
>    toolchain options (so you can point at a different toolchain and have your
>    config rewritten to match), so it's not crazy... but it might not be as
>    easy as with BR2_TOOLCHAIN_*.
>
>
I did this with https://github.com/paralin/skiffos which wraps buildroot
with some scripts to combine device specific config fragments / layers /
patches together.

I've collected a small group of users and we are working on porting +
testing new boards.

Best regards,
Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190923/0655db78/attachment.html>
