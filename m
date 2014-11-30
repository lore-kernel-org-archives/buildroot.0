From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 15:25:51 +0100
Subject: [Buildroot] [PATCH] package/mutt: specify the mailpath
In-Reply-To: <20141130151515.3af7e775@free-electrons.com>
References: <1417258556-16797-1-git-send-email-yann.morin.1998@free.fr>
 <20141130151515.3af7e775@free-electrons.com>
Message-ID: <20141130142551.GE4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:15 +0100, Thomas Petazzoni spake thusly:
> On Sat, 29 Nov 2014 11:55:56 +0100, Yann E. MORIN wrote:
> > mutt's ./configure looks for different paths for where to look for
> > incoming mails.
> > 
> > This is absolutely worng in the case of cross-compilation, because the
> > path it may find on the host may not exist on the target.
> > 
> > Not only that, but some host may not even have any of the paths
> > ./configure looks for.
> > 
> > Fix that by specifying the mailpath, and set it to the value documented
> > in the FHS [0]
> > 
> > Since Buildroot only guarantees /tmp to be writable, make /var/mail a
> > symlink to /tmp .
> > 
> > [0] http://refspecs.linuxfoundation.org/FHS_2.3/fhs-2.3.html#VARMAILUSERMAILBOXFILES
> > 
> > Reported-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/mutt/mutt.mk | 7 +++++++
> >  1 file changed, 7 insertions(+)
> 
> At this point, I'm not sure if this is still material for master
> (2014.11) or for next.

I don;'t realy care either. It fixes a relatively rare occurence of a
build failure, which happens only in very tightly controlled systems,
and we have had only one report of it since we've been packaging mutt
(that is, the past 7 years!), so I think it can well go in -next.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
