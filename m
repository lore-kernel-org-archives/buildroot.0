From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Tue, 9 Oct 2007 00:28:36 +0200 (CEST)
Subject: [Buildroot] usage of '-rm -f ...' in .mk files
Message-ID: <0710090011020.20512@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is there a point (I'm missing) with that?  The rm manpage on my box
states:

       -f, --force
              ignore nonexistent files, never prompt

Shouldn't every occurence of '-rm -f' be replaced with just 'rm -f'?
Even files with permission 000 (owned by me) can be removed with 'rm -f'
with the exit status 0.  Of course one should not be able to remove files
owned by someone else (unless permission is given to so) and an error
status should be produced.

Isn't it so that we want to know if an attempt to remove unremovable files
occurs, instead of ignoring errors by using '-rm -f'?


Cheers,

-- 
Cristian
