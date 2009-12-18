From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Fri, 18 Dec 2009 21:36:30 +0000 (UTC)
Subject: [Buildroot] External toolchain: crosstool-NG instead of
	buildroot?
References: <hgfudc$e2$1@ger.gmane.org> <20091218223139.2118763c@surf>
Message-ID: <hggsku$9gv$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-12-18, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Grant Edwards <grant.b.edwards@gmail.com> a ??crit :
>
>> The buildroot docs recommends using crosstool-NG to generate
>> external toolchains.
>> 
>> Is there some reason one shouldn't or can't use a toolchain
>> generated buildroot?
>
> Theorically, Buildroot should work just as fine as Crosstool-NG for
> generating toolchain.

So far it seems to be working fine.  I haven't figured out what
the minimal set of required files is.  Initially I took a
snapshot of everything under output/staging.  Subsequent makes
using that as an external toolchain failed because it found
files in output/staging/usr/share that it didn't expect to be
there.  I removed usr/share from my "toolchain", and now builds
seem to work fine.

> In practive, my own *personal* feeling is that the Crosstool-NG
> community is spending more time to improve this toolchain generation
> tool than the Buildroot community spends on the toolchain part. I have
> the impression that they do a better job at following new upstream
> versions, integrating necessary patches, etc. But again, I have no
> objective facts to validate these feelings.

For now I think I'll stick with a buildroot-generated toolchain.

-- 
Grant Edwards                   grante             Yow! I'm having a
                                  at               tax-deductible experience!
                               visi.com            I need an energy crunch!!
