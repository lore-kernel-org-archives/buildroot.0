From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Jan 2013 21:42:06 +0100
Subject: [Buildroot] decreasing size of compile log
In-Reply-To: <CALo-6+jBObEiK5reN1qno0bD-ufDK3jX2drKbcwzKLXt=A9reQ@mail.gmail.com>
 (Charles Krinke's message of "Sun, 27 Jan 2013 12:31:55 -0800")
References: <CALo-6+jBObEiK5reN1qno0bD-ufDK3jX2drKbcwzKLXt=A9reQ@mail.gmail.com>
Message-ID: <87a9rubboh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

 Charles> Gentlemen:
 Charles> I have a nearly finished AM3517 project with buildroot. Thank you all
 Charles> for getting me to this point.

 Charles> I have an issue where the compile log runs 50000 lines. That
 Charles> is, "make clean && make" produces output from all the packages
 Charles> being compiled.

 Charles> Is there a way to add a string to selected buildroot/package
 Charles> directories to tell selected packages to either not print
 Charles> their compiled output, send it do /dev/null or minimize the
 Charles> printed output during compile so as to focus on the one or two
 Charles> packages where there are issues to be solved?

You can compile with make -s (silent) option to make buildroot less
verbose (but it is still quite verbose).

Is the amount of output any real problem, or is it just cosmetical?
Normally if there's any build problems you only really want to look at
the last few lines (which is also why the autobuilder web page provides
a link to the last ~100 lines).

-- 
Bye, Peter Korsgaard
