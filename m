From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 28 Apr 2014 19:17:50 +0200
Subject: [Buildroot] [PATCH] evemu: fix make-event-names.py for python3
	syntax
In-Reply-To: <87fvkyy0tk.fsf@dell.be.48ers.dk>
References: <1398548615-18088-1-git-send-email-ps.report@gmx.net>,
 <87fvkyy0tk.fsf@dell.be.48ers.dk>
Message-ID: <trinity-3835e93d-0990-4db4-bea4-e04cb00ba3cf-1398705470052@3capp-gmx-bs26>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

> Gesendet: Sonntag, 27. April 2014 um 22:28 Uhr
> Von: "Peter Korsgaard" <jacmet@uclibc.org>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net, "Peter Korsgaard" <jacmet@uclibc.org>
> Betreff: Re: [PATCH] evemu: fix make-event-names.py for python3 syntax
>
> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
> 
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  > ---
>  >  ...-event-names-fix-for-python3-print-syntax.patch | 162 +++++++++++++++++++++
>  >  1 file changed, 162 insertions(+)
>  >  create mode 100644 package/evemu/evemu-0004-make-event-names-fix-for-python3-print-syntax.patch
> 
> Committed, thanks - But as I mentioned, this only fixes part of the
> problem.
> 
> evemu also comes with python support code, and that code:
> 
> - Gets unconditionally built/installed even if you don't have python on
>   the target
> 
> - Is incompatible with python3:
> 
> Byte-compiling python modules...
> evemu/base.py  File "/usr/lib/python3.4/site-packages/evemu/base.py", line 22
>     raise exception.ExecutionError, "%s: %s" % (
>                                   ^
> SyntaxError: invalid syntax
> 

Yes, there is already a debian patch for this problem...
 
> evemu/const.pyevemu/exception.pyevemu/__init__.py
> Byte-compiling python modules (optimized versions) ...
> evemu/base.pyevemu/const.pyevemu/exception.pyevemu/__init__.py
> make[4]: Leaving directory `/home/peko/source/buildroot/output/build/evemu-1.2.0/python'
> 
> 
> 
> It would be good you could patch the package to add a configure argument
> to enable/disable the python stuff and then change it to only enable it
> if BR2_PACKAGE_PYTHON is enabled.

Will prepare a patch soon (even earlier, but something seems to have broken the python3
byte-compile on my buildroot configuration, still investigating....)...

Regards,
Peter

> 
> -- 
> Bye, Peter Korsgaard
> 
