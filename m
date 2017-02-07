From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Feb 2017 17:49:01 +0100
Subject: [Buildroot] [RFC v2 4/4] support/download/git: shallow fetch of
 all branches
In-Reply-To: <20161202152123.20399-5-ricardo.martincoski@datacom.ind.br>
References: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
 <20161202152123.20399-5-ricardo.martincoski@datacom.ind.br>
Message-ID: <e83213f4-1303-41f2-3b87-3a662dcac1a9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-12-16 16:21, Ricardo Martincoski wrote:
> When a branch of a package is tracked using sha1 and the remote branch
> moves (usually gets another commit), this script stops using a shallow
> fetch since the sha1 is not anymore the head of the branch, falling back
> to a full clone.
> 
> As a middle ground between a --depth 1 fetch and a full clone, fetch all
> branches with depth of 100. We have a good change to catch the desired
> version reducing the data transfer from the remote when fetching from
> large repos, especially hardware-specific linux trees.
> 
> In the case the desired version is not in this shallow fetch, fall back
> to a full fetch that reuses the objects already downloaded.
> 
> This method causes an extra burden in the server side ('Compressing
> objects'), usually a few seconds, but the potential reduction of data
> transferred should be beneficial for both the user and the server.
> 
> https://github.com/raspberrypi/linux.git
> 100 commits from all branches 567.47 MiB
> git clone 1.49 GiB
> 
> https://github.com/Freescale/linux-fslc.git
> 100 commits from all branches 944.72 MiB + 73.89 KiB
> git clone 1.68 GiB
> 
> https://github.com/linux-sunxi/sunxi-mali-proprietary
> 100 commits from all branches 7.55 MiB
> git clone 7.55 MiB
> 
> Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
