From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 7 Oct 2011 21:43:00 +0200
Subject: [Buildroot] [PATCH] crosstool-ng: add dependency to host-lzma
	if no lzma found
In-Reply-To: <CAAXf6LUkL=AE7UHrn_KiVNGCWbDb1zVzbiesJFoGXurb5sSWjQ@mail.gmail.com>
References: <5ce1be6b920b684e152c.1317999108@localhost6.localdomain6>
 <201110072010.50040.yann.morin.1998@anciens.enib.fr>
 <CAAXf6LUkL=AE7UHrn_KiVNGCWbDb1zVzbiesJFoGXurb5sSWjQ@mail.gmail.com>
Message-ID: <201110072143.00909.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Friday 07 October 2011 20:34:34 Thomas De Schampheleire wrote:
> On Fri, Oct 7, 2011 at 8:10 PM, Yann E. MORIN
> <yann.morin.1998@anciens.enib.fr> wrote:
> > In fact, it's a bit more complex than that. In the current development
> > version of crosstool-NG, ./configure still checks for lzma, but it is
> > not an error if it is missing.
> 
> From which version is this available? No stable version as for now,
> but the next one?

Yes, it's only in the development branch for now. The last stable series,
1.12.x, does not have this. The next stable, 1.13.0, due end of october,
will have this.

So, disabling the ./configure check is just a workaround in the meantime.

> How would you like to proceed? Will you add the patch that modifies
> the configure script to buildroot, or would you like me to do it?

As you wish. It's pretty simple, and I guess you should get the credit for
that, as that was your idea. Just remove the offending has_or_abort call.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
