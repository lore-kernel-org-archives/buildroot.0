From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 23:00:38 +0200
Subject: [Buildroot] [PATCH v6 3/3] gnuradio: gnuradio-python
 gnuradio-utils: add missing dependency to python-numpy
In-Reply-To: <1444203799-16230-3-git-send-email-gwenj@trabucayre.com>
References: <1444203799-16230-1-git-send-email-gwenj@trabucayre.com>
 <1444203799-16230-3-git-send-email-gwenj@trabucayre.com>
Message-ID: <20151009230038.6bf9174e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Wed,  7 Oct 2015 09:43:19 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Some gnuradio python blocks needs python-numpy present.
> 
> Without python-numpy, gnuradio-python based apps fails, on runtime, with traceback like:
> 
> Traceback (most recent call last):
>   File "./top_block.py", line 18, in <module>
>     from gnuradio import analog
>   File "/usr/lib/python2.7/site-packages/gnuradio/analog/__init__.py", line 35, in <module>
>     from am_demod import *
>   File "/usr/lib/python2.7/site-packages/gnuradio/analog/am_demod.py", line 22, in <module>
>     from gnuradio import gr
>   File "/usr/lib/python2.7/site-packages/gnuradio/gr/__init__.py", line 44, in <module>
>     from top_block import *
>   File "/usr/lib/python2.7/site-packages/gnuradio/gr/top_block.py", line 30, in <module>
>     from hier_block2 import hier_block2
>   File "/usr/lib/python2.7/site-packages/gnuradio/gr/hier_block2.py", line 26, in <module>
>     import pmt
>   File "/usr/lib/python2.7/site-packages/pmt/__init__.py", line 58, in <module>
>     from pmt_to_python import pmt_to_python as to_python
>   File "/usr/lib/python2.7/site-packages/pmt/pmt_to_python.py", line 22, in <module>
>     import numpy
> ImportError: No module named numpy
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v5 -> v6:
>  * add space between # and runtime
> Changes v4 -> v5:
>  * Re-add BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> Changes v3 -> v4:
>  * add #runtime comment to BR2_PACKAGE_PYTHON_NUMPY select;
>  * suppress python-numpy in GNURADIO_DEPENDENCIES variable (not needed for
>    buildtime)
> Changes v2 -> v3:
>  * Since commit 826a2bc18bc0be0b08f2926c9fa1819fe909557c no special attentions
>    is needed to select python-numpy. So BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>    is no more needed
> Changes v1 -> v2:
>  * Add dependy to BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS;
>  * gnuradio-python select numpy;
>  * gnuradio-utils select again gnuradio-python;
>  * fix commit message
> ---
>  package/gnuradio/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
