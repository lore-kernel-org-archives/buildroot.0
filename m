From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:44:54 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: Avoid absolute path to python
 in shebang
In-Reply-To: <1531413454-11546-1-git-send-email-david.owens@rockwellcollins.com>
 (David Owens's message of "Thu, 12 Jul 2018 11:37:34 -0500")
References: <1531413454-11546-1-git-send-email-david.owens@rockwellcollins.com>
Message-ID: <87h8kuaoix.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David Owens <david.owens@rockwellcollins.com> writes:

 > When the output directory is nested under a long path name, calling the
 > gdbus-codegen, glib-genmarshal, or glib-mkenums scripts throws the
 > error:

 >> '/usr/bin/env: /...: No such file or directory'

 > This is because libglib2 uses the absolute path to the python
 > interpreter for its shebang statements, and shebangs have a max length
 > of 127 chars[1]. A long absolute path will be cut off and appear as a
 > missing file.

 > Since the host Python is present in the $PATH passed to all packages, we
 > can copy the workaround from Yocto and just use the python interpreter
 > in $PATH[2]. However, 'python' is used instead of 'python3' as the
 > scripts are compatible with both.

 > [1] https://linux.die.net/man/2/execve
 > [2] http://cgit.openembedded.org/openembedded-core/commit/?id=eef7883587acc933d6f34b559ec03ff84d18573b

 > Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
 > Signed-off-by: David Owens <david.owens@rockwellcollins.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
