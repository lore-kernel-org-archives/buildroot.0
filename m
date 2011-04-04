From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 4 Apr 2011 16:55:52 -0400
Subject: [Buildroot] [PATCH] add inetutils to package
In-Reply-To: <87bp0lycbz.fsf@macbook.be.48ers.dk>
References: <1298881761-1294-1-git-send-email-lliubbo@gmail.com>
	<87bp0lycbz.fsf@macbook.be.48ers.dk>
Message-ID: <BANLkTi=o_36x0W=oyg73=MGdbU9wFLXxhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 4, 2011 at 4:46 PM, Peter Korsgaard wrote:
>>>>>> "Bob" == Bob Liu <lliubbo@gmail.com> writes:
> ?Bob> Signed-off-by: Bob Liu <lliubbo@gmail.com>
>
> Thanks. Is there any specific reason to use this rather than the busybox
> applets?

note ... ive submitted inetutils a couple of times already with no
feedback.  my version is also much more functionality complete as it
allows people to select specific sub-programs rather than the whole
suite.

as for your question, the answer is "yes".  some of these applets
actually work in a nommu system while the busybox ones do not.

> ?Bob> +INETUTILS_VERSION = 1.8
> ?Bob> +INETUTILS_SOURCE = inetutils-$(INETUTILS_VERSION).tar.gz
> ?Bob> +INETUTILS_SITE = http://ftp.gnu.org/gnu/inetutils/
> ?Bob> +INETUTILS_INSTALL_STAGING = YES
> ?Bob> +INETUTILS_INSTALL_TARGET_OPT = SUIDMODE="-m 4775" DESTDIR=$(TARGET_DIR) install
>
> That suidmode thing looks odd. Does any of these binaries need to be
> suid root? If so, we'll need to add them to device_table.txt

it depends.  if rsh is running as root, then no.  if it isnt, then in
order to properly change uid's to the user you're logging in as, then
yes.  this applies to rcp/rlogin/rsh.  plus, there's ping/traceroute
which need suid in order to be usable as non-root.
-mike
