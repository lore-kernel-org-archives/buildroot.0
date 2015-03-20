From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Mar 2015 20:52:53 -0300
Subject: [Buildroot] openssl 1.0.2 with sed error of unknown option
In-Reply-To: <CAOYKon=qesv3Zrrnno5ha73DJRa5itMqmnMYEmnN58aDLsLuyg@mail.gmail.com>
References: <CAOYKon=qesv3Zrrnno5ha73DJRa5itMqmnMYEmnN58aDLsLuyg@mail.gmail.com>
Message-ID: <550CB2D5.5080504@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/20/2015 08:20 PM, Walt Chow wrote:

> Upgrading to openssl 1.0.2, I came across a problem during configuration
> as below:
> 
> Configured for linux-generic32.
> 
> /usr/bin/sed: -e expression #1, char 141: unknown option to `s' make[1]:
> *** 
> 
> 
> The problem comes from openssl.mk <http://openssl.mk>:
> 
> $(SED) "s:-O[0-9]:$(OPENSSL_CFLAGS):" $(@D)/Makefile
> 
> When it expands OPENSSL_CFLAGS, it contains content like "-rpath
> /lib:/usr/lib".
> With this the sed operation will fail.  To resolve this problem, I
> replaced : with ! like:
> 
> $(SED) "s!-O[0-9]!$(OPENSSL_CFLAGS)!" $(@D)/Makefile

Hi.
That's extremely odd, where is that rpath coming from?
Can you post your defconfig so we can look?
Also -rpath in it's direct form shouldn't ever be in CFLAGS, it belongs
to LDFLAGS (should be -Wl,-rpath... for CFLAGS)
Regards.
