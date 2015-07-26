From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jul 2015 18:45:53 +0200
Subject: [Buildroot] Best way to update deployed systems created with
 BuildRoot?
In-Reply-To: <CAE-zcqW_rRQVr8T+wevTdboyyk3qtf88YpX_be5M-A7_=B89uA@mail.gmail.com>
References: <CAE-zcqW_rRQVr8T+wevTdboyyk3qtf88YpX_be5M-A7_=B89uA@mail.gmail.com>
Message-ID: <20150726164553.GF3770@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fred, All,

On 2015-07-26 09:30 -0700, Fred Basset spake thusly:
> Does anyone have any experience on the best way to update the root
> filesystem of systems in the field once they're deployed?

Basically, you BR2_PACKAGE_XSERVER_XORG_SERVER_MODULARhave two options:

 1) duplication
    - you split your storage in two halves, each with a version of the
      firmware: N and N-1.
    - when you update to N+1, you overwrite the N-1 with N+1 and reboot
    - your bootloader has a way to find the latest version, check its
      integrity, and boot it.

 2) rescue/update
    - you split your storage in two, one large partition with the
      nominal system, a smal one with a minimalist system that only
      knows how to update the nominal
    - your bootloader is smart enough to detect which it should boot.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
