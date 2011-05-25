From: =?UTF-8?Q?Beno=C3=AEt_Mauduit?= <benoit.mauduit@gmail.com>
Date: Wed, 25 May 2011 10:28:20 +0200
Subject: [Buildroot] Fwd: How to enable Oprofile while using external tool
	chain?
In-Reply-To: <BANLkTik5J8hTD_OvXrTZ3KYgHGUGPZqGqg@mail.gmail.com>
References: <BANLkTikQOCg+ZQy1qc34GWBEo-u7QC41Fg@mail.gmail.com>
	<BANLkTik5J8hTD_OvXrTZ3KYgHGUGPZqGqg@mail.gmail.com>
Message-ID: <BANLkTimSZBQwAUfcmF=73DR-4BM4nW3cBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 25, 2011 at 9:31 AM, Bob Liu <lliubbo@gmail.com> wrote:
> Hi, folks

Hi,

> It seems Oprofile package depends on no using external tool chain.

it refers to this :
http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/24247

> Is there any special reason of this, because I am trying to enable
> Oprofile in buildroot while using external tool chain.

Oprofile needs GNU libiberty and libbfd libraries which are provided
by binutils.

> Any guide is welcome, Thanks.

If you want to test, i've made a patch (not very clean) and it's work
with an external toolchain.
The patch will not work with Crosstool-ng.

Regards,

--
Benoit Mauduit
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-external_toolchain-Add-possibility-to-compile-a-host.patch
Type: text/x-diff
Size: 4611 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110525/d2f95faa/attachment-0001.bin>
