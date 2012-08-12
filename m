From: Jonathan Liu <net147@gmail.com>
Date: Sun, 12 Aug 2012 22:04:42 +1000
Subject: [Buildroot] [PATCH] python: fix interpreter directive for
 python scripts
In-Reply-To: <20120811230555.46b2f565@skate>
References: <1344665427-27181-2-git-send-email-net147@gmail.com>
 <20120811230555.46b2f565@skate>
Message-ID: <50279BDA.6080407@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/08/2012 7:05 AM, Thomas Petazzoni wrote:
> Le Sat, 11 Aug 2012 16:10:27 +1000,
> Jonathan Liu<net147@gmail.com>  a ?crit :
>
>> +# Fix Python interpreter directive
>> +define PYTHON_FIX_INTERPRETER
>> +        sed -i '1s|#!.*python.*|#!/usr/bin/env python|' $(TARGET_DIR)/usr/bin/{easy_install,easy_install-2.7,idle,smtpd.py}
>> +endef
>> +
>> +PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_FIX_INTERPRETER
> I agree the paths in those scripts is incorrect, *but*:
>
>   * Should these scripts have been installed in the first place? I don't
>     think there are useful for the typical usage of the Python
>     interpreter, so maybe we want to get rid of them.
>
>   * Instead of fixing this patch manually in every Python script
>     installed, can we investigate on how to fix the root of the problem?
>     I'm the one who has reworked the patches that get Python to
>     cross-compile, and I know this stuff is really painful, but I think
>     it's worth at least trying to understand a bit if there could be a
>     way of handling things. From what I remember the problem is that the
>     host-python uses its host sysconfig parameters even when building
>     things for the target, simply because the whole Python things has
>     absolutely zero understanding of the fact that we could be using
>     Python on one machine to build stuff that will run on a different
>     machine.
I've submitted patch for Python to use fixed path for sys.executable to 
resolve this.

Regards,
Jonathan
