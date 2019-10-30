From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2019 22:01:14 +0100
Subject: [Buildroot] Option to download a particular package source from
 <PACKAGE>_SITE instead of using the predownloaded source from DL_DIR
In-Reply-To: <CAP8JTaaKRrHBk3JeuOfVuGifH05L_V_iDj5NLahqtOaOLxhEDQ@mail.gmail.com>
References: <CAP8JTaaKRrHBk3JeuOfVuGifH05L_V_iDj5NLahqtOaOLxhEDQ@mail.gmail.com>
Message-ID: <1b86bc94-f142-364b-e002-376eab031c8e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jitesh,

On 30/10/2019 10:45, chalil jitesh wrote:
> Hi,
> 
> Is there an option in buildroot to always download a particular package
> source <PACKAGE>_SOURCE from <PACKAGE>_SITE, instead of using the
> predownloaded package source <PACKAGE>_SOURCE file present in DL_DIR
> directory (only for a particular package).
> Example if a package source name is "package-latest.tar.gz", during build

 As noted in the manual [1], using branch names for the version is not supported:

Note: Using a branch name as FOO_VERSION is not supported, because it does not
and can not work as people would expect it should:

1. due to local caching, Buildroot will not re-fetch the repository, so people
who expect to be able to follow the remote repository would be quite surprised
and disappointed;
2. because two builds can never be perfectly simultaneous, and because the
remote repository may get new commits on the branch anytime, two users, using
the same Buildroot tree and building the same configuration, may get different
source, thus rendering the build non reproducible, and people would be quite
surprised and disappointed.


> if the source file package-latest.tar.gz is already present in DL_DIR path
> this source is taken for the build, the latest updated package source file
> is not getting downloaded from <PACKAGE>_SITE. (Only for a particular
> package i want this behavior and for other packages the package source
> should be taken from DL_DIR directory which is configured)
> Kindly please advice me if there any options in buildroot which i can use
> to achieve this.

 If you want the latest version, use _OVERRIDE_SRCDIR [2]. You still have to
manually pull new changes into the overridden source directory, but you probably
want to do that anyway to avoid pulling in some random changes when you're
actually working on something else.

 Regards,
 Arnout


[1] https://buildroot.org/downloads/manual/manual.html#generic-package-reference
[2]
https://buildroot.org/downloads/manual/manual.html#_using_buildroot_during_development
