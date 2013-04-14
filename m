From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Apr 2013 23:12:11 +0200
Subject: [Buildroot] [PATCH] libfuse: not available for static builds
In-Reply-To: <512CE22D.8070601@zacarias.com.ar> (Gustavo Zacarias's message of
 "Tue, 26 Feb 2013 13:26:21 -0300")
References: <1361873801-8672-1-git-send-email-gustavo@zacarias.com.ar>
 <874ngz82q5.fsf@dell.be.48ers.dk> <512CE22D.8070601@zacarias.com.ar>
Message-ID: <87sj2solzo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 02/26/2013 01:22 PM, Peter Korsgaard wrote:
 >> Huh, that build error is just because of the hardcoded target install
 >> step (why don't we just use make install)?
 >> 
 >> Did you mean another build error?

 Gustavo> Yes, but it leads to other errors if we avoid copying
 Gustavo> libfuse*.so If you've just got libfuse.a in staging and
 Gustavo> fuse-using programs link/use it it breaks anyway because
 Gustavo> libfuse hardcodes dlopen.  We'd just be translating the build
 Gustavo> failure to exfat, unionfs and so on...  Regards.

Ok, committed - Thanks.

-- 
Bye, Peter Korsgaard
