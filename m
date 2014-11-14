From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Nov 2014 14:14:45 +0100
Subject: [Buildroot] Source download overwrite
In-Reply-To: <CAOFH_kEf-xur6tPGZb8rhA=211gK=Ww4tS0HRVpOe6KA-WEQMw@mail.gmail.com>
References: <CAOFH_kEf-xur6tPGZb8rhA=211gK=Ww4tS0HRVpOe6KA-WEQMw@mail.gmail.com>
Message-ID: <20141114141445.77f68c2d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mathieu Slabbinck,

On Fri, 14 Nov 2014 10:24:58 +0100, Mathieu Slabbinck wrote:
> Hi,
> 
> I'm looking for a way to overwrite the internal download system of buidroot
> for a specific homebrew package.
> 
> The goal of the package is to download multiple files and install them
> accordingly.
> LIBFOO_SITE contains the common part of the download link. For example
> ftp://myftpserver.mydomain.com/libfoo/.
> 
> Then I'd like to have a pre-install hook that downloads some specific files
> from that url, for example
> - ftp://myftpserver.mydomain.com/libfoo/file1.deb
> - ftp://myftpserver.mydomain.com/libfoo/file2.rpm
> - ftp://myftpserver.mydomain.com/libfoo/file3.someExtension
> 
> This all works fine, but the package still tries to fetch
> ftp://myftpserver.mydomain.com/libfoo/.tar.gz because of the internal way
> of working of buildroot.
> 
> So how can I overwrite this method or disable it?

Why don't you simply use the <pkg>_EXTRA_DOWNLOADS variable? It allows
you to download additional files from the same site, which seems to be
exactly what you're trying to achieve.

LIBFOO_SITE = ftp://myftpserver.mydomain.com/libfoo/
LIBFOO_SOURCE = <one file>
LIBFOO_EXTRA_DOWNLOADS = <another file> <yet another file>

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
