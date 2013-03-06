From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Mar 2013 18:47:33 +0100
Subject: [Buildroot] [PATCH] <pkg>-rsync: exclude version control files
In-Reply-To: <871ubv9bk0.fsf@dell.be.48ers.dk>
References: <f9ac20b69b1bfd3f77ef.1362169598@BEANTN0L019720>
 <871ubv9bk0.fsf@dell.be.48ers.dk>
Message-ID: <51378135.6070006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/04/13 21:04, Peter Korsgaard wrote:
>>>>>> >>>>>"Thomas" == Thomas De Schampheleire<patrickdepinguin+buildroot@gmail.com>  writes:
>   Thomas> When using rsync to import package sources (typically with
>   Thomas> PKG_OVERRIDE_SRCDIR), it often happens that these external sources
>   Thomas> are under version control, and contain directories like .git,
>   Thomas> .hg, etc.
>
>   Thomas> Depending on the project, these directories can become pretty large
>   Thomas> and typically have a lot of files. Moreover, they are not necessary
>   Thomas> in the context of building the package. Therefore, this commit adds
>   Thomas> the --cvs-exclude option to the rsync call, saving both disk space
>   Thomas> and sync time.
>
> I don't personally use this, but doesn't that break stuff using the
> version info (like E.G. the kernel storing the git id)?

  Depends on what you call breaking. The kernel will find buildroot's git 
ID, which is fine by me (that's of course assuming the output directory 
is a subdirectory of the buildroot directory). Or failing that, it will 
use the plain version number. The latter is actually what I prefer, 
because it means I can easily exchange modules with the non-OVERRIDE'n 
kernel.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
