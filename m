From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Mar 2015 18:28:52 +0100
Subject: [Buildroot] [PATCH 1/5 v2] support/download: make hash file
 optional
In-Reply-To: <20150321170041.GC4201@free.fr>
References: <cover.1426597114.git.yann.morin.1998@free.fr>
 <26bebad3dca4191b35ddb2dae535b15de9a883c2.1426597114.git.yann.morin.1998@free.fr>
 <550B3991.8090509@mind.be> <20150321170041.GC4201@free.fr>
Message-ID: <550DAA54.4060908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/03/15 18:00, Yann E. MORIN wrote:
[snip]
> But for git/hg/svn/bzr/cvs
> clones/checkouts/... there is intrisically no reason to have a hash, by
> design.

 Why is there no reason to have a hash? The download helpers will indeed detect
failed clones/checkouts/..., but they won't detect a failed download from the
PRIMARY or SECONDARY site, e.g. if a user configures a bad PRIMARY site that
always gives you a landing page rather than a 404.

 Also, a second reason to have the hash is for "security", to protect against
MITM attacks. git with a sha1 will protect against that, but not if you give it
a tag. And svn, well, I'll leave that as an exercise for the reader :-)


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
