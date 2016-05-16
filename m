From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2016 13:15:38 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-13
In-Reply-To: <CAFGQKxf_m8c_u4j5_RKwLvKog3HC=mmAzqv-L3LJqX-tgbCL8w@mail.gmail.com>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
 <CAFGQKxf_m8c_u4j5_RKwLvKog3HC=mmAzqv-L3LJqX-tgbCL8w@mail.gmail.com>
Message-ID: <20160516131538.70d77f39@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 May 2016 11:19:20 +0100, Martin Bark wrote:

> >>          arm | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/55a7db5c0cbc34bbf6a2cbc52713d8822deec5b2/  
> >
> > Some static linking issue. Martin, you already did some work on
> > iputils, can you have a look?  
> 
> It's an issue with static builds and using libgcrypt.  I've submitted
> a pull request to fix the issue (see
> https://github.com/iputils/iputils/pull/50).  Last time i submitted a
> pull request the author of iputils was very quick to merge my changes
> so I'll wait to see what happens before i submit any changes to
> buildroot.

And indeed, it has been merged half an hour ago. However, I'm wondering
why you have not used pkg-config instead. The drawback of -lgcrypt
-lgpg-error is that now, even in dynamic linking situations, the
iputils binary has a direct reference to libgpg-error.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
