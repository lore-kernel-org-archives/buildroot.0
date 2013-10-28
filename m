From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Oct 2013 20:47:23 +0100
Subject: [Buildroot] Problems with Python ctypes on Raspberry Pi
 platfform - Was: Re: [PATCH v2 1/1] python-pyusb: new package
In-Reply-To: <CAMduVEcp4u0Xb5tSK=LV_s5E2jGF501R_eKjWFnOUWtcTZ4URw@mail.gmail.com>
References: <CAMduVEcp4u0Xb5tSK=LV_s5E2jGF501R_eKjWFnOUWtcTZ4URw@mail.gmail.com>
Message-ID: <20131028204723.458fbe10@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Wojciech Zabolotny,

On Sat, 26 Oct 2013 17:30:16 +0200, Wojciech Zabolotny wrote:
> Testing the newly created python-pyusb on a Raspberry Pi platform, I
> have found, that it doesn't work.
> Investigating the problem more thoroughly, I have found that it is
> associated with Python ctypes package, which is not able to locate the
> libraries.
> Analyzing the Python-2.7.3/Lib/ctypes/util.py file, I have found, that
> on that platform, when neither gcc nor binutils are installed on
> target (which is typical for small systems), locating of the library
> relies on output of the "ldconfig -p" command.
> Unfortunately, this command returns simply:
> 
> # /sbin/ldconfig -p
> Library cache disabled
> 
> I'm afraid that this problem may affect many other programs and
> packages relying on Python ctypes... (and probably not only on
> Raspberry Pi platform)

Interesting. Can you post a simple example of ctypes usage that
exhibits the problem?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
