From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 23:02:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/bzip2: security bump version to
 1.0.8
In-Reply-To: <dh8h1gxvf.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Sat, 03 Aug 2019 22:48:13 +0200")
References: <20190803195526.24827-1-bernd.kuhls@t-online.de>
 <878ssa7zwj.fsf@dell.be.48ers.dk>
 <dh8h1gxvf.ln2@ID-313208.user.individual.net>
Message-ID: <87zhkq6jy9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Sat, 03 Aug 2019 22:33:00 +0200 schrieb Peter Korsgaard:
 >> But we already have a fix for CVE-2019-12900 in
 >> 0003-Make-sure-nSelectors-is-not-out-of-range.patch. How come you are
 >> not removing it?

 > Hi Peter,

 > because the patch did not fail to apply to 1.0.8 and does not contain any 
 > mention about being a CVE fix.

The git history does, and the upstream git history of decompress.c shows
that it should be removed.

git log package/bzip2/0003-Make-sure-nSelectors-is-not-out-of-range.patch
commit 6581c441dfc06c5e5e3666718e5c2e9801485ede
Author: Jared Bents <jared.bents@rockwellcollins.com>
Date:   Wed Jun 26 09:20:42 2019 -0500

    package/bzip2: add upstream security fix for CVE-2019-12900

    Patch to resolve cve-2019-12900 which affects bzip2 versions 1.0.6 and older

    More information can be found at
    https://nvd.nist.gov/vuln/detail/CVE-2019-12900

    Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>


And the patch _IS_ the upstream git commit, as specified in the file:


https://sourceware.org/git/?p=bzip2.git;a=commit;h=7ed62bfb46e87a9e878712603469440e6882b184

 > In fact this patch was reverted upstream for the 1.0.8 release:
 > https://sourceware.org/git/?
 > p=bzip2.git;a=commitdiff;h=b07b105d1b66e32760095e3602261738443b9e13

 > Thanks for the hint, sent v2: http://patchwork.ozlabs.org/patch/1141605/

Thanks.

-- 
Bye, Peter Korsgaard
