From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 18 Jun 2008 10:48:00 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/proftpd
In-Reply-To: <87r6av59np.fsf@macbook.be.48ers.dk>
References: <20080618084529.3973AF8007@busybox.net>
	<20080618092206.GE32192@mx.loc> <87r6av59np.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730806180648u5bf7bd6esd4c882c3de6a118b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 18, 2008 at 7:18 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:
>
> Hi,
>
>  Bernhard> this sounds like it should work without patching by just
>  Bernhard> configuring properly. Also these patches are usually named
>  Bernhard> "susv3.*legacy" for consistency.
>
> Could be - Ulf?

I think it works without that patch even, as I didn't rename it on my
local copy. Will remove it and try to build again just to make sure.

>  >> trunk/buildroot/package/proftpd/proftpd-1.3.1-fix-kernel-header-capability-version.patch
>
>  Bernhard> That one would make me nervous if i would use proftpd but
>  Bernhard> there is vsftpd anyway and luckily i don't do neither.
>
> Me neither.

Same here. This patch could be avoided if we disable it's
--disable-cap feature, that skips that lib build. Since I don't use
it, I have no idea what it does. From proftpd website, it seams that
it does some magic to increase security, so I thought it was best to
apply Gentoo's patch, taken directly from latest portage.

Many probably use proftpd for something, as it's in atngw100_defconfig
