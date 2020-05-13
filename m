From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 May 2020 23:32:22 +0200
Subject: [Buildroot] Adding post image hook
In-Reply-To: <20200513212952.GD12536@scaer>
References: <20200511175027.71ed1d22@windsurf.home>
 <ea-mime-5ebc52f4-7a9b-60b07d84@www-1.mailo.com>
 <20200513221628.42c07184@windsurf.home>
 <CAFV4z9Y6QvY=Ds2sw6U27fSnrcVeKJ0a9p8-nZhHZS+Mua3fEQ@mail.gmail.com>
 <20200513212952.GD12536@scaer>
Message-ID: <20200513213222.GE12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2020-05-13 23:29 +0200, Yann E. MORIN spake thusly:
> On 2020-05-13 14:09 -0700, Patrick Mochel spake thusly:
> > Hi Thomas,
> > On Wed, May 13, 2020 at 1:16 PM Thomas Petazzoni < [1]thomas.petazzoni@bootlin.com> wrote:
> >   Or alternatively, you can do just:
> >   ? make printvars
> This only works for in-tree builds. For out-of-tree builds, you would
> want to run (this also works for in-tree builds):
>     make -C $(BASE_DIR) printvars

Of course, since this is in a shell script, this should be ${BASE_DIR}
not $(BASE_DIR).

[--SNIP--]
> If you want information from packages, you should use (and extend if
> needed) from your post-scripts:
>     make --no-print-directory -C $(BASE_DIR) show-info

Ditto.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
