From: Naitik Amin <Naitik.Amin@ametek.com>
Date: Wed, 23 Oct 2013 17:26:45 -0400
Subject: [Buildroot] No proc mounted
In-Reply-To: <526809BF.5030500@mind.be>
References: <OFE26C9A8F.E4D8CD49-ON85257C0C.006AEB60-85257C0C.006B3127@ametek.com>
 <871u3datxn.fsf@dell.be.48ers.dk>
 <OF01AFC7C1.742725D7-ON85257C0D.004704DA-85257C0D.00471678@LocalDomain>
 <526804A0.3030101@mind.be>
 <OF827CF5C7.0223B4B2-ON85257C0D.005F4956-85257C0D.005F5483@LocalDomain>
 <52680626.8090606@mind.be>
 <OF7B6E1B94.FFB21E9B-ON85257C0D.005FDC58-85257C0D.005FEE0A@LocalDomain>
 <526809BF.5030500@mind.be>
Message-ID: <OFEE44FE8A.B5AEC813-ON85257C0D.0075A5C4-85257C0D.0075CE6F@LocalDomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Got it everything is good now.
 ls
bin         etc         linuxrc     mnt         root        sys var
dev         home        lost+found  opt         run         tmp
dummy       lib         media       proc        sbin        usr

The source control system that I use, wud not keep any empty folders !! 

Thanks for you insight.

One more question, do u know if I can add openssl, I am looking to do scp 
and ssh into my target from my workstation.



From:   Arnout Vandecappelle <arnout@mind.be>
To:     Naitik Amin <Naitik.Amin@ametek.com>, 
Cc:     buildroot at busybox.net, Naitik Amin <naitik.amin@gmail.com>
Date:   10/23/2013 01:39 PM
Subject:        Re: [Buildroot] No proc mounted



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



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131023/be4f5915/attachment.html>
