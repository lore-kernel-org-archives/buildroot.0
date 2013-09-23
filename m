From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 24 Sep 2013 00:17:08 +0200
Subject: [Buildroot] [PATCHv2 1/4] core: introduce the BR2_EXTERNAL
	variable
In-Reply-To: <OF92E620E9.2D6A14D7-ON86257BEF.0070A92F-86257BEF.007178BD@rockwellcollins.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1379185433-8770-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF92E620E9.2D6A14D7-ON86257BEF.0070A92F-86257BEF.007178BD@rockwellcollins.com>
Message-ID: <CAHXCMM+GdD3A1RGMawhct3QZViQ+qnSuh66e4p1txZSJ5J8Zvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan, Thomas,


2013/9/23 Ryan Barnett <rjbarnet@rockwellcollins.com>
>
> Thomas,
>
> I've been using this patch for around a week now and today I tired to
> generate the manual with this patch applied. However, "make manual"
> fails pretty bad with this patch set applied. Have you tired
> generating the manual at all?
>
> Here is what I've done:
>  * Applied all four patches for v2 of BR2_EXTERNAL
>  * make clean
>  * make manual
>
> I'm not exactly sure the root cause of the problem but my guess is
> the top-level Config.in. To fix the problem, I just revert the 4
> patches and I can build the manual fine. When I do make manual I
> get the following error output:
>
> /home/rjbarnet/projects/buildroot/buildroot-git/Config.in:19:warning:
> The symbol BR2_EXTERNAL references the non-existent environment variable
BR2_EXTERNAL and will
> get the empty string as its value.
>
> If you're using kconfiglib via 'make (i)scriptconfig' it should have set
up the
> environment correctly for you. If you still got this message, that might
be an
> error, and you should e-mail kconfiglib at gmail.com.
> .
> Traceback (most recent call last):
>   File
"/home/rjbarnet/projects/buildroot/buildroot-git/support/scripts/gen-manual-lists.py",
line 376, in <module>
>     buildroot = Buildroot()
>   File
"/home/rjbarnet/projects/buildroot/buildroot-git/support/scripts/gen-manual-lists.py",
line 217, in __init__
>     self.root_config))
>   File
"/home/rjbarnet/projects/buildroot/buildroot-git/support/scripts/kconfiglib.py",
line 214, in __init__
>     self.top_block = self._parse_file(filename, None, None, None)
>   File
"/home/rjbarnet/projects/buildroot/buildroot-git/support/scripts/kconfiglib.py",
line 919, in _parse_file
>     return self._parse_block(line_feeder, None, parent, deps,
visible_if_deps, res)
>   File
"/home/rjbarnet/projects/buildroot/buildroot-git/support/scripts/kconfiglib.py",
line 1114, in _parse_block
>     self.base_dir))
> IOError: /home/rjbarnet/projects/buildroot/buildroot-git/Config.in:490:
sourced file "$BR2_EXTERNAL/Config.in" (expands to
> "2_EXTERNAL/Config.in") not found. Perhaps base_dir
> (argument to Config.__init__(), currently
> "/home/rjbarnet/projects/buildroot/buildroot-git") is set to the wrong
value.
> make: *** [manual-update-lists] Error 1

Good catch!
I missed it...

Could you try this patch: http://code.bulix.org/y27qmv-84542

Regards,


--
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130924/b6c49e3c/attachment.html>
