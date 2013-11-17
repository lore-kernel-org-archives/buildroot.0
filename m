From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2013 14:52:14 +0100
Subject: [Buildroot] [PATCH v9 2/8] package: add toolchain dependency to
 every target package
In-Reply-To: <1384526422-30142-3-git-send-email-fabio.porcedda@gmail.com>
References: <1384526422-30142-1-git-send-email-fabio.porcedda@gmail.com>
 <1384526422-30142-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <5288CA0E.6010505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/11/13 15:40, Fabio Porcedda wrote:
> This commit makes the dependency from the target toolchain explicit.
> This way we can buid from command line a package that use
> innger-generic-package right after the configuration phase, example:
>
> 	make clean <package-name>
>
> Also remove TARGETS_ALL because the only purpose was to add toolchain
> dependency so it's superseded by this commit.
>
> To prevent circular dependency add the new variable
> <pkgname>_ADD_TOOLCHAIN_DEPENDENCY to avoid adding the toolchain
> dependency for toolchain packages.
>
> This is also a step forward supporting top-level parallel make.
>
> Signed-off-by: Fabio Porcedda<fabio.porcedda@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  I think the _ADD_TOOLCHAIN_DEPENDENCY workaround is far from ideal, but 
I can't think of anything better. And for sure, this patch is an 
improvement over the current situation.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
