From: Ryan Wilkins <ryan@deadfrog.net>
Date: Mon, 22 Jul 2013 16:14:32 -0400
Subject: [Buildroot] Problem compiling local code
In-Reply-To: <CAAXf6LXmwk0NwheagUtnSX5u9iZei2ieJLs6+XyFqRXm4zKSyA@mail.gmail.com>
References: <4FDB62BA-61E8-4C1C-8835-61BC2DCF0FA4@deadfrog.net>
 <CAAXf6LXmwk0NwheagUtnSX5u9iZei2ieJLs6+XyFqRXm4zKSyA@mail.gmail.com>
Message-ID: <79A67ED1-220E-4FA4-BD5B-01A70D079C06@deadfrog.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Jul 19, 2013, at 1:29 AM, Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:

> Hi Ryan,
> 
> Is there any output regarding the hello package, like 'downloading',
> 'extracting', 'building', etc. or nothing at all?
> What is the name of the config option that you added, and are you sure
> it's enabled in .config?
> 
> What happens if you explicitly run 'make hello' ?
> 
> Depending on what you did before, you may also need to clear previous
> attempts from the output, for example with:
> make hello-dirclean
> 
> If the hello package is seen correctly by buildroot, but the
> compilation doesn't work correctly, you may want to add
> KBUILD_VERBOSE=1 to the make command, to see the actual make command
> executed.
> 
> Best regards,
> Thomas

Thomas,

Thanks for the response.  After some digging around, I found that buildroot wasn't even trying to grab or compile my code.  What I discovered earlier today is that the variable names that I was using contained too many underscores.  My Config.in and hello.mk files were using variables set as BR2_PACKAGE_COMPANY_PROJECT_HELLO.  When I shortened it to just BR2_PACKAGE_HELLO then it started working properly.  Apparently the additional underscores confused some parsing of the buildroot and/or Kbuild system.  If that was mentioned in the documentation then I missed it.  Maybe it was assumed.  In any case, it's working now.

Thanks for your help on this.  I appreciate it.

Best,
Ryan Wilkins
