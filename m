From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Jan 2014 12:33:59 +0100
Subject: [Buildroot] [PATCH] lua: fix compilation with Blackfin FLAT
In-Reply-To: <CAB0FRste2wME45HZCXaCrVD3zB=bJ8mSB6b3wSk5VTQvs8eycQ@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Thu, 23 Jan 2014
 10:33:42 +0100")
References: <1390389214-9768-1-git-send-email-francois.perrad@gadz.org>
 <87ob33d8x3.fsf@dell.be.48ers.dk>
 <CAB0FRste2wME45HZCXaCrVD3zB=bJ8mSB6b3wSk5VTQvs8eycQ@mail.gmail.com>
Message-ID: <87lhy7aq54.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

Hi,

 >> But BINFMT_FLAT imply BR2_PREFER_STATIC_LIB. I guess we should do this
 >> whenever BR2_PREFER_STATIC_LIB is enabled, right?

 > No, the condition BR2_PREFER_STATIC_LIB is too large.
 > The tarball Lua contains no Configure script, my patch behaves like
 > the detection of the presence of the functions dlopen/dlclose/dlsym in
 > a Configure script.
 > The purpose of BR2_PREFER_STATIC_LIB as described in its help message
 > is very different.

Well, I wouldn't call it "very different". The idea is to not use shared
libraries when PREFER_STATIC_LIB is enabled, so also not
dlopen/dlclose/dlsym.

What you perhaps mean is that there is a difference between
architectures (or variants) where we select BR2_PREFER_STATIC_LIB
because they cannot support shared libraries (and hence have no
dlopen/dlclose/dlsym), and other situations where the USER just desides
that they don't want shared libraries, even if the architecture could
support it.

-- 
Bye, Peter Korsgaard
