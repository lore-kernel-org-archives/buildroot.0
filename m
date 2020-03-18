From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Mar 2020 17:41:26 +0100
Subject: [Buildroot] Inquiry : Adding a custom python package to
 buildroot
In-Reply-To: <CALYA+Ys78xtOdKSQZVwgf-QVjU2j+69-uEJg87FJYUJb1j9WGw@mail.gmail.com>
References: <CALYA+Yvspb-eeK7KWeAJn2bYtwWq4NK4W6usw6Ts+2OwQ0XLzw@mail.gmail.com>
 <CALYA+Ys78xtOdKSQZVwgf-QVjU2j+69-uEJg87FJYUJb1j9WGw@mail.gmail.com>
Message-ID: <CAAXf6LX5FRztO3nnjSCKwP2SUHR_ssFeQ=kMgOS_ht=jQFNehA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pragash,



On Wed, Mar 18, 2020, 15:54 Pragash Jeyaratnam <pragash.jeyaratnam@gmail.com>
wrote:

> Hi,
>
> Adding to my previous email. The problem is due to python setup.py issue
> within custom modules. For example If we assume,
> If a setup.py which has configuration
>
> setup(name='your-module',
>       .....
>       data_files=[
>         ('/usr/share/your_module/', glob.glob('data/*')),
>       ],
>      )
>
> The above failure will occur ( Absolute path reference) . As per to the
> setup.py manual https://docs.python.org/3/distutils/setupscript.html
> "The *directory* should be a relative path. It is interpreted relative to
> the installation prefix"
>
> So in-order to satisfy the above the configuration should be changed to
>   setup(name='your_module',
>       .....
>       data_files=[
>         ('share/your_module/', glob.glob('data/*')),
>       ],
>      )
>
> Which will be created as per to the installation_prefix/share/your_module.
>


In order to get efficient help, you should show the .mk file you used for
this custom package.

Buildroot has a python-package infrastructure, did you use it?

Did you compare with other python packages present in Buildroot?

Best regards
Thomas

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200318/668f0455/attachment.html>
