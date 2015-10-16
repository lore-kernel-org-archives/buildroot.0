From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Oct 2015 17:10:05 +0200
Subject: [Buildroot] [PATCH] fs/common.mk: support comments in user
	table files
In-Reply-To: <20151016170128.6a821cd0@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 16 Oct 2015 17:01:28 +0200")
References: <1445007019-23720-1-git-send-email-peter@korsgaard.com>
 <20151016170128.6a821cd0@free-electrons.com>
Message-ID: <87d1we3l4i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Peter, Yann,
 > On Fri, 16 Oct 2015 16:50:19 +0200, Peter Korsgaard wrote:
 >> The format of the users table files is non trivial, so it is sometimes handy
 >> to add comments explaining the syntax (or simply the reason for the user)
 >> inline in the files.
 >> 
 >> Support comment lines prefixed with '#' similar to shell / makedevs files and strip
 >> those lines before passing to the mkusers script.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Shouldn't it the responsibility of the mkusers script to ignore such
 > comments instead ?

It could be, but that is more work as it iterates over the (combined)
file multiple times, and comments only really makes sense for custom
users files (and nog <PKG>_USERS) so just stripping those lines when
handling the custom files imho makes sense.

-- 
Venlig hilsen,
Peter Korsgaard 
