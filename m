From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 May 2017 17:53:40 +0200
Subject: [Buildroot] [PATCH] support/scripts/apply-patches.sh: do not
 apply patches with renames
In-Reply-To: <20170512154039.GA2955@scaer>
References: <1494584944-23924-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170512154039.GA2955@scaer>
Message-ID: <20170512175340.6e94a47c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 May 2017 17:40:39 +0200, Yann E. MORIN wrote:

> Meh. path-2.7 was released 5 years ago. Oh well, let's be kind for those
> stuck with ancient entreprise-grade distros... ;-)

Exactly :)


> Oh-oh... Not good:  the '-a' will be passed as an option to grep; this
> is not a [...] construct.
> 
> What you want instead is:
> 
>     if grep -q "^rename from" ${path}/${patch} && \
>        grep -q "^rename to" ${path}/${patch} ; then

OK, will fix.

However, what bothers me with this is that if the patch description
contains "rename from" and "rename to" at the beginning of two lines,
then it will also trigger this condition.

But I'm not sure if it's a really realistic case, and if it ever
happens, we can always fix/improve the script. Unless there is a better
but still simple way to check if a patch uses renames. Ideally we would
want patch >= 2.7 to bail out if there's a rename, but I couldn't find
any option doing this... and this option would anyway not exist with
patch < 2.7.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
