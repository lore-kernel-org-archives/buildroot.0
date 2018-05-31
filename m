From: Mike Davies <busybox_mail@rovoreed.com>
Date: Thu, 31 May 2018 15:52:49 +0100
Subject: [Buildroot] Buildroot 2018.05-rc3 released
In-Reply-To: <87efht2k8o.fsf@dell.be.48ers.dk>
References: <87efhvufjm.fsf@dell.be.48ers.dk>
 <1527599917.2053.2.camel@rovoreed.com> <87fu2a7bkq.fsf@dell.be.48ers.dk>
 <1527615682.2053.4.camel@rovoreed.com> <87po1e5mev.fsf@dell.be.48ers.dk>
 <1527674917.2072.2.camel@rovoreed.com> <87tvqp2lqv.fsf@dell.be.48ers.dk>
 <20180530180026.77e1dfac@windsurf.home> <87efht2k8o.fsf@dell.be.48ers.dk>
Message-ID: <1527778369.2065.4.camel@rovoreed.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2018-05-30 at 18:15 +0200, Peter Korsgaard wrote:

> 
> Mike, there must be something odd going on with your machine. I'm
> afraid
> you will have to debug it further yourself. Maybe try running
> certdata2pem.py manually?


OK, well, it seems to be that when host_python is being configured, the
configure script has not got the option...

--enable-unicode=ucs4

and it's not got that because python.mk uses a symbol
BR2_PACKAGE_PYTHON_UCS4 to decide whether to add that option to
HOST_PYTHON_CONF_OPTS

I do not have?BR2_PACKAGE_PYTHON_UCS4 in my .config file.

[mike at modron buildroot-2018.05-rc3]$ cat .config | grep PYTHON
# BR2_PACKAGE_MICROPYTHON is not set
# BR2_PACKAGE_HOST_PYTHON_CYTHON is not set
# BR2_PACKAGE_HOST_PYTHON_LXML is not set
# BR2_PACKAGE_HOST_PYTHON_SIX is not set
# BR2_PACKAGE_HOST_PYTHON_XLRD is not set
# BR2_PACKAGE_PYTHON_PYXML is not set
[mike at modron buildroot-2018.05-rc3]$?

I do not know the implications of simply moving --enable-unicode=ucs4
to the list of HOST_PYTHON_CONF_OPTS at the start of python.mk.

Mike
