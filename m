From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Feb 2017 17:48:37 +0100
Subject: [Buildroot] [PATCH v2 2/4] support/download/git: optimized
 download of sha1
In-Reply-To: <20161202152123.20399-3-ricardo.martincoski@datacom.ind.br>
References: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
 <20161202152123.20399-3-ricardo.martincoski@datacom.ind.br>
Message-ID: <e557663d-d8e9-ddec-7f94-515c02d80b0d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-12-16 16:21, Ricardo Martincoski wrote:
> Shallow fetch don't work for downloading SHAs. However it's common to
> track a tag or branch by the commit SHA so that a branch or tag doesn't
> unexpectedly change.
> 
> We can take advantage of this scenario by searching the remote for a ref
> that it equivalent to our sha, then shallow fetching that ref instead.
> 
> Regarding the case the remote changes between the git ls-remote and the
> git fetch, once the script creates the equivalent of a shallow clone,
> the fetch and the checkout do what is expected:
> - for a sha1 of a removed ref (branch, tag or special ref), the fetch
>   fails, falling back to the equivalent of a full clone;
> - for a sha1 of a changed ref (branch, tag or special ref), the checkout
>   fails (because the desired sha1 is not fetched), falling back to the
>   equivalent of a full clone;
> In both cases, the checkout after the equivalent of a full clone or
> mirror clone is successful if the sha1 is still reachable from any ref.
> 
> Similar patch was submitted in [1] using git clone.
> [1] http://patchwork.ozlabs.org/patch/681841/
> 
> Reported-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> Reported-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
