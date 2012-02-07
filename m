From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 7 Feb 2012 17:54:59 +0000 (UTC)
Subject: [Buildroot] Customize package not copy .svn .git etc?
References: <jgrkfd$m8n$1@dough.gmane.org> <4F315A9B.1000207@lucaceresoli.net>
Message-ID: <jgrohj$npe$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-02-07, Luca Ceresoli <luca@lucaceresoli.net> wrote:

> Grant Edwards wrote:
>> Do other users of the customize package not use svn, git, CVS, etc?
>
> During the Buildroot Developers Day last Friday we agreed that the
> customize package is not well-written and not satisfactory, thus it
> will be deprecated in 2012.02 and removed in a following release.

I guess I won't submit a patch for it then. :)

> A much better method to obtain the same result is to put your board
> specific files in board/<company>/<project>/rootfs-additions/, and
> write a command in the post-build script to copy these files onto the
> target root filesystem.

I'll put that on the list of things to do.

> Ah, actually this won't solve your problem with some version control
> systems such as Subversion < 1.7 or CVS which create hidden
> directories for their metadata. To solve this problem you should, in
> my personal order of preference:
>
> - use git, which creates only one hidden dir in the project root, or

Not an option.  We've spent the last several years moving from VSS to
SVN (and we're not finished yet).  Suggesting we now switch to git
would be futile (though I personally would like git just fine handling
branches in svn is clumsy compared to git).  The last time I checked
git wasn't well supported on Windows, and we have some windows
projects to worry about.

> - upgrade to Subversion >= 1.7, which created only one dir as git
>   does, or

That will happen eventually...

> - write your post-build script so that it bypasses .svn and CVS dirs,
>   for example using the find command.

That's probably "the right thing".

Thanks for the warning about customize going away.

-- 
Grant Edwards               grant.b.edwards        Yow! Now KEN and BARBIE
                                  at               are PERMANENTLY ADDICTED to
                              gmail.com            MIND-ALTERING DRUGS ...
