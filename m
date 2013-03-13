From: Tinti <viniciustinti@gmail.com>
Date: Wed, 13 Mar 2013 08:06:44 -0300
Subject: [Buildroot] [PATCH 1/1] python-thrift: new package
In-Reply-To: <20130313083019.4d9129ff@skate>
References: <1363115372-5679-1-git-send-email-viniciustinti@gmail.com>
 <20130313083019.4d9129ff@skate>
Message-ID: <CALD9WKzA_6QCLw5Ps5_+-+dzR1XGM9Rw0Ov0Mk3V9hv+JmmCeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, sure.

But about BR2_PACKAGE_PYTHON I have seen that many other python-<module>
use it. Since I get 'python-serial' as template I thought it was mandatory.

Should I really remove it?




On Wed, Mar 13, 2013 at 4:30 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Vinicius Tinti,
>
> On Tue, 12 Mar 2013 16:09:31 -0300, Vinicius Tinti wrote:
> > diff --git a/package/python-thrift/Config.in
> b/package/python-thrift/Config.in
> > new file mode 100644
> > index 0000000..3aa6bfb
> > --- /dev/null
> > +++ b/package/python-thrift/Config.in
> > @@ -0,0 +1,8 @@
> > +config BR2_PACKAGE_PYTHON_THRIFT
> > +     bool "python-thrift"
> > +     depends on BR2_PACKAGE_PYTHON
>
> The "depends on BR2_PACKAGE_PYTHON" here is not needed, since the
> 'source "package/python-thrift/Config.in"' in package/Config.in is
> already enclosed in a if BR2_PACKAGE_PYTHON...endif.
>
> > +PYTHON_THRIFT_VERSION = 0.9.0
> > +PYTHON_THRIFT_SOURCE  = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
> > +PYTHON_THRIFT_SITE    =
> https://pypi.python.org/packages/source/t/thrift/
>
> Could you add PYTHON_THRIFT_LICENSE and PYTHON_THRIFT_LICENSE_FILES ?
>
> Otherwise, looks good to me.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>



-- 
Simplicity is the ultimate sophistication
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130313/fb572316/attachment.html>
