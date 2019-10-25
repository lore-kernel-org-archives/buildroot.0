From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 11:28:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/libselinux: fix build with
 python 3.8
In-Reply-To: <20191022111017.7607a729@windsurf>
References: <20191020203119.99538-1-james.hilliard1@gmail.com>
 <20191021210603.59270fc2@windsurf>
 <CADvTj4ojPDhL1M3L=yzSzJh=zp+8rO0pTBYYcGHH5=CBs6n90w@mail.gmail.com>
 <20191021231848.57832d2e@windsurf>
 <20191022094025.0ae71f35@windsurf>
 <20191022094500.48f222d8@windsurf>
 <20191022111017.7607a729@windsurf>
Message-ID: <20191025112858.5c1b969a@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Oct 2019 11:10:17 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> +Matt Weber, SELinux stuff inside.
> 
> On Tue, 22 Oct 2019 09:45:00 +0200
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> > So I believe the right fix is:  
> 
> With this fix, the module builds properly. With
> http://patchwork.ozlabs.org/patch/1181164/, it gets installed to the
> target. However, importing the module fails:
> 
> Python 3.8.0 (default, Oct 21 2019, 21:15:12) 
> [GCC 4.9.4] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import selinux  
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "usr/lib/python3.8/site-packages/selinux/__init__.py", line 13, in <module>
> ImportError: cannot import name '_selinux' from partially initialized module 'selinux' (most likely due to a circular import) (/usr/lib/python3.8/site-packages/selinux/__init__.pyc)

This problem, as well as the initial -z defs issue, has been resolved upstream by:

  https://github.com/SELinuxProject/selinux/commit/2efa06857575e4118e91ca250b6b92da68b130d5

I'm now trying to backport that to 2.9.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
