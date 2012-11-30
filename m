From: Noel Roberts <Noel.Roberts@brisbane.qld.gov.au>
Date: Fri, 30 Nov 2012 02:27:09 +0000
Subject: [Buildroot] PATCH > To integrate pycrypto into Buildroot
In-Reply-To: <50B67E54.4060006@mind.be>
References: <07407110F438184D9D87521726FF42D41F64FE15@M357PRD1.ad.bcc.qld.gov.au>
 <50B67E54.4060006@mind.be>
Message-ID: <07407110F438184D9D87521726FF42D41F65F296@M357PRD2.ad.bcc.qld.gov.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good day Arnout

Grrrr, git send-email has issues with my virtual machine/proxy configuration. Not getting decent error messages and googling didn't help either. Not sure which part isn't working, just that SMPT couldn't initialize correctly.

Attached are the newest patch files.



-----Original Message-----
From: Arnout Vandecappelle [mailto:arnout at mind.be] 
Sent: Thursday, 29 November 2012 7:13 AM
To: Noel Roberts
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] PATCH > To integrate pycrypto into Buildroot

On 28/11/12 06:05, Noel Roberts wrote:
> This patch allows Buildroot to cross compile the crypto libraries 
> needed for python integration, enabling good cryptographic support within Python.
>
> This is my first patch submission - please advise me, if I need to rework anything.

  We prefer patches to be sent in-line (with git send-email) because then it is easier to comment on them.  But I'll already give some feedback before you re-post.

- If you include it in package/Config.in's 'external python modules' menu, then the 'depends on BR2_PACKAGE_PYTHON' is redundant.

- Please add the license information:
PYTHON_CRYPTO_LICENSE = Public domain, Python 2.2 license PYTHON_CRYPTO_LICENSE_FILES = COPYRIGHT LEGAL/copy/LICENSE.python-2.2

- Since there is a check for wchar.h in configure.ac, I would add an explicit 'depends on BR2_USE_WCHAR', even though python itself already depends on it. But who knows, maybe that will ever be removed.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

****************************************************
This message has passed through an insecure network.
Please direct all enquiries to the message author.
****************************************************

****************************************************
This message has passed through an insecure network.
Please direct all enquiries to the message author.
****************************************************
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Adding-pyCrypto-functionality-in-Buildroot.patch
Type: application/octet-stream
Size: 1883 bytes
Desc: 0001-Adding-pyCrypto-functionality-in-Buildroot.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121130/5330b901/attachment-0003.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-Added-commentator-feedback.patch
Type: application/octet-stream
Size: 1465 bytes
Desc: 0002-Added-commentator-feedback.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121130/5330b901/attachment-0004.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0003-Added-missing-Config.in-in-git-commit.patch
Type: application/octet-stream
Size: 810 bytes
Desc: 0003-Added-missing-Config.in-in-git-commit.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121130/5330b901/attachment-0005.obj>
