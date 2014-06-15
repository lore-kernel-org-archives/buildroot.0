From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 Jun 2014 15:16:02 +0300
Subject: [Buildroot] FW: [PATCH 1/1] toolchain-buildroot: create a
 relocatable one
In-Reply-To: <884EA965490E3C4D8E66AEF41E980250256965@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E9802502525C8@ezex10.ezchip.com>
 <20140608145430.0125bb29@free-electrons.com>
 <884EA965490E3C4D8E66AEF41E980250252659@ezex10.ezchip.com>
 <20140608154632.1f6f13a6@free-electrons.com>
 <884EA965490E3C4D8E66AEF41E9802502528F6@ezex10.ezchip.com>
 <20140608154420.GF4074@tarshish>
 <884EA965490E3C4D8E66AEF41E980250256965@ezex10.ezchip.com>
Message-ID: <20140615121602.GC4064@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Noam,

On Sun, Jun 15, 2014 at 11:46:03AM +0000, Noam Camus wrote:
> > See the EXAMPLE section of the git-send-email(1) man page (online at
> > http://git-scm.com/docs/git-send-email).
>
> I followed EXAMPLE section but /usr/libexec/git-core/git-send-email always 
> complains:
> Unable to initialize SMTP properly. Check config and use --smtp-debug. VALUES: server=smtp.gmail.com encryption=tls maildomain=xxx.ezchip.com Debug=0 port=587 at /usr/libexec/git-core/git-send-email line 1041.
> 
> This is Net::SMTP->new() that always returns NULL.
> I used CPAN to install latest Net::SMTP.
> 
> Any ideas?

Your friendly corporate firewall might be blocking outgoing traffic to port 
587. Try doing 'telnet smtp.gmail.com 587'. If you get timeout, this is most 
likely the reason. Your best options is to talk to your IT department to let 
you access to outgoing port 587. If that fails I can think of two workarounds:

1. Use an external server you can control from withing your corporate network 
   (SSH would be best, though I guess your firewall blocks SSH as well)

2. Tunnel SMTP over HTTP somehow. This is quite ugly.

Others on this list may have better solutions for this frustrating problem.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
