From: QuickX <quickx@hotmail.com>
Date: Wed, 18 Feb 2009 16:58:06 -0800
Subject: [Buildroot] BR-2009.01 U-Boot not working on my AT91SAM9261ek Board
Message-ID: <BAY124-DS7756E1F27FE5A88524B2BD2B20@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've finally had some time to attempt to update my project to BR-2009.02 and noticed some things, so thought I'd share.

1. microperl (default config option) doesn't build on Kubuntu 8.10 (Make Errors).
2. php (default config option) doesn't build on Kubuntu 8.10 (it doesn't try to download but complains it can't find it in the dl directory).
3. U-Boot (Add architecture specific patch -> Add AT91 specific patches to u-Boot) causes u-Boot to not work on board.

Little more info on "3" is if this option is set (default) then Hyperterminal sits at the at91bootstrap message forever and doesn't load u-boot.  If I turn this option off and then issue the following, it works.

$ make menuconfig (turn off u-boot at91 patch)
$ rm -rf *build_*
$ make



The Hyperterminal (in the non-working case, with patch set) looks like this (and sits there forever):
>AT91Bootstrap-2.10...AT45DB642D detected
>From:  [0x00008400] To:        [0x23F00000] Size:      [0x00032000]
.......SUCCESS
>Start: [0x23F00000] Error Timeout
Error Timeout
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090218/b9520fe6/attachment.htm>
