From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 10 Aug 2017 19:44:18 +0200
Subject: [Buildroot] buildroot uClibc-ng build failure
In-Reply-To: <CAPmKWpG7bSbtrmbFOPDV4Z+EHxzTS_=-9PCBNCWiH3gier3mQA@mail.gmail.com>
References: <20170803054828.GB7682@waldemar-brodkorb.de>
 <20170803092346.02d02371@windsurf.home>
 <CAPmKWpEX5YNKAgi-SbFh_4k3yvYBDMhhPB4Rm8W7m9ZQa0LELA@mail.gmail.com>
 <298e3d5a-5994-3704-fba6-d292d32bfd4c@dawncrow.de>
 <20170808230048.75361077@windsurf>
 <CAPmKWpGqm6xL=ng=TegOw7DqQtU5=Lmq_0Fxv4Vabxr512iPFQ@mail.gmail.com>
 <04d33720-216b-4500-803c-7c55c97693ab@mind.be>
 <CAPmKWpG7bSbtrmbFOPDV4Z+EHxzTS_=-9PCBNCWiH3gier3mQA@mail.gmail.com>
Message-ID: <20170810174418.GJ28021@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eugene,
Eugene Yudin wrote,

> Yes. In that particular case loop iterates through en_US (from buildroot),
> en_US and en_GB.
> Of cause, that list can be patched but I don't know if that's correct.
> It's look a bit strange if user passes locale which actually absent.
> 
> Waldemar, what you think about it?
> 
> I made several tests with different locales (en_US, en_GB, ru_RU, C.UTF-8 and
> C).
> The generated header is the same for all the above locale except pure C.
> 
> Comment in the same makefile tells about problem with some locales.
> I think it would be better to use C locale for fallback.
> 
> I attached the tested patch to modify fallback behavior based on Arnout draft.
> I also changed the order of calls to raise priority of C.UTF-8 locale.

Looks good to me. First trying the user configured locale (.UTF-8)
and if it does not exist fallback to C.UTF-8.

Not sure if we should do configured locale (en_US.UTF-8) then
C.UTF_8 and then even C, when C doesn't build workable output?

best regards
 Waldemar
