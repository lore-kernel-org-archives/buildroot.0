From: Luca Ceresoli <list@lucaceresoli.net>
Date: Wed, 21 Jul 2010 22:55:48 +0200
Subject: [Buildroot] [RESEND/PATCH] Git/Svn downloaders
In-Reply-To: <1279625588-26570-1-git-send-email-maxime.petazzoni@bulix.org>
References: <1279625588-26570-1-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <4C475ED4.1040808@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime Petazzoni ha scritto:
> Hi,
>
> Integrating the feedback from the first series sent last week, here 
> comes the
> promised resend.
Based on the discussions so far, I think this is a good starting point.

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>



> What changed from the first batch?
>
> - the BR2_GIT, BR2_SVN_CO and BR2_SVN_UP configuration options have been
> cleaned up into BR2_GIT="git" and BR2_SVN="svn" and the defconfig files
> updated (I know there has been some discussion about the defconfigs
> recently on the list... this seems to be a hot subject in the community
> right now :-)
>
> - the download method autodetection from the URI scheme has been added,
> taken from Luca's patch and integrated into mine.
>
> - tar --exclude-cvs is no longer used, in favor of per-VCS techniques:
> * `git archive --format=tar ... | gzip -c ...` for Git
> * `svn export ... && tar czf ...` for Subversion
>
> - libsvgtiny now benefits from the download method autodetection
>
>
> Once we get to a general consensus that these are good improvements, 
> I'll start
> looking more actively on how to bring back the "spider"/source-check 
> feature,
> which hopefully shouldn't be to much trouble.
I'm not using it, so I can't judge whether this is a problem or not.

Peter?

Luca


> Regards,
> - Maxime
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
