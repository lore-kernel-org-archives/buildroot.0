From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Mar 2013 14:41:54 +0100
Subject: [Buildroot] [PATCH] <pkg>-rsync: exclude version control files
In-Reply-To: <f9ac20b69b1bfd3f77ef.1362169598@BEANTN0L019720> (Thomas De
 Schampheleire's message of "Fri, 01 Mar 2013 21:26:38 +0100")
References: <f9ac20b69b1bfd3f77ef.1362169598@BEANTN0L019720>
Message-ID: <87d2uy3zz1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> When using rsync to import package sources (typically with
 Thomas> PKG_OVERRIDE_SRCDIR), it often happens that these external sources
 Thomas> are under version control, and contain directories like .git,
 Thomas> .hg, etc.

 Thomas> Depending on the project, these directories can become pretty large
 Thomas> and typically have a lot of files. Moreover, they are not necessary
 Thomas> in the context of building the package. Therefore, this commit adds
 Thomas> the --cvs-exclude option to the rsync call, saving both disk space
 Thomas> and sync time.

It seems the agreement is that people don't mind the missing
.git/.svn/.. files, so committed - Thanks.

-- 
Bye, Peter Korsgaard
