From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 6 Apr 2014 14:42:25 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-04-05
In-Reply-To: <20140406110837.45baff8e@skate>
References: <20140406063010.119BC100CBA@stock.ovh.net>
 <20140406110837.45baff8e@skate>
Message-ID: <CAHXCMMLSKDKqL5eaUBdG1NRWUtqQwEBwVY+DYKLZHXEYOc2cTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Sun, Apr 6, 2014 at 11:08 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[...]
>>        arm |             host-omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/484c33fe398fbc42248c5693a87cf2fe1eac9005/
>
> Samuel, a Python issue, can you investigate? Maybe it is fixed by your
> patch http://patchwork.ozlabs.org/patch/337242/ ?

Yes, this patch fixes it.

>
>>    powerpc |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/6e74a343b4e8e113fd34d45c9279419e233afe8a/
>>       i686 |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/a6512d4c32decc4b5444c7b4ba004002146c4f11/
>
> I'll apply http://patchwork.ozlabs.org/patch/337242/ from Samuel. I'm
> surprised I didn't produce the problem when doing my testing though.

So am I.

>
>>       i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/9f80153cf97ac23c3caa9095b06e71cb26d94e82/
>>        arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/48024ec8aaaf596a5814edb51e35e94fdb803950/
>>   mips64el |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/b4a813f0e702d2d97d38659d7ce67084e67c6837/
>
> Fixed by applying Samuel's Python series.
>
>>        arm |              host-thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/7590122fd85b644ae0886a127005188d1f882bef/
>
[...]
>>    powerpc |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/dd04833b11a0ebb0193c861cb375b2112dd339d1/
>>      avr32 |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/cef96c3c7c1479bfb38fb5c7160ded94511f8894/
>
> Weird: libevdev has a dependency on host-python specifically because it
> needs argparse, which is not available on old machines that have Python
> 2.6. But now it fails to find the host Python. Maybe fixed by Samuel's
> patch at http://patchwork.ozlabs.org/patch/337242/.

Fixed by http://patchwork.ozlabs.org/patch/337257/
(just merged)

[...]
>>     mipsel |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/9d1655d2236d9783a4b4898668d9cf813847b228/
>
> checking for python2... python2
> checking python2 module: libxml2... no
> configure: error: failed to find required module libxml2
> make: *** [/home/test/test/3/output/build/mesa3d-10.0.4/.stamp_configured] Error 1
>
> Mesa3D selects BR2_PACKAGE_HOST_LIBXML2_PYTHON, which should bring a
> Python with XML2 support. This is happening after applying Samuel
> Python series. Maybe after applying his additional fix it will work
> again?

Just checked, http://patchwork.ozlabs.org/patch/337242/ does fix this issue.

Regards,

-- 
Samuel
