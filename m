From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 22 May 2013 10:57:30 -0500
Subject: [Buildroot] [PATCH v7 01/10] libglib2: Bump libglib2 to 2.36.1
In-Reply-To: <20130522085552.7079aae2@skate>
References: <1369177864-6236-1-git-send-email-spenser@gillilanding.com>
 <1369177864-6236-2-git-send-email-spenser@gillilanding.com>
 <20130522085552.7079aae2@skate>
Message-ID: <CAEBucnA3xso9se45tc7EYb1zsPYTQnLk7WHjiKrowJFm7uqkkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> Please wrap your commit logs to ~80 characters.

Oops, one day I will get the hang of this.

> Is there any reason for bumping libglib2, glibmm and glib-networking in
> the same patch? I seem to recall in earlier versions of your patch
> series, you had separate patches for those bumps.

Case 1 is correct.  I was trying to make the patch bisect-able.  It's
possible that glibmm and glib-networking would fail to build if the
version is not consistent.

> There are two cases here:
>
>  *) Either the version bump are needed all together, because there is
>     some tight version dependency between glibmm, glib-networking and
>     libglib2. (I.e, if for example, bumping libglib2, but not bumping
>     glibmm would break the build of the old version of glibmm on top of
>     the new version of libglib2).
>
>  *) Or the version bumps are independent, or dependent only on lower
>     packages being bumped. In this case, we generally prefer to have
>     separate patches. So in this case, I guess bump libglib2 first, and
>     then either glibmm or glib-networking in whichever order your
>     prefer.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com



--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
