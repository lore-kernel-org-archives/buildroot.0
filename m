From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Apr 2019 15:12:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/numactl: remove patches
In-Reply-To: <20190407090614.19628-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 7 Apr 2019 11:06:14 +0200")
References: <20190407090614.19628-1-fontaine.fabrice@gmail.com>
Message-ID: <87bm1ij6wr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Both patches are already included in version 2.0.12
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This sounded odd to me (E.G. why do the patches then still apply?), so I
had a closer look. Indeed, upstream now also has the following just
above the hunk touched by the patches:

#ifndef __GLIBC_PREREQ
# define __GLIBC_PREREQ(x,y) 0
#endif

And given that we allow some fuzz when applying patches, the 2 patches
do apply and we end up with these 3 lines twice in the file.

Committed after extending the commit message a bit, thanks.

-- 
Bye, Peter Korsgaard
