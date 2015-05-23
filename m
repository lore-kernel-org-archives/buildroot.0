From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 May 2015 18:25:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-05-21
In-Reply-To: <874mn52i52.fsf@dell.be.48ers.dk>
References: <20150522063013.33F0D100C04@stock.ovh.net>
 <874mn52i52.fsf@dell.be.48ers.dk>
Message-ID: <20150523162516.GC19247@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2015-05-22 09:20 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  > Build statistics for 2015-05-21
>  >         i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/04a1c48d484debd7894fd32997ed50d3a0110b93/
>  >       x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/9accdfec87aa9922a4096b84a61a6e2dfd53561e/
> 
> Gaah, more ipmiutil issues. I believe Yann is looking into this.

The first issue above is again about an openssl issue, I'm investigating
now.

The second issue is about missing internal symbols:

    isensor2.o: In function `read_sdr_binfile':
    /home/test/autobuild/instance-0/output/build/ipmiutil-2.9.5/util/isensor.c:2990:
    undefined reference to `get_LastError'
or:
    libipmiutil.a(ipmicmd.o): In function `ipmi_open':
    ipmicmd.c:(.text+0x5be): undefined reference to `ipmi_open_lan'

I'm unable (after ~25 builds) to reproduce that second issue. So I'm
bailing out on that one... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
