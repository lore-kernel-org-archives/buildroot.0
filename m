From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Nov 2013 09:19:48 +0100
Subject: [Buildroot] [PATCH v3 3/5] eudev: new package.
In-Reply-To: <CAAXf6LWoRXOwzG2RaNSZc+EN4Ev7bJx_hrsgXFuD1Fa5hs8OjA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Sun, 17 Nov 2013 09:16:26
 +0100")
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1383752078-25315-4-git-send-email-eric.le.bihan.dev@free.fr>
 <20131113234133.2b964da0@skate>
 <CAAXf6LWoRXOwzG2RaNSZc+EN4Ev7bJx_hrsgXFuD1Fa5hs8OjA@mail.gmail.com>
Message-ID: <87wqk7xwwr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> There is also a decision to be taken here: do we duplicate the
 >> dependencies here? If we don't duplicate the comments, then maybe we
 >> shouldn't duplicate the dependencies?
 >> 

 > The advantage of duplicating the dependencies is that there is no room
 > for mistakes. The policy is clear.
 > Take the example where package A depends on B and B needs threads.
 > Strictly speaking, A does not need to repeat the dependency.
 > However, what if A also needs threads. This may or may not be known to
 > the author of that package (or anyone who touches its Config.in
 > files). If a new version of B appears that no longer depends on
 > threads and this dependency is removed from B/Config.in, the
 > dependency of A on threads will no longer be expressed. This is a
 > problem.

 > As making the difference between 'does the package itself also needs
 > this dependency' or 'only the package dependencies have this
 > dependency' is not obvious, having different rules in this matter
 > creates a difficult to maintain situation IMO. Therefore, I am more in
 > favor of duplicating the dependencies consistently, along with the
 > comments.

That's fine by me. It is certainly the simplest solution.

-- 
Bye, Peter Korsgaard
