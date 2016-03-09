From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 9 Mar 2016 11:04:51 -0300
Subject: [Buildroot] [PATCH] pkgconf: make wrapper relocatable
In-Reply-To: <87a8m721lk.fsf@dell.be.48ers.dk>
References: <1457529409-24102-1-git-send-email-gustavo@zacarias.com.ar>
 <87egbj228a.fsf@dell.be.48ers.dk> <56E02A78.1050701@zacarias.com.ar>
 <87a8m721lk.fsf@dell.be.48ers.dk>
Message-ID: <56E02D83.9020402@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/16 11:00, Peter Korsgaard wrote:

> Well, we cannot really break existing features to add new ones. The
> relative location between the pkg-config wrapper script and the staging
> directory is constant (or rather known at build time), so I guess we can
> do something with /proc/self/exe. We might need to implement the wrapper
> in C instead for that to work as /proc/self/exe for a shell script seems
> to return /bin/dash here.

That's overly complicated for no value at all.
You know the sysroot is in the host directory as well, so you just need 
to filter out /usr/bin from $0 and hardcode the tuple in the wrapper - 
that's guaranteed to not change, otherwise you're in serious trouble.
Regards.
