From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 08:49:21 +0200
Subject: [Buildroot] Build Fails with ruby-1.9.2-p0
In-Reply-To: <BANLkTi=uKZXy-_8wZKoNA6ohoOvh2rsYOg@mail.gmail.com> (Christopher
 Boumenot's message of "Mon, 30 May 2011 08:05:51 -0400")
References: <BANLkTimm-3LX2S8-17VyPhuiaLqZC3m4jg@mail.gmail.com>
 <BANLkTi=uKZXy-_8wZKoNA6ohoOvh2rsYOg@mail.gmail.com>
Message-ID: <874o2ytwjy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christopher" == Christopher Boumenot <boumenot@gmail.com> writes:

Hi,

 Christopher> I bisected from the last commit against the ruby package
 Christopher> to tip, and it appears that this commit broke the ruby
 Christopher> build. ?If I revert it on tip, it builds just fine.


 Christopher> commit 7e3e8ec040b06d6e2fb69e55c004f1ebc02c76d0
 Christopher> Author: Peter Korsgaard <jacmet@sunsite.dk>
 Christopher> Date: ? Fri Apr 29 15:40:58 2011 +0200

 Christopher> ? ? package/Makefile.in: CFLAGS/LDFLAGS: don't add -I / -L args for STAGING_DIR

Thanks, but the -I / -L flags probably just masked away the fact that
ruby was looking at your /usr/lib. The real fix is presumably to not let
it do so, but it would be easier to do so if I could reproduce your
build issue.

-- 
Bye, Peter Korsgaard
