From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 11:54:17 +0200
Subject: [Buildroot] [PATCH 13/15 v4] fs: run packages' filesystem hooks
 in a copy of target/
In-Reply-To: <ac9b3e12-1746-40fa-5a11-39b0672ab32a@mind.be> (Arnout
 Vandecappelle's message of "Sat, 31 Mar 2018 23:09:43 +0200")
References: <cover.1522487149.git.yann.morin.1998@free.fr>
 <193b195e0bb305f01ccedd565a517635a975b154.1522487149.git.yann.morin.1998@free.fr>
 <cbd0a228-12b8-9a72-f4bc-311f4c95d001@mind.be>
 <87bmf4t2go.fsf@dell.be.48ers.dk>
 <ac9b3e12-1746-40fa-5a11-39b0672ab32a@mind.be>
Message-ID: <87lge7s14m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> Wouldn't hard links be potentially dangerous - E.G. in case a script
 >> appends to a file.

 >  If this is a script that runs in the context of building a package, then the
 > hard link does exactly what we want.

 >  If it is a script that runs in the context of rootfs generation, you have a point.

Ok.

 >  If your target is a bit large and you have several filesystems to support, I
 > expect that making all these copies is really going to hit you in build time for
 > a simple package rebuild. Of course, we can fix that problem when it happens.

Yes, I'm also a bit scared of these extra steps, but I understand the
reason for it.

One of the most common extra rootfs options is probably .tar, and for
that an optimization could be to directly create the final .tar and use
that for the other filesystem types.

-- 
Bye, Peter Korsgaard
