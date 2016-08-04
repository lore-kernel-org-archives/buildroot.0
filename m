From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 20:09:47 +0200
Subject: [Buildroot] [PATCH] package/lshw: fix musl build
In-Reply-To: <e2ca8dfa-5826-a478-7cec-c53a2da44df5@gmail.com>
References: <1470327886-29273-1-git-send-email-romain.naour@gmail.com>
 <20160804183732.7319a9c8@free-electrons.com>
 <e2ca8dfa-5826-a478-7cec-c53a2da44df5@gmail.com>
Message-ID: <20160804200947.64225ece@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 Aug 2016 19:09:25 +0200, Romain Naour wrote:

> Actually, I get an error on basename from sysfs.cc
> 
> sysfs.cc: In function ?std::string sysfs_getbustype(const string&)?:
> sysfs.cc:103:41: error: invalid conversion from ?const char*? to ?char*?
> [-fpermissive]
>        "/devices/" + basename(path.c_str());
> 
> The cast in dasd is not necessary.

Are you sure it's musl related, and not gcc version related? A
-fpermissive error typically indicates that the compiler has become
stricter than it used to be.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
