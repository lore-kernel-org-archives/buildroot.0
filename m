From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Wed, 15 Mar 2017 15:39:35 -0700
Subject: [Buildroot] site and version vs. package names
Message-ID: <CAAkeqgXK4roHSfoT1LHkOuY1O=VEK=it_okaO2mN=KPq07c9AQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm working on packaging udisks2 and I'm running into a somewhat odd problem.

I want to create a package called "udisks2" since there's already a
package for the older "udisks" that has been abandoned upstream as I
understand it.  That means I have udisks2.mk and macros starting with
UDISKS2_ such as UDISKS2_VERSION and so on.

udisks2 releases look like this:
https://github.com/storaged-project/udisks/releases/tag/udisks-2.6.4

So unfortunately the string "udisks" is in the URL. I can't think of a
reasonable way to make the fetcher generate a URL like
https://github.com/storaged-project/udisks/archive/udisks-2.6.4.tar.gz
because the package is UDISKS2 but then it needs "udisks" in the URL
and the version number.

Is there a way for me to work around that? (sorry if it's a stupid
question, I feel like I'm missing something either way). I can simply
replace the udisks package for my needs but for buildroot itself I
suspect people want both (though I'm not sure that the old udisks has
much utility in a modern system).

Thanks,

  -Andrey
