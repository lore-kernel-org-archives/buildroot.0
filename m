From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Oct 2014 15:14:17 +0200
Subject: [Buildroot] [PATCH v3 2/3] gst-ffmpeg: add --pkg-config to
 internal libav configure options
In-Reply-To: <20141018135102.4b4d86df@free-electrons.com>
References: <1413142206-30581-1-git-send-email-danomimanchego123@gmail.com>
 <1413142206-30581-2-git-send-email-danomimanchego123@gmail.com>
 <20141017212453.GI3971@free.fr> <20141018135102.4b4d86df@free-electrons.com>
Message-ID: <544267A9.9080509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/14 13:51, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Fri, 17 Oct 2014 23:24:53 +0200, Yann E. MORIN wrote:
> 
>>> WARNING: .../output/host/usr/bin/i686-pc-linux-gnu-pkg-config not found, library detection may fail.
>>
>> Instead of fixing just that one package, shouldn't we provide a symlink:
>>     TUPLE-pkg-config  ->  pkg-config
>>
>> This way, all packages that expect a cross-pkg-config will work without
>> customisation.
>>
>> Thomas, thoughts?
> 
> I don't have a very strong opinion here. How many packages expect
> TUPLE-pkg-config instead of pkg-config? I'm not sure it's really the
> majority, and if it's not, I prefer to keep handling this on a
> per-package basis rather than adding a symlink.

 Actually, even if it is just two packages that use it, I think it is worthwhile
to add the symlink. It is one less thing to solve when adding a package.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
