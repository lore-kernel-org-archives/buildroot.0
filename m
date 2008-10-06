From: Micha Nelissen <micha@neli.hopto.org>
Date: Mon, 06 Oct 2008 17:58:45 +0200
Subject: [Buildroot] proftpd does not compile
In-Reply-To: <48E9CB77.8060808@netcentral.co.uk>
References: <gc8fta$bif$1@ger.gmane.org> <48E9CB77.8060808@netcentral.co.uk>
Message-ID: <gcdcjp$v98$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nick Peirson wrote:
> You need to enable UCLIBC_SUSV3_LEGACY and/or UCLIBC_SUSV3_LEGACY_MACROS 
> (not sure exactly which combination, can anyone shed any light?) to 
> provide bcopy, bzero, index, etc. Alternatively you can submit an 
> upstream patch to proftpd, or patch it locally, to replace bcopy with 
> memmove as per:

I'm not sure if you understood me right. The problem is that bcopy is 
declared twice (I get a redefinition warning). It is *not* that bcopy is 
undefined.

If I'm wrong please correct me, thanks.

Micha
