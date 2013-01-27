From: Charles Krinke <charles.krinke@gmail.com>
Date: Sun, 27 Jan 2013 13:49:17 -0800
Subject: [Buildroot] decreasing size of compile log
In-Reply-To: <87a9rubboh.fsf@dell.be.48ers.dk>
References: <CALo-6+jBObEiK5reN1qno0bD-ufDK3jX2drKbcwzKLXt=A9reQ@mail.gmail.com>
 <87a9rubboh.fsf@dell.be.48ers.dk>
Message-ID: <CALo-6+jaZx+NE3bbU3E9M8jxuQw9CEOjX+i-qt2=Hn0s2p6Hnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The key issue seems to be the web page that tracks builds for every
checkin. The 50000 lines of log takes "almost forever" to load on most
browsers and "forever" on the browsers that get indigestion and crash
loading the page.

So, ... at this point in the project, I am only interested in build
failures which only occur when a checkin from someone goes "awry".

The "-s" argument, is this an argument to make? As in, "make -s"

Charles

On Sun, Jan 27, 2013 at 12:42 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:
>
>  Charles> Gentlemen:
>  Charles> I have a nearly finished AM3517 project with buildroot. Thank you all
>  Charles> for getting me to this point.
>
>  Charles> I have an issue where the compile log runs 50000 lines. That
>  Charles> is, "make clean && make" produces output from all the packages
>  Charles> being compiled.
>
>  Charles> Is there a way to add a string to selected buildroot/package
>  Charles> directories to tell selected packages to either not print
>  Charles> their compiled output, send it do /dev/null or minimize the
>  Charles> printed output during compile so as to focus on the one or two
>  Charles> packages where there are issues to be solved?
>
> You can compile with make -s (silent) option to make buildroot less
> verbose (but it is still quite verbose).
>
> Is the amount of output any real problem, or is it just cosmetical?
> Normally if there's any build problems you only really want to look at
> the last few lines (which is also why the autobuilder web page provides
> a link to the last ~100 lines).
>
> --
> Bye, Peter Korsgaard



-- 
Charles Krinke
