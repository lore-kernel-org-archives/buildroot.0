From: Sven Neumann <s.neumann@raumfeld.com>
Date: Sun, 18 Oct 2009 11:51:10 +0200
Subject: [Buildroot] Bash fails to build.
In-Reply-To: <4ADA6A38.40703@rodgers.sdcoxmail.com>
References: <4ADA6A38.40703@rodgers.sdcoxmail.com>
Message-ID: <1255859470.3549.2.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2009-10-17 at 18:07 -0700, Stephen Rodgers wrote:
> I recently upgraded by development machine to Ubuntu 9.04 and now I'm
> having trouble compiling bash. It's failing during the link with a bunch
> of unresolved symbols.
> 
> I am using the buildroot snapshot buildroot-2009.08.tar.gz.
> 
> I see one other mailing list posting around 9/1 with a similar issue.
> However, the suggestion to do a make bash followed by a make does not
> work around the issue.

Try 'make bash-dirclean; make bash'.

Your output looks exactly like the problem we have observed here, also
on Ubuntu 9.04. Our solution has been to disable bash entirely and to
adjust all scripts on the target to work with the busybox sh.


Sven
