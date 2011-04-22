From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Apr 2011 21:36:34 +0200
Subject: [Buildroot] Python segmentation fault
In-Reply-To: <BANLkTikxb2A7_Q13NczB11RPiPpEvdduag@mail.gmail.com> (Ryan
	Whelan's message of "Thu, 21 Apr 2011 22:17:56 -0400")
References: <BANLkTikxb2A7_Q13NczB11RPiPpEvdduag@mail.gmail.com>
Message-ID: <87liz29iyl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Whelan <rcwhelan@gmail.com> writes:

 Ryan> Im having an issue with the python interactive prompt in the latest
 Ryan> git revision when i try to run it, it tries to start and seg faults.
 Ryan> If I create a file, and run it, it seems to work- its only the
 Ryan> interactive prompt.

 Ryan> / # python
 Ryan> Python 2.7.1 (r271:86832, Apr 21 2011, 21:52:43)
 Ryan> [GCC 4.3.5] on linux2
 Ryan> Type "help", "copyright", "credits" or "license" for more information.
 Ryan> Segmentation fault
 Ryan> / #

 Ryan> I've tried with 32bit and 64bit builds, with different versions of GCC
 Ryan> and uClibc with the stack smash protection on and off.  I'm not sure
 Ryan> what info is going to be useful but here
 Ryan> (http://pastebin.com/usP2962n) is a strace and here
 Ryan> (http://pastebin.com/ApfWnTgq) is my .config.  I've enabled most of
 Ryan> the python related options as this is a platform for python app
 Ryan> hosting.  Sorry to include so little info, like i said, im not sure
 Ryan> what is needed- let me know if you need something else and i will
 Ryan> provide whatever i can.

From the looks of the strace log, this looks to be the ncurses problem
we've been trying to solve lately. Could you try changing the ncurses
version back to 5.7 and do a clean rebuild?

-- 
Bye, Peter Korsgaard
