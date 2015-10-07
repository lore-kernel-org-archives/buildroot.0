From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 7 Oct 2015 10:38:31 +0200
Subject: [Buildroot] [PATCH v6 3/3] gnuradio: gnuradio-python
 gnuradio-utils: add missing dependency to python-numpy
In-Reply-To: <1444203799-16230-3-git-send-email-gwenj@trabucayre.com>
References: <1444203799-16230-1-git-send-email-gwenj@trabucayre.com>
 <1444203799-16230-3-git-send-email-gwenj@trabucayre.com>
Message-ID: <CAHXCMMKZp5Z=PYjUckt4vBx7gYC+QAVnQzW1O-48mMuVPoxd1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 7, 2015 at 9:43 AM, Gwenhael Goavec-Merou
<gwenj@trabucayre.com> wrote:
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

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
