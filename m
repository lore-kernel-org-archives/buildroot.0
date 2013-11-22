From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 22 Nov 2013 18:57:12 -0500
Subject: [Buildroot] [PATCH 3/3] jq: switch to official tarball
In-Reply-To: <87siuom4cm.fsf@dell.be.48ers.dk>
References: <1385138401-26445-1-git-send-email-gustavo@zacarias.com.ar>
 <1385138401-26445-3-git-send-email-gustavo@zacarias.com.ar>
 <87siuom4cm.fsf@dell.be.48ers.dk>
Message-ID: <CANxTyt44CyYK_a7jbj98D=yPKGGpqgqhV6MmzFw6KJzqyDcw9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Fri, Nov 22, 2013 at 5:58 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>  > -JQ_VERSION = jq-1.3
>  > -JQ_SITE = http://github.com/stedolan/jq/tarball/$(JQ_VERSION)
>  > -JQ_AUTORECONF = YES
>  > +JQ_VERSION = 1.3
>  > +JQ_SITE = http://stedolan.github.io/jq/download/source
>
> We have a problem here :/
>
> The git tree tarball we used to download was also called jq-1.3.tar.gz,
> so people who already downloaded it (and sources.buildroot.net) will NOT
> redownload it, so the build will fail as there's no configure.

The jq.mk that was actually committed into buldroot's git repo
downloads "jq-jq-1.3.tar.gz"  (has an extra "-jq").  You probably have
a "jq-1.3.tar.gz" because my initial patch submission acquired it from
yet another URL on github.  The v2 patch was changed to get the
archive using the github example in the buildroot manual, resulting in
the double-jq archive is used in the current jq.mk today.

So the number of "dl" directories that have the old "jq-1.3.tar.gz"
may be limited to just the few people who tried my initial v1 patch.

Danomi -
