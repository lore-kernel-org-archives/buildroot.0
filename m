From: swirsky at gmail.com <swirsky@gmail.com>
Date: Mon, 12 Apr 2021 12:54:28 -0700
Subject: [Buildroot] Missing .pyc files in target filesystem
In-Reply-To: <c7681c66-e513-380e-cba3-8b9b2f6b98fa@mind.be>
References: <003801d72fcf$28780910$79681b30$@gmail.com>
 <c7681c66-e513-380e-cba3-8b9b2f6b98fa@mind.be>
Message-ID: <007101d72fd5$a67676c0$f3636440$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks, Arnout.  We were in fact using the symbols

BR2_PACKAGE_PYTHON3_PYC_ONLY
BR2_PACKAGE_PYTHON3_PY_PYC

When I typed it into my email, I left off the 3. I checked my config. The
last build I tried had

BR2_PACKAGE_PYTHON3_PYC_ONLY

And we got .py files in the target filesystem


-----Original Message-----
From: Arnout Vandecappelle <arnout@mind.be> 
Sent: Monday, April 12, 2021 12:50 PM
To: swirsky at gmail.com; buildroot at busybox.net
Subject: Re: [Buildroot] Missing .pyc files in target filesystem



On 12/04/2021 21:08, swirsky at gmail.com wrote:
> We?re not getting python .pyc files for the Python packages in the 
> target filesystem /usr/lib/python3.8/ and I can?t figure out why, 
> despite several days of looking at this.
> 
> ?
> 
> We?re on Buildroot 2020.02.03 and I?ve tried both
> 
> ?
> 
> ??????? BR2_PACKAGE_PYTHON_PYC_ONLY=y
> 
> ?
> 
> ??????? BR2_PACKAGE_PYTHON_PY_PYC=y
> 

 How did you generate this config? The symbols are

BR2_PACKAGE_PYTHON3_PYC_ONLY
BR2_PACKAGE_PYTHON3_PY_PYC

when you're using python3. Setting the python2 configuration will not affect
python3 - and in fact, those python2 symbols should be removed when any
kconfig target is run.


 Regards,
 Arnout

> ?
> 
> in the config. I only see .py files.
> 
> ?
> 
> Any ideas on how to debug this? What?s the thing in buildroot that 
> creates the .pyc files?
> 
> ?
> 
> Thanks!
> 
> ?
> 
> ?
> 
> ?
> 
> ?
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
