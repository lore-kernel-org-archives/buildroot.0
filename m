From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Jul 2013 09:17:09 -0300
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <CAAXf6LUbO+PyKHw7zDDG3bfpjwYzjoahiiO-d+wx2WJdNJW6tw@mail.gmail.com>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
 <CAEYzJUFzijo=jM+s4P_ZFAH-E_-MvhKZbcjHmNUBypiu5pF6zQ@mail.gmail.com>
 <20130711134646.6ef211dd@skate> <201307111402.34152.yann.morin.1998@free.fr>
 <CAAXf6LUbO+PyKHw7zDDG3bfpjwYzjoahiiO-d+wx2WJdNJW6tw@mail.gmail.com>
Message-ID: <51DEA245.2060109@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/2013 09:08 AM, Thomas De Schampheleire wrote:

> But with this policy, all existing 'unexports' in the Makefile should
> be removed, and it's up to the user to fix his stuff.
> In corporate environments, for one, this is not always feasible. Many
> developers will build with buildroot as part of an overall build
> process, and will not know anything about buildroot itself nor its
> requirements. So either the overall build process should clear the
> user's environment before starting the buildroot build, or buildroot
> itself should clean up what it knows is problematic.
> 
> Since there already are several variables cleared in that way, I'm
> more in favor in going down that path and adding some more troublesome
> variables, rather than removing these bits altogether.

I agree.
At the moment it's working quite well as it is, maybe we should add some
extra unexports in the main Makefile for things that are known to be
troublesome.
For instance on Gentoo RUBYOPT is set, and when buildroot builds
host-ruby this causes problems.
The best solution would be to unexport RUBYOPT (and RUBYLIB while at
it), i just didn't send a patch yet because i'm looking at the thread to
see how it pans out :)
Regards.
