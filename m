From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Mar 2018 19:06:39 +0100
Subject: [Buildroot] [PATCH v4] systemd: switch to en_US.UTF-8 locale
 when building
In-Reply-To: <20180228231347.1e2896a2@windsurf.lan>
References: <20180212213400.15061-1-julius@kriukas.lt>
 <20180222230055.25455-1-julius@kriukas.lt>
 <20180228213104.GA16465@scaer>
 <20180228231347.1e2896a2@windsurf.lan>
Message-ID: <20180301180639.GA2449@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-02-28 23:13 +0100, Thomas Petazzoni spake thusly:
> On Wed, 28 Feb 2018 22:31:04 +0100, Yann E. MORIN wrote:
[--SNIP--]
> > Note: this is different from the existing BR2_NEEDS_HOST_UTF8_LOCALE: it
> > onlhy requires that a UTF-8 locale be present on the system, while we
> > now require that it be the current locale.
> Now, we don't require it to be the current locale:
> > > +SYSTEMD_ENV = $(TARGET_MAKE_ENV) LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
> The systemd package ensures to pass LANG/LC_ALL pointing to an UTF-8
> locale.

Ah, yes, you're right, sorry...

I was confused now, because (without this patch) I had to change my
locale to be able to build systemd. My bad, sorry...

> That being said, I also dislike this solution, and think the sytemd
> build system should be fixed instead.

Yup, that's really sad... But properly fixing it is a totally different
endeavour... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
