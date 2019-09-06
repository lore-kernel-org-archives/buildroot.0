From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Fri, 6 Sep 2019 19:31:07 +0300
Subject: [Buildroot] [PATCH] pppd: use uclibc libcrypt instead of openssl
In-Reply-To: <20190906133541.5707ade0@windsurf>
References: <20190906101849.4621-1-alexander.i.mukhin@gmail.com>
 <20190906133541.5707ade0@windsurf>
Message-ID: <20190906163107.GA5121@hpx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, Sep 06, 2019 at 01:35:41PM +0200, Thomas Petazzoni wrote:
> I am surprised: which functions are provided by uClibc that glibc
> doesn't provide ?

According to Fabrice Fontaine's commit 541021, glibc since 2.28 dropped
support for DES encryption functions encrypt(), setkey(), etc. But
uclibc still provides them.

-- 
Alexander.
