From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 21:18:30 +0100
Subject: [Buildroot] Error when adding media-ctl as package
In-Reply-To: <50EC1EBF.80807@yahoo.fr>
References: <50EC1EBF.80807@yahoo.fr>
Message-ID: <50EC7F16.3090008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/08/13 14:27, Patrick wrote:
> Dear mailing list,
>
> I am working with buildroot 2012.11 and I need to add the media-ctl tool
> (http://git.ideasonboard.org/media-ctl.git).
>
> I have added this tool in buildroot as a package following the buildroot
> user manual and this:
> https://github.com/MaxGalemin/buildroot/commit/2ac3323f9d40c2610128d3a22fee8dd195979dc9
>
>
> The Config.in and media-ctl.mk files I have added are attached to this mail.
>
> When doing "make media-ctl" I have the following error when buildroot do
> the configure step :
>
> checking if libtool supports shared libraries... yes
> checking whether to build shared libraries... yes
> checking whether to build static libraries... yes
> ./configure: 10676: ./configure.lineno: Syntax error: word unexpected
> (expecting ")")
> make: ***
> [/home/pgerber/imusba/buildroot/output/build/media-ctl-36a1357c9c879092fe2e36c82187f1d35b1efe13/.stamp_configured]
> Error 2
>
> As anyone have any idea why I have this and how to fix it ?
> Any help is welcome.

  Can you

- post the way that configure is called (just after "media-ctl 36a... 
Configuring");

- look at line 10676 of output/build/media-ctl-36a*/configure and see if 
there's anything suspicious;

- perhaps add some additional echo's before line 10676 to see what might 
go wrong.

  Note that it works fine for me.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
