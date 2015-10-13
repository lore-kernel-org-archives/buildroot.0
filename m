From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Oct 2015 09:06:41 +0200
Subject: [Buildroot] [PATCH 1/4] configs/raspberrypi: use EABIhf
In-Reply-To: <CA+sos78PFnHQLQknch1N22C=q_Qv=NaE1qvmUHi7ffnf6t=UeQ@mail.gmail.com>
References: <20150820143005.GA6441@ketchup.mtl.sfl>
 <1440273688-92868-1-git-send-email-benoit@wsystem.com>
 <20151012235935.6a195741@free-electrons.com>
 <CA+sos78PFnHQLQknch1N22C=q_Qv=NaE1qvmUHi7ffnf6t=UeQ@mail.gmail.com>
Message-ID: <561CAD81.1010204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-10-15 01:17, Beno?t Th?baudeau wrote:
> Dear Thomas Petazzoni,
> 
> On Mon, Oct 12, 2015 at 11:59 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Applied, thanks. I actually believe we should be doing the same for all
>> ARMv6/ARMv7 platforms, except if there is a specific issue with using
>> EABIhf (such as existing pre-built binaries that are EABI only).
> 
> Yes, there is such an issue because some hardware vendors provide
> closed libraries that use soft-FP. It was the case e.g. for i.MX6
> (audio/video CODEC and GPU libraries), but they now provide hard-float
> binaries IIRC. So such a change should be checked on a per-platform
> basis.

 Actually, I think at the BR developer meeting we decided that even if there are
binary-only packages that require softfloat, our defconfig should still use
hardfloat if possible (since the defconfig doesn't enable that package). Anyway
the point is moot since those binary packages will in my experience also depend
on glibc, so the defconfig will not work for them anyway. Also, I can't find
this back in the report :-(


 Regards,
 Arnout

> 
>> Maybe we should even use EABIhf by default on ARMv6+.
> 
> Yes, I think that it would be a sane default, and it would still be
> possible to set EABI for a specific platform for which EABIhf would
> not apply.
> 
> Best regards,
> Beno?t
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
