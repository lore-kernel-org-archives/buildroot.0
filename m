From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Aug 2010 07:18:37 +0200
Subject: [Buildroot] About cygwin
In-Reply-To: <20100822130319.2cb6e9e3@surf> (Thomas Petazzoni's message of
	"Sun, 22 Aug 2010 13:03:19 +0200")
References: <AANLkTikn0oGbsQFbPg-JeX7=5EnY-3AyYpVNPk7qkYkh@mail.gmail.com>
	<AANLkTinY8Ko+8=1yu0-AMUcP16rawcb=YydUhYh=RSh3@mail.gmail.com>
	<20100822130319.2cb6e9e3@surf>
Message-ID: <877hjhkitu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> You're correct: we don't support Cygwin. I'm not personally interested
 Thomas> by adding Cygwin support to Buildroot, and I think that trying to do
 Thomas> embedded Linux development inside Cygwin doesn't make sense, you'd
 Thomas> better use Linux on your development workstation.

 Thomas> Now, if someone steps in and wants to improve Buildroot to support
 Thomas> Cygwin, why not, but we'll have to see how invasive the changes are. I
 Thomas> don't think we want to merge invasive Cygwin-specific changes if no-one
 Thomas> is going to maintain them on the long term. As none of the current main
 Thomas> Buildroot contributors use Windows and Cygwin, Cygwin support is
 Thomas> probably going to be broken quite often by mistake due to improvements
 Thomas> we make to Buildroot. 

 Thomas> Of course, that's my own personal point of view, not the one of the
 Thomas> Buildroot project as a whole.

FYI, I agree totally with the above. There's a few other reasons why
using Linux instead of Cygwin is a good idea:

- Windows (and in term Cygwin) has a few hardcoded magic file names
  (comN.*, con.*, prn.*, ..), which breaks horrible when packages have
  source files like con.c

- Cygwin is SLOW. It's >5 years since I last used it, but back then it
  was around 40x slower than Linux for configure/make/make install style
  stuff.

- A lot of the issues people have when they start working on embedded
  Linux systems are Linux questions rather than anything specific to
  embedded. The best way to learn Linux is IMHO just using it as much as
  possible.

-- 
Bye, Peter Korsgaard
