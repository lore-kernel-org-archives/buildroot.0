From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 23:31:38 +0200
Subject: [Buildroot] [PATCH v6 3/3] gnuradio: gnuradio-python
 gnuradio-utils: add missing dependency to python-numpy
In-Reply-To: <1444203799-16230-3-git-send-email-gwenj@trabucayre.com>
References: <1444203799-16230-1-git-send-email-gwenj@trabucayre.com>
 <1444203799-16230-3-git-send-email-gwenj@trabucayre.com>
Message-ID: <20151009233138.6c35507f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Oct 2015 09:43:19 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Some gnuradio python blocks needs python-numpy present.
> 
> Without python-numpy, gnuradio-python based apps fails, on runtime, with traceback like:

Gwenhael, Samuel, did you really test this patch? It causes some
clearly visible warnings when running "make menuconfig" :

package/python/Config.in:5:error: recursive dependency detected!
package/python/Config.in:5:	symbol BR2_PACKAGE_PYTHON is selected by BR2_PACKAGE_GNURADIO_PYTHON
package/gnuradio/Config.in:46:	symbol BR2_PACKAGE_GNURADIO_PYTHON is selected by BR2_PACKAGE_GNURADIO_UTILS
package/gnuradio/Config.in:55:	symbol BR2_PACKAGE_GNURADIO_UTILS depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
package/python-numpy/Config.in:1:	symbol BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS depends on BR2_PACKAGE_PYTHON

I had to fix that up through a separate following commit
http://git.buildroot.net/buildroot/commit/?id=ef531c6ded27b62462c74b964fad8f5c337da3a2,
but I would have preferred the patch to not contain such an obvious
issue.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
