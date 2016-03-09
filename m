From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 15:00:07 +0100
Subject: [Buildroot] [PATCH] pkgconf: make wrapper relocatable
In-Reply-To: <56E02A78.1050701@zacarias.com.ar> (Gustavo Zacarias's message of
 "Wed, 9 Mar 2016 10:51:52 -0300")
References: <1457529409-24102-1-git-send-email-gustavo@zacarias.com.ar>
 <87egbj228a.fsf@dell.be.48ers.dk> <56E02A78.1050701@zacarias.com.ar>
Message-ID: <87a8m721lk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> Ehh, doesn't this break using pkg-config outside buildroot?

 > Hi.
 > Indeed it does, but you can't have the cake and eat it at once can you?

Well, we cannot really break existing features to add new ones. The
relative location between the pkg-config wrapper script and the staging
directory is constant (or rather known at build time), so I guess we can
do something with /proc/self/exe. We might need to implement the wrapper
in C instead for that to work as /proc/self/exe for a shell script seems
to return /bin/dash here.

 > Arnout in the famous vala-wrapper thread pointed that we shouldn't
 > hardcode the staging directory in it and i've adjusted accordingly, so
 > which way is it? (same logic would apply to both cases). Re:
 > http://lists.busybox.net/pipermail/buildroot/2016-February/153671.html
 > Regards.

I know people today are already using the pkg-config wrapper outside
buildroot (E.G. the output/host dir is used as a sdk), so we imho cannot
break that.

It would be nice to also fix it for vala-wrapper, but as it hasn't
worked before it is atleast not a regression if it doesn't work.

-- 
Venlig hilsen,
Peter Korsgaard 
