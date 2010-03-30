From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 30 Mar 2010 15:20:44 +0200
Subject: [Buildroot] init segfaults when compiled with glibc
In-Reply-To: <4BB1EE15.6000505@browserseal.com>
References: <4BB1EE15.6000505@browserseal.com>
Message-ID: <201003301520.44590.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sasha, All,

On Tuesday 30 March 2010 142701 Sasha Sirotkin wrote:
> I compiled an external toolchain with glibc support using crosstools-ng 
> as recommended. I managed to compile buildroot without any issues. 
> However, when I try to use the resulting image /sbin/init segfaults. 
> With uclibc there are no such issues. I'm using the latest versions of 
> everything on ARM with EABI.

By default, gcc will emit armv5t instructions. What's your target CPU?
init segfaulting can be a symptom of using a bad instruction set, so if
your CPU is armv4, and you did not tell gcc to default to armv4, then
you will hit this segfault issue.

regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
