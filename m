From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Nov 2012 22:12:52 +0100
Subject: [Buildroot] PATCH > To integrate pycrypto into Buildroot
In-Reply-To: <07407110F438184D9D87521726FF42D41F64FE15@M357PRD1.ad.bcc.qld.gov.au>
References: <07407110F438184D9D87521726FF42D41F64FE15@M357PRD1.ad.bcc.qld.gov.au>
Message-ID: <50B67E54.4060006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/11/12 06:05, Noel Roberts wrote:
> This patch allows Buildroot to cross compile the crypto libraries needed for python integration, enabling good
> cryptographic support within Python.
>
> This is my first patch submission - please advise me, if I need to rework anything.

  We prefer patches to be sent in-line (with git send-email) because then it is
easier to comment on them.  But I'll already give some feedback before you re-post.

- If you include it in package/Config.in's 'external python modules' menu,
then the 'depends on BR2_PACKAGE_PYTHON' is redundant.

- Please add the license information:
PYTHON_CRYPTO_LICENSE = Public domain, Python 2.2 license
PYTHON_CRYPTO_LICENSE_FILES = COPYRIGHT LEGAL/copy/LICENSE.python-2.2

- Since there is a check for wchar.h in configure.ac, I would add an
explicit 'depends on BR2_USE_WCHAR', even though python itself already
depends on it. But who knows, maybe that will ever be removed.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
