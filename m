From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Nov 2010 22:14:26 +0100
Subject: [Buildroot] [PATCH] target-finalize: fix libthread_db strip fix
In-Reply-To: <201011281236.56902.vapier@gentoo.org> (Mike Frysinger's message
	of "Sun, 28 Nov 2010 12:36:55 -0500")
References: <1290897792-22134-1-git-send-email-vapier@gentoo.org>
	<87hbf1220t.fsf@macbook.be.48ers.dk>
	<201011281236.56902.vapier@gentoo.org>
Message-ID: <8739ql177x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> On Sunday, November 28, 2010 05:09:06 Peter Korsgaard wrote:
 >> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
 Mike> The attempt to fix libthread_db for some targets broke others.  If
 >> you Mike> want to match more libs, you shouldn't do so by breaking others.
 >> The Mike> correct SONAME is libthread_db.so.#.
 >> 
 >> Out of interest, what targets got broken, and how are the libthread_db
 >> files called?

 Mike> i only care about Blackin targets.  we dont waste space on
 Mike> symlinks and only install SONAMEs.

Ok, I naturally don't share this narrow viewpoint. It's not a use case
for any of the supported archs, but ok, it's easy to support.

Again, I know this is probably just you being you, but do take care of
your choice of words. To me, this commit message sounds quite
aggressive, as if you're upset that Javier's fix broke your
nonstandard/unsupported/undocumented setup, which is ofcause pretty
silly considering that he clearly spent effort on verifying it with
multiple toolchains and the original commit didn't even work for the
default configuration.

Anyway, I've fixed up your commit so it applied to master, and committed
with a somewhat reworked commit message.

 Mike> btw, why is your quoting style so screwed up ?

It's just standard emacs supercite, like I've used for the last 10yrs or
so. I find it handy in mailing lists when several people participate in
a discussion.

-- 
Bye, Peter Korsgaard
