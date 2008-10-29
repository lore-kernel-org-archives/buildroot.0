From: =?iso-8859-1?Q?Arnar_Mar_Sigur=F0sson?= <antab@valka.is>
Date: Wed, 29 Oct 2008 16:36:48 -0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
References: <20081028094026.563A73C671@busybox.net><061E11D86E3DFF459604DF5B36F0805F1BA6D0@salka01.valka.local><873aif2zqq.fsf@macbook.be.48ers.dk>
	<d6cda7730810290901m5b306270t5025ac987c846128@mail.gmail.com>
Message-ID: <061E11D86E3DFF459604DF5B36F0805F1BA6D1@salka01.valka.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

r23828 - the sed changes are good (i remember being hit by this some timeago and had to edit that file by hand)
r23827 - the pkg config changes on the other hand break it. After reverting that i'm able to build 4.4.3 and 4.5.0-tp1.

Greets
  Arnar Mar Sig

-----Original Message-----
From: Thiago A. Corr?a [mailto:thiago.correa at gmail.com]
Sent: Wed 10/29/2008 4:01 PM
To: Peter Korsgaard
Cc: Arnar Mar Sigur?sson; buildroot at uclibc.org; markus.heidelberg at web.de
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
 
On Wed, Oct 29, 2008 at 1:21 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Arnar" == Arnar Mar Sigur?sson <antab@valka.is> writes:
>
> Hi,
>
>  Arnar> This breaks building Qt for AVR32. It will force qmake to be
>  Arnar> build for the target so its unusable later on.
>
> Ok, I don't do Qt nor AVR32 - Markus, Thomas?
>

I didn't try it either myself yet as I'm kind busy working on some
other stuff, but the patch seams ok to me.
I do quite a bit of AVR32 and Qt. The sed just edits the qmake.conf
that qmake uses to generate the makefiles for qt and applications that
use it. qmake itself is usually built using a simpler Makefile to go
around the chicken egg issue.

The PKG_CONFIG_SYSROOT part is that I'm not quite sure. Is that the
part that breaks it Amar?

Kind Regards,
    Thiago A. Correa


-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081029/5e9ab0b7/attachment.htm 
