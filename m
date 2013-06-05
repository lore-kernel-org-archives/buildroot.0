From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Jun 2013 16:15:34 +0200
Subject: [Buildroot] [PATCH] bzip2: Rearrange build order
In-Reply-To: <20130605160438.2a47341b@skate> (Thomas Petazzoni's message of
 "Wed, 5 Jun 2013 16:04:38 +0200")
References: <1370436976-746-1-git-send-email-markos.chandras@gmail.com>
 <877gi8ekf6.fsf@dell.be.48ers.dk> <20130605160438.2a47341b@skate>
Message-ID: <8738swej95.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> This works, but is afaik less efficient for the static lib case.
 >> 
 >> The real fix is imho to build the object files twice, like how libtool
 >> does it.
 >> 
 >> If you look at the Debian package, they work around it by adding a
 >> seperate .c -> .sho build rule, which adds -fPIC, and then link the .so
 >> file with the .sho files instead.

 Thomas> Are you sure there are not already many packages that build
 Thomas> things only once with -fPIC and use that for both the static
 Thomas> and the shared library?

 Thomas> What you're proposing here is quite the opposite to what you
 Thomas> merged (from me) in a33baa1ef9dadbec8e45d411c30d636fa6b8872a
 Thomas> (icu: don't build object files twice).

I've never claimed I was consistent ;) What I'm saying is simply that
the "correct" way to do this, is to build the object files twice similar
to how E.G. libtool does it.

For something as small (and possibly performance sensitive) as bzip2 I
think it is worthwhile doing it.

-- 
Bye, Peter Korsgaard
