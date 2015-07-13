From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jul 2015 20:59:56 +0200
Subject: [Buildroot] [PATCH] gptfdisk: bump version 1.0.0
In-Reply-To: <CAJup9cg-NUSxF_wCA-r7Uh9RQF6E+1ytWc0V1Z6Jf7GiMd56Pg@mail.gmail.com>
References: <1436811980-17812-1-git-send-email-aurelien@chabot.fr>
 <CAJup9cg-NUSxF_wCA-r7Uh9RQF6E+1ytWc0V1Z6Jf7GiMd56Pg@mail.gmail.com>
Message-ID: <55A40AAC.2070903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/13/15 20:33, Aur?lien Chabot wrote:
> 
> On Mon, Jul 13, 2015 at 8:26 PM, Aur?lien Chabot <aurelien@chabot.fr
> <mailto:aurelien@chabot.fr>> wrote:
> 
>     -+      $(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncursesw
>     $(LDLIBS) -o cgdisk
>     ++      $(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncurses
>     $(LDLIBS) -o cgdisk
> 
> 
> I had to do that to make it build correctly. This seems strange to me, any idea
> why ?

 It looks like gptfdisk no longer uses the wide-char version of ncurses. Or
perhaps it depends on the configuration...

 In that case, the select of BR2_PACKAGE_NCURSES_WCHAR can probably be removed
as well. Could you test that?

 Oh, and if you resubmit, please mention a change like this explicitly in the
commit log (along with an explanation why it is needed, which would have been
difficult in this case since you didn't understand :-).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
