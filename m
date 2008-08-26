From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 26 Aug 2008 07:56:03 -0700 (PDT)
Subject: [Buildroot] [RFC] The svn commit of LiTE highlights an issue in
 Makefile.autotools.in
Message-ID: <19163684.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Many packages don't install as well as we would like.  
The Makefile.autotools.in helps us standardise the way things are done but
does not always help.
In the case of LiTE the make command installs some bits and not others,
So I use HOOK_POST_INSTALL to install all the necessary files.

However I think that a HOOK_POST_CLEAN is needed so that when you write  a
HOOK_POST_INSTALL target you automatically write a HOOK_POST_CLEAN that
undoes the extra bits you put in.
Currently without this, cleaning up after usage of HOOK_POST_INSTALL is a
real pain.
What do people think?
Daniel Laird
-- 
View this message in context: http://www.nabble.com/-RFC--The-svn-commit-of-LiTE-highlights-an-issue-in-Makefile.autotools.in-tp19163684p19163684.html
Sent from the BuildRoot mailing list archive at Nabble.com.
