From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 12 Mar 2019 09:37:20 -0500
Subject: [Buildroot] [PATCH 4/4] toolchain: allow PIC/PIE without RELRO
In-Reply-To: <2d087cfc-e1a4-da43-5b4f-46920b60452c@mind.be>
References: <cover.1552286891.git.yann.morin@orange.com>
 <11977_1552286921_5C8604BE_11977_87_1_9c1d9253-d6be-4870-a4dd-b45f5c87742f@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <3c26a901-4f69-163b-266a-5627f818b75c@mind.be>
 <32338_1552371732_5C875014_32338_448_1_20190312062209.GC4924@r-lnx-nyma7486-2>
 <2d087cfc-e1a4-da43-5b4f-46920b60452c@mind.be>
Message-ID: <CANQCQpbBvoSEMsdt+3U9+n7wiQe=OeF7Z3Jn=PFMYNSRbXg+9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
On Tue, Mar 12, 2019 at 3:57 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 12/03/2019 07:22, yann.morin at orange.com wrote:
> > Arnout, All,
> >
> > On 2019-03-12 01:36 +0100, Arnout Vandecappelle spake thusly:
> >> On 11/03/2019 07:48, yann.morin at orange.com wrote:
> >>> From: "Yann E. MORIN" <yann.morin@orange.com>
> >>>
> >>> Note: it is unknown if RELRO_FULL really needs PIC/PIE or not, so we
> >>> keep the current situation, where RELRO-FULL forces PIC/PIE compilation.
> >>
> >>  I just checked on my host, and a simple test program compiled with -no-pie
> >> -Wl,-z,relro -Wl,-z,now does work, so indeed the two seem to be independent.
> >
> > Still, I'd prefer tokeep the select to keep the current behaviour. We
> > can drop it later on if someone has a need for it.
> >
> >>  I guess it's historical accident that the global full relro and PIE are
> >> typically introduced together. From what I understand, they are pretty much
> >> independent.
> >
> > I talked with Matt on IRC about this the other day, and his reasoning
> > for doing so as it is was to mimick the way done on distros (Debian,
> > FC?), so it is not a complete accident either. ;-)
>
>  That's what I meant: it's historical accident that Fedora [1] and Debian [2]
> started enabling -z,now and -pie at the same time. On their respective wiki
> pages that discuss enabling these things, they are in fact treated separately.
>

Yep, sent a note on the v2 patch. I think we should drop the PIC/PIE
select from RELRO FULL....

>  Regards,
>  Arnout
>
> [1] https://fedoraproject.org/wiki/Security_Features_Matrix#Userspace_Hardening
> [2] https://wiki.debian.org/Hardening#User_Space
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
