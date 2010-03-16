From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 16 Mar 2010 18:50:18 +0000 (UTC)
Subject: [Buildroot] Lots of warnings: dereferencing type-punned pointer
	will break...
Message-ID: <hnojta$qc0$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After uptading from a December git snapshot to 2010.2 (which included
moving from gcc 4.3 to 4.4), I've noticed that there are a _lot_ of
warnings from the compiler:

  findutils/grep.c:617: warning: dereferencing type-punned pointer will break strict-aliasing rules
  findutils/grep.c:623: warning: dereferencing type-punned pointer will break strict-aliasing rules
  findutils/grep.c:626: warning: dereferencing type-punned pointer will break strict-aliasing rules
  findutils/grep.c:628: warning: dereferencing type-punned pointer will break strict-aliasing rules
  findutils/grep.c:634: warning: dereferencing type-punned pointer will break strict-aliasing rules
  findutils/grep.c:636: warning: dereferencing type-punned pointer will break strict-aliasing rules

There are now thousands of lines like that, and I don't remember that
being the case before the update.  Have I broken something?

-- 
Grant Edwards               grant.b.edwards        Yow! And then we could sit
                                  at               on the hoods of cars at
                              gmail.com            stop lights!
