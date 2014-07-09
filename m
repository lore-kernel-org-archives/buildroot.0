From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Jul 2014 17:22:42 +0300
Subject: [Buildroot] ping not working in a glibc based buildroot
In-Reply-To: <53BD4395.5050306@scalemp.com>
References: <53BD4395.5050306@scalemp.com>
Message-ID: <20140709142242.GK3003@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eial,

On Wed, Jul 09, 2014 at 04:28:53PM +0300, Eial Czerwacki wrote:
> Greetings,
> 
> I've built a root using buildroot-2014.05 with busybox and glibc.
> after that I've mounted the image and chroot into it. I've tried to ping
> my desktop and I get this:
> # ping eial
> ping: bad address 'eial'
> 
> but when I'm trying the same from the host computer (where the image is
> mounted) I get this:
> [root at cluster1 ~]# ping eial
> PING eial (10.100.0.120) 56(84) bytes of data.
> 64 bytes from eial (10.100.0.120): icmp_seq=1 ttl=64 time=0.227 ms
> 64 bytes from eial (10.100.0.120): icmp_seq=2 ttl=64 time=0.198 ms
> 
> any ideas what can be the issue and how to solve it?

This is most likely a name server configuration issue. Can you compare the 
content of your host /etc/resolv.conf to that of your chroot?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
