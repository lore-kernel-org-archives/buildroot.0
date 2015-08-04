From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 4 Aug 2015 15:45:21 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150729100334.00137b70@free-electrons.com>
References: <20150729063017.EDA6D101EBC@stock.ovh.net>
 <20150729100334.00137b70@free-electrons.com>
Message-ID: <CA+TH9Vm3TA6T5a_7T9vGukAzbYJcC7Xii64BZeGOfq75Z6ER1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

>
>>      powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/f7863af051b2b856280a944749b91ba5b552b53d/
>>          arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/08ec78b88abd16af8e7fc3c5e7d05eb0dbbe9613/
>>      powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/aebfbd4e7fe46edbd3798563df28b4d89903becd/
>
> locale problem. Angelo, can you investigate ?

I investigate the problem and there is a redefinition of function
vasprintf in mono. The configure script should guess if the vasprintf
is missing and compile the internal one only in this case.
Unfortunately, it fails to make a proper detection and compiles the
internal also in case the function is already present.
Actually I brutally delete form Makefile.am the inclusion of
vasprintf.c from compilation and it works, but it's the best patch.
Have you any hint on this matter?

Thank you!
