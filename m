From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Mar 2016 16:49:42 +0200
Subject: [Buildroot] [PATCH] package/tvheadend: use wizard mode on first
 run
In-Reply-To: <20160328151009.01a515f2@free-electrons.com>
References: <1459090620-21422-1-git-send-email-yann.morin.1998@free.fr>
 <20160328151009.01a515f2@free-electrons.com>
Message-ID: <20160328144942.GA3608@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-28 15:10 +0200, Thomas Petazzoni spake thusly:
> On Sun, 27 Mar 2016 16:57:00 +0200, Yann E. MORIN wrote:
> > The format of the ACL database in tvheandend has changed, and generating
> > a default user is a little bit more involved than just dumping a file in
> > the correct locations: filenames are now md5sum (of something?) and the
> > usernames and passwords now have their own DB.
> > 
> > However, tvheadend has a wizard mode, where it is possible to configure
> > the basic features, of which creating an admin user.
> > 
> > We remove our canned ACL database, and change the startup script to
> > start in wizard mode on first run.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/tvheadend/Config.in    | 4 ++--
> >  package/tvheadend/S99tvheadend | 5 +++++
> >  package/tvheadend/tvheadend.mk | 8 --------
> >  3 files changed, 7 insertions(+), 10 deletions(-)
> 
> I don't see this patch removing the accesscontrol.1 file. Is that
> expected?

Damn, I forgot to git-rm it...
Will fix and respin.

Thanks!

Regards,
Yann E. MORIN.

> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
