From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 23:19:28 +0200
Subject: [Buildroot] [PATCH 1/1] xenomai: Add choice for Cobalt/Mercury
 core
In-Reply-To: <CAKfV1CY0wpiDDST8Zv6n9tXRyLbUrnR+maFnXbfvoQ4GEhhHXg@mail.gmail.com>
References: <20170406234139.31532-1-sikor6@gmail.com>
 <20170406234139.31532-2-sikor6@gmail.com>
 <20170408153452.54837e4c@free-electrons.com>
 <2fa9e5f3-79a9-090e-76ed-457be2e6e49a@mind.be>
 <CAKfV1CaoGUPmL6W5xT61YECuVvN3_RthyD7sw8Cw54e_RMOYCQ@mail.gmail.com>
 <99d84995-3497-3072-f56a-bea2960327c6@mind.be>
 <20170410135105.6b246fa4@free-electrons.com>
 <398a808a-b385-73a5-128e-ad56a4b31d2b@mind.be>
 <CAKfV1CY0wpiDDST8Zv6n9tXRyLbUrnR+maFnXbfvoQ4GEhhHXg@mail.gmail.com>
Message-ID: <c88035d6-555e-6e0e-8d43-2837e1e4b1b5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 22:21, Pawel Sikora wrote:
> Hi,
> 
> 2017-04-10 15:33 GMT+02:00 Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>>:
[snip]
>      While checking this, by the way, I discovered that the --default option to
>     prepare-kernel.sh no longer works (i.e., it no longer autodiscovers the patch to
>     apply). So linux-ext-xenomai.mk <http://linux-ext-xenomai.mk> should be
>     updated to disallow an empty ipipe
>     patch. Pawel, could you look into this? It should either autodiscover the patch
>     to apply similar to how rtai does it, or it should just $(error) in case
>     XENOMAI_ADEOS_PATCH is empty, similar to the handling of LINUX_KCONFIG_FILE (but
>     remember to check BR_BUILDING in that case...). I think autodiscovering is a bit
>     fragile, though.
> 
> 
> Hmm ok, I will look at this, but most probably not until wednesday (quite a lot
> to do on university now)
> 
> But... when there is no patch provided, you are prompted for it at a stage of
> kernel patching, isn't this better than error?

 No. Once you type 'make', the build should proceed non-interactively. The build
can take a very long time, so people will start it and then go away to do
something else. You don't want to return and see that it has stopped after five
minutes with some stupid prompt. And anyway, at that point you probably can't
make sense of this prompt.

 That's also the reason why we have an explicit error for e.g. a non-existing
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE.


> Of course, it would be good to have a working autodiscovery (but not so urgent,
> right?)

 Obviously not so urgent. Would be nice to have it fixed before the 2017.05 release.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
