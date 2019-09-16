From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 15 Sep 2019 23:34:12 -0300
Subject: [Buildroot] Notifications of defconfig and runtime test failures
References: <20190908180346.45bb10db@windsurf>
Message-ID: <5d7ef4a4752c2_2a453fc52816785866449@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Sep 08, 2019 at 01:03 PM, Thomas Petazzoni wrote:

> On Sat, 07 Sep 2019 21:51:31 -0300
> Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:
> 
>> > Just like the autobuilder failures, the defconfig and runtime test
>> > failures are not only all reported to the mailing list, they are also
>> > reported individually to each developer who is listed in the DEVELOPERS
>> > file for a given defconfig or runtime test.  
>> 
>> I have this entry in DEVELOPERS files:
>> F:	support/testing/
>> But I did not receive a "Your daily results" e-mail and also the runtime tests
>> are marked as ORPH.
>> Of course it's a minor issue.
>> Should I change my entry to explicitly list a bunch of tests, each one like
>> this?
>> F:	support/testing/tests/package/test_syslog_ng.py
> 
> I just had a look, and in fact the listing of runtime-tests done by the
> getdeveloperlib code was not working on the server sending the e-mails,
> due to missing Python modules. I installed them, and re-checked that
> the e-mail that has been sent on September 7th now properly notifies
> you of failing runtime-tests.

Thanks. I successfully received results for 2019-09-13.

> 
> That being said, I am wondering if having a wildcard support/testing/
> entry is the best thing. It is nice because it makes sure you get
> notifications for all runtime test issues. However, it also means none
> of the tests are "orphan", and so we don't know which test is
> associated with its actual original submitter/maintainer. That's not a
> big issue though, but I would like to make sure that for new tests that
> we add, a proper DEVELOPERS entry gets added.

When the entry was added there was only 32 runtime tests in the tree.
Now there are 147. I am not the best first contact for every one of them.
Of course I can try to help with any other failure, even for those tests not
listed under my name.

And I see your point. I agree it would be good to have the submitter of the
test as a maintainer when possible.

So I just sent a patch to trim down the list of runtime tests for my entry.


Regards,
Ricardo
