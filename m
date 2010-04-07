From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Apr 2010 22:06:16 +0200
Subject: [Buildroot] 2.6.33.2 kernel headers patch
In-Reply-To: <283831A4-C72C-440B-8959-4A1904239F54@me.com> (Thomas
	Brandstetter's message of "Wed, 07 Apr 2010 21:51:39 +0200")
References: <3C3F38C6-6CB3-4F69-ACF7-3229CB42C39F@me.com>
	<A24AAD60-7EAA-49D9-B18C-28728690408D@me.com>
	<87d3ybrag1.fsf@macbook.be.48ers.dk>
	<283831A4-C72C-440B-8959-4A1904239F54@me.com>
Message-ID: <87zl1fownb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Brandstetter <thomas.brandstetter@me.com> writes:

 Thomas> You're totally right, but I thought there is something wrong
 Thomas> with the mailing list because nobody wrote anything in reply
 Thomas> :-)

You can always check the archive if you're in doubt:

http://lists.busybox.net/pipermail/buildroot/

 Thomas> I'm not a developer and I'm not very familiar with git. Is
 Thomas> there a good documentation for Buildroot available how to send
 Thomas> git patches via the command line?

Buildroot is mainly a developer tool, but we do have documentation:

http://buildroot.net/buildroot.html
http://buildroot.net/git.html

The last has a link to the git homepage. There's very little buildroot
specific about how we use git, so a quick google search should find you
plenty of info (hint: we use the same approach like many other projects
like the Linux kernel, U-boot, ..).

The git commands you are looking for are:

git checkout -b <branch>
git commit
git format-patch -s master
git send-email --to buildroot at uclibc.org 0*.patch

-- 
Bye, Peter Korsgaard
