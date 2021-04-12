From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Apr 2021 21:50:15 +0200
Subject: [Buildroot] Missing .pyc files in target filesystem
In-Reply-To: <003801d72fcf$28780910$79681b30$@gmail.com>
References: <003801d72fcf$28780910$79681b30$@gmail.com>
Message-ID: <c7681c66-e513-380e-cba3-8b9b2f6b98fa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/04/2021 21:08, swirsky at gmail.com wrote:
> We?re not getting python .pyc files for the Python packages in the target
> filesystem /usr/lib/python3.8/ and I can?t figure out why, despite several days
> of looking at this.
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
python3 - and in fact, those python2 symbols should be removed when any kconfig
target is run.


 Regards,
 Arnout

> ?
> 
> in the config. I only see .py files.
> 
> ?
> 
> Any ideas on how to debug this? What?s the thing in buildroot that creates the
> .pyc files?
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
