From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2015 11:33:17 +0200
Subject: [Buildroot] [PATCH 1/1] Fix umask settings for non-bash shells
 for root user
In-Reply-To: <20150829112955.3a6b8d77@free-electrons.com>
References: <1434378026-15007-1-git-send-email-vorel@jablocom.com>
 <20150829105707.3d5e0fec@free-electrons.com>
 <20150829092037.GA4857@free.fr>
 <20150829112955.3a6b8d77@free-electrons.com>
Message-ID: <20150829093317.GB4857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-29 11:29 +0200, Thomas Petazzoni spake thusly:
> On Sat, 29 Aug 2015 11:20:37 +0200, Yann E. MORIN wrote:
> > > Yann, Arnout, Peter, your thoughts?
> > 
> > My opinion? Here's what I'd do ;-)
> >     git rm system/skeleton/root/.bash_*
> 
> That's also what I want to do.
> 
> > And maybe provide a simple .profile *iff* needed.
> 
> Can you check if a .profile is really needed? If so, can you submit a
> patch series cleaning up .bash_* ?

After the release, maybe?

> > Furthermore, I'd also like /etc/profile be cleaned-up of all the mess,
> > moving each (interesting) parts to separate files in /etc/profile.d/ .
> 
> Why not, but let's say it's a separate matter.

Yes.

> > And while at it:
> > 
> >     git rm system/skeleton/root/.empty
> 
> Why? Git doesn't track empty directories, so we have those .empty files
> all over the place. I don't see what would recreate the root/ directory
> for the root user if we don't keep it in the skeleton. Am I missing
> something?

Right. I was thinking of keeping a .profile in that directory. If there
is a .profile, there is no need for .empty . If there is no .profile
(and no other file), we need to keep .empty , yes.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
