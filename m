From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Oct 2013 19:39:11 +0200
Subject: [Buildroot] No proc mounted
In-Reply-To: <OF7B6E1B94.FFB21E9B-ON85257C0D.005FDC58-85257C0D.005FEE0A@LocalDomain>
References: <OFE26C9A8F.E4D8CD49-ON85257C0C.006AEB60-85257C0C.006B3127@ametek.com>
 <871u3datxn.fsf@dell.be.48ers.dk>
 <OF01AFC7C1.742725D7-ON85257C0D.004704DA-85257C0D.00471678@LocalDomain>
 <526804A0.3030101@mind.be>
 <OF827CF5C7.0223B4B2-ON85257C0D.005F4956-85257C0D.005F5483@LocalDomain>
 <52680626.8090606@mind.be>
 <OF7B6E1B94.FFB21E9B-ON85257C0D.005FDC58-85257C0D.005FEE0A@LocalDomain>
Message-ID: <526809BF.5030500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/10/13 19:27, Naitik Amin wrote:
> There isn't !
>
> /system/skeleton$ ls
> bin  dev  etc  home  media  mnt  opt  run  sbin  sys  usr  var

  That's weird... You're also missing lib, root and tmp...

  Where did you get this buildroot tree?

  You didn't put this on a FAT or NTFS partition, did you? That won't 
work (but I would expect buildroot to barf on it much earlier already).


> Should just create one by hand, or is there an option in menuconfig that
> needs to be set ?

  You can create lib, proc, root and tmp by hand, but then you have to do 
a 'make clean' to make sure they're actually in the target. So you should 
probably also create them in the target as a quick verification if that 
solves the issue for you.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
