From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 23:57:00 +0200
Subject: [Buildroot] [next v2 6/7] testing/tests/download: add test for
 sha1 as git ref
In-Reply-To: <20170826222056.6119-6-ricardo.martincoski@gmail.com>
References: <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
 <20170826222056.6119-6-ricardo.martincoski@gmail.com>
Message-ID: <a0cb8592-2d28-58ca-cbf7-f5bec4cc2985@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-08-17 00:20, Ricardo Martincoski wrote:
> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> 
> Add a test to download the package with git method and its version set
> to a sha1 reachable by a branch name, but not pointed by it.
> This is the most common use case for git refs in the tree.
> 
> Besides the test case Python script, add:
>  - a br2-external (git-refs) with a fake package (foo) as a fixture for
>    this and upcoming tests;

 I'd use a more descriptive name than foo, e.g. git-refs.mk

>  - support in GitTestBase for repos created on the fly;
>  - a new class GitRepo to create and manipulate repos. It is a class and
>    not a simple module because it will become very useful when testing
>    submodules.

 So why do you suddenly need to create repos on the fly now? I still believe it
is much simpler to include the repo directly. I also think it's easier if the
same repo is used for all git tests - which should be possible, I think.


 Regards,
 Arnout

> After the download, compare the tarball to a checkout of the original
> remote repo.
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
