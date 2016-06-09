From: Mickael Chazaux <mickael.chazaux@etictelecom.com>
Date: Thu, 9 Jun 2016 17:10:52 +0200
Subject: [Buildroot] Python standard library files missing from rootfs
In-Reply-To: <575970BA.7080407@etictelecom.com>
References: <575970BA.7080407@etictelecom.com>
Message-ID: <575986FC.9040307@etictelecom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/06/2016 15:35, Mickael Chazaux wrote:
> Hi,
>
>
> all the standard library files are missing, including site.py.

Sorry for the noise ^^ One of my packages does that in its makefile :
         find $(DESTDIR) -name *.py -exec rm {} \;
         find $(DESTDIR) -name *.pyc -exec rm {} \;
         find $(DESTDIR) -name *.pyo -exec chmod +x {} \;

In OpenEmbedded it causes no harm, but in buildroot, it causes every .py{c} to disappear


-- 
Mickael Chazaux
Software Engineer
Tel : (33) 476 042 009
Fax : (33) 476 042 001

ETIC TELECOM
13, Chemin du Vieux Ch?ne
38240 MEYLAN
Tel: 33 4 76 04 20 00
fax : 33 4 76 04 20 01
