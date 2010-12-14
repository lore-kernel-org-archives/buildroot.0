From: William Wagner <will_wagner@carallon.com>
Date: Tue, 14 Dec 2010 15:50:05 +0000
Subject: [Buildroot] cannot log to my build root
In-Reply-To: <AANLkTinQYpMH5VVCiXwLpN4io7rh=VaML+AX3yAOD5_F@mail.gmail.com>
References: <AANLkTine190SpsTRLjzsOvdTFjAXiEwDK4yd8Vmkhsj_@mail.gmail.com>	<20101214142544.7863d2d2@surf>	<AANLkTi=GjsSptGonZv0S+BqCgYZZYoTOC=K+mTYpLrSd@mail.gmail.com>	<20101214150520.253b9bae@surf>	<AANLkTi=YP74FxwLhGyYo7gn5WFpR6PK8Qqw4UTWTE08N@mail.gmail.com>	<20101214154228.51a969b6@surf>	<AANLkTikOXep3YnuzHai4fzM-QEGb8BqSZvPsdRvQ_Hkc@mail.gmail.com>	<20101214160558.325cddcb@surf>
	<AANLkTinQYpMH5VVCiXwLpN4io7rh=VaML+AX3yAOD5_F@mail.gmail.com>
Message-ID: <4D07922D.9090309@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/12/2010 15:28, Diego Iastrubni wrote:
>
>     and you should see a login prompt on this serial line.
>
>     It's the /etc/inittab file that decides on which terminals a login
>     prompt should appear, by starting a getty program on those terminals.
>
>     What does your /etc/inittab look like ?
>
>
>
> I probably did not express myself properly. I do soo login (which is 
> started by getty). The only problem is that whatever I do in "login" I 
> get kicked out -
>
> buildroot login: root
> Password: /[just enter]/
> Login incorrect
>
> The sad thing is that I do remember that once it did work and I would 
> get by just typing the username.

I have also seen this. In my case the problem was that I had built an 
eglibc toolchain that had configured too much out (I think it was option 
OPTION_EGLIBC_NIS). Busybox built fine, only login as root failed.

Never got around to debugging it as much faster just to change my 
toolchain to include the necessary option.

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101214/b4647d4a/attachment-0001.html>
