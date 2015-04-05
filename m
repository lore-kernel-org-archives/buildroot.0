From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2015 23:36:47 +0200
Subject: [Buildroot] [PATCH/RFC 01/27] package/libsquish: New package
In-Reply-To: <1427913380-14808-2-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
 <1427913380-14808-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150405213647.GK4134@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-01 20:35 +0200, Bernd Kuhls spake thusly:
> Needed for Kodi 15.0
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]

I forgot in my previous review: the Makefile for libsqusih does not know
how to build both a shared and a static lib at the same time.

So, you have two options:
  - fix the Makefile to be able to build either or both at the same time
  - you hide libsquish behind a depends on !BR2_SHARED_STATIC_LIBS

Needless to say, the first is highly preferrable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
