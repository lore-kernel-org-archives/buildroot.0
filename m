From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Jan 2017 17:06:13 +0100
Subject: [Buildroot] [PATCH] gd: security bump to version 2.2.3
In-Reply-To: <20170103144252.28827-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 3 Jan 2017 15:42:52 +0100")
References: <20170103144252.28827-1-peter@korsgaard.com>
Message-ID: <871swi3j4a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Security related fixes:
 > This flaw is caused by loading data from external sources (file, custom ctx,
 > etc) and are hard to validate before calling libgd APIs:

 > - fix php bug 72339, Integer Overflow in _gd2GetHeader (CVE-2016-5766)
 > - bug #248, fix Out-Of-Bounds Read in read_image_tga
 > - gd: Buffer over-read issue when parsing crafted TGA file (CVE-2016-6132)

 > Using application provided parameters, in these cases invalid data causes
 > the issues:

 >  - Integer overflow error within _gdContributionsAlloc() (CVE-2016-6207)
 >  - fix php bug 72494, invalid color index not handled, can lead to crash ( CVE-2016-6128)
 >  - improve color check for CropThreshold

 > The build system now enables -Wall and -Werror by default, so pass
 > --disable-werror to disable that.  Notice that this issue has been fixed
 > upstream post-2.2.3:

 > https://github.com/libgd/libgd/issues/339

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
