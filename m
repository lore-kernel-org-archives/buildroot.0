From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Oct 2013 19:23:50 +0200
Subject: [Buildroot] No proc mounted
In-Reply-To: <OF827CF5C7.0223B4B2-ON85257C0D.005F4956-85257C0D.005F5483@LocalDomain>
References: <OFE26C9A8F.E4D8CD49-ON85257C0C.006AEB60-85257C0C.006B3127@ametek.com>
 <871u3datxn.fsf@dell.be.48ers.dk>
 <OF01AFC7C1.742725D7-ON85257C0D.004704DA-85257C0D.00471678@LocalDomain>
 <526804A0.3030101@mind.be>
 <OF827CF5C7.0223B4B2-ON85257C0D.005F4956-85257C0D.005F5483@LocalDomain>
Message-ID: <52680626.8090606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
