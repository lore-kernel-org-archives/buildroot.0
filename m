From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 18 Nov 2018 23:31:24 -0200
Subject: [Buildroot] [PATCH 4/5] support/testing/tests: CLANG
 compiler-rt runtime test
References: <CANQCQpa8Qv9k9OepMP_9eC9RX8feynYwytCJXb5sUWSGBenb=Q@mail.gmail.com>
Message-ID: <5bf2126c115b0_14b03ff57404dc704575c@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

+ Arnout
+ Thomas
+ Yann

On Sat, Nov 17, 2018 at 12:30 AM, Matthew Weber wrote:

[snip]
> I've got a v2 tested and read to send out (You sketch was quite
> complete and worked).  One general question came to mind.  Why don't
> we just create a single br2_external for support/test?

While keeping them separate, there is no room for interaction between the
fixtures for unrelated test cases.
Each br2-external will be simple.

If we end up moving each test case to the folder of the package it tests (I
hope we do) the fixtures for the test case can be in a subfolder of the package.
And a few years from now, when we remove a package that have test cases, we just
need to remove the entire package folder, because the package folder contains
everything related to it.

There is a small price to pay: the 3 small files per br2-external.
But not all test cases will use a br2-external, only a subset. All current 70
test cases don't need it.


Regards,
Ricardo
