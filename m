From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Oct 2013 07:37:19 +0300
Subject: [Buildroot] iproute2 build error
In-Reply-To: <CALoHCLPE6SOyJM58kDXFyTxhKoCiJs4qQ1Gzk2Fsa_0-1ubViA@mail.gmail.com>
References: <CALoHCLPE6SOyJM58kDXFyTxhKoCiJs4qQ1Gzk2Fsa_0-1ubViA@mail.gmail.com>
Message-ID: <20131010043719.GU4875@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Wed, Oct 09, 2013 at 03:49:45PM -0700, Eric Seifert wrote:
> Hello, I was on buildroot-2012.08 and am trying to get up to date, so I am
> using the git repo directly now with the latest changes. Previously
> iproute2 was building successfully (v3.4.0), now I am getting this iproute2
> build error (v3.11.0). I am building for PowerPC 8548/e500v2 (SPE). I am
> using an external toolchain gcc4.3.2 that uses eglibc. Any help would be
> great.

[...]

> libnetlink.c: In function 'rtnl_open_byproto':
> libnetlink.c:46: error: 'SOCK_CLOEXEC' undeclared (first use in this
> function)
> libnetlink.c:46: error: (Each undeclared identifier is reported only once
> libnetlink.c:46: error: for each function it appears in.)
> make[2]: *** [libnetlink.o] Error 1

It seems that you toolchain is missing the definition of SOCK_CLOEXEC. What 
version of eglibc are you using?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
