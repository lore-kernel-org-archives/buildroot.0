From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Oct 2013 00:38:25 +0200
Subject: [Buildroot] [PATCHv3 19/20] package: package-based
 implementation of source, external-deps and legal-info
In-Reply-To: <20131010233303.783bfd6d@skate>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-20-git-send-email-thomas.petazzoni@free-electrons.com>
 <5256E2BC.8020503@mind.be> <20131010233303.783bfd6d@skate>
Message-ID: <52572C61.6010707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/10/13 23:33, Thomas Petazzoni wrote:
>> >   Shouldn't you do something similar in fs/ ? Otherwise 'make source'
>> >will not download e.g. mtd.
> That's a weakness of this patch series. I believe I might need to
> convert the fs/ stuff to packages (after all they are packages that
> have dependencies, and install something in the images/ directory), so
> that the legal-info/source/external-deps logic works for them as well,
> without doing hacks. What do you think about this?

  I don't think it's useful to make them packages, because they are 
really different. Adding the propagation of -all-source etc. to the 
dependencies can easily be done in ROOTFS_TARGET_INTERNAL.

  In a later stage, we could consider to move the (few) common parts into 
some common package/rootfs infrastructure, but the gain is limited I expect.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
