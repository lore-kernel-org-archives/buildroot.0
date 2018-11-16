From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Nov 2018 20:29:01 +0100
Subject: [Buildroot] [PATCH 1/1] busybox: add patch to fix seg fault in
 'ifup -a'
In-Reply-To: <CA+1k=2b2EPjS_JBF__mVhgaLcJc22P=nCp-BSzo2hdLPwzp0Eg@mail.gmail.com>
 (Joel Carlson's message of "Fri, 16 Nov 2018 09:35:09 -0700")
References: <20181110193319.1273-1-daniel.m@sent.com>
 <1989059802.1429665.1541889047561.JavaMail.zimbra@datacom.com.br>
 <CA+1k=2b2EPjS_JBF__mVhgaLcJc22P=nCp-BSzo2hdLPwzp0Eg@mail.gmail.com>
Message-ID: <87d0r4stxe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joel" == Joel Carlson <JoelsonCarl@gmail.com> writes:

Hi,

 >> Busybox 1.29.3, which is on Buildroot master since commit 77497f5497,
 >> aleady has this fix:
 >> 
 >> Applying 0004-libbb-in-xmalloc_fgets-use-size_t-for-bb_get_chunk_f.patch using patch:
 >> patching file libbb/get_line_from_file.c
 >> Reversed (or previously applied) patch detected!  Skipping patch.
 >> 
 >> What Busybox version are you using? Perhaps your patch could be
 >> applied on the LTS branches but I think we should just bump it
 >> to 1.29.3 on those branches too.
 >> 
 >> Peter?

 > I'm not Peter (obviously), but I'd recommend bumping the buildroot
 > version on any LTS branches still using busybox 1.29.2.  I have a
 > branch off of 2018.08, and I was hitting the same segfault issue until
 > I cherry-picked the commit from master that bumps busybox to 1.29.3.
 > The only change between 1.29.2 and 1.29.3 was the commit to fix this
 > issue.

2018.02.x (our LTS branch) is using 1.27.2 that afaik is not affected by
this ifup issue.

2018.08.x still had 1.29.2, so I've bumped that to 1.29.3.

-- 
Bye, Peter Korsgaard
