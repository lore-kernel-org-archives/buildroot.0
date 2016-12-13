From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Dec 2016 16:26:44 +0100
Subject: [Buildroot] [PATCH] netsnmp: fix libnl include path in
	configure script
In-Reply-To: <CAHfJR7hhiYEKd7c9du61-ave1Gi-rES-L49dGgbfz6e_gL0U=g@mail.gmail.com>
 (Julien Floret's message of "Tue, 13 Dec 2016 15:54:59 +0100")
References: <1481544668-900-1-git-send-email-julien.floret@6wind.com>
 <20161212222605.7906c427@free-electrons.com>
 <CAHfJR7hhiYEKd7c9du61-ave1Gi-rES-L49dGgbfz6e_gL0U=g@mail.gmail.com>
Message-ID: <87bmwf4zpn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Floret <julien.floret@6wind.com> writes:

Hi,

 >> - Change the --with-nl option so that it takes a path to the nl
 >> library.

 > Thanks for your analysis. Indeed, your proposals are much better than
 > patching the configure script on the fly ;)

 > In fact, I just saw that the issue has been addressed upstream:
 > libnl include paths & libs can now be overriden with configure environment
 > variables:
 > https://sourceforge.net/p/net-snmp/code/ci/852dcd644cfe4cfc7177649eaec163d6221f2be1/

 > So if you're ok with this, I suggest to:
 > - embed the upstream patch in package/netsnmp/
 > - trigger an autoreconf
 > - pass the right LIBNL3_{CFLAGS,LIBS} variables in NETSNMP_CONF_ENV.

Yes, sounds good, except that the last step shouldn't be needed as
pkg-config (once you add host-pkgconf to NETSNMP_DEPENDENCIES) should
return the correct values.

Thanks!

-- 
Bye, Peter Korsgaard
