From: Nick Peirson <nick@netcentral.co.uk>
Date: Mon, 6 Oct 2008 09:25:27 +0100
Subject: [Buildroot] proftpd does not compile
In-Reply-To: <gc8fta$bif$1@ger.gmane.org>
References: <gc8fta$bif$1@ger.gmane.org>
Message-ID: <48E9CB77.8060808@netcentral.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Micha Nelissen wrote:
> Further some warnings about bcopy also, I guess:
>
> #undef HAVE_BCOPY
> should be
> #define HAVE_BCOPY 1
>
> Obviously this is not a correct patch, but not sure about correct one?
> Kernel headers broken? configure script broken? toolchain headers?
>   
You need to enable UCLIBC_SUSV3_LEGACY and/or UCLIBC_SUSV3_LEGACY_MACROS 
(not sure exactly which combination, can anyone shed any light?) to 
provide bcopy, bzero, index, etc. Alternatively you can submit an 
upstream patch to proftpd, or patch it locally, to replace bcopy with 
memmove as per:

http://www.opengroup.org/onlinepubs/000095399/functions/bcopy.html

-- 
Regards

Nick Peirson

Developer

Internet Central Ltd

Tel: +44 (0)1782 667788
Fax: +44 (0)1782 667799
Email: nick at netcentral.co.uk
Web: http://www.internet-central.net

Innovation Centre
Keele Science Park
Keele
Staffordshire
ST5 5NB

Registered office: Ivy House Foundry, Hanley, Stoke-on-Trent  ST1 3NR

Registered in England. Reg. No. 3079542
VAT Reg No. GB 655 657 108


"This communication is confidential to the addressee shown in the main text of the message. It must not be disclosed to or used by anyone other than the addressee unless disclosure is a legal requirement or has been agreed to by a separate written agreement. The company scans for but accepts no responsibility for viruses and it is the addressee's responsibility to scan attachments."
