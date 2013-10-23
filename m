From: Naitik Amin <Naitik.Amin@ametek.com>
Date: Wed, 23 Oct 2013 13:27:48 -0400
Subject: [Buildroot] No proc mounted
In-Reply-To: <52680626.8090606@mind.be>
References: <OFE26C9A8F.E4D8CD49-ON85257C0C.006AEB60-85257C0C.006B3127@ametek.com>
 <871u3datxn.fsf@dell.be.48ers.dk>
 <OF01AFC7C1.742725D7-ON85257C0D.004704DA-85257C0D.00471678@LocalDomain>
 <526804A0.3030101@mind.be>
 <OF827CF5C7.0223B4B2-ON85257C0D.005F4956-85257C0D.005F5483@LocalDomain>
 <52680626.8090606@mind.be>
Message-ID: <OF7B6E1B94.FFB21E9B-ON85257C0D.005FDC58-85257C0D.005FEE0A@LocalDomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There isn't !

/system/skeleton$ ls
bin  dev  etc  home  media  mnt  opt  run  sbin  sys  usr  var

Should just create one by hand, or is there an option in menuconfig that 
needs to be set ?



From:   Arnout Vandecappelle <arnout@mind.be>
To:     Naitik Amin <Naitik.Amin@ametek.com>, 
Cc:     buildroot at uclibc.org, buildroot at busybox.net, Peter Korsgaard 
<jacmet@gmail.com>, Peter Korsgaard <jacmet@uclibc.org>, Naitik Amin 
<naitik.amin@gmail.com>
Date:   10/23/2013 01:23 PM
Subject:        Re: [Buildroot] No proc mounted



On 23/10/13 19:21, Naitik Amin wrote:
> $ mount -t proc proc /proc
> mount: mounting proc on /proc failed: No such file or directory

  Aha!

  The /proc directory is part of the skeleton that is copied in from 
system/skeleton. Does the directory system/skeleton/proc exist in your 
copy of buildroot? We keep a file .empty in there to make sure the 
directory is seen by the VCS (git), but perhaps you have a VCS that 
doesn't do that?

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131023/72762bda/attachment-0001.html>
