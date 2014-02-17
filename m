From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 18:36:06 +0100
Subject: [Buildroot] Open bug analysis
In-Reply-To: <20140213195254.0b17b5bf@skate>
References: <CAAXf6LUmkkW8RxfC8RjYTYRnFDJ+TbNOiKM+LyMBDHJu37ORZA@mail.gmail.com>
 <20140213195254.0b17b5bf@skate>
Message-ID: <53024886.1030902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/14 19:52, Thomas Petazzoni wrote:
>> Support for kernel signed modules
>> > https://bugs.busybox.net/show_bug.cgi?id=6764
>> > This bug report has a patch attached, and both Yann and me asked the
>> > submitter to send it to the list, but without response. It's still
>> > pretty recent though, so hopefully the submitter comes back to us. If
>> > not, someone could adopt it and resend to the list.
> Yes, I remember looking at this patch, and looking a bit inside the
> kernel for some details about why signed modules cannot be stripped. If
> I remember correctly, it is indeed true that they cannot be stripped.
> It's a bit annoying if they are built with debugging symbols...
> 

 This is something that can only be solved on the kernel side, I think -
modules have to be stripped before signing. Up to now, the kernel didn't
need support for that because stripping was done by the packagers. But
now that module signing has been added, the kernel will have to do the
stripping.

 So I'd suggest to point the bug reporter to the maintainers of MODULES_SIG.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
