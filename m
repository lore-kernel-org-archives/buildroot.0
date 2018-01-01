From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 Jan 2018 14:05:56 +0100
Subject: [Buildroot] [PATCH 2/2] core/tests: add test for compressed
 iso9660
In-Reply-To: <20171231182302.59012b3f@windsurf>
References: <cover.1513805241.git.yann.morin.1998@free.fr>
 <d9148095910e211f1b38a85f93a10ab88fa1af04.1513805241.git.yann.morin.1998@free.fr>
 <20171231182302.59012b3f@windsurf>
Message-ID: <20180101130556.GA24931@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-31 18:23 +0100, Thomas Petazzoni spake thusly:
> On Wed, 20 Dec 2017 22:27:43 +0100, Yann E. MORIN wrote:
> > +class TestIso9660Grub2ExternalCompress(infra.basetest.BRTest):
> > +    config = BASIC_CONFIG + \
> > +        """
> > +        BR2_TARGET_ROOTFS_ISO9660=y
> > +        # BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
> > +        BR2_TARGET_ROOTFS_ISO9660_TRANSP_COMPRESS
> Not sure you really tested with transparent compression enabled, since
> =y was missing. So I've fixed that, taken into account the option
> rename, and applied. Thanks!

I'm pretty sure that got tested:
    https://gitlab.com/ymorin/buildroot-ci/pipelines/15356311

But it proabably got ignored, so the filesystem was not compression
enabled.

Thanks for the fix.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
