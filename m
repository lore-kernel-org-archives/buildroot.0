From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Nov 2016 22:34:03 +0100
Subject: [Buildroot] [PATCH v3] pseudo-wrapper: fix console issue
In-Reply-To: <20161123215745.7c307e23@free-electrons.com>
References: <20161123173650.1740-1-gael.portay@savoirfairelinux.com>
 <20161123182843.GA3609@free.fr>
 <20161123215745.7c307e23@free-electrons.com>
Message-ID: <20161123213403.GB13048@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-11-23 21:57 +0100, Thomas Petazzoni spake thusly:
> On Wed, 23 Nov 2016 19:28:43 +0100, Yann E. MORIN wrote:
> >   - long term, we want to definitely switch to using pseudo:
> >     - it is actively maintained,,
> >     - it has more features than fakeroot,
> >     - some of those features are very interesting for us.
> 
> Could you explain which additional features of pseudo are interesting
> for us?

pseudo can intercept and redirect acceses to /etc/paswd (and group,
shadow, gshadow) to the ones in the target. With that, we could probably
greatly simplify our handling of users.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
