From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2015 21:53:41 +0200
Subject: [Buildroot] [PATCH 02/12] fs/iso9660: convert to the filesystem
 infrastructure
In-Reply-To: <20150606024313.51afc7ff@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <5572265D.4060204@mind.be>
 <20150606024313.51afc7ff@free-electrons.com>
Message-ID: <20150607195341.GP3545@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-06 02:43 +0200, Thomas Petazzoni spake thusly:
> Dear Arnout Vandecappelle,
> 
> On Sat, 06 Jun 2015 00:44:45 +0200, Arnout Vandecappelle wrote:
> > On 06/04/15 17:05, Thomas Petazzoni wrote:
> > > Now that we have <fs>_POST_GEN_HOOKS, there is nothing that prevents
> > > the iso9660 filesystem logic from using the common filesystem
> > > infrastructure.
> > > 
> > > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > 
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > 
> >  However, instead of doing the cleanup in a _POST_GEN_HOOK, I would skip the
> > cleanup completely. We normally don't clean up any build artefact, so why should
> > we do it here?
> 
> That's actually true. The only advantage by cleaning up is that if you
> redo a build and the contents of the temporary directory have changed,
> it's properly accurate.

Not if the image building itself fails (e.g. FS too large for iso9660,
or whatever other reason), so the temporary directory would still be
there.

> But we could also do:
> 
> 	remove temp dir
> 	create empty temp dir
> 	do stuff
> 	create image
> 
> and that's it.
> 
> Do you want to change it in this direction?

That would be better, yes.

However, that really spawns the question of whether Buildroot should
provide a clean, empty temporary directory from the onset, so we don't
re-invent this logic everywhere.

I'll see what I can do about that...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
