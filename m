From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 10 Aug 2015 08:58:58 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/jsoncpp: Broken on musl
In-Reply-To: <kunk9cxek9.ln2@ID-313208.user.individual.net>
References: <1439121001-14787-1-git-send-email-bernd.kuhls@t-online.de>
 <1439146794.12501.25.camel@embedded.rocks>
 <kunk9cxek9.ln2@ID-313208.user.individual.net>
Message-ID: <1439189938.14443.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On So, 2015-08-09 at 21:57 +0200, Bernd Kuhls wrote:
> Hi J?rg,
> 
> Am Sun, 09 Aug 2015 20:59:54 +0200 schrieb J?rg Krause:
> 
> > After a short investigation [1] I realized this error only applies 
> > for
> > x86 targets.
> > 
> > [1] https://gcc.gnu.org/ml/gcc-patches/2015-04/msg01084.html
> 
> v1 of my patch tried to fix it that way but it does not work for 
> external 
> toolchains: http://patchwork.ozlabs.org/patch/460337/

I see! How about something like
depends on !(BR2_i386 || BR2_x86_64) && !BR2_TOOLCHAIN_USES_MUSL?

Best regards
J?rg Krause
