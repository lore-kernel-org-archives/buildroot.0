From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Aug 2013 07:17:57 +0200
Subject: [Buildroot] debugging inittab
In-Reply-To: <2DD0B9C711CDFC45A3A266C78966CE7F451F8F81@G4W3291.americas.hpqcorp.net>
References: <2DD0B9C711CDFC45A3A266C78966CE7F451F39A0@G4W3291.americas.hpqcorp.net>
 <5216A076.5030409@mind.be>
 <2DD0B9C711CDFC45A3A266C78966CE7F451F8F81@G4W3291.americas.hpqcorp.net>
Message-ID: <521ED985.9050705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/28/13 00:38, Jenkins, Lee (ISS Houston) wrote:
> -----Original Message-----
> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> Sent: Thursday, August 22, 2013 6:36 PM
> To: Jenkins, Lee (ISS Houston)
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] debugging inittab
> Importance: Low
>
>> On 22/08/13 22:11, Jenkins, Lee (ISS Houston) wrote:
>>> Hello. I am debugging a boot problem for a few hours. I'm clearly in
>>> over my head and I could use some insight.
>>>
>>> For debugging purposes, I am booting from a kernel and rootfs on an
>>> nfs share of my dev machine. The console is ttyS0.
>>
>>    The nfs-share is an extracted output/images/rootfs.tar, right? You're not using the target directory?
>>
>
> That was the problem. Thanks!

  Right. Maybe we should just rename target/ to 
THIS_IS_NOT_YOUR_ROOT_FILESYSTEM instead of just creating the file. The 
latter is obviously not enough.

  What was the reason we didn't do that in the first place?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
