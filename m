From: Tomasz Chmielewski <mangoo@wpkg.org>
Date: Wed, 20 Aug 2008 11:29:02 +0200
Subject: [Buildroot] ARM EABI toolchain - anyone build it successfully?
In-Reply-To: <20080819162809.GA15851@mx.loc>
References: <48AAE812.4020706@wpkg.org> <20080819154955.GA15608@mx.loc>
	<48AAECB6.6020309@wpkg.org> <20080819162809.GA15851@mx.loc>
Message-ID: <48ABE3DE.80908@wpkg.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Reutner-Fischer schrieb:
> On Tue, Aug 19, 2008 at 05:54:30PM +0200, Tomasz Chmielewski wrote:
>> Bernhard Reutner-Fischer schrieb:
>>> On Tue, Aug 19, 2008 at 05:34:42PM +0200, Tomasz Chmielewski wrote:
>>>
>>>> So my question - did anyone manage to build ARM EABI toolchain with  
>>>> buildroot (GCC 4.3.1 + uClibc; I also need busybox)?
>>> Built fine for me last time i tried.
>> Do you still have it anywhere?
> 
> Unfortunately i've lost the disk that contained the configs, but going
> off a minimal config should work fine.

OK, it builds (I had a custom uClibc config, which perhaps made some 
problems), but even then, lots of Busybox things don't work.

I.e.:

# ./busybox
(...)
Currently defined functions:
         ash, cat, mount, sh, sleep, switch_root, umount, whoami

# ./busybox ash
Illegal instruction


Similar to: http://bugs.busybox.net/view.php?id=3364 which maybe points 
to http://bugs.busybox.net/view.php?id=0003804 (some things are build as 
EABI, and some things are build as OABI, although EABI is chosen).



-- 
Tomasz Chmielewski
http://wpkg.org
