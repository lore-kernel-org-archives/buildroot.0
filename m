From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Nov 2015 07:49:48 +0100
Subject: [Buildroot] [PATCH] support/download: fetch all refs on full
 git clone
In-Reply-To: <20151112170726.GB11143@ketchup.mtl.sfl>
References: <1446871164-19229-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <CAGduivyHPkkG7f6K7h2KGBXHPS7h8hvn07B2bKJdrbwLsf2nFA@mail.gmail.com>
 <20151112161223.GA22361@ketchup.mtl.sfl>
 <CAGduivzemzRU0_1c+xh8=q+ZF1Tc5o+rwWsF50DtsPqd9Bf38w@mail.gmail.com>
 <20151112170726.GB11143@ketchup.mtl.sfl>
Message-ID: <5645880C.5040103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12-11-15 18:07, Vivien Didelot wrote:
[snip]
> This is orthogonal, but I'm wondering if it'd make sense to stamp a git
> remote update, similary to the local kernel setup + rsync. That would
> ease the build process of a team, when a parallel kernel development is
> on going.

 I'm not sure what you mean with stamping a git remote update. What I think
would make sense is that for distributed VCS downloads (i.e. git and hg) we keep
a full (shallow) clone in DL_DIR in addition to the tarball. That makes handling
updates a lot more efficient. We probably would want to expose that to PRIMARY
and SECONDARY download sites as well. Especially the PRIMARY would be useful,
since it would allow you to start from a local clone of e.g. linux.git (which
may not have the ref you need), and then just fetch the missing refs from upstream.

 This will not be easy to implement, though, since we'd need to handle e.g.
multiple remotes that end up in the same DL_DIR/foo.git repository.


 Was this what you meant, Vivien?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
