From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 May 2018 17:26:00 +0200
Subject: [Buildroot] Buildroot 2018.05-rc3 released
In-Reply-To: <1527778369.2065.4.camel@rovoreed.com>
References: <87efhvufjm.fsf@dell.be.48ers.dk>
 <1527599917.2053.2.camel@rovoreed.com>
 <87fu2a7bkq.fsf@dell.be.48ers.dk>
 <1527615682.2053.4.camel@rovoreed.com>
 <87po1e5mev.fsf@dell.be.48ers.dk>
 <1527674917.2072.2.camel@rovoreed.com>
 <87tvqp2lqv.fsf@dell.be.48ers.dk>
 <20180530180026.77e1dfac@windsurf.home>
 <87efht2k8o.fsf@dell.be.48ers.dk>
 <1527778369.2065.4.camel@rovoreed.com>
Message-ID: <20180531172600.3cc0568e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 May 2018 15:52:49 +0100, Mike Davies wrote:

> OK, well, it seems to be that when host_python is being configured, the
> configure script has not got the option...
> 
> --enable-unicode=ucs4
> 
> and it's not got that because python.mk uses a symbol
> BR2_PACKAGE_PYTHON_UCS4 to decide whether to add that option to
> HOST_PYTHON_CONF_OPTS
> 
> I do not have?BR2_PACKAGE_PYTHON_UCS4 in my .config file.
> 
> [mike at modron buildroot-2018.05-rc3]$ cat .config | grep PYTHON
> # BR2_PACKAGE_MICROPYTHON is not set
> # BR2_PACKAGE_HOST_PYTHON_CYTHON is not set
> # BR2_PACKAGE_HOST_PYTHON_LXML is not set
> # BR2_PACKAGE_HOST_PYTHON_SIX is not set
> # BR2_PACKAGE_HOST_PYTHON_XLRD is not set
> # BR2_PACKAGE_PYTHON_PYXML is not set
> [mike at modron buildroot-2018.05-rc3]$?
> 
> I do not know the implications of simply moving --enable-unicode=ucs4
> to the list of HOST_PYTHON_CONF_OPTS at the start of python.mk.

But why would UCS4 support be required for you to build ca-certificates
and not on other systems ?

My test build had BR2_PACKAGE_PYTHON_UCS4 disabled, so
--enable-unicode=ucs4 was also not passed when building host-python.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
