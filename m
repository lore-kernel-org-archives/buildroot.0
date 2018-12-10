From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Dec 2018 17:50:54 +0100
Subject: [Buildroot] [PATCH] dl-wrapper: Fix urlencode option never
 being sent to backend
In-Reply-To: <671b136857f0b184e19f2f5452c1e764766bf912.camel@vitec.com>
References: <b97d7c67314b9312d4a79aa1a40ec4bd55ed61ff.camel@vitec.com>
 <20181207173522.GH2561@scaer>
 <671b136857f0b184e19f2f5452c1e764766bf912.camel@vitec.com>
Message-ID: <20181210165054.GH3383@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Damien, All,

On 2018-12-10 08:03 +0000, Damien Th?bault spake thusly:
> On Fri, 2018-12-07 at 18:35 +0100, Yann E. MORIN wrote:
> > On 2018-12-07 12:41 +0000, Damien Th?bault spake thusly:
> > > The urlencode parameter is lost in dl-wrapper, because we try to
> > > get it
> > > from backend instead of backend_urlencode.
> > > 
> > > We must get the urlencode information from backend_urlencode.
> > 
> > What is this trying to fix, actually? We have no download issue in
> > the autobuilders, as far as I can see... Do you have a test-case to
> > share?
> I have a build configured with a primary site and
> BR2_PRIMARY_SITE_ONLY=y that failed to download libopenssl patches from
> the mirror.

OK, makes sense, thanks for the feedback. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
