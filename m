From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Sep 2019 18:03:46 +0200
Subject: [Buildroot] Notifications of defconfig and runtime test failures
In-Reply-To: <5d74509312f3_12263fea580e4f704771@ultri5.mail>
References: <20190907082044.3c46f9e0@windsurf>
 <5d74509312f3_12263fea580e4f704771@ultri5.mail>
Message-ID: <20190908180346.45bb10db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

On Sat, 07 Sep 2019 21:51:31 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> > Just like the autobuilder failures, the defconfig and runtime test
> > failures are not only all reported to the mailing list, they are also
> > reported individually to each developer who is listed in the DEVELOPERS
> > file for a given defconfig or runtime test.  
> 
> I have this entry in DEVELOPERS files:
> F:	support/testing/
> But I did not receive a "Your daily results" e-mail and also the runtime tests
> are marked as ORPH.
> Of course it's a minor issue.
> Should I change my entry to explicitly list a bunch of tests, each one like
> this?
> F:	support/testing/tests/package/test_syslog_ng.py

I just had a look, and in fact the listing of runtime-tests done by the
getdeveloperlib code was not working on the server sending the e-mails,
due to missing Python modules. I installed them, and re-checked that
the e-mail that has been sent on September 7th now properly notifies
you of failing runtime-tests.

That being said, I am wondering if having a wildcard support/testing/
entry is the best thing. It is nice because it makes sure you get
notifications for all runtime test issues. However, it also means none
of the tests are "orphan", and so we don't know which test is
associated with its actual original submitter/maintainer. That's not a
big issue though, but I would like to make sure that for new tests that
we add, a proper DEVELOPERS entry gets added.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
