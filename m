From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jul 2016 20:26:42 +0200
Subject: [Buildroot] raspberry3_defconfig error
In-Reply-To: <HK2PR0401MB1329D3F86C57BD1E93FC6137B33E0@HK2PR0401MB1329.apcprd04.prod.outlook.com>
References: <HK2PR0401MB1329D3F86C57BD1E93FC6137B33E0@HK2PR0401MB1329.apcprd04.prod.outlook.com>
Message-ID: <20160710182642.GE3688@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, All,

On 2016-07-10 18:04 +0000, Foxtrot Mike spake thusly:
> I am trying to create a customized linux for raspberry pi 3. I have 
> installed buildroot2016.5 with all the dependencies. I am trying to 
> compile everything with the default configuration file by executing:
> 
> $ make raspberrypi3_defconfig
> $ make
> 
> It fails with the following errors:
> 
>  >>> linux-headers 26f3b72a9c049be10e6af196252283e1f6ab9d1f Downloading

A common reason for the RPi kernel to fail downloading is that upstream
often rebase their branches. However, I just checked, and the commit we
reference is still present in the RPi Linux tree.

> Doing full clone
> Cloning into bare repository 
> 'linux-headers-26f3b72a9c049be10e6af196252283e1f6ab9d1f'...
> remote: Counting objects: 5034470, done.
> remote: Compressing objects: 100% (2553/2553), done.
>   error: RPC failed; curl 56 SSL read: 
> error:00000000:lib(0):func(0):reason(0), errno 104
> fatal: The remote end hung up unexpectedly
> fatal: early EOF
> fatal: index-pack failed

cURL error 56 is "Failure in receiving network data." so probably a
network issue between you and github.

Did that error happen in both of your build tests?

Did it happen right when starting downloading, or did it happen after a
while?

> --2016-07-11 01:48:20-- 
> http://sources.buildroot.net/linux-26f3b72a9c049be10e6af196252283e1f6ab9d1f.tar.gz
> Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
> Connecting to sources.buildroot.net 
> (sources.buildroot.net)|176.9.16.109|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2016-07-11 01:48:22 ERROR 404: Not Found.

Indeed, s.b.o. does not cache those files.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
