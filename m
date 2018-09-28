From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 14:56:28 +0200
Subject: [Buildroot] [PATCH] lcms2: add upstream security fix for
 CVE-2018-16435
In-Reply-To: <20180904214347.18660-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 4 Sep 2018 23:43:47 +0200")
References: <20180904214347.18660-1-peter@korsgaard.com>
Message-ID: <87k1n57pc3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Little CMS (aka Little Color Management System) 2.9 has an integer overflow
 > in the AllocateDataSet function in cmscgats.c, leading to a heap-based
 > buffer overflow in the SetData function via a crafted file in the second
 > argument to cmsIT8LoadFromFile.

 > For more details, see:
 > https://github.com/mm2/Little-CMS/issues/171
 > https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-16435

 > The upstream fix unfortunately includes a number of unrelated changes, but
 > thse files are not used when building for Linux.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
