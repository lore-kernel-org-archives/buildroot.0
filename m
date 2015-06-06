From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2015 11:02:45 +0200
Subject: [Buildroot] [PATCH 04/12] fs/iso9660: enable Joliet extension
In-Reply-To: <20150606024643.15fb2bc7@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150605211840.GD3641@free.fr>
 <20150606024643.15fb2bc7@free-electrons.com>
Message-ID: <20150606090245.GB3581@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-06 02:46 +0200, Thomas Petazzoni spake thusly:
> On Fri, 5 Jun 2015 23:18:40 +0200, Yann E. MORIN wrote:
> 
> > Only tangentially related to your change:
> > 
> > -R is for RockRidge, but it seems using -r would be better:
> > 
> >     -r  This is like the -R option, but file ownership and modes are set
> >         to more useful values. [--snip--]
> > 
> > Reading the full entry for -r is instructive, and makes it sound like
> > that's what we would want to use instead of -R.
> 
> I'm actually not sure. Let's list what -r is doing compared to -R:
> 
>  * Setting uid:gid to 0:0 to all files. We already do that using
>    fakeroot, and we also set some other ownership for specific files
>    using <pkg>_PERMISSIONS and the device table. So getting all of that
>    reset to 0:0 is wrong.
> 
>  * Changing permissions all over. Why do we care? We already take care
>    of dependencies, and -r makes everything world-readable, which we
>    clearly don't want.
> 
>  * It apparently clears the set-id bit, which would make all setuid
>    application to break.
> 
> So, in fact I'm rather convinced that we should keep -R and not use -r.

Yes, you're right! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
