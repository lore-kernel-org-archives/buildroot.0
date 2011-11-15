From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 15 Nov 2011 11:55:39 +0100
Subject: [Buildroot] 2011.11: manual improvements
Message-ID: <CAAXf6LUPKRJUJF83-x1n4rRVXdmg3Ob-1dgtyuV+6v+aqfKbWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

In 2011.11, the new asciidoc manual will be included.

There are a few points I'd like to mention regarding this:

* The 2011.11-rc1 tarball does not contain a ready-made manual. A user
that doesn't know buildroot and searches for the manual, will only
find the manual sources in docs/manual. These are readable, but they
are not intended for that purpose. I don't think we can expect users
to first run 'make manual', and have asciidoc installed.
Therefore I think we should provide a ready-made manual in the
tarballs. It probably requires a rewrite of the 'release' target,
because the current 'git archive' used there will not take along
untracked files. One approach is to add the files to the tarball
afterwards.

* I think it should become more clear that the contents of
'docs/manual' are really the manual sources, not the finished manual.
One way to do this would be to move them in a subdirectory 'sources'
or rename 'manual' to 'manual-sources'.

* Suppose a user does execute 'make manual', then it's unclear what
the location of the manual is. I think we should print the location
when executing the corresponding make targets, and provide a README or
similar in docs/manual to explain this. I would actually like it if
the manual were generated in docs/manual directly, instead of in
'output'.

Best regards,
Thomas
