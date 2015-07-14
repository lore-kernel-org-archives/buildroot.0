From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 13:56:27 +0200
Subject: [Buildroot] [PATCH] package/qpid-proton: needs host-python2
In-Reply-To: <20150714114803.GA2332@tarshish>
References: <1436873894-1080-1-git-send-email-yann.morin.1998@free.fr>
 <20150714114803.GA2332@tarshish>
Message-ID: <20150714135627.26cf899a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 14 Jul 2015 14:48:04 +0300, Baruch Siach wrote:

> My interpretation of the cmake log is that cmake uses the python interpreter 
> it detects to run the scripts. In the failed cases cmake detected host-python3 
> because host-python3 happened to build before qpid-proton. cmake did not use 
> the distro installed host python even though it's python2 (most likely). So 
> I'm not sure patching the scripts is necessary.

It is necessary if your host machine has a Python 3 interpreter and not
a Python 2 interpreter. In this case the scripts will
run /usr/bin/python (because it's hardcoded in their source code), and
this will run Python 3.

So Yann's solution looks good. Am I missing something?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
