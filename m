From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 17:15:01 +0100
Subject: [Buildroot] [PATCH] stress: honor the BR2_PREFER_STATIC_LIB
	preference
In-Reply-To: <CAEvN+1hHaUvusQPDV8qbs8ipzx-m0+Vhe02FmeWZp9NMrPYJ=A@mail.gmail.com>
 (Tzu-Jung Lee's message of "Mon, 4 Mar 2013 02:55:59 +0800")
References: <1362206128-27771-1-git-send-email-roylee17@gmail.com>
 <51337F8E.9070803@mind.be>
 <CAEvN+1hHaUvusQPDV8qbs8ipzx-m0+Vhe02FmeWZp9NMrPYJ=A@mail.gmail.com>
Message-ID: <87boazb0qi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "T" == Tzu-Jung Lee <roylee17@gmail.com> writes:

 T> ? ? ifeq ($(BR2_PREFER_STATIC_LIB),y)
 T> ? ? SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
 T> ? ? TARGET_LDFLAGS += --static
 T> ? ? else
 T> ? ? SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 T> ? ? endif

 T> As you indicated, the --enable-static is given anyway in the
 T> SHARED_STATIC_LIBS_OPTS.  Unfortunately, as long as the
 T> --enable-static is given, stress links the program statically,
 T> regardless how the --enable-shared or --disable-shared.  In this
 T> case, stress would be linked statically regardless how the
 T> BR2_PREFER_STATIC_LIB specifies.  So we need the patch to explicitly
 T> tell it link the program dynamically by appending/overriding with
 T> --disable-static.

So you only need to pass --disable-static if !BR2_PREFER_STATIC_LIB?
Could you please resend with a patch only doing that and a comment above
it explaining why?

-- 
Bye, Peter Korsgaard
