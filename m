From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Jan 2014 07:49:11 +0100
Subject: [Buildroot] command line regular expression substitution fails
In-Reply-To: <20140128221002.157e8b71@skate>
References: <52CC7292.306@alcatel-lucent.com>
 <CAOkaJuVFmrrfda=vG-+06vJp7_jJvhnCAzJy8RJKZ8BxE6XKWA@mail.gmail.com>
 <52CD5340.2090200@alcatel-lucent.com>
 <CAOkaJuVGa4_Et8TL80MEsh8sN1mseKvQ4OZ9RzxSouytbZFUFQ@mail.gmail.com>
 <52CF0287.8010505@alcatel-lucent.com> <20140128221002.157e8b71@skate>
Message-ID: <52E8A467.5070703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/01/14 22:10, Thomas Petazzoni wrote:
> Dear Ed Sutter,
>
> On Thu, 09 Jan 2014 15:11:51 -0500, Ed Sutter wrote:
>
>> Thanks, the strange thing in my case is the iMX6 is cortex-A9, but I had
>> to step back to
>> cortex-A8 in menuconfig for this to work.
>> I did notice that when I use A9 vs A8, the floating point settings
>> automatically change
>> in menuconfig.  I *thought* A8 & A9 were the same from that standpoint,
>> but not really
>> sure.  Anyway, I plan to spend at least the next few days looking into
>> this, so hopefully I'll
>> have more information soon.
>
> No, A8 and A9 are not the same from a floating point perspective.
>
> As visible in
> http://git.buildroot.net/buildroot/tree/arch/Config.in.arm#n91, NEON
> and VFPv3 is mandatory on Cortex-A8, but optional on Cortex-A9.

  Yeah, but in that sense, Cortex-A9 is a subset or Cortex-A8 so if the 
A8 code works, the A9 code should work as well - which is exactly the 
reverse of what Ed saw.

  Also, I know several people have used buildroot on an mx6 with the A9 
option, and it did seem to work for them.

  Perhaps it's a problem with the Sourcery 2013.05 toolchain? Any chance 
of trying a different one?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
