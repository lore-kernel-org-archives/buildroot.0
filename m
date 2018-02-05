From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 5 Feb 2018 20:46:21 +0100
Subject: [Buildroot] [PATCH 1/1] python3: bump to 2.6.4
In-Reply-To: <20180205071225.0fa33ee7@windsurf>
References: <20180130235229.22352-1-Adamduskett@outlook.com>
 <20180205071225.0fa33ee7@windsurf>
Message-ID: <20180205194621.GE12535@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Tue, 30 Jan 2018 18:52:29 -0500, Adam Duskett wrote:
> > Also update necessary patches.
> > 
> > Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> 
> I'm sorry, but I had to revert that patch, it was causing gazillions of
> failures in the autobuilders. The Python build process now tries to use
> os.replace(), which is only available since Python 3.3. It would work
> if the host-python interpreter was being used, but the system Python
> interpreter is used, causing the build failure.
> 
> It is worth noting that the problem happens in the regen-importlib make
> target, and that there is already some code in python3.mk to handle
> issues related to that. See line 162 and following.

By the way, the version in the subject is wrong. 3.6.4 not 2.6.4.
Just if you readd...

best regards
 Waldemar
