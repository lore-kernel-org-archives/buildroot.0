From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jul 2013 13:46:46 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <CAEYzJUFzijo=jM+s4P_ZFAH-E_-MvhKZbcjHmNUBypiu5pF6zQ@mail.gmail.com>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
 <CAAXf6LVC=vqL0mCFVMpKs2A99QtBviHXsmXZp3B+fo+32-+dXA@mail.gmail.com>
 <CAEYzJUFzijo=jM+s4P_ZFAH-E_-MvhKZbcjHmNUBypiu5pF6zQ@mail.gmail.com>
Message-ID: <20130711134646.6ef211dd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bj?rn Forsman,

On Thu, 11 Jul 2013 12:33:42 +0200, Bj?rn Forsman wrote:

> How about going all the way: clean out the environment completely, and
> explicitly add env vars to builders as needed. That would result in a
> more deterministic build environment, IMHO.

I don't think this works: there are a bunch of environment variables
that we accept (to tune the uClibc config file, the Busybox config
file, the host gcc to use, etc.). And we also accept the feature that
all BR2_<foo> values can be overridden using environment variables. So
I don't think wiping out the entire environment is possible. However,
we could /maybe/ (if that's possible), wipe out the entire environment
*except* the BR2_<foo> variables, and the few other variables that we
explicitly accept. But I'm not sure how to achieve that.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
