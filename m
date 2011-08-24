From: Alexjan Carraturo <axjslack@gmail.com>
Date: Wed, 24 Aug 2011 19:25:51 +0200
Subject: [Buildroot] Howto add "single" to busybox command line.
In-Reply-To: <CALo-6+ise3H=_VaHC=xfZ886A8a=Ebox94gwhFS6gK-k=njEjQ@mail.gmail.com>
References: <CALo-6+ise3H=_VaHC=xfZ886A8a=Ebox94gwhFS6gK-k=njEjQ@mail.gmail.com>
Message-ID: <CACR8Qs_iG5YP-3_JCbfoHZZ+F6p+gXT_xUV3mP_VsUCV+6FQ0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/8/24 Charles Krinke <charles.krinke@gmail.com>:
> I have another "howto" question, if I may. I need to be able to boot a
> MPC8321 embedded system into single user mode for maintenance
> occaisionally.
>
> I know that if I add "single" to the kernel command line in u-boot, I
> get a root prompt with no login, so it appears that busybox is
> processing a single-user mode request.
>
> But, ... I dont know how to change the kernel command line on the fly
> from a button press during boot from u-boot. The requirement is that
> pressing Ctrl-C causes single-user mode.
>
> So, .... is it possible to change the kernel command line in u-boot
> from a button press? All my research indicates button presses in
> u-boot just stop the bootcmd processing, but I am hoping I am missing
> a detail here.
>

If you use u-boot you have to have something like "bootargs" variabile
setted up. You have to add "single" (as I do usually) to this
varibale.

for example from u-boot

u-boot> edit bootargs
(add signle at the end of line and hit enter)
u-boot>bootm (or what you usually use to boot, in my case a script)

Some command may change by different versions of u-boot


> An answer of the form "RTFM" is just fine, but it would be useful if
> accompanied by a URL.
>


Sorry, no URL's

Regards
Alexjan.

> --
> Charles Krinke
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Alexjan Carraturo
--
Free Software User Group Italia administrator (http://www.fsugitalia.org)
Fedora/OpenSUSE Ambassador
member of FSFE Italian Team

Twitter/Facebook/Identica: axjslack
Blog: http://axjslack.wordpress.com
--
