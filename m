From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2021 10:36:55 +0100
Subject: [Buildroot] [PATCH 2/2] package/uclibc: Patch with updated
 kernel time definitions
In-Reply-To: <20210127115648.15340-2-geoffrey.legourrierec@gmail.com>
 ("Geoffrey Le =?utf-8?Q?Gourri=C3=A9rec=22's?= message of "Wed, 27 Jan 2021
 12:56:48 +0100")
References: <20210127115648.15340-1-geoffrey.legourrierec@gmail.com>
 <20210127115648.15340-2-geoffrey.legourrierec@gmail.com>
Message-ID: <87im7cp1s8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Geoffrey" == Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com> writes:

 > Building uclibc 1.0.37 for SuperH architecture with linux-headers 5.10.7
 > fails at libpthread level due to missing time-related data structures,
 > usually defined by the kernel. Make uclibc correctly define those types.

 > A previous patch in buildroot [1] fixed the symptom by tampering with
 > linux-headers inclusions, but analysis [2] done in collaboration with
 > Linux folks concluded that the issue lied in (voluntary) include guard
 > "preemption" in uclibc kernel_types.h.
 > However, kernel_types.h was not up to date with relevant 64-bit time
 > data structures, so defining those here was needed.

 > The present uclibc patch was mailed to uclibc-ng mailing list and got
 > a positive response; I am not able to give a link to the discussion,
 > as it has not appeared yet [3] (perhaps I'm not looking at the right
 > place ?)
 > So until the patch is merged upstream and we bump uclibc version, keep
 > our patch here.

 > [1] https://git.buildroot.net/buildroot/commit/?id=742f37de8d0e3797698411dfc6a63bd7e98aafe2
 > [2]
 > https://patchwork.kernel.org/project/linux-sh/patch/20210123165652.10884-1-geoffrey.legourrierec at gmail.com/
 > [3] https://mailman.uclibc-ng.org/pipermail/devel/2021-January/thread.html

 > Signed-off-by: Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
