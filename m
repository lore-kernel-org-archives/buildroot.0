From: Andreas Naumann <dev@andin.de>
Date: Mon, 21 Jan 2019 10:25:47 +0100
Subject: [Buildroot] RFC: Qt5 LTS Versions
Message-ID: <b3124494-30f3-eadf-10ff-141dbf5afe07@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

since Qt will soon end its LTS support for 5.6, see
https://blog.qt.io/blog/2018/11/29/support-qt-5-6-lts-ends-march-2019/,
I wonder which versions will be included/supported in buildroot in 2019.02.

At the moment, I would need 5.9 support, so my first thought was to
create a patch which drops 5.6 for 5.9. However someone might just want
to use 5.6 even after upstream maintenance stopped. (I vaguely remember 
licensing being a reason for some folks to stick with 5.6.)
Creating the patch itself also seems to be a somewhat fiddly task
because of the many conditionals (LATEST vs 5_6) involved. Of course 
LATEST used to be 5.9, but it's 5.11 now (maybe 5.12 soon?) so the 5.9 
specialties would have to be re-integrated using yet another variable.

So I guess the question are, should we introduce more than one LTS
version at all?  And, for easier transistion in the future, should 
_LATEST be renamed to _5_XX before bumping to the next non-lts version?
Are there any other/better mechanisms to maintain multiple versions in 
one package?


regards,
Andreas
