From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 3 Feb 2020 10:49:39 -0800
Subject: [Buildroot] isalnum_l and friends
Message-ID: <CAMo8BfJ6hCMrW6o1W7mLCOwmX3qaHu=E49F4SY9u7msuOHdNAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

there's an example of buildroot package that fails to build when using
isalnum_l:
http://autobuild.buildroot.net/results/b7ba1210d5aa184b133f0171da621d2b0083ec39/build-end.log

AFAICS include/ctype.h defines the following chain of macros for it:
isalnum_l -> __isalnum_l -> __isctype_l
and __isctype_l tries to dereference __ctype_b field in the l parameter
which is of incomplete type.
The easiest fix for that seems to be not providing macro definitions for
isalnum_l and friends.
I also tried to follow the way it was intended to work with macros, but
that seemed a bit too convoluted.

What do you think the fix could be?

-- 
Thanks.
-- Max
