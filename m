From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Apr 2019 15:55:43 +0200
Subject: [Buildroot] [PATCH] Revert "package/gettext-tiny: bump version
 to add --template option"
In-Reply-To: <20190407151147.02ada3fa@windsurf>
References: <20190407073708.11205-1-yann.morin.1998@free.fr>
 <20190407151147.02ada3fa@windsurf>
Message-ID: <20190407135543.GO2659@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-04-07 15:11 +0200, Thomas Petazzoni spake thusly:
> On Sun,  7 Apr 2019 09:37:08 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > This reverts commit 758ea0e518492c703482a323653c3d20520b599b.
[--SNIP--]
> I applied Vadim's patch instead, in order to give a chance to solve
> both the rygel issue and the libglib2 issue. Let's see how it goes.

I'm fine with that, too.

But I would like to emphasise that, so far, we did not manage to have a
gettext-tiny that *really* impersonates GNU gettext.

I think that, ideally, we would like to have:
  - libintl headers that expose the same API as those from GNU gettext,
  - a libintl (probably a static one) that exposes just stub functions.

Additionally, for pre-built blobs, we might want to have a shared
libintl as well, that exposes the same stub functions (but I would not
miss such a lib.)

As I see it, gettext-tiny does not readily and easily provides for this.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
