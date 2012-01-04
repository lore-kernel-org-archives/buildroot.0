From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 4 Jan 2012 09:37:49 +0100
Subject: [Buildroot] [PATCH 04/14] Support multilib variants in
	sub-subdirectories
In-Reply-To: <20120104092403.7727719c@skate>
References: <cover.1325622133.git.thomas.petazzoni@free-electrons.com>
 <c92c89ab091f3560c1339b0fbcf5958ef7810f1c.1325622133.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LVF73FoLcUkEa3=bLrWUfhmdAzuKkAr8qK_bobqr5X+Fw@mail.gmail.com>
 <20120104092403.7727719c@skate>
Message-ID: <CAAXf6LXuzVx7Chuz2C91piaDSkarECT71ihRN+RrSW-+RtmBtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 4, 2012 at 9:24 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Wed, 4 Jan 2012 08:55:51 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
> > Can we be sure that ARCH_SUBDIR never contains a trailing slash?
> > It comes from:
> > ARCH_SUBDIR=`$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)
> > -print-multi-directory`
>
> Hum, it no longer comes from -print-multi-directory as per 03/14.
> ARCH_SUBDIR is computed as follows:
>
> +       ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e
> "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
>
> As you can see, the sed expression removes the trailing slash.
>
> Is this correct?
>

Ok, I took the ARCH_SUBDIR from an unpatched repo not realizing it changed
as well. My bad..
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120104/274bd227/attachment.html>
