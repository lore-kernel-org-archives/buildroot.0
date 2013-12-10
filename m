From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Dec 2013 14:39:32 +0100
Subject: [Buildroot] [PATCH v5 1/1] ktap: new package
In-Reply-To: <1675197757.16219192.1386680505536.JavaMail.root@openwide.fr>
 (Jeremy Rosen's message of "Tue, 10 Dec 2013 14:01:45 +0100 (CET)")
References: <1675197757.16219192.1386680505536.JavaMail.root@openwide.fr>
Message-ID: <874n6g6d0r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jeremy" == Jeremy Rosen <jeremy.rosen@openwide.fr> writes:

Hi,

 > two remarks

 > 1) the usual problem with that idea is that if the kernel is externally
 > built, you can't do that (you don't even know if/where the config is)

But that's not a problem for ktap, as it can only be used with an
internally built kernel as is.


 > 2) I'd rather have it works similar to other dependancies, i.e having
 > the option removed and a comment telling me what I need to enable to 
 > have ktap available.

That's not how we handle the other settings like devtmpfs, cgroups,
EABI, initramfs, .. The kernel has LOTS of options, I don't want to see
Buildroot configuration options for all of them.


 > I recently had a similar problem with udev needing inotify, so the 
 > problem of the plumbing layer relying on some specific kernel feature
 > is probably a more generic problem... maybe a config option telling
 > kconfig where the kernel is ? That would be tricky with the way 
 > kconfig works, but that would be nice...

Basically the strategy is:

Do the right thing automatically if BR builds the kernel, and otherwise
the user is on his own (we'll normally document the requirements in the
help text, but there's no logic to detect it)

-- 
Bye, Peter Korsgaard
