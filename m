From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Wed, 26 Feb 2020 14:20:57 +0100
Subject: [Buildroot] external, how to achieve our needs?
In-Reply-To: <87imjtoqpr.fsf@tarshish>
References: <20200225150149.zvyqbn34swfizg72@M43218.corp.atmel.com>
 <87imjtoqpr.fsf@tarshish>
Message-ID: <20200226132057.zs2lgpm3bkwtjmj2@M43218.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Wed, Feb 26, 2020 at 07:36:00AM +0200, Baruch Siach wrote:
> Hi Ludovic,
> 
> On Tue, Feb 25 2020, Ludovic Desroches wrote:
> > I would like to emphasize that recent changes in buildroot make us
> > think that it won't be easy to get rid of buildroot-at91: devmem2
> > deprecated, rgnd which increases the boot time since it uses the lib
> > jitterentropy, curl library name change and others.
> 
> The curl library name has not changed in the last few year. Do you refer
> to the curl binary Kconfig symbol name change (commit 2a057339cc12)? How
> does that affect your use case? Do you need to support several Buildroot
> versions in a single config?

Yes, that's the Kconfig symbol.

That's one of the pending question, is it possible to support different
versions of Buildroot. When we start using the external, one benefit we had
in mind was we won't have to check/update the external at each new release
of Buildroot. It seems we were wrong, it could only save us to rebase
patches in comparison to the buildroot fork solution.

Regards,

Ludovic

> 
> baruch
> 
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
