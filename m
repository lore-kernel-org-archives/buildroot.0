From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 17:40:13 +0200
Subject: [Buildroot] Python standard library files missing from rootfs
In-Reply-To: <575986FC.9040307@etictelecom.com>
References: <575970BA.7080407@etictelecom.com>
 <575986FC.9040307@etictelecom.com>
Message-ID: <20160609174013.7dc5f2ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Jun 2016 17:10:52 +0200, Mickael Chazaux wrote:
> On 09/06/2016 15:35, Mickael Chazaux wrote:
> > Hi,
> >
> >
> > all the standard library files are missing, including site.py.  
> 
> Sorry for the noise ^^ One of my packages does that in its makefile :
>          find $(DESTDIR) -name *.py -exec rm {} \;
>          find $(DESTDIR) -name *.pyc -exec rm {} \;
>          find $(DESTDIR) -name *.pyo -exec chmod +x {} \;
> 
> In OpenEmbedded it causes no harm, but in buildroot, it causes every .py{c} to disappear

It would be good if you had provided a bit more context here.

But I guess the reason is because we remove *.pyo files in Buildroot,
so if you remove *.py, *.pyc in your package, and Buildroot removes
*.pyo, there's nothing left.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
