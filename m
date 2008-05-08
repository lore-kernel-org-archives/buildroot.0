From: Nigel Kukard <nkukard@lbsd.net>
Date: Thu, 08 May 2008 05:18:11 +0000
Subject: [Buildroot] Bash patches not working? (bash32-025 and up)
In-Reply-To: <326f33790805071819n32858557o187314db62ce5b26@mail.gmail.com>
References: <326f33790805071819n32858557o187314db62ce5b26@mail.gmail.com>
Message-ID: <1210223891.4822.142.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Continuing on with my ARM926T variant build, I run into a bit of a
> problem with the BASH patches being applied. 
> 
> bash32-001 through bash32-024 are successful. But starting with
> bash32-025 I am getting problems as shown here:
> 
> http://img329.imageshack.us/img329/4510/bashpatchnn1.jpg
> 
> It seems that the patch files under ~/buildroot/package/bash/ have
> lines that show the location of specific files. For example,
> bash32-025 shows: lib/readline/input.c, while bash32-024 and before
> show locations such as bash-3.2/lib/readline/display.c
> 
> The difference is that "bash-3.2" location in the directory name. It
> is possible that the correct patch can't be found for 25 and up
> because of this. The thing is I can't edit these patch files because
> they are overwrriten during the build, which means they are copied or
> downloaded from somwhere. I looked at the bash patch fixes and the
> latest ones seem to fix 25 and up, and this was done 6 days ago. So I
> simply upgraded my snapshot to the latest one available- May 7th 2008.
> But I build again and still run into the same problem.
> 
> http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi/trunk/buildroot/package/bash/
> 
> Anyone know what I can do to fix this? Any help is of course
> appreciated.

Did you remove the bash directory before rebuilding?

I've just tested with latest svn and the patches apply fine and bash
builds.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080508/ff8ad943/attachment.pgp 
