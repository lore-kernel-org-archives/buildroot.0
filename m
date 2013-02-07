From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 07 Feb 2013 18:14:28 +0100
Subject: [Buildroot] makedevs and symbolic links
In-Reply-To: <CAJkQPO=A+_7t-dbSP8VutAsen+MvG9J44qx3D6uxKt7C2mBQUg@mail.gmail.com>
References: <CAJkQPOn=Pi+NhbRvVG_gk9ccQDaUoUuPH3aEsos032kAv6Y23A@mail.gmail.com>
 <20130206172641.4c042f87@skate>
 <CAJkQPOmpY_aT1DhDpxe2rw_endLzFkhmOWAkrbt1CzeG+7c=0Q@mail.gmail.com>
 <20130206175711.51603415@skate>
 <CAJkQPO=A+_7t-dbSP8VutAsen+MvG9J44qx3D6uxKt7C2mBQUg@mail.gmail.com>
Message-ID: <5113E0F4.4070404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/13 11:14, Aras Vaichas wrote:
> My current employer wants me to put my Buildroot configuration into their
> version control system (MKS). So I am looking at ways that I can avoid
> using empty directories and symbolic links to make it diff and MKS
> friendly. I guess there's no getting around using multiple files and
> scripts to achieve this.

  Empty directories, I forgot about that!

  Patch coming up. It excludes the .empty files, so that you can create 
an empty directory in your VCS by populating it with a '.empty' file. We 
use the same trick in the skeleton (git doesn't support empty directories 
either).

  For symlinks, I don't see a reason to add a workaround in buildroot. A 
VCS that doesn't have symlinks is broken. I have a customer who uses CVS, 
and their workaround is to put the overlay in a tar file and extract it 
before building.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
