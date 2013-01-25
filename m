From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Jan 2013 11:06:13 +0100
Subject: [Buildroot] [PATCH 3/3] sdl_gfx: bump to version 2.0.24
In-Reply-To: <CAKcgs2wYN1OiQX7e5hRwontZQCSybwG-vJvTQwcSL_BV2V1F9Q@mail.gmail.com>
 (Gilles Talis's message of "Thu, 24 Jan 2013 18:59:12 -0800")
References: <1358453318-751-1-git-send-email-gilles.talis@gmail.com>
 <1358453318-751-3-git-send-email-gilles.talis@gmail.com>
 <87d2x0g818.fsf@dell.be.48ers.dk>
 <CAKcgs2wYN1OiQX7e5hRwontZQCSybwG-vJvTQwcSL_BV2V1F9Q@mail.gmail.com>
Message-ID: <87ehh9h90q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> finally found some time to look into this.

 Gilles> The issue comes from the fact that even though aclocal.m4 and
 Gilles> configure.in are identical across 2.0.23 and 2.0.24,
 Gilles> ?configure.in timestamp has changed, making it newer than
 Gilles> aclocal.m4. This leads "make" to try and re-generate
 Gilles> aclocal.m4.  I am not expert enough in aclocal and m4 to fix
 Gilles> the missing variables issue.  The only quick & dirty workaround
 Gilles> I have found is to change configure.in file timestamp to what
 Gilles> it was in 2.0.23 (touch -t .....).

 Gilles> Would it be an acceptable patch to bump sdl_gfx to 2.0.24?

Is there any strong reason to go for 2.0.24 over 23? Perhaps you could
bring it up with sdl_gfx and get them to do a 2.0.25 release with
aclocal.m4 regenerated?

-- 
Bye, Peter Korsgaard
