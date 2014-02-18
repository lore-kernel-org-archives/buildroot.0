From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Feb 2014 22:11:13 +0100
Subject: [Buildroot] [PATCH 2 of 4] alsa-lib: add a fake dlfcn.h header
	if dynamic load is not supported
In-Reply-To: <CAAXf6LWW=ZgkHZ4--ToOf_=GPycP=rRG8LjqDFQq_mFOV04u0Q@mail.gmail.com>
 (Thomas De Schampheleire's message of "Tue, 18 Feb 2014 15:19:18
 +0100")
References: <patchbomb.1392224140@argentina>
 <2b373a4c038e8029fbfb.1392224142@argentina>
 <87a9dowtgi.fsf@dell.be.48ers.dk>
 <CAAXf6LVCBqSQ=W6xgYUVFJvm6VE+c0GfvVXEv31Ts30m6g0vtg@mail.gmail.com>
 <87wqgsv76u.fsf@dell.be.48ers.dk>
 <CAAXf6LWW=ZgkHZ4--ToOf_=GPycP=rRG8LjqDFQq_mFOV04u0Q@mail.gmail.com>
Message-ID: <87a9do5dou.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> > where snd_dlopen is a wrapper:
 >> 
 >> Ok, why don't we then just stick:
 >> 
 >> #ifndef RTLD_NOW
 >> #define RTLD_NOW 0
 >> #endif
 >> 
 >> #ifndef RTLD_GLOBAL
 >> #define RTLD_GLOBAL 0
 >> #endif
 >> 
 >> To the header where snd_dlopen is defined?

 > That could be done, but we still need something like:
 > #ifdef HAVE_LIBDL
 > #include <dlfcn.h>
 > #endif

Ehh yes, but atleast we don't need to introduce a new file.

-- 
Bye, Peter Korsgaard
